create or replace PROCEDURE SP_IMPRIMIR (cadena in clob)
AS
BEGIN
dbms_output.put_line (cadena);
END;
