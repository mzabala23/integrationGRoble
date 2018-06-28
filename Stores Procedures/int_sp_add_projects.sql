create or replace PROCEDURE INT_SP_ADD_PROJECTS
IS

--Cursor que verifica la información de autenticación en Unifier
CURSOR c_auth_unifier IS
    SELECT ID_AUTH,SHORTNAME,AUTHCODE
    FROM INT_AUTH
    WHERE ACTIVE='Y';

--Consulta en cursor que verifica la información del proyecto existente en la tabla INT_PROJECT_LIST
CURSOR c_projectList (SHORTNAME VARCHAR2,AUTHCODE VARCHAR2) IS
    select xt.projectnumber,xt.projectname,xt.status,CASE WHEN xt.type='wbs_shell' THEN 'PC' ELSE 'FM-RE' END TYPE_PROJECT
    from (select xmltype(DBMS_XMLGEN.CONVERT(getListProjects(SHORTNAME,AUTHCODE).extract('//xmlcontents/text()').getClobVal(),1)) valor
          from dual) x
    left join
    xmltable('/List_Wrapper/projectshell'
    passing x.valor
    COLUMNS
    projectname VARCHAR2(50) path 'projectname',
    projectnumber VARCHAR2 (15) path 'projectnumber',
    status VARCHAR2(15) path 'status',
    type VARCHAR2(15) path 'type'
    ) xt on (1=1)
    WHERE NOT EXISTS (SELECT *
                      FROM INT_PROJECT_LIST B
                      WHERE B.PROJECTCODE_U=projectnumber);

--Bloque de variables para los cursores
r_auth_unifier  c_auth_unifier%rowtype;
r_projectList   c_projectList%rowtype;

--Variables locales
SHORTNAME       VARCHAR2(20);
AUTHCODE        VARCHAR2(4);
point_debug     NUMBER:=0;
--Bloque de variables para la verificación de existencia de valores en el resultado de consulta de los cursores
vb_existe_auth_unifier  boolean;
vb_existe_project       boolean;
--Log de mensajes en las excepciones
err_num               NUMBER;
err_msg               VARCHAR2(255);

BEGIN

--Abrir el cursor para autenticación en Unifier
OPEN c_auth_unifier;
    FETCH c_auth_unifier INTO r_auth_unifier;
    vb_existe_auth_unifier := c_auth_unifier%FOUND;
CLOSE c_auth_unifier;

--Verificar si existe la información de la autenticación con unifier
IF vb_existe_auth_unifier THEN
  SHORTNAME:=r_auth_unifier.SHORTNAME;
  AUTHCODE:=r_auth_unifier.AUTHCODE;
  point_debug:=1;

   OPEN c_projectList (SHORTNAME,AUTHCODE);
    FETCH c_projectList INTO r_projectList;
    vb_existe_project := c_projectList%FOUND;
   CLOSE c_projectList;

  IF vb_existe_project THEN

    OPEN c_projectList (SHORTNAME,AUTHCODE);
        point_debug:=2;
        LOOP
          point_debug:=3;

              FETCH c_projectList INTO r_projectList;
              point_debug:=4;
                EXIT WHEN c_projectList%NOTFOUND;
                   point_debug:=5;
                   INSERT INTO INT_PROJECT_LIST (PROJECTCODE_U,PROJECTNAME,STATUS_U,TYPE_PROJECT)
                   VALUES(r_projectList.projectnumber,r_projectList.projectname,r_projectList.status,r_projectList.TYPE_PROJECT);
                   point_debug:=6;
                    --//Ingresar la información a la tabla de logs
                    INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
                    VALUES(SYSDATE, r_projectList.projectnumber, '997', 'Ingreso de proyecto: '||r_projectList.projectnumber||' de tipo: '||r_projectList.TYPE_PROJECT,0,r_projectList.TYPE_PROJECT);

        END LOOP;
    CLOSE c_projectList;

  END IF;
ELSE
  point_debug:=7;
  INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,INTERFACE_CODE,TRANSACTION_EBS)
  VALUES(SYSDATE, 'N/A', '998', 'No Existe información para la autenticación con Unifier, por favor verifique la tabla INT_AUTH ',0,'N/A');
END IF;

EXCEPTION

         WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error'||SQLCODE||SQLERRM);

         err_num := SQLCODE;
         err_msg := SQLERRM;

         INSERT INTO LOG_BP_PROCESS(RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,INTERFACE_CODE,TRANSACTION_EBS,DATE_TRANSACTION)
         VALUES('999','Error procesando el ingreso de proyectos: con el mensaje: '||err_msg||' en el punto: '||point_debug,'',0,'','',SYSDATE);

END INT_SP_ADD_PROJECTS;
