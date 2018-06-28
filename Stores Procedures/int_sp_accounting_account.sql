create or replace PROCEDURE INT_SP_ACCOUNTING_ACCOUNT (UNIFIERPROJECT IN VARCHAR2, EBSPROJECT IN VARCHAR2, TYPEPROJECT VARCHAR2,IN_COLUMN VARCHAR2,IN_EFFECTIVE_YEAR NUMBER,IN_EFFECTIVE_MONTH NUMBER) IS

--Cursor que obtiene la información de la columna para cuentas contables en el web service de PC
CURSOR c_accounting_pc (SHORTNAME VARCHAR2,AUTHCODE VARCHAR2,U_PROJECT VARCHAR2,COLUMNNAME VARCHAR2) IS
       select wbscode,unit_cost,replace(replace(amount,SUBSTR(amount,-2)),'.') amount
       from (select xmltype(replace(replace(replace(getcolumndata(SHORTNAME,AUTHCODE,U_PROJECT,COLUMNNAME).extract('//xmlcontents/text()').getClobVal(),'&lt;','<'),'&gt;','>'),'&quot;','"')) valor
           from dual) x
       left join
       xmltable('/List_Wrapper/column'
       passing x.valor
       COLUMNS
       wbscode VARCHAR2(50) path 'wbs_code',
       unit_cost VARCHAR2(50) path 'unit_cost',
       amount VARCHAR2(100) path 'amount'
       ) on (1=1);

--Cursor que extrae la información de la columna para cuentas contables en las vistas materializadas de FM
CURSOR c_accounting_fm (U_PROJECT VARCHAR2,COLUMNNAME VARCHAR2) IS
          select DISTINCT REPLACE(CAST(AMOUNT AS VARCHAR2(100)),',') AMOUNT,A.CODE,C.PROJECTNAME,C.PROJECTNUMBER
          from INT_MV_CM_COST_LINEITEM A,INT_MV_PROJECTINFO C
          WHERE EXISTS
                (select ID,PROJECT_ID
                 from INT_MV_CM_COST_SHEET B
                 where id in (select sheet_id
                              from INT_MV_CM_COST_COLUMN
                              where name=COLUMNNAME)
                              AND A.SHEET_ID=B.ID
                              AND A.PROJECT_ID=B.PROJECT_ID)
         AND C.PID=A.PROJECT_ID
         AND C.PROJECTNUMBER=U_PROJECT
         AND A.EFFECTIVE_YEAR=IN_EFFECTIVE_YEAR
         AND A.EFFECTIVE_MONTH=IN_EFFECTIVE_MONTH
         AND A.AMOUNT<>0;

--Verifica las credenciales de autenticación de Unifier
CURSOR c_auth_unifier IS
      SELECT ID_AUTH,SHORTNAME,AUTHCODE
      FROM INT_AUTH
      WHERE ACTIVE='Y';

--Bloque de variables para los cursores
r_auth_unifier          c_auth_unifier%rowtype;
r_accounting_pc         c_accounting_pc%rowtype;
r_accounting_fm         c_accounting_fm%rowtype;
--Variables locales
SHORTNAME               varchar2(30);
AUTHCODE                varchar2(4);

vb_existe_auth_unifier  boolean;
vb_existe_accounting_pc boolean;
vb_existe_accounting_fm boolean;

--Bloque de variables para excepciones
err_num                 NUMBER;
err_msg                 VARCHAR2(255);
conse                   NUMBER:=1;

BEGIN

