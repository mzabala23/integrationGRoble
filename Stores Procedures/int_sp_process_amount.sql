create or replace PROCEDURE INT_SP_PROCESS_AMOUNT
IS

--Cursor para verificar los (BP) procesos de negocio asociados a:
--IP => Presupuesto Inicial
--AT => Transferencia Entre Lineas
--CO => Ordenes de Cambio
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
CURSOR c_ip(PROJECTUNIFIER varchar2) IS
    SELECT BPNAME
    FROM INT_BP_PROJECT
    WHERE ID_INTERFACES=9
    AND BP_ACTIVE='Y'
    AND PROJECT_CODE=PROJECTUNIFIER;

--Cursor que verifica la información del BP con interfaz 12 y su respectivo codigo de proyecto
CURSOR c_at(PROJECTUNIFIER varchar2) IS
    SELECT BPNAME
    FROM INT_BP_PROJECT
    WHERE ID_INTERFACES=12
    AND BP_ACTIVE='Y'
    AND PROJECT_CODE=PROJECTUNIFIER;

--Cursor que verifica la información del BP con interfaz 11 y su respectivo codigo de proyecto
CURSOR c_co(PROJECTUNIFIER varchar2) IS
    SELECT BPNAME
    FROM INT_BP_PROJECT
    WHERE ID_INTERFACES=11
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

--Cursor para verficar la información de los registros que no han sido ingresados en la tabla INT_BP_AMOUNT para PC
CURSOR c_insert_amount_pc (PROJECTEBS varchar2,TYPEAMOUNT VARCHAR2) IS
  select ID_UPDATE_AMOUNT,BITEMID_CS,STATUS,AMOUNT
  from INT_UPDATE_AMOUNT xt where FLAG='N'
  AND NOT EXISTS (select *
                  from INT_BP_AMOUNT xp
                  where xt.BITEMID_CS=xp.BITEMID_CS
                  and xt.PROJECT_EBS=xp.PROJECT_BPA)
  and xt.PROJECT_EBS=PROJECTEBS and xt.TYPE_AMOUNT=TYPEAMOUNT;

--Cursor para verificar la información de los registros que no ha sido actualizada en la tabla INT_BP_AMOUNT para PC
CURSOR c_update_amount_pc (PROJECTEBS VARCHAR2,TYPEAMOUNT VARCHAR2) is
  select ID_UPDATE_AMOUNT,BITEMID_CS,STATUS,AMOUNT
  from INT_UPDATE_AMOUNT xt where FLAG='N'
  and xt.PROJECT_EBS=PROJECTEBS and xt.TYPE_AMOUNT=TYPEAMOUNT;

--Cursor para verificar la información de los registros que no ha sido ingresados en la tabla INT_BP_AMOUNT para FM
CURSOR c_insert_amount_fm (PROJECTEBS varchar2,TYPEAMOUNT VARCHAR2) IS
  select BITEMID_CS,STATUS,SUM(AMOUNT) amount,EFFECTIVE_DATE, to_char(EFFECTIVE_DATE,'YYYY') YEAR_EFFECTIVE
  from INT_UPDATE_AMOUNT xt where FLAG='N'
  AND NOT EXISTS (select * from INT_BP_AMOUNT xp where xt.BITEMID_CS=xp.BITEMID_CS
                and xt.PROJECT_EBS=xp.PROJECT_BPA
                and to_char(xt.EFFECTIVE_DATE,'MM')=to_char(xp.EFFECTIVE_DATE,'MM')
                and to_char(xt.EFFECTIVE_DATE,'YYYY')=to_char(xp.EFFECTIVE_DATE,'YYYY'))
  and xt.PROJECT_EBS=PROJECTEBS
  and xt.TYPE_AMOUNT=TYPEAMOUNT
  GROUP BY BITEMID_CS,STATUS,EFFECTIVE_DATE,to_char(EFFECTIVE_DATE,'YYYY');

