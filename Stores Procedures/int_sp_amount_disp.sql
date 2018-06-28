create or replace procedure INT_SP_AMOUNT_COMMITED
IS

--Cursor para verificar los (BP) procesos de negocio asociados a:
--MC => Monto Comprometido
CURSOR c_disponible IS
       SELECT DISTINCT B.PROJECT_CODE,A.PROJECTEBS,A.TYPE_PROJECT
       FROM INT_PROJECT_LIST A, INT_BP_PROJECT B
       WHERE B.PROJECT_CODE=A.PROJECTCODE_U AND PROJECTEBS IS NOT NULL AND B.ID_INTERFACES IN (11,12);

--Cursor que verifica la información de autenticación en Unifier
CURSOR c_auth_unifier IS
    SELECT ID_AUTH,SHORTNAME,AUTHCODE
    FROM INT_AUTH
    WHERE ACTIVE='Y';

--Cursor que verifica la información del BP con interfaz 9 y su respectivo codigo de proyecto
CURSOR c_mc(PROJECTUNIFIER varchar2) IS
    SELECT BPNAME
    FROM INT_BP_PROJECT
    WHERE ID_INTERFACES=10
    AND BP_ACTIVE='Y'
    AND PROJECT_CODE=PROJECTUNIFIER;

--Cursor para verificar la información que exista en la tabla INT_UPDATE_AMOUT para PC
 CURSOR c_amount_pc (SHORTNAME VARCHAR2,AUTHCODE VARCHAR2,PROJECTUNIFIER VARCHAR2,BPNAME VARCHAR2,TYPEAMOUNT VARCHAR2) IS
    SELECT bItemID,record_no,status,amount
    FROM (select xp.bItemID,xt.record_no,xt.status,sum(to_number(xp.amount,'999999999999999999.9999999999999999')) amount
          FROM (select xmltype(DBMS_XMLGEN.CONVERT(getbplist(SHORTNAME,AUTHCODE,PROJECTUNIFIER,BPNAME,null).extract('//xmlcontents/text()').getClobVal(),1)) valor
                from dual) x
    LEFT JOIN
    xmltable('/List_Wrapper/_bp'
    passing x.valor
    COLUMNS
    status varchar(30) path 'status',
    record_no varchar2(30) path 'record_no',
    bItemID XMLTYPE path '_bp_lineitems'
    ) xt on (1=1)
    left join
    xmltable('/_bp_lineitems'
    passing xt.bItemID
    COLUMNS
    bItemID VARCHAR2(2000) path 'bItemID',
    amount varchar2(500) path 'amount') xp on (1=1) group by xp.bItemID,xt.record_no,xt.status) A
    WHERE NOT EXISTS (SELECT *
                      FROM INT_UPDATE_AMOUNT B
                      WHERE B.BITEMID_CS=A.bItemID
                      AND A.RECORD_NO=B.RECORD_NO
                      AND B.PROJECT_UNIFIER=PROJECTUNIFIER
                      AND TYPE_AMOUNT = TYPEAMOUNT)
          AND record_no is not null
          AND A.STATUS='Aprobado'
          AND A.bItemID IS NOT NULL;

