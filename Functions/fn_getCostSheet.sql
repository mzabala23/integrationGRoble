create or replace function fn_getCostSheet (PROJECTNUMBER IN VARCHAR2)
RETURN XMLTYPE
AS

  --Declarar un cursor para gestión de autenticación
   CURSOR c_auth_unifier IS
   SELECT SHORTNAME,AUTHCODE,ENDPOINT FROM int_auth where active='N';
-- Se declaran las variables tipo SOAP para la petición y respuesta req/resp
   soap_req_msg varchar2(32767);
   soap_resp_msg varchar2(32767);

   v_http_request utl_http.req;
   v_http_response utl_http.resp;

   vb_exists_auth_unifier boolean;

   --Variables con cursores implicitos para recuperar registros que interactuan en el procedimiento
   v_shortname varchar2(4000);
   v_authcode  varchar2(4000);
   v_endpoint  varchar2(100);
   r_auth c_auth_unifier%rowtype;

   v_buffer_size NUMBER   :=4000;
   v_line_size NUMBER     :=4000;
   v_lines_count NUMBER   :=4000;
   v_string_request varchar2(4000);
   v_line clob;
   v_raw_data raw(8000);
   v_clob_response_1 clob;
   v_clob_response_2 clob;

   v_xml xmltype; --Variable tipo XML que me almacena toda la información del response en XML

BEGIN

  OPEN c_auth_unifier;
      FETCH c_auth_unifier INTO r_auth;
           vb_exists_auth_unifier := c_auth_unifier%FOUND;
  close c_auth_unifier;

  IF vb_exists_auth_unifier THEN
      v_shortname :=r_auth.SHORTNAME;
      v_authcode  :=r_auth.AUTHCODE;
      v_endpoint  :=r_auth.ENDPOINT;


  /*La siguiente línea de código se debe activar cuando se tiene una billetera (wallet) que contenga certificados de autenticación
                UTL_HTTP.set_wallet('file:E:\app\Wallet', 'V3r4n02o17');
  */
  /*Petición tipo SOAP que llama el metodo getWBSCodes() de Unifier*/
     soap_req_msg           :=
        '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:gen="http://general.service.webservices.skire.com">
           <soapenv:Header/>
           <soapenv:Body>
              <gen:getWBSCodes soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
                 <shortname xsi:type="xsd:string">'||encrypt_decrypt.decrypt(v_shortname)||'</shortname>
                 <authcode xsi:type="xsd:string">'||encrypt_decrypt.decrypt(v_authcode)||'</authcode>
                 <projectnumber xsi:type="xsd:string">'||PROJECTNUMBER||'</projectnumber>
              </gen:getWBSCodes>
           </soapenv:Body>
        </soapenv:Envelope>';
    --
    --Bloque de variables para la petición del servicio web que pasara al HEADER
    --
    v_http_request          :=utl_http.begin_request(
            url                                       => v_endpoint
          , method                                    => 'POST'
          , http_version                              => 'HTTP/1.1');
    utl_http.set_transfer_timeout(
            timeout                                   => 90);
    utl_http.set_header(
          r                                           => v_http_request
        , name                                        => 'Accept-Encoding'
        , value                                       => 'gzip,deflate');
    utl_http.set_header(
          r                                           => v_http_request
          , name                                      => 'Content-Type'
          , value                                     => 'application/soap+xml;charset=UTF-8;action="http://tempuri.org/IDataInterfaceService/Connect"');
    utl_http.set_header(
            r                                         => v_http_request
          , name                                      => 'Content-Length'
          , value                                     => length(soap_req_msg));
    utl_http.set_header(
            r                                         => v_http_request
          , name                                      => 'Connection'
          , value                                     => 'Keep-Alive');
    utl_http.set_header(
          r                                           => v_http_request
        , name                                        => 'User-Agent'
        , value                                       => 'Apache-HttpClient/4.1.1 (java 1.5)');
    utl_http.write_text(
          r                                           => v_http_request
        , data                                        => soap_req_msg );
     -- Invocar la petición y solicitar la respuesta
     --
     v_http_response        := UTL_HTTP.get_response(v_http_request);

     --Verificar que la respuesta sea exitosa (Status =200)
  if v_http_response.status_code                      =utl_http.HTTP_OK then

    begin
      <<loop_respuesta>>
      loop
          utl_http.read_raw(
                      r                               => v_http_response
                    , data                            => v_raw_data
                    , len                             => v_buffer_size);
          v_clob_response_1 := v_clob_response_1 || utl_raw.cast_to_varchar2(
                      r                               => v_raw_data);
      end loop loop_respuesta;
      exception
        when utl_http.END_OF_BODY then
          utl_http.end_response(
                      r                               => v_http_response );
    end;

      <<print_response>>
      for i in 0..ceil(length(v_clob_response_1)/v_line_size) - 1
      loop
        v_line              := substr(v_clob_response_1,i*v_line_size+1,v_line_size);
        v_clob_response_2   :=v_clob_response_2||substr(trim(v_line),1,900000);
        exit when i>v_lines_count-1;
      end loop;

    v_xml                   :=xmltype(v_clob_response_2);

    if v_http_request.private_hndl is not null
    then
        utl_http.end_request(v_http_request);
    end if;

  end if;

 END IF;--IF vb_exists_auth_unifier THEN

RETURN v_xml;

  -- Bloque de excepciones

    EXCEPTION
    WHEN UTL_HTTP.TOO_MANY_REQUESTS THEN
    UTL_HTTP.END_RESPONSE(v_http_response);
    WHEN UTL_HTTP.END_OF_BODY THEN
    v_xml                 :=xmltype(v_clob_response_2);
    UTL_HTTP.END_RESPONSE(v_http_response);

RETURN v_xml;
END fn_getCostSheet;
/
