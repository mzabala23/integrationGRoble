create or replace TRIGGER AI_INT_ADD_EBS_PROCESS
AFTER INSERT OR UPDATE ON INT_EBS_AMOUNT
FOR EACH ROW
DECLARE

--Cursor para identificar el tipo de proyeto y si existe
CURSOR c_project_type(PROJECT_EBS VARCHAR2) IS
  SELECT TYPE_PROJECT
  FROM INT_PROJECT_LIST
  WHERE PROJECTEBS = PROJECT_EBS;

--Cursor para identificar si existe la linea de costo
CURSOR c_bitemid (PROJECT_EBS VARCHAR2, BITEMID VARCHAR2) IS
  select BITEMID_CS
  from int_cost_sheet
  where PROJECT_CS = PROJECT_EBS AND BITEMID_CS=BITEMID;

--Cursor para identificar si existe la fuente y de que tipo es
CURSOR c_interface (INTERFACES VARCHAR2) IS
  select ID_INTERFACES
  from int_interfaces
  where NAME_INTERFACES = INTERFACES;

--Cursor para verificar disponbible por linea de costo (Esto solo aplica para FM)
CURSOR c_disponible (PROJECT_EBS VARCHAR2, BITEMID VARCHAR2,FECHA DATE) IS
  SELECT AMOUNT_BPA
  FROM INT_BP_AMOUNT
  WHERE BITEMID_CS = BITEMID
  AND PROJECT_BPA=PROJECT_EBS
  AND to_char(EFFECTIVE_DATE,'MM')= TO_CHAR(FECHA,'MM')
  AND EFFECTIVE_YEAR=to_char(FECHA,'YYYY');

--Variables de los cursores
vb_existe_project     boolean;
vb_existe_bitemid     boolean;
vb_existe_interface   boolean;
vb_existe_disponible boolean;

--Variables que almacenan información de los cursores
type_project          varchar2(50);
bitemid_exist         varchar2(3000);
type_interfaz         number;
disponible            number;
fecha                 date;

