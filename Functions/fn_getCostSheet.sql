create or replace function fn_getCostSheet (SHORTNAME IN VARCHAR2,
                                            AUTHCODE IN VARCHAR2,
                                            PROJECTNUMBER IN VARCHAR2,
                                            ENDPOINT IN VARCHAR2)
RETURN XMLTYPE
AS
-- Se declaran las variables tipo SOAP para la petición y respuesta req/resp
   soap_req_msg varchar2(32767);
   soap_resp_msg varchar2(32767);

   v_http_request utl_http.req;
   v_http_response utl_http.resp;

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
/*La siguiente línea de código se debe activar cuando se tiene una billetera (wallet) que contenga certificados de autenticación
              UTL_HTTP.set_wallet('file:E:\app\Wallet', 'V3r4n02o17');
*/
/*Petición tipo SOAP que llama el metodo getWBSCodes() de Unifier*/
   soap_req_msg           :=
      '<?xml version                                ="1.0" encoding="UTF-8"?>
        <soap:Envelope xmlns:soap                   ="http://schemas.xmlsoap.org/soap/envelope/"xmlns:xs="http://www.w3.org/2001/XMLSchema">
          <soap:Body>
            <getWBSCodes xmlns                      ="http://general.service.webservices.skire.com/" soap:encondingStyle="http://schemas.xmlsoap.org/soap/encoding/">
              <shortname xsi:type                   ="xsd:string">'||SHORTNAME||'</shortname>
              <authcode xsi:type                    ="xsd:string">'||AUTHCODE||'</authcode>
              <projectNumber xsi:type               ="xsd:string">'||PROJECTNUMBER||'</projectNumber>
            </getWBSCodes>
          </soap:Body>
        </soap:Envelope>';
  --
  --Bloque de variables para la petición del servicio web que pasara al HEADER
  --
  v_http_request          :=utl_http.begin_request(
          url                                       => ENDPOINT
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
if v_http_response.status_code                      =200 then

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
      v_clob_response_2   :=v_clob_response_2||substr(trim(v_line),1,1600);
      exit when i>v_lines_count-1;
    end loop;

  v_xml                   :=xmltype(v_clob_response_2);

  if v_http_request.private_hndl is not null
  then
      utl_http.end_request(v_http_request);
  end if;

end if;

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
