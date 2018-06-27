create or replace FUNCTION fn_setBPRecord (SHORTNAME IN VARCHAR2,
                                          AUTHCODE IN VARCHAR2,
                                          PROJECTNUMBER IN VARCHAR2,
                                          BPNAME IN VARCHAR2,
                                          BPXML in CLOB)
RETURN XMLTYPE
AS

 -- SOAP REQUESTS/RESPONSE
   soap_req_msg    varchar2(32767);
   --V_SOAP_REQUEST_TEXT CLOB := V_SOAP_REQUEST.getClobVal();
   soap_resp_msg  varchar2(32767);
    l_http_request   UTL_HTTP.req;
    l_http_response  UTL_HTTP.resp;
    l_buffer_size    NUMBER := 4000;
    l_line_size      NUMBER := 4000;
    l_lines_count    NUMBER := 200;
    l_string_request VARCHAR2(4000);
    l_line           CLOB;
    l_raw_data       RAW(8000);
    l_clob_response  CLOB;
    l_clob_response2  CLOB;
    l_ct_cookies UTL_HTTP.COOKIE_TABLE;
    l_vc_secure VARCHAR2(1);
      l_xml xmltype;
BEGIN

   --El número de ID para el tipo de UDF SPI INTERNO(EEB) es 10857
    --UTL_HTTP.set_wallet('file:E:\app\Wallet', 'V3r4n02o17');
    soap_req_msg :=
      '<?xml version="1.0" encoding="UTF-8"?>
  <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <soap:Body>
    <createBPRecord xmlns="http://general.service.webservices.skire.com/" soap:encondingStyle="http://schemas.xmlsoap.org/soap/encoding/">
       <shortname xsi:type="xsd:string">'||SHORTNAME||'</shortname>
       <authcode xsi:type="xsd:string">'||AUTHCODE||'</authcode>
       <projectNumber xsi:type="xsd:string">'||PROJECTNUMBER||'</projectNumber>
       <BPName xsi:type="xsd:string">'||BPNAME||'</BPName>
       <BPXML xsi:type="xsd:string">'||BPXML||'</BPXML>
    </createBPRecord>
  </soap:Body>
  </soap:Envelope>';
   l_http_request :=UTL_HTTP.begin_request('http://172.16.120.123:7001/ws/services/mainservice', 'POST', 'HTTP/1.1');
   UTL_HTTP.set_transfer_timeout(90);
   UTL_HTTP.set_header (l_http_request, 'Accept-Encoding', 'gzip,deflate');
   UTL_HTTP.set_header (l_http_request, 'Content-Type', 'application/soap+xml;charset=UTF-8;action="http://tempuri.org/IDataInterfaceService/Connect"');
   UTL_HTTP.set_header (l_http_request, 'Content-Length', length(soap_req_msg));
   UTL_HTTP.set_header (l_http_request, 'Connection', 'Keep-Alive');
   UTL_HTTP.set_header (l_http_request, 'User-Agent', 'Apache-HttpClient/4.1.1 (java 1.5)');
   UTL_HTTP.write_text (l_http_request, soap_req_msg);
    l_http_response := UTL_HTTP.get_response(l_http_request);
DBMS_OUTPUT.put_line ('Ingreso: ' || PROJECTNUMBER ||BPNAME||l_http_response.status_code||l_http_response.reason_phrase);
IF l_http_response.status_code = 200 THEN

  BEGIN

        <<response_loop>>
        LOOP
            UTL_HTTP.read_raw(l_http_response, l_raw_data, l_buffer_size);
            l_clob_response := l_clob_response || UTL_RAW.cast_to_varchar2(l_raw_data);
        END LOOP response_loop;

        EXCEPTION
            WHEN UTL_HTTP.end_of_body THEN
                UTL_HTTP.end_response(l_http_response);
    END;

    <<print_response>>
    FOR i IN 0..CEIL(LENGTH(l_clob_response) / l_line_size) - 1 LOOP
        l_line := SUBSTR(l_clob_response, i * l_line_size + 1, l_line_size);
        l_clob_response2:=l_clob_response2||SUBSTR(TRIM(l_line),1,16000);
        EXIT WHEN i > l_lines_count - 1;
    END LOOP print_response;

   l_xml:=xmltype(l_clob_response2);

    IF l_http_request.private_hndl IS NOT NULL THEN
        UTL_HTTP.end_request(l_http_request);
    END IF;

END IF;


RETURN l_xml;

  UTL_HTTP.end_response (l_http_response);

     EXCEPTION
    WHEN UTL_HTTP.TOO_MANY_REQUESTS THEN
    UTL_HTTP.END_RESPONSE(l_http_response);
    WHEN UTL_HTTP.END_OF_BODY THEN
    dbms_output.put_line('end loop');
    --dbms_output.put_line(dbms_lob.getlength(temp_clob));
    l_xml:=xmltype(l_clob_response2);
   -- dbms_lob.close(temp_clob);
    --dbms_lob.freetemporary(temp_clob);
    UTL_HTTP.END_RESPONSE(l_http_response);
RETURN l_xml;
END;
