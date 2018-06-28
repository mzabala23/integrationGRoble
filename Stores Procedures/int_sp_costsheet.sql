set define off;
create or replace procedure int_sp_costsheet (UNIFIER_PROJECT_CODE IN VARCHAR2)
as

--*Cursor que verifica las credenciales de autenticación a Unifier
CURSOR c_auth_unifier IS
      SELECT SHORTNAME,AUTHCODE,ENDPOINT FROM int_auth where active='N';

--Cursor que captura la información del nodo raiz de la estructura jerarquica
CURSOR c_node_root(SHORTNAME VARCHAR2,AUTHCODE VARCHAR2, ENDPOINT VARCHAR2) IS
     SELECT parentid
      from (select xmltype(replace(replace(replace(fn_getcostsheet(my_hash(SHORTNAME),my_hash(AUTHCODE),UNIFIER_PROJECT_CODE,ENDPOINT).extract('//xmlcontents/text()').getClobVal(),'&lt;','<'),'&gt;','>'),'&quot;','"')) valor
            from dual) x
      left join
         xmltable('/List_Wrapper/costcodes/costcode'
         passing x.valor
         COLUMNS
         parentid number path 'parentid',
         orderid number path 'orderid'
         ) xt on (1=1) where xt.orderid=0;

--Bloque de variables para los respectivos cursores
r_node_root c_node_root%rowtype;
r_auth c_auth_unifier%rowtype;

--Bloque de variables para verificación de resultados en los respectivos cursores
vb_exists_auth_unifier boolean;

--Bloque de variables para excepciones
err_num NUMBER;
err_msg VARCHAR2(255);

--Variables explicitas para almacenamiento de resultados en registros
v_shortname varchar2(4000);
v_authcode varchar2(4000);
v_endpoint varchar2(100);

begin

     OPEN c_auth_unifier;
         FETCH c_auth_unifier INTO r_auth;
              vb_exists_auth_unifier := c_auth_unifier%FOUND;
     close c_auth_unifier;

     IF vb_exists_auth_unifier THEN
       v_shortname :=r_auth.SHORTNAME;
       v_authcode  :=r_auth.AUTHCODE;
       v_endpoint  :=r_auth.ENDPOINT;
     END IF;

     OPEN c_node_root (v_shortname,v_authcode,v_endpoint);
          LOOP
          FETCH c_node_root INTO r_node_root;
          EXIT WHEN c_node_root%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE('La raiz de esta estructura es');

          END LOOP;
      CLOSE c_node_root;

 --Bloque de excepciones
    EXCEPTION
         WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

            INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
            VALUES(SYSDATE, 'N/A', '995', 'Error agregando lineas de costo a la tabla INT_COST_SHEET, error:'||err_msg||'',0,'N/A');

end int_sp_costsheet;
/
