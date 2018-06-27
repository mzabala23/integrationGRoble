/*Creación de disparadores con secuencias y disparadores con logica de integración*/

CREATE OR REPLACE TRIGGER BI_INT_AUTH
  before insert on "INT_AUTH"
  for each row
begin
  if :NEW."ID_AUTH" is null then
    select "INT_AUTH_SEQ".nextval into :NEW."ID_AUTH" from sys.dual;
  end if;
end;

/
ALTER TRIGGER BI_INT_AUTH ENABLE;

/**/
