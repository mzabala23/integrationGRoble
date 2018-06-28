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
create or replace TRIGGER "BI_INT_AUTH"
  before insert on "INT_AUTH"
  for each row
begin
  if :NEW."ID_AUTH" is null then
    select "INT_AUTH_SEQ".nextval into :NEW."ID_AUTH" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_BP_AMOUNT"
  before insert on "INT_BP_AMOUNT"
  for each row
begin
  if :NEW."ID_BP_AMOUNT" is null then
    select "INT_BP_AMOUNT_SEQ".nextval into :NEW."ID_BP_AMOUNT" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_BP_PROCESS"
  before insert on "INT_BP_PROCESS"
  for each row
begin
  if :NEW."ID_BP_PROCESS" is null then
    select "INT_BP_PROCESS_SEQ".nextval into :NEW."ID_BP_PROCESS" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_BP_PROJECT"
  before insert on "INT_BP_PROJECT"
  for each row
begin
  if :NEW."ID_BP_PROJECT" is null then
    select "INT_BP_PROJECT_SEQ".nextval into :NEW."ID_BP_PROJECT" from sys.dual;
  end if;
end;


/**/
create or replace TRIGGER "BI_INT_COST_SHEET"
  before insert on "INT_COST_SHEET"
  for each row
begin
  if :NEW."ID_COST_SHEET" is null then
    select "INT_COST_SHEET_SEQ".nextval into :NEW."ID_COST_SHEET" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_EBS_AMOUNT"
  before insert on "INT_EBS_AMOUNT"
  for each row
begin
  if :NEW."ID_EBS" is null then
    select "INT_EBS_AMOUNT_SEQ".nextval into :NEW."ID_EBS" from sys.dual;
  end if;
end;

/**/
create or replace trigger "BI_INT_EXCHANGE_RATES"
  before insert on "INT_EXCHANGE_RATES"
  for each row
begin
  if :NEW."ID_EXCHANGE_RATES" is null then
    select "INT_EXCHANGE_RATES_SEQ".nextval into :NEW."ID_EXCHANGE_RATES" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_INTERFACES"
  before insert on "INT_INTERFACES"
  for each row
begin
  if :NEW."ID_INTERFACES" is null then
    select "INT_INTERFACES_SEQ".nextval into :NEW."ID_INTERFACES" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_PROJECT_LIST"
  before insert on "INT_PROJECT_LIST"
  for each row
begin
  if :NEW."ID_PROYECTO" is null then
    select "INT_PROJECT_LIST_SEQ".nextval into :NEW."ID_PROYECTO" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_ROOTNODE"
  before insert on "INT_ROOTNODE"
  for each row
begin
  if :NEW."ID_ROOTNODE" is null then
    select "INT_ROOTNODE_SEQ".nextval into :NEW."ID_ROOTNODE" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_STATUS_CODE"
  before insert on "INT_STATUS_CODE"
  for each row
begin
  if :NEW."ID_STATUS_CODE" is null then
    select "INT_STATUS_CODE_SEQ".nextval into :NEW."ID_STATUS_CODE" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_INT_UPDATE_AMOUNT"
  before insert on "INT_UPDATE_AMOUNT"
  for each row
begin
  if :NEW."ID_UPDATE_AMOUNT" is null then
    select "INT_UPDATE_AMOUNT_SEQ".nextval into :NEW."ID_UPDATE_AMOUNT" from sys.dual;
  end if;
end;

/**/
create or replace TRIGGER "BI_LOG_BP_PROCESS"
  before insert on "LOG_BP_PROCESS"
  for each row
begin
  if :NEW."ID_LOG_BP_PROCESS" is null then
    select "LOG_BP_PROCESS_SEQ".nextval into :NEW."ID_LOG_BP_PROCESS" from sys.dual;
  end if;
end; 
