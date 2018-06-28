set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>100000
,p_default_application_id=>100
,p_default_owner=>'EBS_UNIFIER'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_css_bar_chart
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(63575691394248868053)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.CSS_BAR_CHART'
,p_display_name=>'CSS Bar Chart'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix=>'#IMAGE_PREFIX#eba/css/'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'procedure render_bar_chart (',
'    p_region in apex_plugin.t_region )',
'is',
'    -- constants for the columns of our region source query',
'    c_label_col constant pls_integer := 1;',
'    c_value_col constant pls_integer := 2;',
'    c_url_col   constant pls_integer := 3;',
'    c_color_col constant pls_integer := 4;',
'',
'    -- attributes of the plug-in',
'    l_display_as           varchar2(20)    := nvl(p_region.attribute_01, ''VALUE_ABSOLUTE'');',
'    l_value_prefix         varchar2(40)    := p_region.attribute_02;',
'    l_value_postfix        varchar2(40)    := p_region.attribute_03;',
'    -- page items to submit = p_region.attribute_09',
'    l_max_rows             number          := to_number(p_region.attribute_10);',
'    l_region_source        varchar2(32767) := p_region.source;',
'',
'    l_valid_data_type_list wwv_flow_global.vc_arr2;',
'    l_column_value_list    apex_plugin_util.t_column_value_list2;',
'    l_max_value            number;',
'    l_total_value          number;',
'    l_label                varchar2(4000);',
'    l_value                number;',
'    l_url                  varchar2(4000);',
'    l_color                varchar2(4000);',
'    l_width                number;',
'    l_display_value        varchar2(4000);',
'begin',
'',
'    -- if percentage is displayed then the value will always have % as postfix',
'    if l_display_as like ''PERCENTAGE%'' then',
'        l_value_postfix := '' %'';',
'    end if;',
'',
'    -- define the valid column data types for the region query',
'    l_valid_data_type_list(c_label_col) := apex_plugin_util.c_data_type_varchar2;',
'    l_valid_data_type_list(c_value_col) := apex_plugin_util.c_data_type_number;',
'    l_valid_data_type_list(c_url_col)   := apex_plugin_util.c_data_type_varchar2;',
'    l_valid_data_type_list(c_color_col) := apex_plugin_util.c_data_type_varchar2;',
'',
'    -- get the data to be displayed',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'                               p_sql_statement  => l_region_source,',
'                               p_min_columns    => 2,',
'                               p_max_columns    => 4,',
'                               p_data_type_list => l_valid_data_type_list,',
'                               p_component_name => p_region.name,',
'                               p_max_rows       => l_max_rows );',
'',
'    -- calculate the total or max value depending on "Display As"',
'    -- We could rewrite the region query with SUM(xxx) over ()',
'    -- but that would require that we know how the columns are named in the query.',
'    -- That''s why we just do a simple loop of the tiny array to get the',
'    -- total/max value which is probably faster anyway',
'    if l_display_as like ''%RELATIVE'' then',
'        l_total_value := 0;',
'        for i in 1 .. l_column_value_list(c_value_col).value_list.count loop',
'            -- $$$ what should we do if VALUE is NULL??? Set l_total_value to NULL as well?',
'            l_total_value := l_total_value + l_column_value_list(c_value_col).value_list(i).number_value;',
'        end loop;',
'    else',
'        l_max_value := 0;',
'        for i in 1 .. l_column_value_list(c_value_col).value_list.count loop',
'            -- $$$ what should we do if VALUE is NULL??? Set l_max_value to NULL as well?',
'            if l_column_value_list(c_value_col).value_list(i).number_value > l_max_value then',
'                l_max_value := l_column_value_list(c_value_col).value_list(i).number_value;',
'            end if;',
'        end loop;',
'    end if;',
'',
'    -- print our bar chart',
'    sys.htp.p(''<table class="cbc" border="0" cellspacing="0" cellpadding="0" summary="''||p_region.name||''">'');',
'',
'    for i in 1 .. l_column_value_list(c_label_col).value_list.count loop',
'        l_label := apex_escape.html(l_column_value_list(c_label_col).value_list(i).varchar2_value);',
'        l_value := l_column_value_list(c_value_col).value_list(i).number_value;',
'',
'        -- get the value of the URL and color only if the column exists in the SQL statement',
'        if l_column_value_list.exists(c_url_col) then',
'            l_url := wwv_flow_utilities.prepare_url (',
'                         apex_application.do_substitutions (',
'                             l_column_value_list(c_url_col).value_list(i).varchar2_value ));',
'        end if;',
'        if l_column_value_list.exists(c_color_col) then',
'            l_color := lower(l_column_value_list(c_color_col).value_list(i).varchar2_value);',
'            -- map a few of the standard colors to better looking ones',
'            l_color := case l_color',
'                         when ''red''     then ''#e10''',
'                         when ''yellow''  then ''#fd0''',
'                         when ''green''   then ''#0c0''',
'                         when ''black''   then ''#555''',
'                         when ''default'' then ''#ddd''',
'                         else l_color',
'                       end;',
'        end if;',
'',
'        -- calculate how long the chart bar should be',
'        if l_display_as like ''%RELATIVE'' then',
'            if l_total_value = 0 then',
'                l_width := 0;',
'            else',
'                l_width := round(l_value * 100 / l_total_value);',
'            end if;',
'        else',
'            if l_max_value = 0 then',
'                l_width := 0;',
'            else',
'                l_width := round(l_value * 100 / l_max_value);',
'            end if;',
'        end if;',
'',
'        if l_display_as like ''PERCENTAGE%'' then',
'            l_value := l_width;',
'        end if;',
'',
'        l_display_value := case when l_value_prefix is not null then l_value_prefix||'' '' end||',
'                           trim(to_char(l_value, ''999G999G999G990''))||',
'                           case when l_value_postfix is not null then '' ''||l_value_postfix end;',
'',
'        sys.htp.p(''<tr>'');',
'',
'',
'        -- print label column and add link if an URL has been specified in the SQL statement',
'        -- otherwise just print the label',
'        sys.htp.p(''<th id="''||p_region.static_id||''_row_''||i||''"><span class="cbc_label">'');',
'        if l_url is not null then',
'            sys.htp.p(''<a href="''||l_url||''">''||l_label||''</a>'');',
'        else',
'            sys.htp.p(l_label);',
'        end if;',
'        sys.htp.p(''</span></th>'');',
'',
'        -- print chart bar',
'        sys.htp.p(''<td headers="''||p_region.static_id||''_row_''||i||''">'');',
'        sys.htp.p(''<span class="cbc_bar_background">'');',
'',
'        -- add link if an URL has been specified in the SQL statement otherwise just print the value',
'        if l_url is not null then',
'            sys.htp.p(''<span class="cbc_value"><a href="''||l_url||''">''||l_display_value||''</a></span>'');',
'        else',
'            sys.htp.p(''<span class="cbc_value">''||l_display_value||''</span>'');',
'        end if;',
'        ',
'        sys.htp.p (',
'            ''<span class="cbc_bar" style="width:''||l_width||''%;''||',
'            case when l_color is not null then ''background-color:''||l_color end||',
'            ''"></span>'' );',
'        sys.htp.p(''</span>'');',
'        sys.htp.p(''</td>'');',
'',
'        sys.htp.p(''</tr>'');',
'    end loop;',
'',
'    sys.htp.p(''</table>'');',
'end render_bar_chart;',
'',
'',
'function render (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'is',
'    l_page_items_to_submit varchar2(4000)  := p_region.attribute_09;',
'begin',
'    apex_css.add_file (',
'        p_name      => ''css_bar_chart'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null );',
'',
'    sys.htp.p (''',
'<!--[if IE]> ',
'<style type="text/css" media="screen">',
'.cbc .cbc_bar_background {',
'  background-color: #FFF;',
'  border: 1px solid #AAA;',
'}',
'.cbc .cbc_value {',
'  color: #000;',
'  border-right: 1px solid #AAA;',
'}',
'.cbc .cbc_value a {',
'  color: #000;',
'}',
'.cbc .cbc_value a:hover {',
'  text-decoration: underline',
'}',
'</style>',
'<![endif]-->'');',
'',
'    -- print our region data',
'    sys.htp.p(''<div id="''||p_region.static_id||''_chart" class="cbc">'');',
'',
'    render_bar_chart (',
'        p_region => p_region );',
'',
'    sys.htp.p(''</div>'');',
'',
'    apex_javascript.add_library (',
'        p_name      => ''com_oracle_apex_css_bar_chart'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null );',
'',
'    apex_javascript.add_onload_code (',
'        p_code => ''com_oracle_apex_css_bar_chart(''||',
'                      apex_javascript.add_value(p_region.static_id)||',
'                      ''{''||',
'                      apex_javascript.add_attribute(''pageItemsToSubmit'', apex_plugin_util.page_item_names_to_jquery(l_page_items_to_submit))||',
'                      apex_javascript.add_attribute(''ajaxIdentifier'',    apex_plugin.get_ajax_identifier, false, false)||',
'                      ''});'' );',
'',
'    return null;',
'end render;',
'',
'function ajax (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin )',
'    return apex_plugin.t_region_ajax_result',
'is',
'begin',
'    sys.owa_util.mime_header(''text/html'', false);',
'    sys.htp.p(''Cache-Control: no-cache'');',
'    sys.htp.p(''Pragma: no-cache'');',
'    sys.owa_util.http_header_close;',
'',
'    render_bar_chart (',
'        p_region => p_region );',
'',
'    return null;',
'exception when others then',
'    sys.htp.p(''Error: ''||sqlerrm);',
'end ajax;'))
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL'
,p_sql_min_column_count=>2
,p_sql_max_column_count=>4
,p_sql_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'The region source has to be in the following format:',
'<pre>',
'select label,',
'       value,',
'       [link,]',
'       [color]',
'  from table',
' order by value',
'</pre>',
'<ul>',
'<li><strong>Label</strong> is the label ...</li>',
'<li><strong>Value</strong> is the value ... and has to be of type NUMBER</li>',
'<li><strong>Link</strong> is optional and can allow a user to navigate to another page within the application or a provided URL, and is activated by clicking on the chart bar of the record.</li>',
'<li><strong>Color</strong> is optional and is the background color of the chart bar for the record. The color is a hex value (for example #ff0000) or one of the standard web colors like red, green, ...</li>',
'</ul>',
''))
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.9'
,p_about_url=>'http://apex.oracle.com/plugins'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(54509759635178058841)
,p_plugin_id=>wwv_flow_api.id(63575691394248868053)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Display As'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'VALUE_ABSOLUTE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(54509760027990058841)
,p_plugin_attribute_id=>wwv_flow_api.id(54509759635178058841)
,p_display_sequence=>1
,p_display_value=>'Percentage with relative bar width'
,p_return_value=>'PERCENTAGE_RELATIVE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(54509760512101058842)
,p_plugin_attribute_id=>wwv_flow_api.id(54509759635178058841)
,p_display_sequence=>1
,p_display_value=>'Value with relative bar width'
,p_return_value=>'VALUE_RELATIVE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(54509761008347058842)
,p_plugin_attribute_id=>wwv_flow_api.id(54509759635178058841)
,p_display_sequence=>1
,p_display_value=>'Percentage with absolute bar width'
,p_return_value=>'PERCENTAGE_ABSOLUT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(54509761538809058843)
,p_plugin_attribute_id=>wwv_flow_api.id(54509759635178058841)
,p_display_sequence=>1
,p_display_value=>'Value with absolute bar width'
,p_return_value=>'VALUE_ABSOLUTE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(54509762039268058844)
,p_plugin_id=>wwv_flow_api.id(63575691394248868053)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Prefix for Value'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>10
,p_max_length=>40
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(54509759635178058841)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'VALUE_ABSOLUTE,VALUE_RELATIVE'
,p_help_text=>'Specify the prefix which should be added to the displayed value.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(54509762414368058844)
,p_plugin_id=>wwv_flow_api.id(63575691394248868053)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Postfix for Value'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>10
,p_max_length=>40
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(54509759635178058841)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'VALUE_ABSOLUTE,VALUE_RELATIVE'
,p_help_text=>'Specify the postfix which should be added to the displayed value.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(54509762815133058845)
,p_plugin_id=>wwv_flow_api.id(63575691394248868053)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Page Items to Submit'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Specify a comma separated list of page items that will be submitted to the server and thus, available for use from within your region source SQL statement.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(54509763238466058845)
,p_plugin_id=>wwv_flow_api.id(63575691394248868053)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Maximum Rows'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'5'
,p_display_length=>3
,p_max_length=>3
,p_is_translatable=>false
,p_help_text=>'Defines the maximum number of rows to query and to display.'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20636F6D5F6F7261636C655F617065785F6373735F6261725F63686172742870526567696F6E49642C20704F7074696F6E7329207B0A0A20202F2F2044656661756C74206F7572206F7074696F6E7320616E642073746F7265207468';
wwv_flow_api.g_varchar2_table(2) := '656D2077697468207468652022676C6F62616C22207072656669782C20626563617573652074686579206172650A20202F2F20757365642062792074686520646966666572656E742066756E6374696F6E7320617320636C6F737572650A202076617220';
wwv_flow_api.g_varchar2_table(3) := '674F7074696F6E73203D20617065782E6A51756572792E657874656E64287B0A20202020202020202020202020202020202020616A61784964656E7469666965723A6E756C6C2C0A20202020202020202020202020202020202020706167654974656D73';
wwv_flow_api.g_varchar2_table(4) := '546F5375626D69743A6E756C6C0A202020202020202020202020202020202020207D2C20704F7074696F6E73292C0A20202020202067526567696F6E20203D20617065782E6A5175657279282723272B70526567696F6E4964292C0A2020202020206743';
wwv_flow_api.g_varchar2_table(5) := '686172742020203D20617065782E6A5175657279282723272B70526567696F6E49642B275F636861727427293B0A0A20202F2F204578656375746564207768656E2074686520414A41582063616C6C2069732066696E69736865642E2070446174612077';
wwv_flow_api.g_varchar2_table(6) := '696C6C20636F6E7461696E7320746865206E65772048544D4C20636F646520666F72207468652063686172740A202066756E6374696F6E205F64726177526573756C7428704461746129207B0A202020206743686172740A2020202020202E72656D6F76';
wwv_flow_api.g_varchar2_table(7) := '65436C61737328276362635F6C6F6164696E6727290A2020202020202E68746D6C287044617461293B0A2020202067526567696F6E2E7472696767657228276170657861667465727265667265736827293B0A20207D3B202F2F205F6472617752657375';
wwv_flow_api.g_varchar2_table(8) := '6C740A0A20202F2F20457865637574657320616E20414A41582063616C6C20746F20676574206E65772076616C75657320666F722074686520435353206261722063686172740A202066756E6374696F6E20726566726573682829207B0A0A202020202F';
wwv_flow_api.g_varchar2_table(9) := '2F207472696767657220746865206265666F72652072656672657368206576656E740A2020202067526567696F6E2E747269676765722827617065786265666F72657265667265736827293B0A0A202020202F2F20696E697469616C697A652074686520';
wwv_flow_api.g_varchar2_table(10) := '414A41582063616C6C20706172616D65746572730A20202020766172206C44617461203D207B20705F726571756573743A20224E41544956453D222B674F7074696F6E732E616A61784964656E7469666965722C0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(11) := '202020705F666C6F775F69643A202476282770466C6F77496427292C0A202020202020202020202020202020202020705F666C6F775F737465705F69643A202476282770466C6F7753746570496427292C0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(12) := '705F696E7374616E63653A202476282770496E7374616E636527290A202020202020202020202020202020207D3B0A0A202020202F2F2061646420616C6C2070616765206974656D73207765206861766520746F207375626D697420746F207468652041';
wwv_flow_api.g_varchar2_table(13) := '4A41582063616C6C0A20202020617065782E6A517565727928674F7074696F6E732E706167654974656D73546F5375626D6974292E656163682866756E6374696F6E28297B0A202020202020766172206C4964783B0A202020202020696620286C446174';
wwv_flow_api.g_varchar2_table(14) := '612E705F6172675F6E616D65733D3D3D756E646566696E656429207B0A20202020202020206C446174612E705F6172675F6E616D657320203D205B5D3B0A20202020202020206C446174612E705F6172675F76616C756573203D205B5D3B0A2020202020';
wwv_flow_api.g_varchar2_table(15) := '2020206C496478203D20303B0A2020202020207D20656C7365207B0A20202020202020206C496478203D206C446174612E705F6172675F6E616D65732E6C656E6774683B0A2020202020207D0A2020202020206C446174612E705F6172675F6E616D6573';
wwv_flow_api.g_varchar2_table(16) := '205B6C4964785D203D20746869732E69643B0A2020202020206C446174612E705F6172675F76616C7565735B6C4964785D203D2024762874686973293B0A202020207D293B0A0A202020202F2F20616464206C6F64696E6720696E64696361746F720A20';
wwv_flow_api.g_varchar2_table(17) := '2020206743686172742E616464436C61737328276362635F6C6F6164696E6727293B0A0A202020202F2F20706572666F726D2074686520414A41582063616C6C0A20202020617065782E6A51756572792E616A6178287B0A2020202020202F2F20747279';
wwv_flow_api.g_varchar2_table(18) := '20746F206C6576657261676520616A6178517565756520706C7567696E20746F2061626F72742070726576696F75732072657175657374730A2020202020206D6F64653A202261626F7274222C0A2020202020202F2F206C696D69742061626F7274696F';
wwv_flow_api.g_varchar2_table(19) := '6E20746F207468697320696E7075740A202020202020706F72743A20226373735F6261725F63686172745F222B70526567696F6E49642C0A20202020202064617461547970653A202268746D6C222C0A202020202020747970653A2022706F7374222C0A';
wwv_flow_api.g_varchar2_table(20) := '20202020202075726C3A20227777765F666C6F772E73686F77222C0A202020202020747261646974696F6E616C3A20747275652C0A202020202020646174613A206C446174612C0A202020202020737563636573733A205F64726177526573756C740A20';
wwv_flow_api.g_varchar2_table(21) := '20202020207D293B0A20207D3B202F2F20726566726573680A0A20202F2F207265676973746572207468652072656672657368206576656E74207768696368206973207472696767657265642062792061206D616E75616C20726566726573680A202067';
wwv_flow_api.g_varchar2_table(22) := '526567696F6E2E62696E6428226170657872656672657368222C2072656672657368293B0A0A7D3B202F2F20636F6D5F6F7261636C655F617065785F6373735F6261725F63686172740A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(54509764728476058847)
,p_plugin_id=>wwv_flow_api.id(63575691394248868053)
,p_file_name=>'com_oracle_apex_css_bar_chart.js'
,p_mime_type=>'text/javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7461626C652E636263207B0D0A202077696474683A20313030253B0D0A7D0D0A7461626C652E636263207468207B0D0A2020746578742D616C69676E3A206C6566743B0D0A2020666F6E742D7765696768743A206E6F726D616C3B0D0A2020666F6E742D';
wwv_flow_api.g_varchar2_table(2) := '73697A653A20313270783B0D0A20206C696E652D6865696768743A20313870783B0D0A202070616464696E673A20337078203570782033707820303B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234545453B0D0A20207768';
wwv_flow_api.g_varchar2_table(3) := '6974652D73706163653A206E6F777261703B0D0A2020746578742D6F766572666C6F773A20656C6C69707369733B0D0A20206F766572666C6F773A2068696464656E3B0D0A7D0D0A2E6362635F6C61726765207461626C65207468207B0D0A2020666F6E';
wwv_flow_api.g_varchar2_table(4) := '742D7765696768743A206E6F726D616C3B0D0A2020666F6E742D73697A653A20313370783B0D0A20206C696E652D6865696768743A20323470783B0D0A202070616464696E673A20357078203570782035707820303B0D0A7D0D0A2E636263202E636263';
wwv_flow_api.g_varchar2_table(5) := '5F6C6162656C2061207B0D0A2020636F6C6F723A20233030303B0D0A7D0D0A7461626C652E6362632074723A6C6173742D6368696C642074682C7461626C652E6362632074723A6C6173742D6368696C64207464207B0D0A2020626F726465722D626F74';
wwv_flow_api.g_varchar2_table(6) := '746F6D3A206E6F6E653B0D0A7D0D0A7461626C652E636263207464207B0D0A202070616464696E673A20337078203020337078203570783B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234545453B0D0A202077696474683A';
wwv_flow_api.g_varchar2_table(7) := '203930253B0D0A7D0D0A2E6362635F6C61726765207461626C652E636263207464207B0D0A202070616464696E673A20357078203020357078203570783B0D0A7D0D0A2E636263202E6362635F6261725F6261636B67726F756E64207B0D0A2020646973';
wwv_flow_api.g_varchar2_table(8) := '706C61793A20626C6F636B3B0D0A202077696474683A20313030253B0D0A20202D7765626B69742D626F726465722D7261646975733A203670783B0D0A20202D6D6F7A2D626F726465722D7261646975733A203670783B0D0A2020626F726465722D7261';
wwv_flow_api.g_varchar2_table(9) := '646975733A203670783B0D0A20206261636B67726F756E643A202D7765626B69742D6772616469656E74286C696E6561722C30252030252C302520313030252C66726F6D287267626128302C302C302C2E3229292C746F287267626128302C302C302C2E';
wwv_flow_api.g_varchar2_table(10) := '312929293B0D0A20206261636B67726F756E643A202D6D6F7A2D6C696E6561722D6772616469656E7428746F702C207267626128302C302C302C302E32292C7267626128302C302C302C2E3129293B0D0A2020666F6E742D7765696768743A20626F6C64';
wwv_flow_api.g_varchar2_table(11) := '3B0D0A2020666F6E742D73697A653A20313270783B0D0A20206C696E652D6865696768743A20323070783B0D0A20202D7765626B69742D6261636B67726F756E642D636C69703A2070616464696E672D626F783B0D0A20202D6D6F7A2D6261636B67726F';
wwv_flow_api.g_varchar2_table(12) := '756E642D636C69703A2070616464696E672D626F783B0D0A20206261636B67726F756E642D636C69703A2070616464696E672D626F783B0D0A2020706F736974696F6E3A2072656C61746976653B0D0A20202D7765626B69742D626F782D736861646F77';
wwv_flow_api.g_varchar2_table(13) := '3A20696E736574203020302030707820317078207267626128302C302C302C2E3035293B0D0A20202D6D6F7A2D626F782D736861646F773A20696E736574203020302030707820317078207267626128302C302C302C2E3035293B0D0A2020626F782D73';
wwv_flow_api.g_varchar2_table(14) := '6861646F773A20696E736574203020302030707820317078207267626128302C302C302C2E3035293B0D0A7D0D0A2E6362635F6C61726765202E6362635F6261725F6261636B67726F756E64207B0D0A2020666F6E742D7765696768743A20626F6C643B';
wwv_flow_api.g_varchar2_table(15) := '0D0A2020666F6E742D73697A653A20313470783B0D0A20206C696E652D6865696768743A20323470783B0D0A2020706F736974696F6E3A2072656C61746976653B0D0A7D0D0A0D0A2E636263202E6362635F626172207B0D0A20206261636B67726F756E';
wwv_flow_api.g_varchar2_table(16) := '643A202D7765626B69742D6772616469656E74286C696E6561722C30252030252C302520313030252C66726F6D2872676261283235352C3235352C3235352C2E313529292C746F287267626128302C302C302C2E32352929293B0D0A20206261636B6772';
wwv_flow_api.g_varchar2_table(17) := '6F756E643A202D6D6F7A2D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E3135292C7267626128302C302C302C2E323529293B0D0A20206261636B67726F756E642D636F6C6F723A2023463246324632';
wwv_flow_api.g_varchar2_table(18) := '3B0D0A2020646973706C61793A20626C6F636B3B0D0A20206865696768743A20323070783B0D0A20202D7765626B69742D626F726465722D7261646975733A203570783B0D0A20202D6D6F7A2D626F726465722D7261646975733A203570783B0D0A2020';
wwv_flow_api.g_varchar2_table(19) := '626F726465722D7261646975733A203570783B0D0A20202D7765626B69742D626F782D736861646F773A20696E736574203020302030707820317078207267626128302C302C302C2E3235293B0D0A20202D6D6F7A2D626F782D736861646F773A20696E';
wwv_flow_api.g_varchar2_table(20) := '736574203020302030707820317078207267626128302C302C302C2E3235293B0D0A2020626F782D736861646F773A20696E736574203020302030707820317078207267626128302C302C302C2E3235293B0D0A7D0D0A0D0A2E6362635F6C6172676520';
wwv_flow_api.g_varchar2_table(21) := '2E6362635F626172207B0D0A20206865696768743A20323470783B0D0A7D0D0A0D0A2E636263202E6362635F76616C7565207B0D0A2020636F6C6F723A20233535353B0D0A2020636F6C6F723A207267626128302C302C302C2E3735293B0D0A20207769';
wwv_flow_api.g_varchar2_table(22) := '6474683A20313030253B0D0A2020646973706C61793A20626C6F636B3B0D0A2020746578742D616C69676E3A2063656E7465723B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A7D0D0A0D0A2E636263202E6362635F76616C7565206120';
wwv_flow_api.g_varchar2_table(23) := '7B0D0A2020636F6C6F723A20233535353B0D0A2020636F6C6F723A207267626128302C302C302C2E3735293B0D0A2020746578742D6465636F726174696F6E3A206E6F6E653B0D0A2020646973706C61793A20626C6F636B3B0D0A2020746578742D7368';
wwv_flow_api.g_varchar2_table(24) := '61646F773A20302031707820302072676261283235352C3235352C303235352C2E3235293B0D0A7D0D0A0D0A2E636263202E6362635F76616C756520613A686F766572207B0D0A20206261636B67726F756E642D636F6C6F723A207267626128302C302C';
wwv_flow_api.g_varchar2_table(25) := '302C2E3135293B0D0A20202D7765626B69742D626F726465722D7261646975733A203670783B0D0A20202D6D6F7A2D626F726465722D7261646975733A203670783B0D0A2020626F726465722D7261646975733A203670783B0D0A7D0D0A0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(54509765130700058847)
,p_plugin_id=>wwv_flow_api.id(63575691394248868053)
,p_file_name=>'css_bar_chart.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
