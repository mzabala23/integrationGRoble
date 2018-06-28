create or replace TRIGGER AI_INT_ADDCS
AFTER UPDATE OF PROJECTEBS ON INT_PROJECT_LIST
FOR EACH ROW
DECLARE
   PRAGMA AUTONOMOUS_TRANSACTION;

--Bloque de variables para excepciones
err_num NUMBER;
err_msg VARCHAR2(255);

BEGIN
    --Este procedimiento actualiza las hojas de costo de la tabla INT_COST_SHEET
    EBS_UNIFIER.INT_SP_COST_SHEET(:NEW.PROJECTCODE_U,:NEW.PROJECTEBS,:NEW.TYPE_PROJECT);
    COMMIT;

EXCEPTION
 WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
            VALUES(SYSDATE, 'N/A', '995', 'Error en el disparador para la tabla INT_PROJECT_LIST, trigger: AI_INT_ADDCS, error:'||err_msg||'',0,'N/A');

END AI_INT_ADDCS;
