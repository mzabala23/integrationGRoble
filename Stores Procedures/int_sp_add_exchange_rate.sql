create or replace PROCEDURE INT_SP_ADD_EXCHANGE_RATE (CURRENCY_NAME IN VARCHAR2, CURRENCY_CODE IN VARCHAR2, RATE IN VARCHAR2)
IS
--Area de Cursores
--Cursor que verifica la información de autenticación en Unifier
CURSOR c_auth_unifier IS
    SELECT ID_AUTH,SHORTNAME,AUTHCODE
    FROM INT_AUTH
    WHERE ACTIVE='Y';

--Área de variables locales
r_auth_unifier          c_auth_unifier%rowtype;
vb_existe_auth_unifier  boolean;
SHORTNAME               VARCHAR2(20);
AUTHCODE                VARCHAR2(4);
ER_XML                  VARCHAR2(1000):='';
err_num                 NUMBER;
err_msg                 VARCHAR2(255);

BEGIN

--Abrir el cursor para autenticación en Unifier
OPEN c_auth_unifier;
    FETCH c_auth_unifier INTO r_auth_unifier;
    vb_existe_auth_unifier := c_auth_unifier%FOUND;
CLOSE c_auth_unifier;

--Formatear desde el inicio, fechas y moneda
execute immediate 'alter session set NLS_DATE_LANGUAGE=''SPANISH''';
execute immediate 'alter session set NLS_TERRITORY=''SPAIN''';
execute immediate 'alter session set nls_date_format=''MM/DD/YYYY''';
execute immediate 'alter session set NLS_NUMERIC_CHARACTERS= ''.,'' ';

IF vb_existe_auth_unifier THEN
  SHORTNAME:=r_auth_unifier.SHORTNAME;
  AUTHCODE:=r_auth_unifier.AUTHCODE;
ELSE

  INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
  VALUES(SYSDATE, 'N/A', '887', 'No Existe información para la autenticación con Unifier, por favor verifique la tabla INT_AUTH ',0,'N/A');
END IF;

ER_XML:='<![CDATA[
                  <List_Wrapper>
                    <exchange_rate>
                      <currency_name>'||CURRENCY_NAME||'</currency_name>
                      <currency_code>'||CURRENCY_CODE||'</currency_code>
                      <rate>'||RATE||'</rate>
                    </exchange_rate>
                  </List_Wrapper>]]>';
--Ingresando la información a Unifier, llamando la función y guardando el registro.
  INSERT INTO LOG_BP_PROCESS (RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,INTERFACE_CODE,TRANSACTION_EBS,DATE_TRANSACTION)
  SELECT
        FN_UPDATEEXCHANGERATES(SHORTNAME,AUTHCODE,ER_XML).extract('//statusCode/text()').getClobVal(),
        ER_XML,
        'EXCHANGE_RATES',
        'GENERIC',
        NULL,
        'GENERIC',
        sysdate
  FROM DUAL;

--Bloque de excepciones
EXCEPTION

         WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

         INSERT INTO LOG_BP_PROCESS(RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,INTERFACE_CODE,TRANSACTION_EBS,DATE_TRANSACTION)
         VALUES('102','Error procesando datos en el ingreso de información a Unifier mediante el WS: ','GENERIC','GENERIC',0,'GENERIC',SYSDATE);

END INT_SP_ADD_EXCHANGE_RATE;
