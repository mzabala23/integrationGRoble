/*
create or replace package encrypt_decrypt
as
  --A continuación la declaración de un paquete, que contiene dos funciones que retornan la encriptación raw y la desencriptación varchar2
  function encrypt(v_string varchar2) return raw deterministic;
  function decrypt(v_string raw) return varchar2 deterministic;
end;
/
*/


create or replace package body encrypt_decrypt
as

--Variables Globales
encryption_type PLS_INTEGER :=DMBS_CRYPTO.ENCRYPT_DES+DBMS_CRYPTO.CHAIN_CBS+DBMS_CRYPTO.PAD_PKCS5;

encryption_key RAW(32):=UTL_RAW.CAST_TO_RAW('V3R4N0O2O18GROBLE');

  function encrypt(v_string varchar2) return raw deterministic
  is
    encrypte_raw RAW(2000);
  begin
--Utilizando el paquete DBMS_CRYPTO y la función ENCRYPT pasamos el tipo de encriptación y la llave para encriptación
    encrypte_raw:=DBMS_CRYPTO.ENCRYPT(
            src => utl_raw.cast_to_raw(v_string)
          , typ =>  encryption_type
          , key => encryption_key
          );

      return encrypte_raw;

  end encrypt;

  function decrypt( v_string raw) return varchar2 deterministic
  is
    decrypted_raw RAW(2000);
  begin
--Utilizando el paquete DBMS_CRYPTO y la función DECRYPT pasamos el tipo de encriptación y la llave para la desencriptación
    decrypted_raw:=DBMS_CRYPTO.DECRYPT(
            src => v_string
          , typ => encryption_type
          , key => encryption_key
          );
    return (utl_raw.cast_to_varchar2(decrypted_raw));

  end decrypt;

end;
/