----Cursor para verificar la información de los registros que no ha sido actualizada en la tabla INT_BP_AMOUNT para FM
CURSOR c_update_amount_fm (PROJECTEBS VARCHAR2,TYPEAMOUNT VARCHAR2) is
  select BITEMID_CS,STATUS,xt.EFFECTIVE_DATE,SUM(AMOUNT) amount,to_char(EFFECTIVE_DATE,'YYYY') YEAR_EFFECTIVE
  from INT_UPDATE_AMOUNT xt where FLAG='N'
  and xt.PROJECT_EBS=PROJECTEBS and xt.TYPE_AMOUNT=TYPEAMOUNT
  GROUP BY BITEMID_CS,STATUS,xt.EFFECTIVE_DATE,to_char(EFFECTIVE_DATE,'YYYY');

--Vaiables del cursor
r_disponible        c_disponible%rowtype;
r_auth_unifier      c_auth_unifier%rowtype;
r_ip                c_ip%rowtype; --Initial Plan
r_at                c_at%rowtype; --Amount Transfer
r_co                c_co%rowtype; --Change Order
r_amount_pc         c_amount_pc%rowtype; --Verificar la existencia del registro en la tabla donde lo procesa para PC
r_amount_fm         c_amount_fm%rowtype; --Verificar la existencia del registro en la tabla donde lo procesa para FM
r_insert_amount_pc  c_insert_amount_pc%rowtype;
r_update_amount_pc  c_update_amount_pc%rowtype;
r_insert_amount_fm  c_insert_amount_fm%rowtype;
r_update_amount_fm  c_update_amount_fm%rowtype;


--Bloque de variables para la verificación de existencia de valores en el resultado de consulta de los cursores
vb_existe_auth_unifier  boolean;
vb_existe_ip            boolean; --Initial Plan
vb_existe_at            boolean; --Amount Transfer
vb_existe_co            boolean; --Change Order
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
  VALUES(SYSDATE, 'N/A', '887', 'No Existe información para la autenticación con Unifier, por favor verifique la tabla INT_AUTH - Actualizando presupuesto',0,'N/A');
