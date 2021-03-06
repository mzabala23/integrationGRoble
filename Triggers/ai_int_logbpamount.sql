create or replace TRIGGER AI_INT_LOGBPAMOUNT
AFTER INSERT OR DELETE OR UPDATE ON INT_BP_AMOUNT
FOR EACH ROW
DECLARE
   VAR_ChangeType CHAR(1);

--Bloque de variables para excepciones
err_num NUMBER;
err_msg VARCHAR2(255);

BEGIN

IF INSERTING THEN VAR_ChangeType :='I';
ELSIF UPDATING THEN VAR_ChangeType :='U';
ELSE VAR_ChangeType :='D';
END IF;

INSERT INTO INT_AUDIT_BP_AMOUNT
(
ID_AUDIT_BP_AMOUNT,
PROJECT_EBS,
BITEMID_CS,
AMOUNT_BPA_OLD,
AMOUNT_BPA_NEW,
PROJECT_UNIFIER,
EFFECTIVE_YEAR,
EFFECTIVE_DATE,
TIPO_CHANGE,
DATE_CHANGE,
BY_CHANGE)
VALUES (
  INT_BP_AMOUNT_SEQ.NEXTVAL,
  :NEW.PROJECT_BPA,
  :NEW.BITEMID_CS,
  :OLD.AMOUNT_BPA,
  :NEW.AMOUNT_BPA,
  :NEW.PROJECTUNIFIER,
  :NEW.EFFECTIVE_YEAR,
  :NEW.EFFECTIVE_DATE,
  VAR_ChangeType,
  SYSDATE,
  USER
);

EXCEPTION
 WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
            VALUES(SYSDATE, 'N/A', '995', 'Error en el disparador para la tabla INT_BP_AMOUNT, trigger: AI_INT_LOGBPAMOUNT, error:'||err_msg||'',0,'N/A');

END AI_INT_ADDCS;