BEGIN

  --Seteamos las fechas, para no tener problemas de formatos
  execute immediate 'alter session set nls_date_language=''SPANISH''';
  execute immediate 'alter session set nls_date_format=''MM/DD/YYYY''';
  execute immediate 'alter session set nls_numeric_characters= ''.,'' ';

  --Verifica que exista información para un tipo de proyecto
  OPEN c_project_type(:NEW.PROJECT_EBS);
    FETCH c_project_type INTO type_project;
    vb_existe_project := c_project_type%FOUND;
    CLOSE c_project_type;

    --Verifica que exista información para una linea de costo asociada a un proyecto
  OPEN c_bitemid(:NEW.PROJECT_EBS,:NEW.BITEMID_EBS);
    FETCH c_bitemid INTO bitemid_exist;
    vb_existe_bitemid := c_bitemid%FOUND;
    CLOSE c_bitemid;

  --Verifica que exista la información del tipo de fuente
  OPEN c_interface(:NEW.INT_SOURCE);
    FETCH c_interface INTO type_interfaz;
    vb_existe_interface := c_interface%FOUND;
    CLOSE c_interface;

  --Verifica si el campo fecha esta disponible
  IF :NEW.FROM_DATE IS NOT NULL THEN
    fecha:=:NEW.FROM_DATE;
  ELSE
    fecha:=sysdate;
  END IF;

  --Verifica que exista monto disponible para una fecha determinada en el módulo FM
  OPEN c_disponible(:NEW.PROJECT_EBS,:NEW.BITEMID_EBS,fecha);
    FETCH c_disponible INTO disponible;
    vb_existe_disponible := c_disponible%FOUND;
    CLOSE c_disponible;

    IF vb_existe_project THEN
      IF vb_existe_bitemid THEN
        IF vb_existe_interface THEN
          IF type_project='PC' THEN

            IF type_interfaz=4 AND :NEW.AMOUNT_EBS < 0 THEN
              type_interfaz:=42;
            ELSIF type_interfaz=5 AND :NEW.AMOUNT_EBS < 0 THEN
              type_interfaz:=43;
            ELSIF type_interfaz=6 AND :NEW.AMOUNT_EBS < 0 THEN
              type_interfaz:=44;
            ELSIF type_interfaz=7 AND :NEW.AMOUNT_EBS<0 THEN
              type_interfaz:=45;
            END IF;

            --Las interfaces 5,6,7,43,44,45 no hacen validación de presupuesto y no actualizan columna de presupuesto
            --Las interfaces 3,10,21,41 estan asociadas a montos comprometidos, por lo tanto si actualizan  el monto real disponible
            IF type_interfaz = 3 OR type_interfaz = 10 OR type_interfaz = 21 OR type_interfaz = 41 THEN
                --Actualiza el nuevo monto comprometido
                UPDATE INT_BP_AMOUNT
                SET AMOUNT_BPA=AMOUNT_BPA-:NEW.AMOUNT_EBS
                WHERE BITEMID_CS = :NEW.BITEMID_EBS
                AND PROJECT_BPA=:NEW.PROJECT_EBS;
            ELSE
              INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,TRANSACTION_EBS)
              VALUES(SYSDATE, :NEW.PROJECT_EBS, '888', 'NO HAY ACTUALIZACIÓN DE PRESUPUESTO PARA LAS LINEAS DE COSTO:  '||:NEW.BITEMID_EBS||' PC, FUENTE: '||:NEW.INT_SOURCE,:NEW.TRANSACTION_EBS);
            END IF;--IF type_interfaz <> 5 AND type_interfaz <> 6 AND type_interfaz <> 7 AND type_interfaz <> 42 AND type_interfaz <> 43 AND type_interfaz <> 44 THEN

          ELSIF type_project='FM-RE' THEN--IF type_project='PC' THEN

            IF type_interfaz=4 AND :NEW.AMOUNT_EBS<0 THEN
              type_interfaz:=42;
            ELSIF type_interfaz=5 AND :NEW.AMOUNT_EBS<0 THEN
              type_interfaz:=43;
            ELSIF type_interfaz=6 AND :NEW.AMOUNT_EBS<0 THEN
              type_interfaz:=44;
            ELSIF type_interfaz=7 AND :NEW.AMOUNT_EBS<0 THEN
              type_interfaz:=45;
            END IF;

            --Si no pertenece a las integraciones 3,10,21,41 si pasa la condición, las anteriores son para actualizar monto comprometido
            --Las interfaces 5,6,7,43,44,45 no hacen validación de presupuesto y no actualizan el presupuesto disponible
           IF type_interfaz = 3 OR type_interfaz = 10 OR type_interfaz = 21 OR type_interfaz = 41 THEN
              IF vb_existe_disponible then
                IF (disponible-:NEW.AMOUNT_EBS)>0 THEN
                    --Actualiza el nuevo monto comprometido
                    UPDATE INT_BP_AMOUNT
                    SET AMOUNT_BPA=AMOUNT_BPA-:NEW.AMOUNT_EBS
                    WHERE BITEMID_CS = :NEW.BITEMID_EBS
                    AND PROJECT_BPA=:NEW.PROJECT_EBS
                    AND EFFECTIVE_DATE LIKE '%'||TO_CHAR(fecha,'MM')||'%'
                    AND EFFECTIVE_YEAR=to_char(fecha,'YYYY');
                ELSE
                   --Si no tiene presupuesto disponible simplemente no se procesa
                   INSERT INTO INT_BP_PROCESS (BITEMID,DESCRIPTION,TRANSACTION_EBS,AMOUNT,INT_SOURCE)
                   VALUES(:NEW.BITEMID_EBS,'No Procesada, no le alcanza el presupuesto disponible, Proyecto: '||:NEW.PROJECT_EBS||' Interfaz: '||:NEW.INT_SOURCE||' Fecha: '||fecha,:NEW.TRANSACTION_EBS,:NEW.AMOUNT_EBS,:NEW.INT_SOURCE);

                   INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,TRANSACTION_EBS)
                   VALUES(SYSDATE, :NEW.PROJECT_EBS, '888', 'NO HAY PRESUPUESTO DISPONIBLE PARA LA LÍNEA: '||:NEW.BITEMID_EBS||', INTERFAZ: '||:NEW.INT_SOURCE||', PROYECTO: '||:NEW.PROJECT_EBS||', FECHA: '||fecha,:NEW.TRANSACTION_EBS);
                END IF;--IF (disponible-:NEW.AMOUNT_EBS)>0 THEN
              ELSE
                --Si no cumple con la condición, simplemente pasa a la tabla como si estuviera procesada
                INSERT INTO INT_BP_PROCESS (BITEMID,DESCRIPTION,TRANSACTION_EBS,AMOUNT,INT_SOURCE)
                VALUES(:NEW.BITEMID_EBS,'No Procesada, la línea de costo no tiene presupuesto disponible',:NEW.TRANSACTION_EBS,:NEW.AMOUNT_EBS,:NEW.INT_SOURCE);

                INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,TRANSACTION_EBS)
                VALUES(SYSDATE, :NEW.PROJECT_EBS, '888', 'NO HAY ACTUALIZACIÓN DE LINEAS DE COSTO FM, FUENTE: '||:NEW.INT_SOURCE,:NEW.TRANSACTION_EBS);
              END IF;-- IF vb_existe_disponible then
           END IF;--IF type_interfaz <> 3 AND type_interfaz <> 10 AND type_interfaz <> 21 AND type_interfaz <> 41 THEN

          END IF;--IF type_project='PC' THEN

        ELSE
          --Si no cumple con la condición, simplemente pasa a la tabla como si estuviera procesada
          INSERT INTO INT_BP_PROCESS (BITEMID,DESCRIPTION,TRANSACTION_EBS,AMOUNT,INT_SOURCE)
          VALUES(:NEW.BITEMID_EBS,'No Procesada - No tiene interfaz asociada',:NEW.TRANSACTION_EBS,:NEW.AMOUNT_EBS,:NEW.INT_SOURCE);

          INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,TRANSACTION_EBS)
          VALUES(SYSDATE, :NEW.PROJECT_EBS, '888', 'NO SE ENCONTRO LA INTERFAZ: '||:NEW.INT_SOURCE,:NEW.TRANSACTION_EBS);
        END IF;--IF vb_existe_interface THEN
      ELSE
        --Cuando la línea de costo no existe y tampoco tiene que validar presupuesto disponible
        IF type_project='FM-RE' THEN
          --Si la interfaz que ingresa no tiene validación de presupuesto disponible y no tiene linea de costo, no se procesara en Unifier
          IF type_interfaz <> 41 AND type_interfaz <> 5 AND type_interfaz <> 6 AND type_interfaz <> 7 AND type_interfaz <> 43 AND type_interfaz <> 44 AND type_interfaz <> 45 THEN
               --Si no cumple con la condición, simplemente pasa a la tabla como si estuviera procesada
            INSERT INTO INT_BP_PROCESS (BITEMID,DESCRIPTION,TRANSACTION_EBS,AMOUNT,INT_SOURCE)
            VALUES(:NEW.BITEMID_EBS,'No procesada, no existe la línea de costo: '||:NEW.BITEMID_EBS||' asociada con el proyecto: '||:NEW.PROJECT_EBS||', Interfaz: '||:NEW.INT_SOURCE||', Fecha: '||fecha||' - Módulo FM',:NEW.TRANSACTION_EBS,:NEW.AMOUNT_EBS,:NEW.INT_SOURCE);
          END IF;
        --
        ELSIF type_project='PC' THEN
           IF type_interfaz <> 3 AND type_interfaz <> 41 AND type_interfaz <> 5 AND type_interfaz <> 6 AND type_interfaz <> 7 AND type_interfaz <> 43 AND type_interfaz <> 44 AND type_interfaz <> 45 THEN
               --Si no cumple con la condición, simplemente pasa a la tabla como si estuviera procesada
            INSERT INTO INT_BP_PROCESS (BITEMID,DESCRIPTION,TRANSACTION_EBS,AMOUNT,INT_SOURCE)
            VALUES(:NEW.BITEMID_EBS,'No procesada, no existe la línea de costo: '||:NEW.BITEMID_EBS||' asociada con el proyecto: '||:NEW.PROJECT_EBS||' - Módulo PC',:NEW.TRANSACTION_EBS,:NEW.AMOUNT_EBS,:NEW.INT_SOURCE);
          END IF;
        END IF;

        INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,TRANSACTION_EBS)
        VALUES(SYSDATE, :NEW.PROJECT_EBS, '888', 'NO SE ENCONTRO LA LINEA DE COSTO: '||:NEW.BITEMID_EBS||' ASOCIADA A EL PROYECTO: '||:NEW.PROJECT_EBS,:NEW.TRANSACTION_EBS);
      END IF;--IF vb_existe_bitemid THEN
    ELSE
      --Si no cumple con la condición, simplemente pasa a la tabla como si estuviera procesada
      INSERT INTO INT_BP_PROCESS (BITEMID,DESCRIPTION,TRANSACTION_EBS,AMOUNT,INT_SOURCE)
      VALUES(:NEW.BITEMID_EBS,'No Procesada',:NEW.TRANSACTION_EBS,:NEW.AMOUNT_EBS,:NEW.INT_SOURCE);

      INSERT INTO log_bp_process(date_transaction, project_code, response, xmlprocess,TRANSACTION_EBS)
      VALUES(SYSDATE, :NEW.PROJECT_EBS, '888', 'NO SE ENCONTRO EL TIPO DE PROYECTO NÚMERO: '||:NEW.PROJECT_EBS,:NEW.TRANSACTION_EBS);
    END IF;

END AI_INT_ADD_EBS_PROCESS;
