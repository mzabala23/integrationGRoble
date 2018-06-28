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
prompt --application/shared_components/plugins/region_type/com_oracle_apex_big_value_list
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(54977450154689679768)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.BIG_VALUE_LIST'
,p_display_name=>'Big Value List'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'is',
'    -- It''s better to have named variables instead of using the generic ones,',
'    -- makes the code more readable. We are using the same defaults for the',
'    -- required attributes as in the plug-in attribute configuration, because',
'    -- they can still be null. Keep them in sync!',
'    c_label_column      constant varchar2(255) := p_region.attribute_01;',
'    c_value_column      constant varchar2(255) := p_region.attribute_02;',
'    c_percent_column    constant varchar2(255) := p_region.attribute_03;',
'    c_link_target       constant varchar2(255) := p_region.attribute_04;',
'    c_number_of_columns constant number        := to_number(p_region.attribute_05);',
'    c_chart_size        constant varchar2(1)   := p_region.attribute_06;',
'',
'    l_label_column_no   pls_integer;',
'    l_value_column_no   pls_integer;',
'    l_percent_column_no pls_integer;',
'    l_column_value_list apex_plugin_util.t_column_value_list2;',
'    ',
'    l_label             varchar2(4000);',
'    l_value             varchar2(4000);',
'    l_percent           number;',
'    l_url               varchar2(4000);',
'    l_class             varchar2(255);',
'begin',
'    -- Read the data based on the region source query',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'                               p_sql_statement  => p_region.source,',
'                               p_min_columns    => 2,',
'                               p_max_columns    => null,',
'                               p_component_name => p_region.name );',
'',
'    -- Get the actual column# for faster access and also verify that the data type',
'    -- of the column matches with what we are looking for',
'    l_label_column_no   := apex_plugin_util.get_column_no (',
'                               p_attribute_label   => ''Label Column'',',
'                               p_column_alias      => c_label_column,',
'                               p_column_value_list => l_column_value_list,',
'                               p_is_required       => true,',
'                               p_data_type         => apex_plugin_util.c_data_type_varchar2 );',
'                                      ',
'    l_value_column_no   := apex_plugin_util.get_column_no (',
'                               p_attribute_label   => ''Value Column'',',
'                               p_column_alias      => c_value_column,',
'                               p_column_value_list => l_column_value_list,',
'                               p_is_required       => true,',
'                               p_data_type         => apex_plugin_util.c_data_type_varchar2 );',
'                                      ',
'    l_percent_column_no := apex_plugin_util.get_column_no (',
'                             p_attribute_label   => ''Percent Column'',',
'                             p_column_alias      => c_percent_column,',
'                             p_column_value_list => l_column_value_list,',
'                             p_is_required       => false,',
'                             p_data_type         => apex_plugin_util.c_data_type_number );',
'',
'    -- CSS for Big Value List',
'    apex_css.add_file (',
'        p_name      => ''com_oracle_apex_big_value_list'',',
'        p_directory => p_plugin.file_prefix );',
'',
'    -- Start the list',
'    sys.htp.p(',
'        ''<ul class="aChartList'' ||',
'        case when c_chart_size = ''S'' then '' smallChart'' end ||',
'        ''">'');',
'',
'    -- It''s time to emit the selected rows',
'    for l_row_num in 1 .. l_column_value_list(1).value_list.count loop',
'        begin',
'            -- Set the column values of our current row so that apex_plugin_util.replace_substitutions',
'            -- can do substitutions for columns contained in the region source query.',
'            apex_plugin_util.set_component_values (',
'                p_column_value_list => l_column_value_list,',
'                p_row_num           => l_row_num );',
'',
'            -- get the label',
'            l_label := apex_plugin_util.escape (',
'                           apex_plugin_util.get_value_as_varchar2 (',
'                               p_data_type => l_column_value_list(l_label_column_no).data_type,',
'                               p_value     => l_column_value_list(l_label_column_no).value_list(l_row_num) ),',
'                           p_region.escape_output );',
'',
'            -- get the value',
'            l_value := apex_plugin_util.escape (',
'                           apex_plugin_util.get_value_as_varchar2 (',
'                               p_data_type => l_column_value_list(l_value_column_no).data_type,',
'                               p_value     => l_column_value_list(l_value_column_no).value_list(l_row_num) ),',
'                           p_region.escape_output );',
'',
'            -- get percent',
'            if l_percent_column_no is not null then',
'                l_percent := l_column_value_list(l_percent_column_no).value_list(l_row_num).number_value;',
'            end if;',
'',
'            -- get the link target if it does exist',
'            if c_link_target is not null then',
'                l_url := wwv_flow_utilities.prepare_url (',
'                             apex_plugin_util.replace_substitutions (',
'                                 p_value  => c_link_target,',
'                                 p_escape => false ));',
'            end if;',
'',
'            -- Calculate the class names based on different settings',
'            if l_percent is null then',
'                l_class := ''aNumber'';',
'            else',
'                l_class := ''aBarChart'';',
'            end if;',
'            ',
'            if c_number_of_columns > 1 then',
'                l_class := l_class || '' aGrid col_'' || c_number_of_columns;',
'            end if;',
'            ',
'            if   c_number_of_columns = 1',
'              or mod(l_row_num, c_number_of_columns) = 1',
'            then',
'                l_class := l_class || '' col_start'';',
'            end if;',
'',
'            -- Time to emit the row data in a list entry tag',
'            sys.htp.p(''<li class="'' || l_class || ''">'');',
'            ',
'            if l_url is not null then',
'                sys.htp.p(''<a href="'' || apex_escape.html_attribute(l_url) || ''">'');',
'            end if;',
'            ',
'            sys.htp.p(''<span class="uValue">'');',
'            if l_percent is null then',
'                sys.htp.p(l_value);',
'            else',
'                sys.htp.p(''<span class="uBarContainer"><span class="uBarLabel">'' || l_value || ''</span><span class="uBarWidth" style="width: '' || trunc(l_percent) || ''%;"></span></span>'');',
'            end if;',
'            sys.htp.p(''</span>'');',
'                        ',
'            sys.htp.p(''<span class="uLabel">'' || l_label || ''</span>'');',
'',
'            sys.htp.p(',
'                case when l_url is not null then ''</a>'' end ||',
'                ''</li>'' );',
'',
'            apex_plugin_util.clear_component_values;',
'        exception when others then',
'            apex_plugin_util.clear_component_values;',
'            raise;',
'        end;',
'    end loop;',
'',
'    sys.htp.p(''</ul>'');',
'',
'    return null;',
'',
'end render;',
''))
,p_render_function=>'render'
,p_standard_attributes=>'SOURCE_SQL:SOURCE_REQUIRED:ESCAPE_OUTPUT'
,p_sql_min_column_count=>2
,p_sql_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre>',
'select ''Open''               as label,',
'       to_char(320,''9G990'') as value,',
'       13                   as percent',
'  from dual',
' union all',
'select ''Closed''             as label,',
'       to_char(87,''9G990'')  as value,',
'       70                   as percent',
'  from dual',
'</pre>'))
,p_substitute_attributes=>false
,p_reference_id=>1841129043527665703
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'http://apex.oracle.com/plugins'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(55110709253358799607)
,p_plugin_id=>wwv_flow_api.id(54977450154689679768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Label Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(55110709625137799608)
,p_plugin_id=>wwv_flow_api.id(54977450154689679768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(55110710137158799608)
,p_plugin_id=>wwv_flow_api.id(54977450154689679768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Percent Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(55110710552635799608)
,p_plugin_id=>wwv_flow_api.id(54977450154689679768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Link Target'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>93
,p_max_length=>255
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Specifies the URL to a target page that is used if a user clicks on an entry.',
'</p>',
'<p>',
'To reference column values of your SQL statement use substitution syntax.',
'</p>',
'<p>',
'Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked entry.',
'<pre>',
'f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.',
'</pre>',
'</p>',
'<p>',
'Example 2: Display the EMPNO value of the clicked entry in a JavaScript alert',
'<pre>',
'javascript:alert(''current empno: &amp;EMPNO.'');',
'</pre>',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(55110710955248799608)
,p_plugin_id=>wwv_flow_api.id(54977450154689679768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Number of Columns'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'1'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(55110711332076799608)
,p_plugin_attribute_id=>wwv_flow_api.id(55110710955248799608)
,p_display_sequence=>10
,p_display_value=>'1'
,p_return_value=>'1'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(55110711844337799609)
,p_plugin_attribute_id=>wwv_flow_api.id(55110710955248799608)
,p_display_sequence=>20
,p_display_value=>'2'
,p_return_value=>'2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(55110712355256799609)
,p_plugin_attribute_id=>wwv_flow_api.id(55110710955248799608)
,p_display_sequence=>30
,p_display_value=>'3'
,p_return_value=>'3'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(55110712856009799609)
,p_plugin_attribute_id=>wwv_flow_api.id(55110710955248799608)
,p_display_sequence=>40
,p_display_value=>'4'
,p_return_value=>'4'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(55110713342560799609)
,p_plugin_id=>wwv_flow_api.id(54977450154689679768)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Chart Size'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'B'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(55110713737632799613)
,p_plugin_attribute_id=>wwv_flow_api.id(55110713342560799609)
,p_display_sequence=>10
,p_display_value=>'Big'
,p_return_value=>'B'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(55110714253126799613)
,p_plugin_attribute_id=>wwv_flow_api.id(55110713342560799609)
,p_display_sequence=>20
,p_display_value=>'Small'
,p_return_value=>'S'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A204269672056616C7565204C69737420506C75672D696E2076312E30202D20687474703A2F2F617065782E6F7261636C652E636F6D2F706C7567696E730A202A0A202A204475616C206C6963656E73656420756E64657220746865204D4954';
wwv_flow_api.g_varchar2_table(2) := '20616E642047504C206C6963656E7365733A0A202A202020687474703A2F2F7777772E6F70656E736F757263652E6F72672F6C6963656E7365732F6D69742D6C6963656E73652E7068700A202A202020687474703A2F2F7777772E676E752E6F72672F6C';
wwv_flow_api.g_varchar2_table(3) := '6963656E7365732F67706C2E68746D6C0A202A2F0A0A202F2A20436C656172206143686172744C697374202A2F0A756C2E6143686172744C697374207B0A20206C6973742D7374796C653A206E6F6E65206F757473696465206E6F6E653B0A20206D6172';
wwv_flow_api.g_varchar2_table(4) := '67696E3A20302021696D706F7274616E743B0A202070616464696E673A20303B0A7D0A756C2E6143686172744C6973743A6265666F72652C200A756C2E6143686172744C6973743A6166746572207B0A2020636F6E74656E743A202220223B0A20206469';
wwv_flow_api.g_varchar2_table(5) := '73706C61793A20626C6F636B3B0A20206865696768743A20303B0A20206F766572666C6F773A2068696464656E3B0A7D0A756C2E6143686172744C6973743A6166746572207B0A2020636C6561723A20626F74683B0A7D0A0A2F2A20536D616C6C204368';
wwv_flow_api.g_varchar2_table(6) := '617274202A2F0A756C2E6143686172744C6973742E736D616C6C4368617274207B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234430443044303B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E';
wwv_flow_api.g_varchar2_table(7) := '614E756D626572202E7556616C7565207B0A2020666F6E742D73697A653A20313470783B0A20206C696E652D6865696768743A20323470783B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75';
wwv_flow_api.g_varchar2_table(8) := '426172436F6E7461696E6572207B0A20206865696768743A20333270783B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75426172436F6E7461696E6572202E754261725769647468207B0A20';
wwv_flow_api.g_varchar2_table(9) := '206865696768743A20333270783B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75426172436F6E7461696E6572202E754261724C6162656C207B0A2020666F6E742D73697A653A2031347078';
wwv_flow_api.g_varchar2_table(10) := '3B0A20206C696E652D6865696768743A20333270783B0A7D0A2F2A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75426172436F6E7461696E6572207B0A202070616464696E673A2038707820303B0A';
wwv_flow_api.g_varchar2_table(11) := '7D2A2F0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E75426172436F6E7461696E6572202E754261725769647468207B0A2020666F6E742D73697A653A20313270783B0A2020666F6E742D77656967';
wwv_flow_api.g_varchar2_table(12) := '68743A20626F6C643B0A7D0A756C2E6143686172744C6973742E736D616C6C4368617274206C692E614261724368617274202E754C6162656C207B0A2020666F6E742D73697A653A20313470783B0A2020666F6E742D7765696768743A20626F6C643B0A';
wwv_flow_api.g_varchar2_table(13) := '202070616464696E673A2038707820303B0A7D0A0A2F2A204368617274205374796C6573202A2F0A756C2E6143686172744C697374206C69207B0A2020646973706C61793A20626C6F636B3B0A20206D617267696E3A20313670783B0A7D0A756C2E6143';
wwv_flow_api.g_varchar2_table(14) := '686172744C697374206C69202E7556616C7565207B0A20206261636B67726F756E642D636F6C6F723A20234536454546413B0A20206261636B67726F756E642D696D6167653A206C696E6561722D6772616469656E7428234630463446412C2023453645';
wwv_flow_api.g_varchar2_table(15) := '454641293B0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234230424443433B0A2020626F726465722D7261646975733A2032707820327078203020303B0A2020636F6C6F723A20233430343034303B0A2020646973706C61793A';
wwv_flow_api.g_varchar2_table(16) := '20626C6F636B3B0A202070616464696E673A203136707820303B0A2020706F736974696F6E3A2072656C61746976653B0A2020746578742D616C69676E3A2063656E7465723B0A2020746578742D736861646F773A203020302031307078207267626128';
wwv_flow_api.g_varchar2_table(17) := '3235352C203235352C203235352C20302E3935293B0A7D0A756C2E6143686172744C697374206C69202E7556616C75653A61667465722C200A756C2E6143686172744C697374206C69202E7556616C75653A6265666F7265207B0A2020626F726465723A';
wwv_flow_api.g_varchar2_table(18) := '206D656469756D20736F6C6964207472616E73706172656E743B0A2020636F6E74656E743A202220223B0A20206865696768743A20303B0A2020706F696E7465722D6576656E74733A206E6F6E653B0A2020706F736974696F6E3A206162736F6C757465';
wwv_flow_api.g_varchar2_table(19) := '3B0A2020746F703A20313030253B0A202077696474683A20303B0A7D0A756C2E6143686172744C697374206C69202E7556616C75653A6166746572207B0A2020626F726465722D746F702D636F6C6F723A20234536454546413B0A2020626F726465722D';
wwv_flow_api.g_varchar2_table(20) := '77696474683A203870783B0A20206C6566743A203530253B0A20206D617267696E2D6C6566743A202D3870783B0A7D0A756C2E6143686172744C697374206C69202E7556616C75653A6265666F7265207B0A2020626F726465722D746F702D636F6C6F72';
wwv_flow_api.g_varchar2_table(21) := '3A20234230424443433B0A2020626F726465722D77696474683A203970783B0A20206C6566743A203530253B0A20206D617267696E2D6C6566743A202D3970783B0A7D0A756C2E6143686172744C697374206C692061207B0A20202D6D6F7A2D626F7264';
wwv_flow_api.g_varchar2_table(22) := '65722D626F74746F6D2D636F6C6F72733A206E6F6E653B0A20202D6D6F7A2D626F726465722D6C6566742D636F6C6F72733A206E6F6E653B0A20202D6D6F7A2D626F726465722D72696768742D636F6C6F72733A206E6F6E653B0A20202D6D6F7A2D626F';
wwv_flow_api.g_varchar2_table(23) := '726465722D746F702D636F6C6F72733A206E6F6E653B0A20206261636B67726F756E642D636F6C6F723A20234630463446413B0A2020626F726465722D636F6C6F723A2023423042444343202342304244434320233838393641393B0A2020626F726465';
wwv_flow_api.g_varchar2_table(24) := '722D696D6167653A206E6F6E653B0A2020626F726465722D7261646975733A203370782033707820337078203370783B0A2020626F726465722D7374796C653A20736F6C69643B0A2020626F726465722D77696474683A203170783B0A2020646973706C';
wwv_flow_api.g_varchar2_table(25) := '61793A20626C6F636B3B0A202070616464696E673A20303B0A2020746578742D6465636F726174696F6E3A206E6F6E653B0A20207472616E736974696F6E3A20626F782D736861646F7720302E317320656173652030733B0A7D0A756C2E614368617274';
wwv_flow_api.g_varchar2_table(26) := '4C697374206C6920613A686F766572207B0A2020626F782D736861646F773A20302030203570782032707820726762612835362C203132372C203231342C20302E32293B0A7D0A756C2E6143686172744C697374206C6920613A686F766572207370616E';
wwv_flow_api.g_varchar2_table(27) := '207B0A2020636F6C6F723A20233335363641363B0A7D0A756C2E6143686172744C697374206C69202E754C6162656C207B0A2020626F726465722D746F703A2031707820736F6C69642072676261283235352C203235352C203235352C20302E3635293B';
wwv_flow_api.g_varchar2_table(28) := '0A2020636F6C6F723A20233430343034303B0A2020646973706C61793A20626C6F636B3B0A2020666F6E742D73697A653A20313470783B0A2020666F6E742D7765696768743A20626F6C643B0A20206C696E652D6865696768743A20323070783B0A2020';
wwv_flow_api.g_varchar2_table(29) := '70616464696E673A2038707820303B0A2020746578742D616C69676E3A2063656E7465723B0A7D0A756C2E6143686172744C697374206C692E614E756D626572202E7556616C7565207B0A2020666F6E742D73697A653A20333270783B0A20206C696E65';
wwv_flow_api.g_varchar2_table(30) := '2D6865696768743A20333270783B0A7D0A756C2E6143686172744C697374206C692E614261724368617274202E7556616C7565207B0A202070616464696E673A203870783B0A7D0A756C2E6143686172744C697374206C692E614261724368617274202E';
wwv_flow_api.g_varchar2_table(31) := '75426172436F6E7461696E6572207B0A20206261636B67726F756E642D636F6C6F723A20234646464646463B0A2020626F726465722D7261646975733A203370782033707820337078203370783B0A2020626F782D736861646F773A2030203020302031';
wwv_flow_api.g_varchar2_table(32) := '7078207267626128302C20302C20302C20302E32352920696E7365742C20302031707820317078207267626128302C20302C20302C20302E31352920696E7365743B0A2020646973706C61793A20626C6F636B3B0A20206865696768743A20343870783B';
wwv_flow_api.g_varchar2_table(33) := '0A20206D617267696E3A2030203870783B0A2020706F736974696F6E3A2072656C61746976653B0A7D0A756C2E6143686172744C697374206C692E614261724368617274202E754261724C6162656C207B0A2020636F6C6F723A20233430343034303B0A';
wwv_flow_api.g_varchar2_table(34) := '2020646973706C61793A20626C6F636B3B0A2020666F6E742D73697A653A20323470783B0A2020666F6E742D7374796C653A206E6F726D616C3B0A2020666F6E742D7765696768743A206E6F726D616C3B0A20206C696E652D6865696768743A20343870';
wwv_flow_api.g_varchar2_table(35) := '783B0A2020706F736974696F6E3A206162736F6C7574653B0A2020746578742D616C69676E3A2063656E7465723B0A2020746578742D736861646F773A2030203020313070782072676261283235352C203235352C203235352C20302E3935293B0A2020';
wwv_flow_api.g_varchar2_table(36) := '77696474683A20313030253B0A7D0A756C2E6143686172744C697374206C692E614261724368617274202E754261725769647468207B0A20206261636B67726F756E642D636F6C6F723A20233943424446313B0A20206261636B67726F756E642D696D61';
wwv_flow_api.g_varchar2_table(37) := '67653A206C696E6561722D6772616469656E7428234331443846372C2023394342444631293B0A2020626F726465722D7261646975733A203370782033707820337078203370783B0A2020626F782D736861646F773A2030203020302031707820233838';
wwv_flow_api.g_varchar2_table(38) := '3936413920696E7365742C20302032707820302072676261283235352C203235352C203235352C20302E36352920696E7365743B0A2020646973706C61793A20626C6F636B3B0A20206865696768743A20343870783B0A7D0A0A0A0A2F2A204772696420';
wwv_flow_api.g_varchar2_table(39) := '2A2F0A2E6143686172744C697374206C692E6147726964207B0A2020666C6F61743A206C6566743B0A2020636C6561723A206E6F6E653B0A20206D617267696E3A20303B0A7D0A2E61477269642E636F6C5F31207B0A202077696474683A20313030253B';
wwv_flow_api.g_varchar2_table(40) := '0A7D0A2E61477269642E636F6C5F32207B0A202077696474683A203530253B0A7D0A2E61477269642E636F6C5F33207B0A202077696474683A2033332E3333253B0A7D0A2E61477269642E636F6C5F325F33207B0A202077696474683A2036362E363625';
wwv_flow_api.g_varchar2_table(41) := '3B0A7D0A2E61477269642E636F6C5F34207B0A202077696474683A203235253B0A7D0A2F2A20536D616C6C65722077696474687320666F72204945202A2F0A2E696537207B0A20202E61477269642E636F6C5F31207B0A2020202077696474683A203939';
wwv_flow_api.g_varchar2_table(42) := '2E35253B0A20207D0A20202E61477269642E636F6C5F32207B0A2020202077696474683A2034392E35253B0A20207D0A20202E61477269642E636F6C5F33207B0A2020202077696474683A2033322E3733253B0A20207D0A20202E61477269642E636F6C';
wwv_flow_api.g_varchar2_table(43) := '5F325F33207B0A2020202077696474683A2036352E3636253B0A20207D0A20202E61477269642E636F6C5F34207B0A2020202077696474683A2032342E35253B0A20207D0A7D0A2E61477269642E636F6C5F7374617274207B0A2020636C6561723A2062';
wwv_flow_api.g_varchar2_table(44) := '6F74683B0A7D0A0A2E61477269642E636F6C5F66756C6C207B0A202077696474683A20313030253B0A7D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(55110714940046799620)
,p_plugin_id=>wwv_flow_api.id(54977450154689679768)
,p_file_name=>'com_oracle_apex_big_value_list.css'
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