--Cursor para verificar la información que exista en la tabla INT_UPDATE_AMOUT para FM
CURSOR c_amount_fm (SHORTNAME VARCHAR2,AUTHCODE VARCHAR2,PROJECTUNIFIER VARCHAR2,BPNAME VARCHAR2,TYPEAMOUNT VARCHAR2) IS
   select xp.uuu_cm0_picker,xt.record_no,xt.status,to_date(xp.uuu_effective_date,'mm-dd-yyyy HH24:MI:SS') effective_date,sum(to_number(xp.amount,'999999999999999999.999999999999999')) amount
   from (select xmltype(replace(replace(replace(getbplist(SHORTNAME,AUTHCODE,PROJECTUNIFIER,BPNAME,null).extract('//xmlcontents/text()').getClobVal(),'&lt;','<'),'&gt;','>'),'&quot;','"')) valor
        from dual) x
   left join
   xmltable('/List_Wrapper/_bp'
   passing x.valor
   COLUMNS
   status VARCHAR2 (20) path 'status',
   record_no varchar2(30) path 'record_no',
   uuu_effective_date varchar2(50) path 'uuu_effective_date',
   bItemID XMLTYPE path '_bp_lineitems'
   ) xt on (1=1)
   left join
   xmltable('/_bp_lineitems'
   passing xt.bItemID
   COLUMNS
   uuu_cm0_picker VARCHAR2(50) path 'uuu_cm0_picker'  ,
   uuu_effective_date varchar(50) path 'uuu_effective_date',
   amount varchar (30) path 'amount',
   short_desc varchar(50) path 'short_desc') xp on (1=1)
   where not exists (select *
                     from INT_UPDATE_AMOUNT B
                     where B.BITEMID_CS=xp.uuu_cm0_picker
                     and B.RECORD_NO=xt.record_no
                     and to_date(xp.uuu_effective_date,'mm-dd-yyyy HH24:MI:SS')=b.EFFECTIVE_DATE
                     and B.PROJECT_UNIFIER=PROJECTUNIFIER
                     and TYPE_AMOUNT = TYPEAMOUNT)
   and xt.status in ('Approved','Aprobado')
   and xt.record_no is not null
   and xp.uuu_cm0_picker is not null
   and xp.uuu_effective_date is not null
   group by xp.uuu_cm0_picker,xt.record_no,xt.status,to_date(xp.uuu_effective_date,'mm-dd-yyyy HH24:MI:SS');

--Vaiables del cursor
r_disponible        c_disponible%rowtype;
r_auth_unifier      c_auth_unifier%rowtype;
r_mc                c_mc%rowtype; --Monto Comprometido
r_amount_pc         c_amount_pc%rowtype; --Verificar la existencia del registro en la tabla donde lo procesa para PC
r_amount_fm         c_amount_fm%rowtype; --Verificar la existencia del registro en la tabla donde lo procesa para FM


--Bloque de variables para la verificación de existencia de valores en el resultado de consulta de los cursores
vb_existe_auth_unifier  boolean;
vb_existe_mc            boolean; --Initial Plan
vb_existe_amount_pc     boolean;
vb_existe_amount_fm     boolean;

--Variables locales
SHORTNAME             VARCHAR2(20);
AUTHCODE              VARCHAR2(4);
BPNAME                VARCHAR2(50);

--Log de mensajes en las excepciones
err_num               NUMBER;
err_msg               VARCHAR2(255);
point_debug           NUMBER:=0;

BEGIN

execute immediate 'alter session set NLS_DATE_LANGUAGE=''SPANISH''';
execute immediate 'alter session set NLS_TERRITORY=''SPAIN''';
execute immediate 'alter session set nls_date_format=''MM/DD/YYYY''';
execute immediate 'alter session set NLS_NUMERIC_CHARACTERS= ''.,'' ';

--Abrir el cursor para autenticación en Unifier
OPEN c_auth_unifier;
    FETCH c_auth_unifier INTO r_auth_unifier;
    vb_existe_auth_unifier := c_auth_unifier%FOUND;
CLOSE c_auth_unifier;

--Verificar si existe la información de la autenticación con unifier
IF vb_existe_auth_unifier THEN
  SHORTNAME:=r_auth_unifier.SHORTNAME;
  AUTHCODE:=r_auth_unifier.AUTHCODE;
ELSE
  INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
  VALUES(SYSDATE, 'N/A', '887', 'No Existe información para la autenticación con Unifier, por favor verifique la tabla INT_AUTH - Monto Comprometido',0,'N/A');
