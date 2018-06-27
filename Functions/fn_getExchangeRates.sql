create or replace FUNCTION getExchangeRates (SHORTNAME IN VARCHAR2,
                                         AUTHCODE IN VARCHAR2)
RETURN XMLTYPE
AS

-- Se declaran las variables tipo SOAP para la petición y respuesta req/resp
   soap_req_msg   varchar2(30000);
   soap_resp_msg  varchar2(30000);

   -- HTTP REQUEST/RESPONSE
   http_req        UTL_HTTP.req; --API de UTL_HTTP
   http_resp       UTL_HTTP.resp; --API de UTL_HTTP
   v_buffer clob; --Variable que almacena toda la información del response, linea x linea
   l_xml xmltype; --Variable tipo XML que me almacena toda la información del response en XML
   v_first boolean:=true; --Variable que controla el ingreso de lineas a la variable TMP_CLOB
   temp_clob     clob;

BEGIN

    dbms_lob.createtemporary(temp_clob, TRUE, dbms_lob.call);
    dbms_lob.open(temp_clob, dbms_lob.lob_readwrite);
   --
   -- Crear la petición SOAP vía HTTP
   --
   soap_req_msg :=
      '<?xml version="1.0" encoding="UTF-8"?>
  <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <soap:Body>
    <getExchangeRates xmlns="http://general.service.webservices.skire.com/" soap:encondingStyle="http://schemas.xmlsoap.org/soap/encoding/">
       <shortname xsi:type="xsd:string">'||SHORTNAME||'</shortname>
       <authcode xsi:type="xsd:string">'||AUTHCODE||'</authcode>
    </getExchangeRates>
  </soap:Body>
  </soap:Envelope>';
  --
  --Bloque de variables para la petición del servicio web
  --
   http_req :=UTL_HTTP.begin_request('http://172.16.120.123:7001/ws/services/mainservice', 'POST', 'HTTP/1.1');
   UTL_HTTP.set_header (http_req, 'Accept-Encoding', 'gzip,deflate');
   UTL_HTTP.set_header (http_req, 'Content-Type', 'application/soap+xml;charset=UTF-8;action="http://tempuri.org/IDataInterfaceService/Connect"');
   UTL_HTTP.set_header (http_req, 'Content-Length', length(soap_req_msg));
   UTL_HTTP.set_header (http_req, 'Connection', 'Keep-Alive');
   UTL_HTTP.set_header (http_req, 'User-Agent', 'Apache-HttpClient/4.1.1 (java 1.5)');
   UTL_HTTP.write_text (http_req, soap_req_msg);
   --
   -- Invocar la petición y solicitar la respuesta
   --
   http_resp := UTL_HTTP.get_response(http_req);

   --
   --Bucle que recorre las peticiones linea a linea con READ_LINE de UTL_HTTP.
   --
   loop
    UTL_HTTP.READ_LINE(http_resp, v_buffer, TRUE);
     if v_first then
       v_first := FALSE;
       dbms_lob.write(temp_clob, length(v_buffer), 1, v_buffer);
    else
       dbms_lob.writeappend(temp_clob,length(v_buffer),v_buffer);
   end if;
  end loop;

   l_xml:=xmltype(temp_clob);



  UTL_HTTP.end_response (http_resp);
  dbms_lob.close(temp_clob);
  dbms_lob.freetemporary(temp_clob);

  RETURN l_xml;

  --
  -- Bloque de excepciones
  --
    EXCEPTION
    WHEN UTL_HTTP.TOO_MANY_REQUESTS THEN
    UTL_HTTP.END_RESPONSE(http_resp);
    WHEN UTL_HTTP.END_OF_BODY THEN
    dbms_output.put_line('end loop');
    dbms_output.put_line(dbms_lob.getlength(temp_clob));
    l_xml:=xmltype(temp_clob);
    dbms_lob.close(temp_clob);
    dbms_lob.freetemporary(temp_clob);
    UTL_HTTP.END_RESPONSE(http_resp);

RETURN l_xml;
END;