--Actualizar las vistas de las tablas que traen la información de
    DBMS_MVIEW.REFRESH('INT_MV_CM_COST_COLUMN') ;
    DBMS_MVIEW.REFRESH('INT_MV_CM_COST_LINEITEM');
    DBMS_MVIEW.REFRESH('INT_MV_CM_COST_SHEET');
    DBMS_MVIEW.REFRESH('INT_MV_CM0');

    OPEN c_auth_unifier;
      FETCH c_auth_unifier INTO r_auth_unifier;
      vb_existe_auth_unifier := c_auth_unifier%FOUND;
    CLOSE c_auth_unifier;

  --Validar la conexión de autenticación, en Unifier
    IF vb_existe_auth_unifier THEN
      SHORTNAME:=r_auth_unifier.SHORTNAME;
      AUTHCODE:=r_auth_unifier.AUTHCODE;
    ELSE
      INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
      VALUES(SYSDATE, 'N/A', '998', 'No Existe información para la autenticación con Unifier, por favor verifique la tabla INT_AUTH - INT_SP_COST_SHEET',0,'N/A');
    END IF;

    IF TYPEPROJECT='PC' THEN

     OPEN c_accounting_pc (SHORTNAME,AUTHCODE,UNIFIERPROJECT,IN_COLUMN);
          FETCH c_accounting_pc INTO r_accounting_pc;
          vb_existe_accounting_pc := c_accounting_pc%FOUND;
     CLOSE c_accounting_pc;

         IF vb_existe_accounting_pc THEN

            OPEN c_accounting_pc (SHORTNAME,AUTHCODE,UNIFIERPROJECT,IN_COLUMN);
            LOOP
              FETCH c_accounting_pc INTO r_accounting_pc;
              EXIT WHEN c_accounting_pc%NOTFOUND;
                conse:=conse+1;
                --Actualizando información
                update int_cost_sheet set ACCOUNTING_ACCOUNT=r_accounting_pc.amount,FLAG_EBS='N'
                where BITEMID_CS=r_accounting_pc.wbscode AND PROJECT_CS=EBSPROJECT;
                --Registrando en el log de eventos
                INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                VALUES(SYSDATE, UNIFIERPROJECT, '102', 'Ingreso de cuenta contable para PC, Cuenta contable: '||r_accounting_pc.amount||'',0,r_accounting_pc.wbscode);
            END LOOP;
            CLOSE c_accounting_pc;
          ELSE

           INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
           VALUES(SYSDATE, 'N/A', '101', 'No Existe información para ingresar relacionado con una cuenta contable en PC',0,'N/A');

         END IF;--IF vb_existe_accounting_pc THEN;
    ELSIF TYPEPROJECT='FM-RE' THEN

      OPEN c_accounting_fm (UNIFIERPROJECT,IN_COLUMN);
          FETCH c_accounting_fm INTO r_accounting_fm;
          vb_existe_accounting_fm := c_accounting_fm%FOUND;
     CLOSE c_accounting_fm;

      IF vb_existe_accounting_fm THEN

        OPEN c_accounting_fm (UNIFIERPROJECT,IN_COLUMN);

         LOOP

          FETCH c_accounting_fm INTO r_accounting_fm;

            EXIT WHEN c_accounting_fm%NOTFOUND;

                --Actualización de las cuentas contables
                update int_cost_sheet set ACCOUNTING_ACCOUNT=r_accounting_fm.AMOUNT,FLAG_EBS='N'
                where BITEMID_CS=r_accounting_fm.CODE AND PROJECT_CS=EBSPROJECT ;

                 --Registrando en el log de eventos
                INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                VALUES(SYSDATE, UNIFIERPROJECT, '102', 'Ingreso de cuenta contable para FM, Cuenta contable: '||r_accounting_fm.amount||'',0,r_accounting_fm.CODE);
         END LOOP;

        CLOSE c_accounting_fm;

        INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
        VALUES(SYSDATE, 'N/A', '101', 'No Existe información para ingresar relacionado con una cuenta contable en FM',0,'N/A');

      END IF;--IF vb_existe_accounting_fm THEN


    END IF; --IF TYPEPROJECT='PC' THEN;

 EXCEPTION

         WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
            VALUES(SYSDATE, 'N/A', '105', 'Error agregando actualizando cuentas contables INT_COST_SHEET, error:'||err_msg||'',0,'N/A');

END INT_SP_ACCOUNTING_ACCOUNT;
