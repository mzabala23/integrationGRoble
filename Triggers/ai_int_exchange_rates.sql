create or replace TRIGGER AI_INT_EXCHANGE_RATES
AFTER INSERT ON INT_EXCHANGE_RATES
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;

--Bloque de variables para excepciones
err_num NUMBER;
err_msg VARCHAR2(255);

BEGIN
 --Seteamos las fechas, para no tener problemas de formatos
  execute immediate 'alter session set nls_date_language=''SPANISH''';
  execute immediate 'alter session set nls_date_format=''MM/DD/YYYY''';
  execute immediate 'alter session set nls_numeric_characters= ''.,'' ';

INT_SP_ADD_EXCHANGE_RATE(:NEW.SOURCE,:NEW.FROM_COD_CURRENCY,:NEW.INVERSE_CONVERSION_RATE);

COMMIT;

EXCEPTION
 WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
            VALUES(SYSDATE, 'N/A', '101', 'Error en el disparador para la tabla INT_EXCHANGE_RATES, trigger: AI_INT_EXCHANGE_RATES, error:'||err_msg||'',0,'N/A');

END AI_INT_EXCHANGE_RATES;