END IF;

 OPEN c_disponible;
   LOOP
   FETCH c_disponible INTO r_disponible;
   EXIT WHEN c_disponible%NOTFOUND;

        point_debug:=1;--Punto para mapeo

        IF r_disponible.TYPE_PROJECT='PC' THEN

        point_debug:=2;--Punto para mapeo

            OPEN c_ip (r_disponible.PROJECT_CODE);
              FETCH c_ip INTO r_ip;
              vb_existe_ip := c_ip%FOUND;
            CLOSE c_ip;

            OPEN c_at(r_disponible.PROJECT_CODE);
              FETCH c_at INTO r_at;
              vb_existe_at := c_at%FOUND;
            CLOSE c_at;

            OPEN c_co(r_disponible.PROJECT_CODE);
              FETCH c_co INTO r_co;
              vb_existe_co := c_co%FOUND;
            CLOSE c_co;

        --Verificar si existe la información del BP para presupuesto inicial
            IF vb_existe_ip THEN

                BPNAME:=r_ip.BPNAME;--Capturar el nombre del proceso de negocio
                point_debug:=3;--Punto para mapeo

                --Verificar que existe información del cursor c_amount_pc
                OPEN c_amount_pc (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'IP');
                    FETCH c_amount_pc INTO r_amount_pc;
                    vb_existe_amount_pc := c_amount_pc%FOUND;
                CLOSE c_amount_pc;

                IF vb_existe_amount_pc THEN
                      --//Se recorre el cursor que tiene la consulta a la función del Web Service, pasandole los parametros necesarios que requiere el WS
                      --//y adicional el tipo de transacción IP= Initial Plan (Columna de Unifier presupuesto inicial)
                      OPEN c_amount_pc (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'IP');
                       LOOP
                         FETCH c_amount_pc INTO r_amount_pc;
                         EXIT WHEN c_amount_pc%NOTFOUND;
                            point_debug:=4;--Punto para mapeo
                            INSERT INTO INT_UPDATE_AMOUNT (PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,TYPE_AMOUNT)
                            VALUES (r_disponible.PROJECTEBS,r_amount_pc.bItemID,r_disponible.PROJECT_CODE,r_amount_pc.record_no,'N',r_amount_pc.status,r_amount_pc.amount,'IP');
                       END LOOP;
                      CLOSE c_amount_pc;

                      --//Se recorre el cursor que realiza la consulta a la tabla INT_UPDATE_AMOUNT y verica las que no esten procesadas para ingresar los
                      --//registros a la tabla INT_BP_AMOUNT; N= No Procesado, Y= Procesado
                      OPEN c_insert_amount_pc (r_disponible.PROJECTEBS,'IP');
                       LOOP
                         FETCH c_insert_amount_pc INTO r_insert_amount_pc;
                         EXIT WHEN c_insert_amount_pc%NOTFOUND;
                            point_debug:=5;--Punto para mapeo
                            INSERT INTO INT_BP_AMOUNT (PROJECT_BPA,BITEMID_CS,AMOUNT_BPA,STATUS_BPA,FLAG_EBS,PROJECTUNIFIER)
                            VALUES (r_disponible.PROJECTEBS,r_insert_amount_pc.BITEMID_CS,r_insert_amount_pc.AMOUNT,r_insert_amount_pc.STATUS,'N',r_disponible.PROJECT_CODE);
                            point_debug:=6;--Punto para mapeo
                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE ID_UPDATE_AMOUNT=r_insert_amount_pc.ID_UPDATE_AMOUNT;

                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '986', 'IP - Ingreso de registro para la línea: '||r_insert_amount_pc.BITEMID_CS||' y un monto de: '||r_insert_amount_pc.AMOUNT||' - PC',0,r_insert_amount_pc.BITEMID_CS);

                       END LOOP;
                      CLOSE c_insert_amount_pc;

                      --//Se recorre el cursor con la consulta a la tabla INT_BP_AMOUNT y verifica los registros que no han sido procesados (N)
                      --//para actualizar la tabla INT_BP_AMOUNT y marcar los registros que ya fueron procesados segun el identificador de la tabla
                      OPEN c_update_amount_pc (r_disponible.PROJECTEBS,'IP');
                       LOOP
                         FETCH c_update_amount_pc INTO r_update_amount_pc;
                         EXIT WHEN c_update_amount_pc%NOTFOUND;

                            point_debug:=7;--Punto para mapeo
                            UPDATE INT_BP_AMOUNT set AMOUNT_BPA=AMOUNT_BPA+r_update_amount_pc.AMOUNT
                            WHERE BITEMID_CS=r_update_amount_pc.BITEMID_CS
                            AND PROJECTUNIFIER=r_disponible.PROJECT_CODE;
                            point_debug:=8;--Punto para mapeo
                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE ID_UPDATE_AMOUNT=r_update_amount_pc.ID_UPDATE_AMOUNT;

                             --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '985', 'IP - Actulización de registro para la línea: '||r_insert_amount_pc.BITEMID_CS||' y un monto de: '||r_insert_amount_pc.AMOUNT||' - PC',0,r_insert_amount_pc.BITEMID_CS);
                            point_debug:=9;--Punto para mapeo
                       END LOOP;
                      CLOSE c_update_amount_pc;
                END IF;
            ELSE
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, r_disponible.PROJECTEBS, '987', 'No Existe información para el BP de Presupuesto Inicial, interfaz 9 - Actualizando presupuesto PC',0,'N/A');
            END IF;

            IF vb_existe_at THEN

                BPNAME:=r_at.BPNAME;--Captura nombre del proceso de negocio
                point_debug:=10;--Punto para mapeo

                OPEN c_amount_pc (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'AT');
                    FETCH c_amount_pc INTO r_amount_pc;
                    vb_existe_amount_pc := c_amount_pc%FOUND;
                CLOSE c_amount_pc;

                IF vb_existe_amount_pc THEN

                      --//Se recorre el cursor que tiene la consulta a la función del Web Service, pasandole los parametros necesarios que requiere el WS
                      --//y adicional el tipo de transacción AT= Amount Transfer (Transferencia entre líneas de costo)
                      OPEN c_amount_pc (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'AT');
                       LOOP
                         FETCH c_amount_pc INTO r_amount_pc;
                         EXIT WHEN c_amount_pc%NOTFOUND;
                            INSERT INTO INT_UPDATE_AMOUNT (PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,TYPE_AMOUNT)
                            VALUES (r_disponible.PROJECTEBS,r_amount_pc.bItemID,r_disponible.PROJECT_CODE,r_amount_pc.record_no,'N',r_amount_pc.status,r_amount_pc.amount,'AT');
                            point_debug:=11;--Punto para mapeo
                       END LOOP;
                      CLOSE c_amount_pc;

                      OPEN c_insert_amount_pc (r_disponible.PROJECTEBS,'AT');
                       LOOP
                         FETCH c_insert_amount_pc INTO r_insert_amount_pc;
                         EXIT WHEN c_insert_amount_pc%NOTFOUND;
                            INSERT INTO INT_BP_AMOUNT (PROJECT_BPA,BITEMID_CS,AMOUNT_BPA,STATUS_BPA,FLAG_EBS,PROJECTUNIFIER)
                            VALUES (r_disponible.PROJECTEBS,r_insert_amount_pc.BITEMID_CS,r_insert_amount_pc.AMOUNT,r_insert_amount_pc.STATUS,'N',r_disponible.PROJECT_CODE);
                            point_debug:=12;--Punto para mapeo
                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE ID_UPDATE_AMOUNT=r_insert_amount_pc.ID_UPDATE_AMOUNT;
                            point_debug:=13;--Punto para mapeo
                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '984', 'AT - Ingreso de registro para la línea: '||r_insert_amount_pc.BITEMID_CS||' y un monto de: '||r_insert_amount_pc.AMOUNT||' - PC',0,r_insert_amount_pc.BITEMID_CS);
                            point_debug:=14;--Punto para mapeo
                       END LOOP;
                      CLOSE c_insert_amount_pc;

                      --//Se recorre el cursor con la consulta a la tabla INT_BP_AMOUNT y verifica los registros que no han sido procesados (N)
                      --//para actualizar la tabla INT_BP_AMOUNT y marcar los registros que ya fueron procesados segun el identificador de la tabla
                      OPEN c_update_amount_pc (r_disponible.PROJECTEBS,'AT');
                       LOOP
                         FETCH c_update_amount_pc INTO r_update_amount_pc;
                         EXIT WHEN c_update_amount_pc%NOTFOUND;
                            point_debug:=15;--Punto para mapeo
                            UPDATE INT_BP_AMOUNT set AMOUNT_BPA=AMOUNT_BPA+r_update_amount_pc.AMOUNT
                            WHERE BITEMID_CS=r_update_amount_pc.BITEMID_CS
                            AND PROJECTUNIFIER=r_disponible.PROJECT_CODE;
                            point_debug:=16;--Punto para mapeo
                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE ID_UPDATE_AMOUNT=r_update_amount_pc.ID_UPDATE_AMOUNT;

                             --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '983', 'AT - Actualización de registro para la línea: '||r_insert_amount_pc.BITEMID_CS||' y un monto de: '||r_insert_amount_pc.AMOUNT||' - PC',0,r_insert_amount_pc.BITEMID_CS);
                            point_debug:=17;--Punto para mapeo
                       END LOOP;
                      CLOSE c_update_amount_pc;
                END IF;
            ELSE
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No Existe información para el BP de Presupuesto Inicial, interfaz 12 - Actualizando presupuesto PC',0,'N/A');
            END IF;
            IF vb_existe_co THEN

                BPNAME:=r_co.BPNAME;
                point_debug:=18;--Punto para mapeo

                OPEN c_amount_pc (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'CO');
                    FETCH c_amount_pc INTO r_amount_pc;
                    vb_existe_amount_pc := c_amount_pc%FOUND;
                CLOSE c_amount_pc;

                IF vb_existe_amount_pc THEN
                      --//Se recorre el cursor que tiene la consulta a la función del Web Service, pasandole los parametros necesarios que requiere el WS
                      --//y adicional el tipo de transacción CO= Change Order (Ordenes de Cambio)
                      OPEN c_amount_pc (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'CO');
                       LOOP
                         FETCH c_amount_pc INTO r_amount_pc;
                         EXIT WHEN c_amount_pc%NOTFOUND;
                            point_debug:=19;--Punto para mapeo
                            INSERT INTO INT_UPDATE_AMOUNT (PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,TYPE_AMOUNT)
                            VALUES (r_disponible.PROJECTEBS,r_amount_pc.bItemID,r_disponible.PROJECT_CODE,r_amount_pc.record_no,'N',r_amount_pc.status,r_amount_pc.amount,'CO');
                       END LOOP;
                      CLOSE c_amount_pc;

                      OPEN c_insert_amount_pc (r_disponible.PROJECTEBS,'CO');
                       LOOP
                         FETCH c_insert_amount_pc INTO r_insert_amount_pc;
                         EXIT WHEN c_insert_amount_pc%NOTFOUND;
                            point_debug:=20;--Punto para mapeo
                            INSERT INTO INT_BP_AMOUNT (PROJECT_BPA,BITEMID_CS,AMOUNT_BPA,STATUS_BPA,FLAG_EBS,PROJECTUNIFIER)
                            VALUES (r_disponible.PROJECTEBS,r_insert_amount_pc.BITEMID_CS,r_insert_amount_pc.AMOUNT,r_insert_amount_pc.STATUS,'N',r_disponible.PROJECT_CODE);

                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE ID_UPDATE_AMOUNT=r_insert_amount_pc.ID_UPDATE_AMOUNT;
                            point_debug:=21;--Punto para mapeo
                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '982', 'CO - Ingreso de registro para la línea: '||r_insert_amount_pc.BITEMID_CS||' y un monto de: '||r_insert_amount_pc.AMOUNT||' - PC',0,r_insert_amount_pc.BITEMID_CS);
                            point_debug:=22;--Punto para mapeo
                       END LOOP;
                      CLOSE c_insert_amount_pc;

                      OPEN c_update_amount_pc (r_disponible.PROJECTEBS,'CO');
                       LOOP
                         FETCH c_update_amount_pc INTO r_update_amount_pc;
                         EXIT WHEN c_update_amount_pc%NOTFOUND;

                            UPDATE INT_BP_AMOUNT set AMOUNT_BPA=AMOUNT_BPA+r_update_amount_pc.AMOUNT
                            WHERE BITEMID_CS=r_update_amount_pc.BITEMID_CS
                            AND PROJECTUNIFIER=r_disponible.PROJECT_CODE;
                            point_debug:=23;--Punto para mapeo
                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE ID_UPDATE_AMOUNT=r_update_amount_pc.ID_UPDATE_AMOUNT;

                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '981', 'CO - Actualización de registro para la línea: '||r_insert_amount_pc.BITEMID_CS||' y un monto de: '||r_insert_amount_pc.AMOUNT||' - PC',0,r_insert_amount_pc.BITEMID_CS);
                            point_debug:=24;--Punto para mapeo
                       END LOOP;
                      CLOSE c_update_amount_pc;
                END IF;
            ELSE
              point_debug:=25;--Punto para mapeo
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No Existe información para el BP de Presupuesto Inicial, interfaz 11 - Actualizando presupuesto PC',0,'N/A');
            END IF;

        ELSIF r_disponible.TYPE_PROJECT='FM-RE' THEN

            OPEN c_ip (r_disponible.PROJECT_CODE);
              FETCH c_ip INTO r_ip;
              vb_existe_ip := c_ip%FOUND;
            CLOSE c_ip;

            OPEN c_at(r_disponible.PROJECT_CODE);
              FETCH c_at INTO r_at;
              vb_existe_at := c_at%FOUND;
            CLOSE c_at;

            OPEN c_co(r_disponible.PROJECT_CODE);
              FETCH c_co INTO r_co;
              vb_existe_co := c_co%FOUND;
            CLOSE c_co;

           --Verificar si existe la información del BP para pres
            IF vb_existe_ip THEN

                BPNAME:=r_ip.BPNAME;

                OPEN c_amount_fm (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'IP');
                    FETCH c_amount_fm INTO r_amount_fm;
                    vb_existe_amount_fm := c_amount_fm%FOUND;
                CLOSE c_amount_fm;

                IF vb_existe_amount_fm THEN

                      OPEN c_amount_fm (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'IP');
                       LOOP
                         FETCH c_amount_fm INTO r_amount_fm;
                         EXIT WHEN c_amount_fm%NOTFOUND;
                            INSERT INTO INT_UPDATE_AMOUNT (PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,EFFECTIVE_DATE,TYPE_AMOUNT)
                            VALUES (r_disponible.PROJECTEBS,r_amount_fm.uuu_cm0_picker,r_disponible.PROJECT_CODE,r_amount_fm.record_no,'N',r_amount_fm.status,r_amount_fm.amount,r_amount_fm.effective_date,'IP');
                       END LOOP;
                      CLOSE c_amount_fm;

                      OPEN c_insert_amount_fm (r_disponible.PROJECTEBS,'IP');
                       LOOP
                         FETCH c_insert_amount_fm INTO r_insert_amount_fm;
                         EXIT WHEN c_insert_amount_fm%NOTFOUND;

                            INSERT INTO INT_BP_AMOUNT (PROJECT_BPA,BITEMID_CS,AMOUNT_BPA,STATUS_BPA,FLAG_EBS,PROJECTUNIFIER,EFFECTIVE_YEAR,EFFECTIVE_DATE)
                            VALUES (r_disponible.PROJECTEBS,r_insert_amount_fm.BITEMID_CS,r_insert_amount_fm.AMOUNT,r_insert_amount_fm.STATUS,'N',r_disponible.PROJECT_CODE,r_insert_amount_fm.YEAR_EFFECTIVE,r_insert_amount_fm.EFFECTIVE_DATE);

                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE BITEMID_CS=r_insert_amount_fm.BITEMID_CS
                            AND PROJECT_EBS=r_disponible.PROJECTEBS
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_insert_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_insert_amount_fm.EFFECTIVE_DATE,'YYYY');

                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '980', 'IP - Ingreso de registro para la línea: '||r_insert_amount_fm.BITEMID_CS||' y un monto de: '||r_insert_amount_fm.AMOUNT||' - FM',0,r_insert_amount_fm.BITEMID_CS);

                       END LOOP;
                      CLOSE c_insert_amount_fm;

                      OPEN c_update_amount_fm (r_disponible.PROJECTEBS,'IP');
                       LOOP
                         FETCH c_update_amount_fm INTO r_update_amount_fm;
                         EXIT WHEN c_update_amount_fm%NOTFOUND;

                            UPDATE INT_BP_AMOUNT set AMOUNT_BPA=AMOUNT_BPA+r_update_amount_fm.AMOUNT
                            WHERE BITEMID_CS=r_update_amount_fm.BITEMID_CS
                            AND PROJECTUNIFIER=r_disponible.PROJECT_CODE
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'YYYY');

                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE BITEMID_CS=r_update_amount_fm.BITEMID_CS
                            AND PROJECT_EBS=r_disponible.PROJECTEBS
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'YYYY');

                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '979', 'IP - Actualización de registro para la línea: '||r_insert_amount_fm.BITEMID_CS||' y un monto de: '||r_insert_amount_fm.AMOUNT||' - FM',0,r_insert_amount_fm.BITEMID_CS);

                       END LOOP;
                      CLOSE c_update_amount_fm;

                END IF;

            ELSE
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No Existe información para el BP de Presupuesto Inicial interfaz 9 - Actualizando presupuesto FM',0,'N/A');
            END IF;

            IF vb_existe_at THEN

                BPNAME:=r_at.BPNAME;

                OPEN c_amount_fm (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'AT');
                    FETCH c_amount_fm INTO r_amount_fm;
                    vb_existe_amount_fm := c_amount_fm%FOUND;
                CLOSE c_amount_fm;

                IF vb_existe_amount_fm THEN

                      OPEN c_amount_fm (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'AT');
                       LOOP
                         FETCH c_amount_fm INTO r_amount_fm;
                         EXIT WHEN c_amount_fm%NOTFOUND;
                            INSERT INTO INT_UPDATE_AMOUNT (PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,EFFECTIVE_DATE,TYPE_AMOUNT)
                            VALUES (r_disponible.PROJECTEBS,r_amount_fm.uuu_cm0_picker,r_disponible.PROJECT_CODE,r_amount_fm.record_no,'N',r_amount_fm.status,r_amount_fm.amount,r_amount_fm.effective_date,'AT');
                       END LOOP;
                      CLOSE c_amount_fm;

                      OPEN c_insert_amount_fm (r_disponible.PROJECTEBS,'AT');
                       LOOP
                         FETCH c_insert_amount_fm INTO r_insert_amount_fm;
                         EXIT WHEN c_insert_amount_fm%NOTFOUND;

                            INSERT INTO INT_BP_AMOUNT (PROJECT_BPA,BITEMID_CS,AMOUNT_BPA,STATUS_BPA,FLAG_EBS,PROJECTUNIFIER,EFFECTIVE_YEAR,EFFECTIVE_DATE)
                            VALUES (r_disponible.PROJECTEBS,r_insert_amount_fm.BITEMID_CS,r_insert_amount_fm.AMOUNT,r_insert_amount_fm.STATUS,'N',r_disponible.PROJECT_CODE,r_insert_amount_fm.YEAR_EFFECTIVE,r_insert_amount_fm.EFFECTIVE_DATE);

                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE BITEMID_CS=r_insert_amount_fm.BITEMID_CS
                            AND PROJECT_EBS=r_disponible.PROJECTEBS
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_insert_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_insert_amount_fm.EFFECTIVE_DATE,'YYYY');

                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '978', 'AT - Ingreso de registro para la línea: '||r_insert_amount_fm.BITEMID_CS||' y un monto de: '||r_insert_amount_fm.AMOUNT||' - FM',0,r_insert_amount_fm.BITEMID_CS);

                       END LOOP;
                      CLOSE c_insert_amount_fm;

                      OPEN c_update_amount_fm (r_disponible.PROJECTEBS,'AT');
                       LOOP
                         FETCH c_update_amount_fm INTO r_update_amount_fm;
                         EXIT WHEN c_update_amount_fm%NOTFOUND;

                            UPDATE INT_BP_AMOUNT set AMOUNT_BPA=AMOUNT_BPA+r_update_amount_fm.AMOUNT
                            WHERE BITEMID_CS=r_update_amount_fm.BITEMID_CS
                            AND PROJECTUNIFIER=r_disponible.PROJECT_CODE
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'YYYY');

                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE BITEMID_CS=r_update_amount_fm.BITEMID_CS
                            AND PROJECT_EBS=r_disponible.PROJECTEBS
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'YYYY');

                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '977', 'AT - Actualización de registro para la línea: '||r_insert_amount_fm.BITEMID_CS||' y un monto de: '||r_insert_amount_fm.AMOUNT||' - FM',0,r_insert_amount_fm.BITEMID_CS);

                       END LOOP;
                      CLOSE c_update_amount_fm;
                END IF;
            ELSE
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '887', 'No Existe información para el BP de Presupuesto Inicial interfaz 12 - Actualizando presupuesto FM',0,'N/A');
            END IF;

            IF vb_existe_co THEN

                BPNAME:=r_co.BPNAME;

                OPEN c_amount_fm (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'CO');
                    FETCH c_amount_fm INTO r_amount_fm;
                    vb_existe_amount_fm := c_amount_fm%FOUND;
                CLOSE c_amount_fm;

                IF vb_existe_amount_fm THEN

                      OPEN c_amount_fm (SHORTNAME,AUTHCODE,r_disponible.PROJECT_CODE,BPNAME,'CO');
                       LOOP
                         FETCH c_amount_fm INTO r_amount_fm;
                         EXIT WHEN c_amount_fm%NOTFOUND;
                            INSERT INTO INT_UPDATE_AMOUNT (PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,EFFECTIVE_DATE,TYPE_AMOUNT)
                            VALUES (r_disponible.PROJECTEBS,r_amount_fm.uuu_cm0_picker,r_disponible.PROJECT_CODE,r_amount_fm.record_no,'N',r_amount_fm.status,r_amount_fm.amount,r_amount_fm.effective_date,'CO');
                       END LOOP;
                      CLOSE c_amount_fm;

                      OPEN c_insert_amount_fm (r_disponible.PROJECTEBS,'CO');
                       LOOP
                         FETCH c_insert_amount_fm INTO r_insert_amount_fm;
                         EXIT WHEN c_insert_amount_fm%NOTFOUND;

                            INSERT INTO INT_BP_AMOUNT (PROJECT_BPA,BITEMID_CS,AMOUNT_BPA,STATUS_BPA,FLAG_EBS,PROJECTUNIFIER,EFFECTIVE_YEAR,EFFECTIVE_DATE)
                            VALUES (r_disponible.PROJECTEBS,r_insert_amount_fm.BITEMID_CS,r_insert_amount_fm.AMOUNT,r_insert_amount_fm.STATUS,'N',r_disponible.PROJECT_CODE,r_insert_amount_fm.YEAR_EFFECTIVE,r_insert_amount_fm.EFFECTIVE_DATE);

                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE BITEMID_CS=r_insert_amount_fm.BITEMID_CS
                            AND PROJECT_EBS=r_disponible.PROJECTEBS
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_insert_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_insert_amount_fm.EFFECTIVE_DATE,'YYYY');

                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '976', 'CO - Ingreso de registro para la línea: '||r_insert_amount_fm.BITEMID_CS||' y un monto de: '||r_insert_amount_fm.AMOUNT||' - FM',0,r_insert_amount_fm.BITEMID_CS);

                       END LOOP;
                      CLOSE c_insert_amount_fm;

                      OPEN c_update_amount_fm (r_disponible.PROJECTEBS,'CO');
                       LOOP
                         FETCH c_update_amount_fm INTO r_update_amount_fm;
                         EXIT WHEN c_update_amount_fm%NOTFOUND;

                            UPDATE INT_BP_AMOUNT set AMOUNT_BPA=AMOUNT_BPA+r_update_amount_fm.AMOUNT
                            WHERE BITEMID_CS=r_update_amount_fm.BITEMID_CS
                            AND PROJECTUNIFIER=r_disponible.PROJECT_CODE
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'YYYY');

                            UPDATE INT_UPDATE_AMOUNT SET FLAG='Y'
                            WHERE BITEMID_CS=r_update_amount_fm.BITEMID_CS
                            AND PROJECT_EBS=r_disponible.PROJECTEBS
                            AND to_char(EFFECTIVE_DATE,'MM')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'MM')
                            AND to_char(EFFECTIVE_DATE,'YYYY')=to_char(r_update_amount_fm.EFFECTIVE_DATE,'YYYY');

                            --//Ingresar la información a la tabla de logs
                            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                            VALUES(SYSDATE, r_disponible.PROJECTEBS, '975', 'CO - Actualización de registro para la línea: '||r_insert_amount_fm.BITEMID_CS||' y un monto de: '||r_insert_amount_fm.AMOUNT||' - FM',0,r_insert_amount_fm.BITEMID_CS);

                       END LOOP;
                      CLOSE c_update_amount_fm;
                END IF;
            ELSE
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
              VALUES(SYSDATE, 'N/A', '987', 'No Existe información para el BP de Presupuesto Inicial interfaz 11 - Actualizando presupuesto FM',0,'N/A');
            END IF;

        END IF;

   END LOOP;
   CLOSE c_disponible;

EXCEPTION

         WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

         INSERT INTO LOG_BP_PROCESS(RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,INTERFACE_CODE,TRANSACTION_EBS,DATE_TRANSACTION)
         VALUES('999','Error procesando datos con los presupuestos, proyecto: '||r_disponible.PROJECTEBS||' ,BP:'||BPNAME||' con el mensaje: '||err_msg||' en el punto: '||point_debug,'',0,'','',SYSDATE);

END INT_SP_PROCESS_AMOUNT;
