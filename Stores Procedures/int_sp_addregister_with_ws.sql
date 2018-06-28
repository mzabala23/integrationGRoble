create or replace PROCEDURE INT_SP_ADDREGISTER_WITH_WS
IS

--Cursor para verificar las transacciones que no han sido procesadas
CURSOR c_transaction_process (TRANSACTION_FLAG VARCHAR2, EBS_PROJECT VARCHAR2) IS
  SELECT PROJECT_EBS,
         BITEMID_EBS,
         AMOUNT_EBS,
         INT_SOURCE_DESC,
         TRANSACTION_EBS,
          A.FROM_DATE CUSTOMDATE
  FROM INT_EBS_AMOUNT A
  WHERE NOT EXISTS
        (SELECT *
        FROM INT_BP_PROCESS B
        WHERE A.TRANSACTION_EBS=B.TRANSACTION_EBS
        AND B.BITEMID=A.BITEMID_EBS
        AND A.INT_SOURCE=B.INT_SOURCE
        AND A.PROJECT_EBS=B.PROJECT_EBS)
  AND A.TRANSACTION_EBS=TRANSACTION_FLAG
  AND PROJECT_EBS=EBS_PROJECT and rownum <=45;

--Cursor que verifica la información de autenticación en Unifier
CURSOR c_auth_unifier IS
    SELECT ID_AUTH,SHORTNAME,AUTHCODE
    FROM INT_AUTH
    WHERE ACTIVE='Y';

--Cursor que verifica el código de interfaz segun sea la fuente
CURSOR c_interfaz(INTERFAZ VARCHAR2) IS
    SELECT ID_INTERFACES
    FROM INT_INTERFACES
    WHERE NAME_INTERFACES=INTERFAZ;

--Cursor que verifica el BP que pertene a cierta interfaz
CURSOR c_bp (ID_INTERFAZ NUMBER, PROJECT_EBS VARCHAR2) IS
    SELECT BPNAME,PROJECT_CODE
    FROM INT_BP_PROJECT
    WHERE BP_ACTIVE='Y'
    AND ID_INTERFACES=ID_INTERFAZ
    AND PROJECT_CODE=(SELECT PROJECTCODE_U
                      FROM INT_PROJECT_LIST
                      WHERE PROJECTEBS=PROJECT_EBS
                      AND TYPE_PROJECT='PC')
    UNION ALL
    SELECT BPNAME,PROJECT_CODE
    FROM INT_BP_PROJECT
    WHERE BP_ACTIVE='Y'
    AND ID_INTERFACES=ID_INTERFAZ
    AND PROJECT_CODE=(SELECT PROJECTCODE_U
                      FROM INT_PROJECT_LIST
                      WHERE PROJECTEBS=PROJECT_EBS
                      AND TYPE_PROJECT='FM-RE');

--Cursor para verificar el monto total de una transacción
CURSOR c_bp_amount(INTERFAZ VARCHAR2,TRANSACTION_EBS VARCHAR2,PROJECT_EBS VARCHAR2) IS
    SELECT SUM(AMOUNT_EBS) MONTO_TOTAL
    FROM INT_EBS_AMOUNT
    WHERE TRANSACTION_EBS=TRANSACTION_EBS
    AND INT_SOURCE=INTERFAZ
    AND PROJECT_EBS=PROJECT_EBS;

--Cursor para verificar la existencia del BP y Proyecto segun sea el INT_SOURCE
CURSOR c_bp_source (ID_INTERFAZ NUMBER,PROJECT_EBS VARCHAR2) IS
    SELECT BPNAME,PROJECT_CODE
    FROM INT_BP_PROJECT
    WHERE BP_ACTIVE='Y'
    AND ID_INTERFACES=ID_INTERFAZ
    AND PROJECT_CODE=(SELECT PROJECTCODE_U
                      FROM INT_PROJECT_LIST
                      WHERE PROJECTEBS=PROJECT_EBS
                      AND TYPE_PROJECT='PC')
    UNION ALL
    SELECT BPNAME,PROJECT_CODE
    FROM INT_BP_PROJECT
    WHERE BP_ACTIVE='Y'
    AND ID_INTERFACES=ID_INTERFAZ
    AND PROJECT_CODE=(SELECT PROJECTCODE_U
                      FROM INT_PROJECT_LIST
                      WHERE PROJECTEBS=PROJECT_EBS
                      AND TYPE_PROJECT='FM-RE');

--Este cursor verifica que la transacción que llega tenga todos los item's o líneas de costo asociadas
--Si no tiene la letra Y como ultimo ítem no la procesara a menos que sea la integración de tipo PO_RECEIPT
--PO_RECEIPT Envíar el valor recibido y actualizar costo real
CURSOR c_last_item(TRANSACCTION_EBS_C VARCHAR2) IS
  SELECT LAST_ITEM_EBS
  FROM INT_EBS_AMOUNT
  WHERE TRANSACTION_EBS=TRANSACCTION_EBS_C
      AND LAST_ITEM_EBS='Y';

--Cursor que interactua directamente con el Web Service que se encuentra invocado mediante la función fn_setbprecord
CURSOR c_fn_ws (SHORTNAME VARCHAR2,AUTHCODE VARCHAR2,PROJECTCODE VARCHAR2,BPNAME VARCHAR2,BPXML CLOB) IS
  SELECT FN_SETBPRECORD(SHORTNAME,AUTHCODE,PROJECTCODE,BPNAME,BPXML).extract('//statusCode/text()').getClobVal() CODE
  FROM DUAL;

--Bloque de variables para los cursores
r_auth_unifier                  c_auth_unifier%rowtype;
r_interfaz                      c_interfaz%rowtype;
r_bp                            c_bp%rowtype;
r_bp_amount                     c_bp_amount%rowtype;
r_bp_source                     c_bp_source%rowtype;
r_fn_ws                         c_fn_ws%rowtype;
r_last_item                     c_last_item%rowtype;
r_transaction_process           c_transaction_process%rowtype;