END IF;

 OPEN c_disponible;
   LOOP
   FETCH c_disponible INTO r_disponible;
   EXIT WHEN c_disponible%NOTFOUND;

        point_debug:=1;--Punto para mapeo

        IF r_disponible.TYPE_PROJECT='PC' THEN

        point_debug:=2;--Punto para mapeo

            OPEN c_mc (r_disponible.PROJECT_CODE);
              FETCH c_mc INTO r_mc;
              vb_existe_mc := c_mc%FOUND;
            CLOSE c_mc;

        --Verificar si existe la información del BP para presupuesto inicial
            IF vb_existe_mc THEN

                BPNAME:=r_mc.BPNAME;--Capturar el nombre del proceso de negocio
                point_debug:=3;--Punto para mapeo

                --Verificar que existe información del cursor c_amount_pc
                OPEN c_amount_pc (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'MC');
                    FETCH c_amount_pc INTO r_amount_pc;
                    vb_existe_amount_pc := c_amount_pc%FOUND;
                CLOSE c_amount_pc;

                IF vb_existe_amount_pc THEN
                      --//Se recorre el cursor que tiene la consulta a la función del Web Service, pasandole los parametros necesarios que requiere el WS
                      --//y adicional el tipo de transacción IP= Initial Plan (Columna de Unifier presupuesto inicial)
                      OPEN c_amount_pc (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'MC');
                       LOOP
                         FETCH c_amount_pc INTO r_amount_pc;
                         EXIT WHEN c_amount_pc%NOTFOUND;
                            point_debug:=4;--Punto para mapeo
                            INSERT INTO INT_UPDATE_AMOUNT (PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,TYPE_AMOUNT)
                            VALUES (r_disponible.PROJECTEBS,r_amount_pc.bItemID,r_disponible.PROJECT_CODE,r_amount_pc.record_no,'N',r_amount_pc.status,r_amount_pc.amount,'MC');
                       END LOOP;
                      CLOSE c_amount_pc;

                END IF;
            ELSE
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, r_disponible.PROJECTEBS, '987', 'No Existe información para el BP de Monto Comprometido, interfaz 10 - Actualizando presupuesto PC',0,'N/A');
            END IF;

        ELSIF r_disponible.TYPE_PROJECT='FM-RE' THEN--IF r_disponible.TYPE_PROJECT='PC' THEN

            OPEN c_mc (r_disponible.PROJECT_CODE);
              FETCH c_mc INTO r_mc;
              vb_existe_mc := c_mc%FOUND;
            CLOSE c_mc;

           --Verificar si existe la información del BP para pres
            IF vb_existe_mc THEN

                BPNAME:=r_mc.BPNAME;

                OPEN c_amount_fm (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'MC');
                    FETCH c_amount_fm INTO r_amount_fm;
                    vb_existe_amount_fm := c_amount_fm%FOUND;
                CLOSE c_amount_fm;

                IF vb_existe_amount_fm THEN

                      OPEN c_amount_fm (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'MC');
                       LOOP
                         FETCH c_amount_fm INTO r_amount_fm;
                         EXIT WHEN c_amount_fm%NOTFOUND;
                            INSERT INTO INT_UPDATE_AMOUNT (PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,EFFECTIVE_DATE,TYPE_AMOUNT)
                            VALUES (r_disponible.PROJECTEBS,r_amount_fm.uuu_cm0_picker,r_disponible.PROJECT_CODE,r_amount_fm.record_no,'N',r_amount_fm.status,r_amount_fm.amount,r_amount_fm.effective_date,'MC');
                       END LOOP;
                      CLOSE c_amount_fm;
              END IF;--IF vb_existe_amount_fm THEN
        END IF;--IF vb_existe_mc THEN
   END IF;
   END LOOP;
   CLOSE c_disponible;

EXCEPTION

         WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

         INSERT INTO LOG_BP_PROCESS(RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,INTERFACE_CODE,TRANSACTION_EBS,DATE_TRANSACTION)
         VALUES('999','Error procesando datos con los presupuestos, proyecto: '||r_disponible.PROJECTEBS||' ,BP:'||BPNAME||' con el mensaje: '||err_msg||' en el punto: '||point_debug,'',0,'','',SYSDATE);
END;
