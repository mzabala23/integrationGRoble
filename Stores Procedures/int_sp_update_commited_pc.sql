create or replace procedure INT_SP_UPDATE_COMMITED_PC
IS

--Cursor para verificar los (BP) procesos de negocio asociados a:
--MC => Monto Comprometido
CURSOR c_amount_pc IS
       select PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,SUM(AMOUNT) monto,EFFECTIVE_DATE
       from INT_UPDATE_AMOUNT
       where TYPE_AMOUNT='MC' and EFFECTIVE_DATE is null
       group by PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,EFFECTIVE_DATE;

--Vaiables del cursor
r_amount_pc        c_amount_pc%rowtype;

--Log de mensajes en las excepciones
err_num               NUMBER;
err_msg               VARCHAR2(255);
point_debug           NUMBER:=0;

BEGIN

execute immediate 'alter session set NLS_DATE_LANGUAGE=''SPANISH''';
execute immediate 'alter session set NLS_TERRITORY=''SPAIN''';
execute immediate 'alter session set nls_date_format=''MM/DD/YYYY''';
execute immediate 'alter session set NLS_NUMERIC_CHARACTERS= ''.,'' ';


 OPEN c_amount_pc;
   LOOP
   FETCH c_amount_pc INTO r_amount_pc;
   EXIT WHEN c_amount_pc%NOTFOUND;
        update int_bp_amount b set AMOUNT_BPA=AMOUNT_BPA-r_amount_pc.monto
        where b.BITEMID_CS=r_amount_pc.BITEMID_CS and b.PROJECTUNIFIER=r_amount_pc.PROJECT_UNIFIER;
   END LOOP;
   CLOSE c_amount_pc;
END;