--Bloque de variables para la verificación de existencia de valores en el resultado de consulta de los cursores
vb_existe_auth_unifier  boolean;
vb_existe_interfaz      boolean;
vb_existe_bp            boolean;
vb_existe_bp_amount     boolean;
vb_existe_bp_source     boolean;
vb_existe_fn_ws         boolean;
vb_existe_last_item     boolean;

--Variables locales
SHORTNAME             VARCHAR2(20);
AUTHCODE              VARCHAR2(4);
BPNAME                VARCHAR2(150);--Almacena de la tabla INT_BP_PROJECT el BP según sea la fuente
PROJECTCODE           VARCHAR2(50); --Almacena de la tabla INT_BP_PROJECT el código de proyecto Unifier según sea la fuente

--Variables que forman el archivo XML
BP_HEADER             VARCHAR2(4000);
BP_LINEITEM           CLOB:='';
BP_LINEITEM_2         CLOB:='';
BP_FOOTER             VARCHAR(500);
BPXML                 CLOB:='';

--Variables locales
TOTAL_AMOUNT          NUMBER:=0;         --Almacena el monto total por transacción, sumando el valor de todas las líneas
ID_SOURCE             NUMBER;            --Almacena el codigo de la fuente que escribe EBS, eje: PO_RECEIPT=5
FECHASISTEMA          DATE:=sysdate;     --Almacena la fecha del sistema, si EBS no lo escribe toma la fecha del sistema
CUSTOMDATE            DATE:=sysdate;     --Almacena las fechas que llegan de la columna FROM_DATE de la tabla INT_EBS_AMOUNT
STATUS_CODE           VARCHAR2(3);       --Esta variable guarda el estatus que retorna el web service, eje: 200 = OK
LAST_ITEM             VARCHAR2(10):='N'; --Esta variable almacena la verificación del ultimo ítem segun sea la fuente de integración
LOG_TRANSACTION       VARCHAR2(600);     --Esta variable almacena el log de la transacción para mostrarlos en las excepciones

--Log de mensajes en las excepciones
err_num               NUMBER;
err_msg               VARCHAR2(255);
point_debug           NUMBER:=0;

BEGIN

--Formatear desde el inicio, fechas y moneda
execute immediate 'alter session set NLS_DATE_LANGUAGE=''SPANISH''';
execute immediate 'alter session set NLS_TERRITORY=''SPAIN''';
execute immediate 'alter session set nls_date_format=''MM/DD/YYYY''';
execute immediate 'alter session set NLS_NUMERIC_CHARACTERS= ''.,'' ';


point_debug:=1;--Punto para mapeo de errores
--Abrir el cursor para autenticación en Unifier
OPEN c_auth_unifier;
    FETCH c_auth_unifier INTO r_auth_unifier;
    vb_existe_auth_unifier := c_auth_unifier%FOUND;
CLOSE c_auth_unifier;

point_debug:=2;--Punto para mapeo de errores
--Verificar si existe la información de la autenticación con unifier
IF vb_existe_auth_unifier THEN
  SHORTNAME:=r_auth_unifier.SHORTNAME;
  AUTHCODE:=r_auth_unifier.AUTHCODE;
ELSE
  point_debug:=3;--Punto para mapeo de errores
  INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
  VALUES(SYSDATE, 'N/A', '887', 'No Existe información para la autenticación con Unifier, por favor verifique la tabla INT_AUTH ',0,'N/A');
END IF;

