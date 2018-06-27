create or replace FUNCTION getBPList (SHORTNAME IN VARCHAR2,
                                         AUTHCODE IN VARCHAR2,
                                         PROJECTNUMBER IN VARCHAR2,
                                         BPNAME IN VARCHAR2,FILTER IN VARCHAR2)
RETURN XMLTYPE
AS
-- SOAP REQUESTS/RESPONSE
   soap_req_msg    varchar2(30000);
   --V_SOAP_REQUEST_TEXT CLOB := V_SOAP_REQUEST.getClobVal();
   soap_resp_msg  varchar2(30000);

   -- HTTP REQUEST/RESPONSE
   http_req        UTL_HTTP.req;
   http_resp       UTL_HTTP.resp;
   V_BUFFER CLOB;
   l_xml xmltype;
   v_first boolean:=TRUE;
   temp_clob     clob;
BEGIN
 dbms_lob.createtemporary(temp_clob, TRUE, dbms_lob.call);
    dbms_lob.open(temp_clob, dbms_lob.lob_readwrite);
   --
   -- Create SOAP request via HTTP
   --
   soap_req_msg :=
      '<?xml version="1.0" encoding="UTF-8"?>
  <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <soap:Body>
    <getBPList xmlns="http://general.service.webservices.skire.com/" soap:encondingStyle="http://schemas.xmlsoap.org/soap/encoding/">
       <shortname xsi:type="xsd:string">'||SHORTNAME||'</shortname>
       <authcode xsi:type="xsd:string">'||AUTHCODE||'</authcode>
       <projectNumber xsi:type="xsd:string">'||PROJECTNUMBER||'</projectNumber>
       <BPName xsi:type="xsd:string">'||BPNAME||'</BPName>
       <filterCondition xsi:type="xsd:string"><_filterCondition>'||FILTER||'</_filterCondition></filterCondition>
    </getBPList>
  </soap:Body>
  </soap:Envelope>';
   http_req :=UTL_HTTP.begin_request('http://172.16.120.123:7001:8204/ws/services/mainservice', 'POST', 'HTTP/1.1');
   UTL_HTTP.set_header (http_req, 'Accept-Encoding', 'gzip,deflate');
   UTL_HTTP.set_header (http_req, 'Content-Type', 'application/soap+xml;charset=UTF-8;action="http://tempuri.org/IDataInterfaceService/Connect"');
   UTL_HTTP.set_header (http_req, 'Content-Length', length(soap_req_msg));
   UTL_HTTP.set_header (http_req, 'Connection', 'Keep-Alive');
   UTL_HTTP.set_header (http_req, 'User-Agent', 'Apache-HttpClient/4.1.1 (java 1.5)');
   UTL_HTTP.write_text (http_req, soap_req_msg);

  dbms_output.put_line(' ');
  --
   -- Invoke Request and get Response.
   --
   http_resp := UTL_HTTP.get_response(http_req);
  -- UTL_HTTP.read_text (http_resp, soap_resp_msg);

   LOOP
    UTL_HTTP.READ_LINE(http_resp, V_BUFFER, TRUE);
     if v_first then
       v_first := FALSE;
       dbms_lob.write(temp_clob, length(V_BUFFER), 1, V_BUFFER);
    else
       dbms_lob.writeappend(temp_clob,length(V_BUFFER),V_BUFFER);
   end if;

  END LOOP;
   l_xml:=xmltype(temp_clob);
RETURN l_xml;

  UTL_HTTP.end_response (http_resp);
  -- DBMS_OUTPUT.put_line ('Output: ' || soap_resp_msg);
  dbms_lob.close(temp_clob);
  dbms_lob.freetemporary(temp_clob);
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
