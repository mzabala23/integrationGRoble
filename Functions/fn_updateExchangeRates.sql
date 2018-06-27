create or replace FUNCTION fn_updateExchangeRates (SHORTNAME IN VARCHAR2,
                                         AUTHCODE IN VARCHAR2,
                                         ERXML in CLOB)
RETURN xmltype
AS

-- SOAP REQUESTS/RESPONSE
   soap_req_msg    varchar2(30000);
   --V_SOAP_REQUEST_TEXT CLOB := V_SOAP_REQUEST.getClobVal();
   soap_resp_msg  varchar2(30000);

   -- HTTP REQUEST/RESPONSE
   http_req        UTL_HTTP.req;
   http_resp       UTL_HTTP.resp;
   l_xml XMLTYPE;
BEGIN
--
   -- Create SOAP request via HTTP
   --
   soap_req_msg :=
      '<?xml version="1.0" encoding="UTF-8"?>
  <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <soap:Body>
    <updateExchangeRates xmlns="http://general.service.webservices.skire.com/" soap:encondingStyle="http://schemas.xmlsoap.org/soap/encoding/">
       <shortname xsi:type="xsd:string">'||SHORTNAME||'</shortname>
       <authcode xsi:type="xsd:string">'||AUTHCODE||'</authcode>
       <ratesXML xsi:type="xsd:string">'||ERXML||'</ratesXML>
    </updateExchangeRates>
  </soap:Body>
  </soap:Envelope>';
   http_req :=UTL_HTTP.begin_request('http://172.16.120.123:7001/ws/services/mainservice', 'POST', 'HTTP/1.1');
   UTL_HTTP.set_header (http_req, 'Accept-Encoding', 'gzip,deflate');
   UTL_HTTP.set_header (http_req, 'Content-Type', 'application/soap+xml;charset=UTF-8;action="http://tempuri.org/IDataInterfaceService/Connect"');
   UTL_HTTP.set_header (http_req, 'Content-Length', length(soap_req_msg));
   UTL_HTTP.set_header (http_req, 'Connection', 'Keep-Alive');
   UTL_HTTP.set_header (http_req, 'User-Agent', 'Apache-HttpClient/4.1.1 (java 1.5)');
   UTL_HTTP.write_text (http_req, soap_req_msg);

  --
   -- Invoke Request and get Response.
   --
   http_resp := UTL_HTTP.get_response(http_req);
   UTL_HTTP.read_text (http_resp, soap_resp_msg);
   UTL_HTTP.end_response (http_resp);
   UTL_HTTP.end_request(http_req);
   l_xml:=xmltype(soap_resp_msg);
   DBMS_OUTPUT.put_line ('Output: ' || soap_resp_msg);
   RETURN l_xml;
    EXCEPTION
      WHEN UTL_HTTP.END_OF_BODY THEN
        BEGIN
          UTL_HTTP.END_RESPONSE(http_resp);
          UTL_HTTP.end_request(http_req);
          RETURN l_xml;
        EXCEPTION WHEN OTHERS THEN
          RETURN l_xml;
        END;
      WHEN OTHERS THEN
        BEGIN
          UTL_HTTP.END_RESPONSE(http_resp);
          UTL_HTTP.end_request(http_req);
          RETURN l_xml;
        EXCEPTION WHEN OTHERS THEN
          RETURN l_xml;
        END;
END;