point_debug:=4;--Punto para mapeo de errores
--Bloque para construccion de XML en proyectos PC
      FOR TRANSACTION_EBS_ IN (SELECT DISTINCT TRANSACTION_EBS,A.PROJECT_EBS,A.INT_SOURCE,'PC' TYPE_PROJECT,FROM_DATE DESDE,TO_DATE HASTA
                               FROM INT_EBS_AMOUNT A
                               WHERE NOT EXISTS (SELECT *
                                                 FROM INT_BP_PROCESS b
                                                 WHERE A.TRANSACTION_EBS=B.TRANSACTION_EBS
                                                 AND B.BITEMID=A.BITEMID_EBS
                                                 AND A.INT_SOURCE=B.INT_SOURCE AND A.PROJECT_EBS=b.PROJECT_EBS)
                               AND A.PROJECT_EBS IN (SELECT PROJECTEBS
                                                     FROM INT_PROJECT_LIST
                                                     WHERE TYPE_PROJECT='PC')
                              UNION ALL
                              SELECT DISTINCT TRANSACTION_EBS,A.PROJECT_EBS,A.INT_SOURCE,'FM-RE' TYPE_PROJECT,FROM_DATE DESDE,TO_DATE HASTA
                              FROM INT_EBS_AMOUNT A
                              WHERE NOT EXISTS (SELECT *
                                                FROM INT_BP_PROCESS b
                                                WHERE A.TRANSACTION_EBS=B.TRANSACTION_EBS
                                                AND B.BITEMID=A.BITEMID_EBS
                                                AND A.INT_SOURCE=B.INT_SOURCE AND A.PROJECT_EBS=b.PROJECT_EBS)
                              AND A.PROJECT_EBS IN (SELECT PROJECTEBS
                              FROM INT_PROJECT_LIST WHERE TYPE_PROJECT='FM-RE'))
      LOOP

      point_debug:=5;--Punto para mapeo de errores
      IF TRANSACTION_EBS_.TYPE_PROJECT = 'PC' THEN

            point_debug:=6;--Punto para mapeo de errores
            --Segun sea la fuente extaer el identificador de la interface
            OPEN c_interfaz(TRANSACTION_EBS_.INT_SOURCE);
              FETCH c_interfaz INTO r_interfaz;
              vb_existe_interfaz := c_interfaz%FOUND;
            CLOSE c_interfaz;

            point_debug:=7;--Punto para mapeo de errores
            --Verificar si existe información de la interfaz
            IF vb_existe_interfaz THEN
              ID_SOURCE:=r_interfaz.ID_INTERFACES;
            ELSE
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No Existe información del ID o esta nulo - Módulo PC '||ID_SOURCE,0,TRANSACTION_EBS_.TRANSACTION_EBS);
            END IF;

             point_debug:=8;--Punto para mapeo de errores
            --Buscar el bp que pertenezca a la interfaz ingresada como parametro de integración y que este activo (Y)
            OPEN c_bp(ID_SOURCE,TRANSACTION_EBS_.PROJECT_EBS);
              FETCH c_bp INTO r_bp;
              vb_existe_bp := c_bp%FOUND;
            CLOSE c_bp;

            point_debug:=9;--Punto para mapeo de errores
            --Verificar si existe información de la interfaz
            IF vb_existe_bp THEN
              BPNAME:=r_bp.BPNAME;
              PROJECTCODE:=r_bp.PROJECT_CODE;
            ELSE
              point_debug:=10;--Punto para mapeo de errores
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No Existe información del proceso de negocio con la interfaz: '||TRANSACTION_EBS_.INT_SOURCE||' - Módulo PC ',0,TRANSACTION_EBS_.TRANSACTION_EBS);
            END IF;

            point_debug:=11;--Punto para mapeo de errores
            --Insertar el monto total del resultado del cursor
            OPEN c_bp_amount(TRANSACTION_EBS_.INT_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS,TRANSACTION_EBS_.PROJECT_EBS);
              FETCH c_bp_amount INTO r_bp_amount;
              vb_existe_bp_amount := c_bp_amount%FOUND;
            CLOSE c_bp_amount;

            point_debug:=14;--Punto para mapeo de errores
            --Buscar la letra Y segun la transacción que pase
            OPEN c_last_item(TRANSACTION_EBS_.TRANSACTION_EBS);
              FETCH c_last_item INTO r_last_item;
              vb_existe_last_item := c_last_item%FOUND;
            CLOSE c_last_item;

            point_debug:=15;--Punto para mapeo de errores
            --Verificar si la interfaz ingresada contiene el ultimo ítem del envío total
            IF vb_existe_last_item THEN
              IF ID_SOURCE=3 OR ID_SOURCE=4 OR ID_SOURCE=5 OR ID_SOURCE=6 OR ID_SOURCE=7 OR ID_SOURCE=10 OR ID_SOURCE=21 OR ID_SOURCE=41 OR ID_SOURCE=42 OR ID_SOURCE=43 OR ID_SOURCE=44 OR ID_SOURCE=45 THEN
                LAST_ITEM:='Y';
              END IF;
            ELSE
              IF ID_SOURCE=4 OR ID_SOURCE=42 THEN
                LAST_ITEM:='Y';
              END IF;
            END IF;

            point_debug:=16;--Punto para mapeo de errores
            IF LAST_ITEM='Y' THEN

                 OPEN c_transaction_process (TRANSACTION_EBS_.TRANSACTION_EBS,TRANSACTION_EBS_.PROJECT_EBS);

                  LOOP
                  point_debug:=17;--Punto para mapeo de errores
                  --PROJECTCODE_EBS,BITEMID,AMOUNT,DESCRIPTION,TRANSACTION_EBS,CUSTOMDATE
                  FETCH c_transaction_process INTO r_transaction_process;

                  EXIT WHEN c_transaction_process%NOTFOUND;
                    --Validar si la fecha que viene es NULL o mantendra la fecha del sistema
                   IF r_transaction_process.CUSTOMDATE IS NOT NULL THEN

                      point_debug:=18;--Punto para mapeo de errores
                      FECHASISTEMA:=r_transaction_process.CUSTOMDATE;

                   END IF;

                  point_debug:=181;

                  IF ID_SOURCE = 7 THEN

                    BP_LINEITEM:=BP_LINEITEM || '
                            <_bp_lineitems>
                            <bi_item>TERRENO SANTO TOMAS</bi_item>
                            <amount>'||r_transaction_process.AMOUNT_EBS||'</amount>
                            <bItemID>'||r_transaction_process.BITEMID_EBS||'</bItemID>
                            <nOCAC_003_Monto_Asiento_Con>'||r_transaction_process.AMOUNT_EBS||'</nOCAC_003_Monto_Asiento_Con>
                            <nAC_003_Monto_Asiento_Con>'||r_transaction_process.AMOUNT_EBS||'</nAC_003_Monto_Asiento_Con>
                            <short_desc>'||TRANSACTION_EBS_.INT_SOURCE||'</short_desc>
                            </_bp_lineitems>';
                    TOTAL_AMOUNT:=TOTAL_AMOUNT+r_transaction_process.AMOUNT_EBS;

                  ELSIF  ID_SOURCE = 6 THEN

                    BP_LINEITEM:=BP_LINEITEM || '
                            <_bp_lineitems>
                            <bi_item>TERRENO SANTO TOMAS</bi_item>
                            <amount>'||r_transaction_process.AMOUNT_EBS||'</amount>
                            <bItemID>'||r_transaction_process.BITEMID_EBS||'</bItemID>
                            <nCSM_003_MontoEjecutadoSM>'||r_transaction_process.AMOUNT_EBS||'</nCSM_003_MontoEjecutadoSM>
                            <nOCSM_003_MontoOrdenCambiSM>'||r_transaction_process.AMOUNT_EBS||'</nOCSM_003_MontoOrdenCambiSM>
                            <short_desc>'||TRANSACTION_EBS_.INT_SOURCE||'</short_desc>
                            </_bp_lineitems>';
                   TOTAL_AMOUNT:=TOTAL_AMOUNT+r_transaction_process.AMOUNT_EBS;

                  ELSIF  ID_SOURCE = 5 THEN

                          BP_LINEITEM:=BP_LINEITEM || '
                            <_bp_lineitems>
                            <bi_item>TERRENO SANTO TOMAS</bi_item>
                            <amount>'||r_transaction_process.AMOUNT_EBS||'</amount>
                            <bItemID>'||r_transaction_process.BITEMID_EBS||'</bItemID>
                            <nSP_C_003_MontoPagado>'||r_transaction_process.AMOUNT_EBS||'</nSP_C_003_MontoPagado>
                            <nOCSP_C_003_Monto_Orden_Cam>'||r_transaction_process.AMOUNT_EBS||'</nOCSP_C_003_Monto_Orden_Cam>
                            <short_desc>'||TRANSACTION_EBS_.INT_SOURCE||'</short_desc>
                            </_bp_lineitems>';
                   TOTAL_AMOUNT:=TOTAL_AMOUNT+r_transaction_process.AMOUNT_EBS;
                  ELSIF  ID_SOURCE = 4 THEN

                         BP_LINEITEM:=BP_LINEITEM || '
                            <_bp_lineitems>
                            <bi_item>TERRENO SANTO TOMAS</bi_item>
                            <amount>'||r_transaction_process.AMOUNT_EBS||'</amount>
                            <bItemID>'||r_transaction_process.BITEMID_EBS||'</bItemID>
                            <nME_003_MontoEjecutado>'||r_transaction_process.AMOUNT_EBS||'</nME_003_MontoEjecutado>
                            <nOCME_003_Monto_Ord_Cam_Eje>'||r_transaction_process.AMOUNT_EBS||'</nOCME_003_Monto_Ord_Cam_Eje>
                            <short_desc>'||TRANSACTION_EBS_.INT_SOURCE||'</short_desc>
                            </_bp_lineitems>';
                    TOTAL_AMOUNT:=TOTAL_AMOUNT+r_transaction_process.AMOUNT_EBS;
                  ELSE

                    BP_LINEITEM:=BP_LINEITEM || '
                            <_bp_lineitems>
                            <bi_item>TERRENO SANTO TOMAS</bi_item>
                            <amount>'||r_transaction_process.AMOUNT_EBS||'</amount>
                            <bItemID>'||r_transaction_process.BITEMID_EBS||'</bItemID>
                            <nMC_005_MontoComprometido>'||r_transaction_process.AMOUNT_EBS||'</nMC_005_MontoComprometido>
                            <nPLA_006_Monto>'||r_transaction_process.AMOUNT_EBS||'</nPLA_006_Monto>
                            <nOCMC_003_MontoOrdenCamComp>'||r_transaction_process.AMOUNT_EBS||'</nOCMC_003_MontoOrdenCamComp>
                            <short_desc>'||TRANSACTION_EBS_.INT_SOURCE||'</short_desc>
                            </_bp_lineitems>';
                    TOTAL_AMOUNT:=TOTAL_AMOUNT+r_transaction_process.AMOUNT_EBS;
                  END IF;


                    point_debug:=19;--Punto para mapeo de errores
                  -- Insertar en la tabla BP_PROCESS para indicar que ya esta procesada
                    INSERT INTO INT_BP_PROCESS(BITEMID,DESCRIPTION,TRANSACTION_EBS,AMOUNT,INT_SOURCE,PROJECT_EBS)
                    VALUES(r_transaction_process.BITEMID_EBS,r_transaction_process.INT_SOURCE_DESC,
                    r_transaction_process.TRANSACTION_EBS,r_transaction_process.AMOUNT_EBS,TRANSACTION_EBS_.INT_SOURCE,TRANSACTION_EBS_.PROJECT_EBS);

                  END LOOP;

                CLOSE c_transaction_process;

                BP_HEADER:='<![CDATA[<List_Wrapper>
                            <_bp>
                            <dMC_001_FechaRegistro>'||FECHASISTEMA||'</dMC_001_FechaRegistro>
                            <dME_001_FechaRegistro>'||FECHASISTEMA||'</dME_001_FechaRegistro>
                            <dSP_C_001_FechaRegistro>'||FECHASISTEMA||'</dSP_C_001_FechaRegistro>
                            <dPLA_001_FechaRegistro>'||FECHASISTEMA||'</dPLA_001_FechaRegistro>
                            <dOCMC_001_FechaRegistro>'||FECHASISTEMA||'</dOCMC_001_FechaRegistro>
                            <dCSM_001_FechaRegistro>'||FECHASISTEMA||'</dCSM_001_FechaRegistro>
                            <dOCSM_001_FechaRegistro>'||FECHASISTEMA||'</dOCSM_001_FechaRegistro>
                            <dOCME_001_FechaRegistro>'||FECHASISTEMA||'</dOCME_001_FechaRegistro>
                            <dOCSP_C_001_FechaRegistro>'||FECHASISTEMA||'</dOCSP_C_001_FechaRegistro>
                            <dOCAC_001_FechaRegistro>'||FECHASISTEMA||'</dOCAC_001_FechaRegistro>
                            <dAC_001_FechaRegistro>'||FECHASISTEMA||'</dAC_001_FechaRegistro>
                            <dPLA_002_Desde>'||TRANSACTION_EBS_.DESDE||'</dPLA_002_Desde>
                            <dPLA_003_Hasta>'||TRANSACTION_EBS_.HASTA||'</dPLA_003_Hasta>
                            <nMC_006_MontoComprometido>'||TOTAL_AMOUNT||'</nMC_006_MontoComprometido>
                            <nCSM_004_TotalEjecutadoSM>'||TOTAL_AMOUNT||'</nCSM_004_TotalEjecutadoSM>
                            <nME_005_TotalEjecutado>'||TOTAL_AMOUNT||'</nME_005_TotalEjecutado>
                            <nSP_C_004_TotalPagado>'||TOTAL_AMOUNT||'</nSP_C_004_TotalPagado>
                            <nPLA_005_Monto_Tot_Planilla>'||TOTAL_AMOUNT||'</nPLA_005_Monto_Tot_Planilla>
                            <nOCMC_004_OrdenCambioMC>'||TOTAL_AMOUNT||'</nOCMC_004_OrdenCambioMC>
                            <nOCME_004_TotalEjecutado>'||TOTAL_AMOUNT||'</nOCME_004_TotalEjecutado>
                            <nOCSP_C_004_Total_Ord_Cam>'||TOTAL_AMOUNT||'</nOCSP_C_004_Total_Ord_Cam>
                            <nOCSM_004_Total_Ord_Cam_SM>'||TOTAL_AMOUNT||'</nOCSM_004_Total_Ord_Cam_SM>
                            <nOCAC_004_Total_Asiento_Con>'||TOTAL_AMOUNT||'</nOCAC_004_Total_Asiento_Con>
                            <nAC_004_Total_Asiento_Cont>'||TOTAL_AMOUNT||'</nAC_004_Total_Asiento_Cont>
                            <amount>'||TOTAL_AMOUNT||'</amount>
                            <project_projectname>'||TRANSACTION_EBS_.PROJECT_EBS||'</project_projectname>
                            <tMC_002_Proveedor>Frevi</tMC_002_Proveedor>
                            <tMC_003_IDordencompra>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tMC_003_IDordencompra>
                            <tME_002_IDRecepcion>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tME_002_IDRecepcion>
                            <tSP_C_002_IDRecepcion>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tSP_C_002_IDRecepcion>
                            <tPLA_004_Nro_Planilla>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tPLA_004_Nro_Planilla>
                            <tOCMC_002_IDordencambio>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tOCMC_002_IDordencambio>
                            <tCSM_002_IDSalida>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tCSM_002_IDSalida>
                            <tOCME_002_IDOrd_Cam_Recepci>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tOCME_002_IDOrd_Cam_Recepci>
                            <tOCSP_C_002_IDRecepcion>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tOCSP_C_002_IDRecepcion>
                            <tOCSM_002_ID_Ord_Cam_Salid>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tOCSM_002_ID_Ord_Cam_Salid>
                            <tOCAC_002_IDRecepcion>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tOCAC_002_IDRecepcion>
                            <tAC_002_IDRecepcion>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tAC_002_IDRecepcion>
                            <status>Aprobado</status>';
                BP_FOOTER:='</_bp></List_Wrapper>]]>';

                BPXML:=BP_HEADER||BP_LINEITEM||BP_FOOTER;

               IF ID_SOURCE = 4 AND r_transaction_process.AMOUNT_EBS < 0 THEN
                    point_debug:=20;--Punto para mapeo de errores
                    ID_SOURCE:=42;

               ELSIF  ID_SOURCE=5 AND r_transaction_process.AMOUNT_EBS < 0 THEN
                    point_debug:=21;--Punto para mapeo de errores
                    ID_SOURCE:=43;

               ELSIF ID_SOURCE=6 AND r_transaction_process.AMOUNT_EBS < 0 THEN
                    point_debug:=22;--Punto para mapeo de errores
                    ID_SOURCE:=44;

               ELSIF ID_SOURCE=7 AND r_transaction_process.AMOUNT_EBS < 0 THEN
                    point_debug:=23;--Punto para mapeo de errores
                    ID_SOURCE:=45;

               END IF;
               point_debug:=24;--Punto para mapeo de errores
               OPEN c_bp_source(ID_SOURCE,TRANSACTION_EBS_.PROJECT_EBS);
                  FETCH c_bp_source INTO r_bp_source;
                  vb_existe_bp_source := c_bp_source%FOUND;
                CLOSE c_bp_source;

                point_debug:=25;--Punto para mapeo de errores
                --Verificar si existe información de la interfaz
                IF vb_existe_bp_source THEN
                  BPNAME:=r_bp_source.BPNAME;
                  PROJECTCODE:=r_bp_source.PROJECT_CODE;
                ELSE
                  INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                  VALUES(SYSDATE, TRANSACTION_EBS_.PROJECT_EBS, '887', 'No Existe información del proceso de negocio asociado a la fuente '||ID_SOURCE||' - Módulo PC',ID_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS);
                END IF;

                point_debug:=26;--Punto para mapeo de errores
                --|||||||||||||||||||||-------  Verificar la transacción con el WS   -----------------------------|||||||||||||
                OPEN c_fn_ws(SHORTNAME,AUTHCODE,PROJECTCODE,BPNAME,BPXML);
                  FETCH c_fn_ws INTO r_fn_ws;
                  vb_existe_fn_ws := c_fn_ws%FOUND;
                CLOSE c_fn_ws;

                point_debug:=27;--Punto para mapeo de errores
                --Verificar si existe algun tipo de respuesta por parte del Web Service
                IF vb_existe_fn_ws THEN
                  STATUS_CODE:=r_fn_ws.CODE;

                    IF STATUS_CODE IS NULL OR STATUS_CODE = 814 THEN
                      point_debug:=28;--Punto para mapeo de errores
                      --Si la transacción es null o simplemente no guarda la información, debe borrarla de la tabla INT_BP_PROCESS
                      DELETE FROM INT_BP_PROCESS WHERE TRANSACTION_EBS=TRANSACTION_EBS_.TRANSACTION_EBS and INT_SOURCE=TRANSACTION_EBS_.INT_SOURCE AND PROJECT_EBS=TRANSACTION_EBS_.PROJECT_EBS;

                      point_debug:=29;--Punto para mapeo de errores
                      --Agregar la información al log de transacciones de EBS
                      INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                      VALUES(SYSDATE, PROJECTCODE, '886', 'Error interactuando con el Web Service para guardar la transaccion, retorno null, se procesara de nuevo con el número de transacción: '||TRANSACTION_EBS_.TRANSACTION_EBS||' y la fuente: '||ID_SOURCE||', EL XML Contiene: '||BPXML||' - Módulo PC',ID_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS);
                    END IF;

                ELSE
                  point_debug:=30;--Punto para mapeo de errores
                  INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                  VALUES(SYSDATE, PROJECTCODE, '886', 'Error interactuando con el Web Service para guardar la transaccion '||TRANSACTION_EBS_.TRANSACTION_EBS||' y la fuente: '||ID_SOURCE||' - Módulo PC',ID_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS);
                END IF;

                IF STATUS_CODE IS NOT NULL THEN

                 point_debug:=31;--Punto para mapeo de errores
                   --Guardar el resultado de la transacción guardada en Unifier
                 INSERT INTO LOG_BP_PROCESS(RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,INTERFACE_CODE,TRANSACTION_EBS,DATE_TRANSACTION)
                 VALUES (STATUS_CODE,BPXML,BPNAME,PROJECTCODE,ID_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS,sysdate);
                END IF;

               --Se desocupan las variables que contienen la información del XML procesado
                BPXML:='';
                BP_LINEITEM:='';
                TOTAL_AMOUNT:=0;
                LOG_TRANSACTION:=TRANSACTION_EBS_.TRANSACTION_EBS;
            END IF;--IF LAST_ITEM='Y' THEN

         ELSIF TRANSACTION_EBS_.TYPE_PROJECT = 'FM-RE' THEN

            point_debug:=32;--Punto para mapeo de errores
            --Segun sea la fuente extaer el identificador de la interface
            OPEN c_interfaz(TRANSACTION_EBS_.INT_SOURCE);
              FETCH c_interfaz INTO r_interfaz;
              vb_existe_interfaz := c_interfaz%FOUND;
            CLOSE c_interfaz;

            point_debug:=33;--Punto para mapeo de errores
            --Verificar si existe información de la interfaz
            IF vb_existe_interfaz THEN
              ID_SOURCE:=r_interfaz.ID_INTERFACES;
            ELSE
              point_debug:=34;--Punto para mapeo de errores
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No Existe información del proceso de negocio con la interfaz: '||TRANSACTION_EBS_.INT_SOURCE||' - Módulo FM-RE ',0,TRANSACTION_EBS_.TRANSACTION_EBS);
            END IF;

            point_debug:=35;--Punto para mapeo de errores
            --Buscar el bp que pertenezca a la interfaz ingresada como parametro de integración y que este activo (Y)
            OPEN c_bp(ID_SOURCE,TRANSACTION_EBS_.PROJECT_EBS);
              FETCH c_bp INTO r_bp;
              vb_existe_bp := c_bp%FOUND;
            CLOSE c_bp;

            point_debug:=36;--Punto para mapeo de errores
            --Verificar si existe información de la interfaz
            IF vb_existe_bp THEN
              BPNAME:=r_bp.BPNAME;
              PROJECTCODE:=r_bp.PROJECT_CODE;
            ELSE
              point_debug:=37;--Punto para mapeo de errores
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No Existe información del proceso de negocio con la interfaz: '||TRANSACTION_EBS_.INT_SOURCE||' - Módulo FM-RE ',0,TRANSACTION_EBS_.TRANSACTION_EBS);
            END IF;

            point_debug:=38;--Punto para mapeo de errores
            --Insertar el monto total del resultado del cursor
            OPEN c_bp_amount(TRANSACTION_EBS_.INT_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS,TRANSACTION_EBS_.PROJECT_EBS);
              FETCH c_bp_amount INTO r_bp_amount;
              vb_existe_bp_amount := c_bp_amount%FOUND;
            CLOSE c_bp_amount;

            --Verificar si existe información de la interfaz
            TOTAL_AMOUNT:=0;
            IF vb_existe_bp_amount THEN
              point_debug:=39;--Punto para mapeo de errores
              --SELECT SUM(AMOUNT_EBS) INTO TOTAL_AMOUNT FROM INT_EBS_AMOUNT WHERE TRANSACTION_EBS=TRANSACTION_EBS_.TRANSACTION_EBS AND INT_SOURCE=TRANSACTION_EBS_.INT_SOURCE AND PROJECT_EBS=TRANSACTION_EBS_.PROJECT_EBS;

            ELSE
              point_debug:=40;--Punto para mapeo de errores
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No se pudo calcular el monto total de los registros asociados a la transacción: '||TRANSACTION_EBS_.TRANSACTION_EBS||' y la interfaz: '||ID_SOURCE||' - Módulo PC',0,TRANSACTION_EBS_.TRANSACTION_EBS);
            END IF;

            point_debug:=41;--Punto para mapeo de errores
            --Buscar la letra Y segun la transacción que pase
            OPEN c_last_item(TRANSACTION_EBS_.TRANSACTION_EBS);
              FETCH c_last_item INTO r_last_item;
              vb_existe_last_item := c_last_item%FOUND;
            CLOSE c_last_item;

            point_debug:=42;--Punto para mapeo de errores
            --Verificar si la interfaz ingresada contiene el ultimo ítem del envío total
            IF vb_existe_last_item THEN
              IF ID_SOURCE=3 OR ID_SOURCE=4 OR ID_SOURCE=5 OR ID_SOURCE=6 OR ID_SOURCE=7 OR ID_SOURCE=10 OR ID_SOURCE=21 OR ID_SOURCE=41 OR ID_SOURCE=42 OR ID_SOURCE=43 OR ID_SOURCE=44 OR ID_SOURCE=45 THEN
                LAST_ITEM:='Y';
              END IF;
            ELSE
              IF ID_SOURCE=4 OR ID_SOURCE=42 THEN
                LAST_ITEM:='Y';
              END IF;
            END IF;

            point_debug:=43;--Punto para mapeo de errores
            IF LAST_ITEM='Y' THEN

                OPEN c_transaction_process (TRANSACTION_EBS_.TRANSACTION_EBS,TRANSACTION_EBS_.PROJECT_EBS);

                  LOOP

                  point_debug:=44;--Punto para mapeo de errores
                  FETCH c_transaction_process INTO r_transaction_process;

                  EXIT WHEN c_transaction_process%NOTFOUND;

                IF r_transaction_process.CUSTOMDATE IS NOT NULL THEN

                  point_debug:=45;--Punto para mapeo de errores
                  FECHASISTEMA:=r_transaction_process.CUSTOMDATE;

                END IF;

                    IF ID_SOURCE = 7 THEN

                    point_debug:=451||r_transaction_process.AMOUNT_EBS;--Punto para mapeo de errores

                     DBMS_OUTPUT.PUT_LINE('Voy en:'||r_transaction_process.BITEMID_EBS||FECHASISTEMA);

                    BP_LINEITEM:=BP_LINEITEM ||
                                '<_bp_lineitems>
                                <bi_item>TST</bi_item>
                                <amount>'||r_transaction_process.AMOUNT_EBS||'</amount>
                                <uuu_cm0_picker>'||r_transaction_process.BITEMID_EBS||'</uuu_cm0_picker>
                                <uuu_effective_date>'||FECHASISTEMA||'</uuu_effective_date>
                                <ueffectyearPD>'||TO_CHAR(FECHASISTEMA,'YYYY')||'</ueffectyearPD>
                                <nME_003_MontoEjecutado>'||r_transaction_process.AMOUNT_EBS||'</nME_003_MontoEjecutado>
                                <nOCME_002_Mon_Ord_Cam_EjeFM>'||r_transaction_process.AMOUNT_EBS||'</nOCME_002_Mon_Ord_Cam_EjeFM>
                                <short_desc>'||TRANSACTION_EBS_.INT_SOURCE||'</short_desc>
                                </_bp_lineitems>';

                    TOTAL_AMOUNT:=TOTAL_AMOUNT+r_transaction_process.AMOUNT_EBS;


                    ELSE
                    point_debug:=452;--Punto para mapeo de errores
                        BP_LINEITEM:=BP_LINEITEM ||
                                '<_bp_lineitems>
                                <bi_item>TST</bi_item>
                                <amount>'||r_transaction_process.AMOUNT_EBS||'</amount>
                                <uuu_cm0_picker>'||r_transaction_process.BITEMID_EBS||'</uuu_cm0_picker>
                                <uuu_effective_date>'||FECHASISTEMA||'</uuu_effective_date>
                                <ueffectyearPD>'||TO_CHAR(FECHASISTEMA,'YYYY')||'</ueffectyearPD>
                                <nMcFm_001_MontoComprometido>'||r_transaction_process.AMOUNT_EBS||'</nMcFm_001_MontoComprometido>
                                <nOCMC_00_MontoOrdenCamComp>'||r_transaction_process.AMOUNT_EBS||'</nOCMC_00_MontoOrdenCamComp>
                                <short_desc>'||TRANSACTION_EBS_.INT_SOURCE||'</short_desc>
                                </_bp_lineitems>';

                    TOTAL_AMOUNT:=TOTAL_AMOUNT+r_transaction_process.AMOUNT_EBS;

                                DBMS_OUTPUT.PUT_LINE('Voy en:'||ID_SOURCE);

                    END IF;



                          point_debug:=46;--Punto para mapeo de errores
                          INSERT INTO INT_BP_PROCESS(BITEMID,DESCRIPTION,TRANSACTION_EBS,AMOUNT,INT_SOURCE,PROJECT_EBS)
                          VALUES(r_transaction_process.BITEMID_EBS,r_transaction_process.INT_SOURCE_DESC,
                          r_transaction_process.TRANSACTION_EBS,r_transaction_process.AMOUNT_EBS,TRANSACTION_EBS_.INT_SOURCE,TRANSACTION_EBS_.PROJECT_EBS);

                     END LOOP;

                point_debug:=47;--Punto para mapeo de errores
                CLOSE c_transaction_process;

                       IF (ID_SOURCE=4 OR ID_SOURCE=5 OR ID_SOURCE=6 OR ID_SOURCE=7) THEN
                            point_debug:=48;--Punto para mapeo de errores
                            IF ID_SOURCE=5 AND r_transaction_process.AMOUNT_EBS < 0 THEN
                               point_debug:=49;--Punto para mapeo de errores
                               ID_SOURCE:=43;

                             ELSIF ID_SOURCE=6 AND r_transaction_process.AMOUNT_EBS < 0 THEN
                               point_debug:=50;--Punto para mapeo de errores
                               ID_SOURCE:=44;

                             ELSIF ID_SOURCE=7 AND r_transaction_process.AMOUNT_EBS < 0 THEN
                               point_debug:=51;--Punto para mapeo de errores
                               ID_SOURCE:=45;

                             ELSIF ID_SOURCE=4 AND r_transaction_process.AMOUNT_EBS <0 THEN
                              point_debug:=52;--Punto para mapeo de errores
                              ID_SOURCE:=42;

                            END IF;
                        point_debug:=53;--Punto para mapeo de errores
                        OPEN c_bp_source(ID_SOURCE,TRANSACTION_EBS_.PROJECT_EBS);
                        FETCH c_bp_source INTO r_bp_source;
                          vb_existe_bp_source := c_bp_source%FOUND;
                        CLOSE c_bp_source;

                          --Verificar si existe información de la interfaz
                        IF vb_existe_bp_source THEN
                          BPNAME:=r_bp_source.BPNAME;
                          PROJECTCODE:=r_bp_source.PROJECT_CODE;
                        ELSE
                          point_debug:=54;--Punto para mapeo de errores
                          INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS,BPNAME)
                          VALUES(SYSDATE, 'N/A', '887', 'No Existe información del proceso de negocio asociado, fuente: '||ID_SOURCE||' la transacción: '||TRANSACTION_EBS_.TRANSACTION_EBS||' o no hay valores negativos',0,TRANSACTION_EBS_.TRANSACTION_EBS,BPNAME);
                        END IF;

                      END IF;

                    IF ID_SOURCE = 7 THEN

                        BP_HEADER:='<![CDATA[<List_Wrapper>
                            <_bp>
                            <uuu_effective_date>'||FECHASISTEMA||'</uuu_effective_date>
                            <ueffectyearPD>'||TO_CHAR(FECHASISTEMA,'YYYY')||'</ueffectyearPD>
                            <tMC_003_IDordencompra>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tMC_003_IDordencompra>
                            <tOCMC_006_IDordencompra>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tOCMC_006_IDordencompra>
                            <BuildingName>'||TRANSACTION_EBS_.PROJECT_EBS||'</BuildingName>
                            <nME_005_TotalEjecutado>'||TOTAL_AMOUNT||'</nME_005_TotalEjecutado>
                            <nOCME_03_TotalEjecutadoOCFM>'||TOTAL_AMOUNT||'</nOCME_03_TotalEjecutadoOCFM>
                            <amount>'||TOTAL_AMOUNT||'</amount>
                            <status>Aprobado</status>';


                    ELSE

                        BP_HEADER:='<![CDATA[<List_Wrapper>
                            <_bp>
                            <uuu_effective_date>'||FECHASISTEMA||'</uuu_effective_date>
                            <ueffectyearPD>'||TO_CHAR(FECHASISTEMA,'YYYY')||'</ueffectyearPD>
                            <tMC_003_IDordencompra>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tMC_003_IDordencompra>
                            <tOCME_01_IDOrd_Cam_Ejec_FM>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tOCME_01_IDOrd_Cam_Ejec_FM>
                            <tOCMC_006_IDordencompra>'||TRANSACTION_EBS_.TRANSACTION_EBS||'</tOCMC_006_IDordencompra>
                            <BuildingName>'||TRANSACTION_EBS_.PROJECT_EBS||'</BuildingName>
                            <nME_005_TotalEjecutado>'||TOTAL_AMOUNT||'</nME_005_TotalEjecutado>
                            <nMC_006_MontoComprometido>'||TOTAL_AMOUNT||'</nMC_006_MontoComprometido>
                            <nOCME_03_TotalEjecutadoOCFM>'||TOTAL_AMOUNT||'</nOCME_03_TotalEjecutadoOCFM>
                            <nOCMC_008_OrdenCambioMC>'||TOTAL_AMOUNT||'</nOCMC_008_OrdenCambioMC>
                            <amount>'||TOTAL_AMOUNT||'</amount>
                            <status>Aprobado</status>';


                    END IF;

                BP_FOOTER:='</_bp></List_Wrapper>]]>';

                BPXML:=BP_HEADER||BP_LINEITEM||BP_FOOTER;

                      point_debug:=55;--Punto para mapeo de errores
                   --|||||||||||||||||||||-------  Verificar la transacción con el WS   -----------------------------|||||||||||||
                      OPEN c_fn_ws(SHORTNAME,AUTHCODE,PROJECTCODE,BPNAME,BPXML);
                        FETCH c_fn_ws INTO r_fn_ws;
                        vb_existe_fn_ws := c_fn_ws%FOUND;
                      CLOSE c_fn_ws;

                      point_debug:=56;--Punto para mapeo de errores
                      --Verificar si existe algun tipo de respuesta por parte del Web Service
                      IF vb_existe_fn_ws THEN
                        STATUS_CODE:=r_fn_ws.CODE;

                          IF STATUS_CODE is null OR STATUS_CODE = 814 then
                            point_debug:=57;--Punto para mapeo de errores
                            --Si la transacción es null o simplemente no guarda la información, debe borrarla de la tabla INT_BP_PROCESS y procesarla en la proxima ejecución del Job
                            DELETE FROM INT_BP_PROCESS WHERE TRANSACTION_EBS=TRANSACTION_EBS_.TRANSACTION_EBS and INT_SOURCE=TRANSACTION_EBS_.INT_SOURCE AND PROJECT_EBS=TRANSACTION_EBS_.PROJECT_EBS;

                            point_debug:=58;--Punto para mapeo de errores
                            --Agregar la información al log de transacciones de EBS
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, PROJECTCODE, '886', 'Error interactuando con el Web Service para guardar la transaccion, retorno null, se procesara de nuevo con el número de transacción: '||TRANSACTION_EBS_.TRANSACTION_EBS||' y la fuente: '||ID_SOURCE||', el XML Contiene: '||BPXML||' - Módulo FM',ID_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS);
                          END IF;

                      ELSE
                        point_debug:=59;--Punto para mapeo de errores
                        INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS,BPNAME)
                        VALUES(SYSDATE, PROJECTCODE, '886', 'Error interactuando con el Web Service para guardar la transaccion '||ID_SOURCE,ID_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS,BPNAME);
                      END IF;

                    IF STATUS_CODE IS NOT NULL THEN
                     point_debug:=60;--Punto para mapeo de errores
                       --Guardar el resultado de la transacción guardada en Unifier
                     INSERT INTO LOG_BP_PROCESS(RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,INTERFACE_CODE,TRANSACTION_EBS,DATE_TRANSACTION)
                     VALUES (STATUS_CODE,BPXML,BPNAME,PROJECTCODE,ID_SOURCE,TRANSACTION_EBS_.TRANSACTION_EBS,sysdate);

                    END IF;


                BPXML:='';
                BP_LINEITEM:='';
                TOTAL_AMOUNT:=0;
                LOG_TRANSACTION:=TRANSACTION_EBS_.TRANSACTION_EBS;
             END IF;--Fin del ciclo para proyectos tipo PC

            END IF;--IF LAST_ITEM='Y' THEN

      END LOOP;

 --Bloque de excepciones
    EXCEPTION

         WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

         INSERT INTO LOG_BP_PROCESS(RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,INTERFACE_CODE,TRANSACTION_EBS,DATE_TRANSACTION)
         VALUES('999','Error procesando datos en el ingreso de información a Unifier mediante el WS: '||r_bp.PROJECT_CODE||' ,BP:'||BPNAME||' con el mensaje: '||err_msg||' en el punto: '||point_debug,BPNAME,r_bp.PROJECT_CODE,0,LOG_TRANSACTION,SYSDATE);

END INT_SP_ADDREGISTER_WITH_WS;
