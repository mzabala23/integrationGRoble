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
prompt --application/set_environment
 
prompt APPLICATION 100 - CAI
--
-- Application Export:
--   Application:     100
--   Name:            CAI
--   Date and Time:   18:42 Wednesday June 27, 2018
--   Exported By:     EBS_UNIFIER
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.4.00.12
--   Instance ID:     108870666451017
--

-- Application Statistics:
--   Pages:                     18
--     Items:                   29
--     Validations:              2
--     Processes:               24
--     Regions:                 46
--     Buttons:                 21
--     Dynamic Actions:         13
--   Shared Components:
--     Logic:
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:             13
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              13
--         Label:                5
--         List:                11
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:               9
--       Plug-ins:               4
--     Globalization:
--     Reports:
--   Supporting Objects:  Included (auto-install)

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,100)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'EBS_UNIFIER')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'CAI')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F_100')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'800DDAF69D0AF6C5D810CEE5A64841EA91572265E37C276FF95829E93A56A5F8'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(5594122812562305)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:Centro de Administración Integraciones - Grupo Roble'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20170420100444'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5551591327562272)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5595336278562312)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Integraciones'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-clipboard'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5597597813584711)
,p_list_item_display_sequence=>11
,p_list_item_link_text=>'Administración'
,p_list_item_icon=>'fa-align-justify'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5596953617579444)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Proyectos'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-archive'
,p_parent_list_item_id=>wwv_flow_api.id(5597597813584711)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2,3'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5653379774423224)
,p_list_item_display_sequence=>21
,p_list_item_link_text=>'Interfaces'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-check'
,p_parent_list_item_id=>wwv_flow_api.id(5597597813584711)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6,7'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5597229369581470)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'BP''s'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-book'
,p_parent_list_item_id=>wwv_flow_api.id(5597597813584711)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4,5'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5598491555591997)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Autenticación'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-angle-double-right'
,p_parent_list_item_id=>wwv_flow_api.id(5597597813584711)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5598799292595907)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Código Errores'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-close'
,p_parent_list_item_id=>wwv_flow_api.id(5597597813584711)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5599232121602208)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Auditoria'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bookmark-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5839748109114550)
,p_list_item_display_sequence=>61
,p_list_item_link_text=>'OC y TC'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-arrows-h'
,p_parent_list_item_id=>wwv_flow_api.id(5599232121602208)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5850745506497450)
,p_list_item_display_sequence=>62
,p_list_item_link_text=>'Log Eventos'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-exclamation-triangle'
,p_parent_list_item_id=>wwv_flow_api.id(5599232121602208)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5861553826617496)
,p_list_item_display_sequence=>63
,p_list_item_link_text=>'Datos EBS'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-align-justify'
,p_parent_list_item_id=>wwv_flow_api.id(5599232121602208)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5599548319606807)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Datos Disponibles'
,p_list_item_icon=>'fa-cube'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5688320626732312)
,p_list_item_display_sequence=>71
,p_list_item_link_text=>'Presupuestos'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-dollar'
,p_parent_list_item_id=>wwv_flow_api.id(5599548319606807)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5716387975977699)
,p_list_item_display_sequence=>72
,p_list_item_link_text=>'Estructuras de Costo'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-sitemap'
,p_parent_list_item_id=>wwv_flow_api.id(5599548319606807)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5593843763562302)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5594089480562304)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Cerrar Sesión'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(5551289614562272)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(5551355537562272)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(5551491855562272)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(5815241980473074)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'PLUGIN_BE.CTB.ALERTIFY'
,p_attribute_01=>'BOOTSTRAP'
,p_attribute_02=>'Aceptar'
,p_attribute_03=>'Cancelar'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
null;
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
null;
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
null;
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(5595254435562311)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5595637714562312)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5613200301668064)
,p_short_name=>'Proyectos'
,p_link=>'f?p=&APP_ID.:2:&SESSION.'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5614444589668066)
,p_parent_id=>wwv_flow_api.id(5613200301668064)
,p_short_name=>'Asignación Proyecto EBS'
,p_link=>'f?p=&APP_ID.:3:&SESSION.'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5629351855731219)
,p_short_name=>'BPS'
,p_link=>'f?p=&APP_ID.:4:&SESSION.'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5630508530731220)
,p_parent_id=>wwv_flow_api.id(5629351855731219)
,p_short_name=>'Asignación BPs'
,p_link=>'f?p=&APP_ID.:5:&SESSION.'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5657987859423237)
,p_short_name=>'Interfaces'
,p_link=>'f?p=&APP_ID.:6:&SESSION.'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5659197618423238)
,p_parent_id=>wwv_flow_api.id(5657987859423237)
,p_short_name=>'Asignacion Interfaces'
,p_link=>'f?p=&APP_ID.:7:&SESSION.'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5670939247470555)
,p_short_name=>'Credenciales'
,p_link=>'f?p=&APP_ID.:8:&SESSION.'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5682881120509440)
,p_short_name=>'Codigo Errores'
,p_link=>'f?p=&APP_ID.:9:&SESSION.'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5684046104509440)
,p_parent_id=>wwv_flow_api.id(5682881120509440)
,p_short_name=>'Crear Código Estatus'
,p_link=>'f?p=&APP_ID.:10:&SESSION.'
,p_page_id=>10
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5689293408732313)
,p_short_name=>'Presupuestos Disponibles'
,p_link=>'f?p=&APP_ID.:12:&SESSION.'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5717777228092770)
,p_short_name=>'Estructura de Costos'
,p_link=>'f?p=&APP_ID.:13:&SESSION.'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5724102734294134)
,p_short_name=>'Auditoria'
,p_link=>'f?p=&APP_ID.:11:&SESSION.'
,p_page_id=>11
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5551684176562280)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5551759679562282)
,p_page_template_id=>wwv_flow_api.id(5551684176562280)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5551858246562282)
,p_page_template_id=>wwv_flow_api.id(5551684176562280)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5551956841562282)
,p_page_template_id=>wwv_flow_api.id(5551684176562280)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552017114562282)
,p_page_template_id=>wwv_flow_api.id(5551684176562280)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552123163562282)
,p_page_template_id=>wwv_flow_api.id(5551684176562280)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552263353562282)
,p_page_template_id=>wwv_flow_api.id(5551684176562280)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552311943562282)
,p_page_template_id=>wwv_flow_api.id(5551684176562280)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552429808562282)
,p_page_template_id=>wwv_flow_api.id(5551684176562280)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5552542474562282)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-side" id="t_Body_side">',
'      #REGION_POSITION_02#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552678968562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552729884562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552862369562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5552920254562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5553028799562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5553170923562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5553212763562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5553366979562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5553490005562282)
,p_page_template_id=>wwv_flow_api.id(5552542474562282)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5553528728562282)
,p_theme_id=>42
,p_name=>'Login'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="html-login no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="html-login no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="html-login no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="html-login no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container">',
'      #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5553611486562283)
,p_page_template_id=>wwv_flow_api.id(5553528728562282)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5553777701562283)
,p_page_template_id=>wwv_flow_api.id(5553528728562282)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5553856067562283)
,p_theme_id=>42
,p_name=>'Master Detail'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-info" id="t_Body_info">',
'        #REGION_POSITION_02#',
'      </div>',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5553940318562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554043536562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554126380562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554207744562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554314258562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554468363562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554542722562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554633165562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554757382562283)
,p_page_template_id=>wwv_flow_api.id(5553856067562283)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5554816707562283)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-wrapper">',
'    <div class="t-Dialog-header">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Dialog-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'500'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--standard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5554913738562283)
,p_page_template_id=>wwv_flow_api.id(5554816707562283)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555070623562283)
,p_page_template_id=>wwv_flow_api.id(5554816707562283)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555150198562283)
,p_page_template_id=>wwv_flow_api.id(5554816707562283)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5555276782562283)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      <div class="t-Body-contentInner">',
'        #BODY#',
'      </div>',
'      <footer class="t-Footer">',
'        #APP_VERSION#',
'        #CUSTOMIZE#',
'        #SCREEN_READER_TOGGLE#',
'        #REGION_POSITION_05#',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Button t-Button--icon t-Button--header t-Button--headerRight" id="t_Button_rightControlButton" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent">',
'    #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555310301562283)
,p_page_template_id=>wwv_flow_api.id(5555276782562283)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555443644562283)
,p_page_template_id=>wwv_flow_api.id(5555276782562283)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555530804562283)
,p_page_template_id=>wwv_flow_api.id(5555276782562283)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555631374562283)
,p_page_template_id=>wwv_flow_api.id(5555276782562283)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555778752562283)
,p_page_template_id=>wwv_flow_api.id(5555276782562283)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555828230562283)
,p_page_template_id=>wwv_flow_api.id(5555276782562283)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5555944958562283)
,p_page_template_id=>wwv_flow_api.id(5555276782562283)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5556048948562283)
,p_page_template_id=>wwv_flow_api.id(5555276782562283)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5556100210562283)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Wizard t-Wizard--modal">',
'    <div class=" t-Wizard-steps">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="t-Wizard-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="t-Wizard-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_css_classes=>'t-Dialog--wizard'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5556264094562283)
,p_page_template_id=>wwv_flow_api.id(5556100210562283)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5556386665562283)
,p_page_template_id=>wwv_flow_api.id(5556100210562283)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5556489905562283)
,p_page_template_id=>wwv_flow_api.id(5556100210562283)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5556590991562283)
,p_theme_id=>42
,p_name=>'Standard'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
end;
/
begin
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5556688625562283)
,p_page_template_id=>wwv_flow_api.id(5556590991562283)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5556757123562283)
,p_page_template_id=>wwv_flow_api.id(5556590991562283)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5556890310562283)
,p_page_template_id=>wwv_flow_api.id(5556590991562283)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5556998090562283)
,p_page_template_id=>wwv_flow_api.id(5556590991562283)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557052172562283)
,p_page_template_id=>wwv_flow_api.id(5556590991562283)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557164217562283)
,p_page_template_id=>wwv_flow_api.id(5556590991562283)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557280418562283)
,p_page_template_id=>wwv_flow_api.id(5556590991562283)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>false
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(5557375341562283)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'',
'<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if IE 9]><html class="no-js lt-ie10" lang="&BROWSER_LANGUAGE."> <![endif]-->',
'<!--[if gt IE 9]><!--> <html class="no-js" lang="&BROWSER_LANGUAGE."> <!--<![endif]-->',
'<head>',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #ONLOAD# id="t_PageBody">',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" id="t_Button_navControl" type="button"><span class="t-Icon fa-bars" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'      <div class="t-Body-title" id="t_Body_title">',
'        #REGION_POSITION_01#',
'      </div>',
'      <div class="t-Body-content" id="t_Body_content">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-contentInner">',
'          #BODY#',
'        </div>',
'        <footer class="t-Footer">',
'          #APP_VERSION#',
'          #CUSTOMIZE#',
'          #SCREEN_READER_TOGGLE#',
'          #REGION_POSITION_05#',
'        </footer>',
'      </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">',
'  #REGION_POSITION_04#',
'</div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">',
'          #MESSAGE#',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'        <span class="t-Icon a-Icon icon-user"></span>',
'        <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'      <span class="t-Icon #IMAGE#"></span>',
'      <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>3
,p_grid_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>',
'#CONTENT#',
'</div>'))
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557475153562283)
,p_page_template_id=>wwv_flow_api.id(5557375341562283)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557579011562283)
,p_page_template_id=>wwv_flow_api.id(5557375341562283)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557626924562283)
,p_page_template_id=>wwv_flow_api.id(5557375341562283)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557733062562283)
,p_page_template_id=>wwv_flow_api.id(5557375341562283)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557844007562283)
,p_page_template_id=>wwv_flow_api.id(5557375341562283)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5557931892562283)
,p_page_template_id=>wwv_flow_api.id(5557375341562283)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(5558061819562283)
,p_page_template_id=>wwv_flow_api.id(5557375341562283)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(5588669968562294)
,p_template_name=>'Icon'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(5588746689562294)
,p_template_name=>'Text'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(5588882223562294)
,p_template_name=>'Text with Icon'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5558103912562284)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #BODY#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5558210431562284)
,p_plug_template_id=>wwv_flow_api.id(5558103912562284)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5559647771562285)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5559702048562285)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5559809934562285)
,p_plug_template_id=>wwv_flow_api.id(5559702048562285)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5559941888562285)
,p_plug_template_id=>wwv_flow_api.id(5559702048562285)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5563269130562286)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-body js-regionDialog-body">',
'#BODY#',
'  </div>',
'  <div class="t-DialogRegion-buttons js-regionDialog-buttons">',
'     <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'       <div class="t-ButtonRegion-wrap">',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'         <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'       </div>',
'     </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5563306661562286)
,p_plug_template_id=>wwv_flow_api.id(5563269130562286)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5564147699562286)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5564257693562286)
,p_plug_template_id=>wwv_flow_api.id(5564147699562286)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5564373092562286)
,p_plug_template_id=>wwv_flow_api.id(5564147699562286)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5564930218562286)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls">',
'    <button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5565011636562286)
,p_plug_template_id=>wwv_flow_api.id(5564930218562286)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5565106281562286)
,p_plug_template_id=>wwv_flow_api.id(5564930218562286)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5567035606562287)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h2 class="t-HeroRegion-title">#TITLE#</h2>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5567111270562287)
,p_plug_template_id=>wwv_flow_api.id(5567035606562287)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5567285753562287)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#" role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5567561930562287)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5567627363562287)
,p_plug_template_id=>wwv_flow_api.id(5567561930562287)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5567722550562287)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# role="group" aria-labelledby="#REGION_STATIC_ID#_heading">',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5567869483562287)
,p_plug_template_id=>wwv_flow_api.id(5567722550562287)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5567956323562287)
,p_plug_template_id=>wwv_flow_api.id(5567722550562287)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5569851595562287)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5569961155562287)
,p_plug_template_id=>wwv_flow_api.id(5569851595562287)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5570012771562287)
,p_plug_template_id=>wwv_flow_api.id(5569851595562287)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5571092665562288)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(5571568255562288)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(5571638436562288)
,p_plug_template_id=>wwv_flow_api.id(5571568255562288)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5579945129562291)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value"><a href="#LINK#" #A03#>#A01#</a></span>',
'</li>',
''))
,p_list_template_name=>'Badge List'
,p_theme_id=>42
,p_theme_class_id=>3
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_list_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5581655973562291)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2885322685880632508
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5583792140562292)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5584279634562292)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" role="button">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5584340607562292)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_theme_id=>42
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5585218225562292)
,p_list_template_current=>'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>'
,p_list_template_noncurrent=>'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap"><span class="t-WizardSteps-marker"><span class="t-Icon a-Icon icon-check"></span></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"'
||'></span></span></div></li>'
,p_list_template_name=>'Wizard Progress'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5585778433562292)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item#A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#<'
||'/span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5586556065562293)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({ slide: e.hasClass("js-slide")});',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5586648007562293)
,p_list_template_current=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_reference_id=>2066548068783481421
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5587597554562293)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'$(''body'').addClass(''t-PageBody--leftNav'');',
''))
,p_theme_id=>42
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(5587607182562293)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_javascript_code_onload=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5572175611562288)
,p_row_template_name=>'Alerts'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5572251185562288)
,p_row_template_name=>'Badge List'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList t-BadgeList--circular #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BadgeList--responsive'
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5573976015562289)
,p_row_template_name=>'Cards'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon"><span class="t-Icon #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--3cols:t-Cards--featured'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5576015911562289)
,p_row_template_name=>'Comments'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon a-MediaBlock-graphic">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body a-MediaBlock-content">',
'        <div class="t-Comments-info">',
'            #USER_NAME# &middot; <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5576402364562289)
,p_row_template_name=>'Search Results'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5576510027562290)
,p_row_template_name=>'Standard'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(5576510027562290)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5577840059562290)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5578864364562290)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(5579762615562290)
,p_row_template_name=>'Timeline'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline">',
''))
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(5588120720562293)
,p_template_name=>'Hidden'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(5588235400562293)
,p_template_name=>'Optional'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(5588316700562294)
,p_template_name=>'Optional - Above'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(5588477030562294)
,p_template_name=>'Required'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(5588520986562294)
,p_template_name=>'Required - Above'
,p_template_body1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label><span class="t-Form-required"><span class="a-Icon icon-asterisk"></span></span> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="t-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Button t-Button--noUI t-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden'
||'="true"></span></button>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(5589201002562294)
,p_name=>'Breadcrumb'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><span class="t-Breadcrumb-label">#NAME#</span></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(5589444265562295)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="t-Form-field t-Form-searchField"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(5589325044562294)
,p_cal_template_name=>'Calendar'
,p_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal">',
'<h1 class="uMonth">#IMONTH# <span>#YYYY#</span></h1>'))
,p_cust_day_of_week_format=>'<th scope="col" class="uCalDayCol" id="#DY#">#IDAY#</th>'
,p_cust_month_open_format=>'<table class="uCal" cellpadding="0" cellspacing="0" border="0" summary="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>',
''))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="uDay today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="uDay nonday" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="uDayTitle weekendday">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="uDay" headers="#DY#">'
,p_cust_weekend_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uDayData">#DATA#</span>',
'</td>'))
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="uCalHour" id="#TIME#">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="uCal uCalWeekly">',
'<h1 class="uMonth">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<th scope="col" class="uCalDayCol" id="#DY#">',
'  <span class="visible-desktop">#DD# #IDAY#</span>',
'  <span class="hidden-desktop">#DD# <em>#IDY#</em></span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="uCal">'
,p_cust_wk_month_close_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</table>',
'<div class="uCalFooter"></div>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_title_format=>'<span class="uDayTitle">#DD#</span>'
,p_cust_wk_day_open_format=>'<td class="uDay" headers="#DY#"><div class="uDayData">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="uDay today" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_open_format=>'<td class="uDay weekend" headers="#DY#"><div class="uDayData">'
,p_cust_wk_weekend_close_format=>'</div></td>'
,p_agenda_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(5589843378562297)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(5556590991562283)
,p_default_dialog_template=>wwv_flow_api.id(5554816707562283)
,p_error_template=>wwv_flow_api.id(5553528728562282)
,p_printer_friendly_template=>wwv_flow_api.id(5556590991562283)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(5553528728562282)
,p_default_button_template=>wwv_flow_api.id(5588746689562294)
,p_default_region_template=>wwv_flow_api.id(5567722550562287)
,p_default_chart_template=>wwv_flow_api.id(5567722550562287)
,p_default_form_template=>wwv_flow_api.id(5567722550562287)
,p_default_reportr_template=>wwv_flow_api.id(5567722550562287)
,p_default_tabform_template=>wwv_flow_api.id(5567722550562287)
,p_default_wizard_template=>wwv_flow_api.id(5567722550562287)
,p_default_menur_template=>wwv_flow_api.id(5571092665562288)
,p_default_listr_template=>wwv_flow_api.id(5567722550562287)
,p_default_irr_template=>wwv_flow_api.id(5567285753562287)
,p_default_report_template=>wwv_flow_api.id(5576510027562290)
,p_default_label_template=>wwv_flow_api.id(5588235400562293)
,p_default_menu_template=>wwv_flow_api.id(5589201002562294)
,p_default_calendar_template=>wwv_flow_api.id(5589325044562294)
,p_default_list_template=>wwv_flow_api.id(5585778433562292)
,p_default_nav_list_template=>wwv_flow_api.id(5587607182562293)
,p_default_top_nav_list_temp=>wwv_flow_api.id(5587607182562293)
,p_default_side_nav_list_temp=>wwv_flow_api.id(5587597554562293)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(5564147699562286)
,p_default_dialogr_template=>wwv_flow_api.id(5559647771562285)
,p_default_option_label=>wwv_flow_api.id(5588235400562293)
,p_default_required_label=>wwv_flow_api.id(5588477030562294)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(5584279634562292)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.0/')
,p_files_version=>62
,p_icon_library=>'FONTAWESOME'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.regionDisplaySelector#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#tooltipManager#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/hammer/2.0.3/hammer#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/modernizr-custom#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.0/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(5589560644562295)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>true
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(5589609417562295)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(5589773121562295)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"customCSS":"","vars":{"@g_Accent-BG":"#505f6d","@g_Accent-OG":"#ececec","@g_Body-Title-BG":"#dee1e4","@l_Link-Base":"#337ac0","@g_Body-BG":"#f5f5f5"}}'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5558455701562284)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5558638968562284)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5558962575562285)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5560051141562285)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5560577941562285)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5561239481562285)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5561811660562285)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5562157761562286)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5562365279562286)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5562595654562286)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5563446036562286)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5564580219562286)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5565643811562286)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5570230560562287)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5570444418562287)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5570644958562288)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5571288281562288)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5571743591562288)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5572309432562288)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5573172158562289)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5574303490562289)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the style and design of the cards in the report.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5574506907562289)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5574934017562289)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the amount of text to display for the Card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5575387210562289)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5576161154562289)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5576645350562290)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5576888389562290)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5577222676562290)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5577948022562290)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5580000760562291)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5580207051562291)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5582048258562291)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5582229638562291)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5582644957562292)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5583035306562292)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5584710677562292)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5585334590562292)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5586256125562293)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5588936610562294)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5589939882562301)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5590102206562301)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5590336000562301)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5590500978562301)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5590713922562301)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5591121165562301)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5591816399562301)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5592297853562301)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5592403161562301)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5592622551562301)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5592863746562301)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5593156389562302)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(5593489963562302)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5558335613562284)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5558563398562284)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(5558455701562284)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5558745735562285)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(5558638968562284)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5558864157562285)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(5558455701562284)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5559032048562285)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(5558962575562285)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5559147789562285)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(5558638968562284)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5559291105562285)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(5558455701562284)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5559308025562285)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(5558638968562284)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5559417549562285)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(5558638968562284)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5559593682562285)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5558103912562284)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(5558962575562285)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5560147307562285)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5560244090562285)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5560382930562285)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5560417364562285)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5560697865562285)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(5560577941562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5560769202562285)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(5560577941562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5560833707562285)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(5560577941562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5560930730562285)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(5560577941562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5561030520562285)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5561115142562285)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5561308348562285)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5561405589562285)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5561560192562285)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5561628990562285)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5561798028562285)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5561941225562285)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(5561811660562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5562017401562286)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(5561811660562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5562262847562286)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(5562157761562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5562459534562286)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(5562365279562286)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5562621001562286)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5562737514562286)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5562879808562286)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(5562365279562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5562941121562286)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(5562157761562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5563046271562286)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5563187959562286)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5559702048562285)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5563506532562286)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5563269130562286)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(5563446036562286)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5563667510562286)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5563269130562286)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(5563446036562286)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5563765351562286)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5563269130562286)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(5563446036562286)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5563821572562286)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5563269130562286)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5563924466562286)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5563269130562286)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5564068931562286)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5563269130562286)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5564486320562286)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(5564147699562286)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5564628019562286)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(5564147699562286)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(5564580219562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5564711862562286)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(5564147699562286)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5564899470562286)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(5564147699562286)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(5564580219562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5565261910562286)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5565396219562286)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5565443938562286)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5565581282562286)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5565738097562286)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(5565643811562286)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5565897005562286)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(5565643811562286)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5565907831562286)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566002436562286)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566141991562286)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566265423562286)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566363939562286)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566413714562286)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(5562157761562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566514009562287)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566622266562287)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566785781562287)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566858642562287)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(5562157761562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5566903342562287)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5564930218562286)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5567303258562287)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5567285753562287)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5567496141562287)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5567285753562287)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568043588562287)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568194896562287)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568279978562287)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568386918562287)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(5560051141562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568429650562287)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568587424562287)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568625132562287)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568743765562287)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568831048562287)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5568974619562287)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(5561239481562285)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5569071041562287)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(5562157761562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5569128922562287)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(5562365279562286)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5569298758562287)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5569360106562287)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5569484110562287)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5569510768562287)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(5562365279562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5569645445562287)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(5562157761562286)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5569767078562287)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5567722550562287)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(5562595654562286)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5570102567562287)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5569851595562287)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5570324636562287)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5569851595562287)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(5570230560562287)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5570501511562287)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5569851595562287)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(5570444418562287)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5570710580562288)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5569851595562287)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(5570644958562288)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5570826338562288)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5569851595562287)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(5570644958562288)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5570911921562288)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5569851595562287)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(5570444418562287)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5571170435562288)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(5571092665562288)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5571369282562288)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(5571092665562288)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(5571288281562288)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5571443880562288)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(5571092665562288)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(5571288281562288)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5571882066562288)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(5571568255562288)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(5571743591562288)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5571929246562288)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5571568255562288)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(5571743591562288)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5572080198562288)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(5571568255562288)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5572433233562288)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5572533208562289)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5572630630562289)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5572750301562289)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5572880972562289)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5572940590562289)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5573074472562289)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5573250747562289)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(5573172158562289)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5573382108562289)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(5573172158562289)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5573491072562289)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'REPORT'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5573526459562289)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(5573172158562289)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5573631338562289)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5573729705562289)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(5573172158562289)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5573830278562289)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(5572251185562288)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(5573172158562289)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5574019196562289)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5574186034562289)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5574237148562289)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5574477576562289)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(5574303490562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5574601464562289)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(5574506907562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5574727456562289)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5574881736562289)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(5574303490562289)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575084283562289)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(5574934017562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575197640562289)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(5574934017562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575247926562289)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(5574934017562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575453145562289)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(5575387210562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575541761562289)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(5575387210562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575657978562289)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(5574303490562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575769085562289)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575811255562289)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(5574934017562289)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5575998587562289)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(5573976015562289)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5576201601562289)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5576015911562289)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(5576161154562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5576340548562289)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5576015911562289)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(5576161154562289)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5576746707562290)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(5576645350562290)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5576982736562290)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(5576888389562290)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5577032777562290)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(5576888389562290)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5577136901562290)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(5576888389562290)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5577358709562290)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(5577222676562290)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5577403319562290)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(5577222676562290)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5577568774562290)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(5576645350562290)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5577678628562290)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5577793580562290)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5576510027562290)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(5576888389562290)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578019802562290)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(5577840059562290)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578153715562290)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5577840059562290)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578268151562290)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5577840059562290)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578373493562290)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5577840059562290)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578440936562290)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5577840059562290)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578521767562290)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(5577840059562290)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578691298562290)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(5577840059562290)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578791721562290)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(5577840059562290)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5578915775562290)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(5578864364562290)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5579068787562290)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5578864364562290)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5579129573562290)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5578864364562290)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5579288618562290)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(5578864364562290)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5579394524562290)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(5578864364562290)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(5572309432562288)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5579494910562290)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(5578864364562290)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5579581727562290)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(5578864364562290)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5579671555562290)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(5578864364562290)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(5577948022562290)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5579886624562290)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(5579762615562290)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(5574303490562289)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact video of timeline with smaller font-sizes and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5580170459562291)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'.t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(5580000760562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5580385143562291)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5580435577562291)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5580583309562291)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5580619274562291)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5580785028562291)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5580878641562291)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5580949964562291)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581051984562291)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(5580000760562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581187402562291)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(5580000760562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581236373562291)
,p_theme_id=>42
,p_name=>'RESPONSIVE'
,p_display_name=>'Responsive'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--responsive'
,p_template_types=>'LIST'
,p_help_text=>'Automatically resize badges to smaller sizes as screen becomes smaller.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581380348562291)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(5580000760562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581461534562291)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581577867562291)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(5579945129562291)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(5580000760562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581724676562291)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581891722562291)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5581959414562291)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5582152898562291)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(5582048258562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5582391322562292)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Use Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--colorize'
,p_group_id=>wwv_flow_api.id(5582229638562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5582447086562292)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5582546129562292)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(5582048258562291)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5582754585562292)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(5582644957562292)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5582816679562292)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(5582644957562292)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5582942909562292)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(5582644957562292)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5583101547562292)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(5583035306562292)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5583275756562292)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(5583035306562292)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5583352939562292)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--featured'
,p_group_id=>wwv_flow_api.id(5582048258562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5583468624562292)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5583572349562292)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(5582644957562292)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5583630522562292)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(5581655973562291)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5583852999562292)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(5583792140562292)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5583952724562292)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5583792140562292)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5584061342562292)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5583792140562292)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5584116937562292)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5583792140562292)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5584462791562292)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(5584340607562292)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5584519967562292)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5584340607562292)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(5583035306562292)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5584638626562292)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5584340607562292)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(5583035306562292)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5584865531562292)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5584340607562292)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(5584710677562292)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5584986745562292)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5584340607562292)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(5582048258562291)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5585003636562292)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5584340607562292)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(5582048258562291)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5585114134562292)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(5584340607562292)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(5584710677562292)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5585456439562292)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5585218225562292)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(5585334590562292)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5585591684562292)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5585218225562292)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(5585334590562292)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5585684961562292)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5585218225562292)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(5585334590562292)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5585889763562293)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5585778433562292)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(5582048258562291)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5585949882562293)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5585778433562292)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5586073194562293)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5585778433562292)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5586179156562293)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5585778433562292)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5586320870562293)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5585778433562292)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(5586256125562293)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5586420860562293)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5585778433562292)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(5586256125562293)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5586706744562293)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5586648007562293)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5586868686562293)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5586648007562293)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5586997008562293)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5586648007562293)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5587080114562293)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(5586648007562293)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5587147966562293)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(5586648007562293)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(5580207051562291)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5587258225562293)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(5586648007562293)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5587391950562293)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(5586648007562293)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5587428589562293)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(5586648007562293)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Shows an icon for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5587783452562293)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(5587607182562293)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5587881262562293)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(5587607182562293)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5587928148562293)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(5587607182562293)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5588064583562293)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(5587607182562293)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5589076006562294)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(5588882223562294)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(5588936610562294)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5589176461562294)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(5588882223562294)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(5588936610562294)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5590054830562301)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(5589939882562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5590211481562301)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large Left Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(5590102206562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5590473516562301)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large Right Margin'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(5590336000562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5590644207562301)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(5590500978562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5590811442562301)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(5590713922562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5590946372562301)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small Left Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(5590102206562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5591064402562301)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small Right Margin'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(5590336000562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5591280146562301)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(5591121165562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5591384390562301)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(5591121165562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5591458213562301)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(5591121165562301)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5591588713562301)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(5589939882562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5591632238562301)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(5590713922562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5591775898562301)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(5590500978562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5591989796562301)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(5591816399562301)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5592072874562301)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(5589939882562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5592154332562301)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(5589939882562301)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5592381939562301)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(5592297853562301)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5592541693562301)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(5592403161562301)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5592728739562301)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(5592622551562301)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5592997673562301)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(5592863746562301)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5593023515562302)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(5592863746562301)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5593257040562302)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(5593156389562302)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5593369874562302)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(5592403161562301)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5593514355562302)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(5593489963562302)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5593671223562302)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(5593731042562302)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(5593489963562302)
,p_template_types=>'FIELD'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
null;
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(5594122812562305)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/be_ctb_jq_alv
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(32656238987998412)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'BE.CTB.JQ.ALV'
,p_display_name=>'Live Validation'
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','BE.CTB.JQ.ALV'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render(p_dynamic_action in apex_plugin.t_dynamic_action',
'              , p_plugin         in apex_plugin.t_plugin)',
'return apex_plugin.t_dynamic_action_render_result is',
'  l_validation           varchar2(4000) := p_dynamic_action.attribute_01;',
'  l_item_type            varchar2(4000) := p_dynamic_action.attribute_02;',
'  l_items_to_validate    varchar2(4000) := p_dynamic_action.attribute_03;',
'  l_triggering_event     varchar2(4000) := p_dynamic_action.attribute_04;',
'  l_condition            varchar2(4000) := p_dynamic_action.attribute_05;',
'  l_equal                varchar2(4000) := p_dynamic_action.attribute_06;',
'  l_regex                varchar2(4000) := p_dynamic_action.attribute_07;',
'  l_minimum_item         varchar2(4000) := p_dynamic_action.attribute_08;',
'  l_maximum_item         varchar2(4000) := p_dynamic_action.attribute_09;',
'  l_minimum              varchar2(4000) := p_dynamic_action.attribute_10;',
'  l_maximum              varchar2(4000) := p_dynamic_action.attribute_11;',
'  l_forms_to_validate    varchar2(4000) := p_dynamic_action.attribute_12;',
'  l_form_submit_elements varchar2(4000) := p_dynamic_action.attribute_13;',
'  l_error_msg            varchar2(4000) := p_dynamic_action.attribute_14;',
'  l_error_msg_location   varchar2(4000) := p_dynamic_action.attribute_15;',
'',
'  l_date_format        varchar2(4000);',
'  l_numeric_characters varchar2(4000);',
'',
'  l_render_result      apex_plugin.t_dynamic_action_render_result;',
'begin',
'  apex_javascript.add_library(',
'    p_name      => ''jquery.alv'',',
'    p_directory => p_plugin.file_prefix,',
'    p_version   => null',
'  );',
'  apex_css.add_file(',
'    p_name      => ''style.alv'',',
'    p_directory => p_plugin.file_prefix,',
'    p_version   => null',
'  );',
'',
'  select value',
'  into l_date_format',
'  from nls_session_parameters',
'  where parameter = ''NLS_DATE_FORMAT'';',
'',
'  select value',
'  into l_numeric_characters',
'  from nls_session_parameters',
'  where parameter = ''NLS_NUMERIC_CHARACTERS'';',
'',
'  l_render_result.attribute_01 := l_validation;',
'  l_render_result.attribute_02 := apex_plugin_util.page_item_names_to_jquery(l_items_to_validate);',
'  l_render_result.attribute_03 := l_triggering_event;',
'  l_render_result.attribute_04 := l_condition;',
'  l_render_result.attribute_05 := l_forms_to_validate;',
'  l_render_result.attribute_06 := l_item_type;',
'  l_render_result.attribute_07 := l_form_submit_elements;',
'  if l_minimum_item is not null then',
'    l_minimum_item := apex_plugin_util.page_item_names_to_jquery(l_minimum_item);',
'  end if;',
'  if l_maximum_item is not null then',
'    l_maximum_item := apex_plugin_util.page_item_names_to_jquery(l_maximum_item);',
'  end if;',
'  l_render_result.attribute_10 := nvl(l_minimum_item, l_minimum);',
'  l_render_result.attribute_11 := nvl(l_maximum_item, l_maximum);',
'  l_render_result.attribute_12 := apex_plugin_util.page_item_names_to_jquery(l_equal);',
'  l_render_result.attribute_13 := l_regex;',
'  l_render_result.attribute_14 := l_error_msg;',
'  l_render_result.attribute_15 := l_error_msg_location;',
'',
'  l_render_result.javascript_function := ''',
'    function() {',
'      var render = this;',
'      var action = render.action;',
'      var l_allowWhitespace = true;',
'',
'      if (!action.attribute14) { action.attribute14 = ""; }',
'',
'      if (action.attribute01 !== "form") {',
'        // item validation',
'        if (action.attribute01 === "notBlank") {',
'          action.attribute01 = "notEmpty";',
'          l_allowWhitespace = false;',
'        }',
'        if (!action.attribute04) { action.attribute04 = ""; }',
'        if (!action.attribute10) { action.attribute10 = ""; }',
'        if (!action.attribute11) { action.attribute11 = ""; }',
'',
'        $(action.attribute02).alv({',
'          validate: action.attribute01,',
'          triggeringEvent: action.attribute03,',
'          condition: action.attribute04,',
'          errorMsg: action.attribute14,',
'          errorMsgLocation: action.attribute15,',
'          allowWhitespace: l_allowWhitespace,',
'          itemType: action.attribute06,',
'          dateFormat: "'' || l_date_format || ''",',
'          numericCharacters: "'' || l_numeric_characters || ''",',
'          min: action.attribute10,',
'          max: action.attribute11,',
'          equal: action.attribute12,',
'          regex: action.attribute13',
'        });',
'      } else {',
'        // form validation',
'        $(action.attribute07).alv("validateForm", {',
'          formsToSubmit: action.attribute05,',
'          errorMsg: action.attribute14',
'        });',
'      }',
'    }',
'  '';',
'',
'  return l_render_result;',
'end render;'))
,p_render_function=>'render'
,p_standard_attributes=>'STOP_EXECUTION_ON_ERROR'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.5'
,p_about_url=>'http://apex.oracle.com/pls/apex/f?p=59381:1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32664348601020099)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Validation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'notEmpty'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select the type of validation you want to perform.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32676624490022625)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>10
,p_display_value=>'Required'
,p_return_value=>'notEmpty'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32680932109024778)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>20
,p_display_value=>'Required (Trim Whitespace)'
,p_return_value=>'notBlank'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32685238342026709)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>30
,p_display_value=>'Item Type'
,p_return_value=>'itemType'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32689542844027960)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>40
,p_display_value=>'Equality'
,p_return_value=>'equal'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32693847000029100)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>50
,p_display_value=>'Match Regex'
,p_return_value=>'regex'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32698151848030521)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>60
,p_display_value=>'Character Length'
,p_return_value=>'charLength'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32734925445041845)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>70
,p_display_value=>'Number Size'
,p_return_value=>'numberSize'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32739239990046030)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>80
,p_display_value=>'Date Order'
,p_return_value=>'dateOrder'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32743543453047003)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>90
,p_display_value=>'Checkboxes'
,p_return_value=>'totalChecked'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32747850033048934)
,p_plugin_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_display_sequence=>100
,p_display_value=>'Form'
,p_return_value=>'form'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32760047094085951)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Item Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'number'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'itemType'
,p_lov_type=>'STATIC'
,p_help_text=>'Define what kind of item type validation should be applied.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32764451249087149)
,p_plugin_attribute_id=>wwv_flow_api.id(32760047094085951)
,p_display_sequence=>10
,p_display_value=>'Number'
,p_return_value=>'number'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32768721598088086)
,p_plugin_attribute_id=>wwv_flow_api.id(32760047094085951)
,p_display_sequence=>20
,p_display_value=>'Only Digits'
,p_return_value=>'digit'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32773024368088808)
,p_plugin_attribute_id=>wwv_flow_api.id(32760047094085951)
,p_display_sequence=>30
,p_display_value=>'Alphanumeric'
,p_return_value=>'alphanumeric'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32777326446089507)
,p_plugin_attribute_id=>wwv_flow_api.id(32760047094085951)
,p_display_sequence=>40
,p_display_value=>'Date'
,p_return_value=>'date'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32781629217090244)
,p_plugin_attribute_id=>wwv_flow_api.id(32760047094085951)
,p_display_sequence=>50
,p_display_value=>'E-mail'
,p_return_value=>'email'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32785931641090948)
,p_plugin_attribute_id=>wwv_flow_api.id(32760047094085951)
,p_display_sequence=>60
,p_display_value=>'URL'
,p_return_value=>'url'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32798133157100809)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Page Item(s)'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'NOT_IN_LIST'
,p_depending_on_expression=>'form'
,p_help_text=>'The page item(s) for which you want the above validation to apply. Separate multiple page items with a comma.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32806428786109060)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Triggering Event'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'blur'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'NOT_IN_LIST'
,p_depending_on_expression=>'form'
,p_lov_type=>'STATIC'
,p_help_text=>'Specify the JavaScript event that will cause the validation to fire.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32810832249110040)
,p_plugin_attribute_id=>wwv_flow_api.id(32806428786109060)
,p_display_sequence=>10
,p_display_value=>'Blur'
,p_return_value=>'blur'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32815136751111373)
,p_plugin_attribute_id=>wwv_flow_api.id(32806428786109060)
,p_display_sequence=>20
,p_display_value=>'FocusOut'
,p_return_value=>'focusout'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32819442638113042)
,p_plugin_attribute_id=>wwv_flow_api.id(32806428786109060)
,p_display_sequence=>30
,p_display_value=>'Change'
,p_return_value=>'change'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32823745409113892)
,p_plugin_attribute_id=>wwv_flow_api.id(32806428786109060)
,p_display_sequence=>40
,p_display_value=>'KeyUp'
,p_return_value=>'keyup'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32835938960121455)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Condition'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'NOT_IN_LIST'
,p_depending_on_expression=>'form'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Optionally specify a JavaScript expression to support conditional execution of your validation. The validation will fire when the expression evaluates to true.',
'',
'For example: $(''#P5_COUNTRY'').val() === "Belgium"'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32844240954140937)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Must Equal'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'equal'
,p_help_text=>'Select the page item that you want the value to be equal to. Frequently used to validate that two password fields are equal.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32864232427147934)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Regex'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'regex'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This field allows specifying a regular expression that has to match the entered value.',
'',
'For example: #[A-Fa-f0-9]{6}'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32872553898154215)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Minimum Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'numberSize,dateOrder'
,p_help_text=>'The page item that contains the minimum value. Overrides the ''Minimum'' setting if filled in.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32876939484159469)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Maximum Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'numberSize,dateOrder'
,p_help_text=>'The page item that contains the maximum value. Overrides the ''Maximum'' setting if filled in.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32896946073237080)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Minimum'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'charLength,numberSize,dateOrder,totalChecked'
,p_help_text=>'A fixed minimum value. Gets overridden by the ''Minimum Item'' setting if filled in.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32901340663245070)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Maximum'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'charLength,numberSize,dateOrder,totalChecked'
,p_help_text=>'A fixed maximum value. Gets overridden by the ''Maximum Item'' setting if filled in.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32909630751251636)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Form(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'form'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'A jQuery selector to determine the form region(s) you want to validate before the page is submitted. Use a comma to separate multiple elements.',
'',
'For example: #empForm,#deptForm'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32917951876257701)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Form Submit Element(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'form'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'A jQuery ID selector to determine the buttons that submit the form. Use a comma to separate multiple elements.',
'',
'For example: #createBtn,#saveBtn'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32926233999262126)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Error Message'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_help_text=>'Specifying an error message overrides the default error message. Use &1, &2, &n for substitution values.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(32930651314267004)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Error Message Location'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'after'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(32664348601020099)
,p_depending_on_condition_type=>'NOT_IN_LIST'
,p_depending_on_expression=>'form'
,p_lov_type=>'STATIC'
,p_help_text=>'You can choose to show the error message before or after the input item.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32935024780268862)
,p_plugin_attribute_id=>wwv_flow_api.id(32930651314267004)
,p_display_sequence=>10
,p_display_value=>'After Item'
,p_return_value=>'after'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(32939330667270596)
,p_plugin_attribute_id=>wwv_flow_api.id(32930651314267004)
,p_display_sequence=>20
,p_display_value=>'Before Item'
,p_return_value=>'before'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(28394496069448472)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_name=>'alvformfail'
,p_display_name=>'Form Failure'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(28390186026445581)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_name=>'alvformsuccess'
,p_display_name=>'Form Success'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(28386011868443591)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_name=>'alvitemfail'
,p_display_name=>'Item Failure'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(28381805981441929)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_name=>'alvitemsuccess'
,p_display_name=>'Item Success'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '76617220616C763D7B7D3B616C762E7574696C3D7B7472696D3A66756E6374696F6E2874297B72657475726E20742E7265706C616365282F5E5C732B7C5C732B242F672C2222297D2C7265706C61636543686172496E537472696E673A66756E6374696F';
wwv_flow_api.g_varchar2_table(2) := '6E28742C732C65297B72657475726E20742E73756273747228302C73292B28652B2222292B742E73756273747228732B28652B2222292E6C656E677468297D2C676574506167654974656D56616C75653A66756E6374696F6E2874297B72657475726E28';
wwv_flow_api.g_varchar2_table(3) := '742B2222292E737562737472696E6728302C32293D3D3D222350223F242874292E76616C28293A747D2C676574436F6E646974696F6E526573756C743A66756E6374696F6E287045787072657373696F6E297B7661722065787072657373696F6E526573';
wwv_flow_api.g_varchar2_table(4) := '756C743D21303B72657475726E207045787072657373696F6E2E6C656E67746826262865787072657373696F6E526573756C743D6576616C287045787072657373696F6E29292C65787072657373696F6E526573756C747D2C6765744E756D6265724672';
wwv_flow_api.g_varchar2_table(5) := '6F6D537472696E673A66756E6374696F6E2874297B72657475726E28742B2222292E6C656E6774683F4E756D6265722874293A22227D2C6765744461746546726F6D537472696E673A66756E6374696F6E2874297B76617220733D742E73706C69742822';
wwv_flow_api.g_varchar2_table(6) := '2F22292C653D7061727365496E7428735B325D292C693D7061727365496E7428735B315D2C3130292C613D7061727365496E7428735B305D2C3130293B72657475726E206E6577204461746528652C692D312C61297D2C636F6E76657274446174653A66';
wwv_flow_api.g_varchar2_table(7) := '756E6374696F6E28742C73297B76617220652C692C612C6E3D732E746F55707065724361736528292C723D6E2E7265706C616365282F5B412D5A5D2B2F672C2222292C6C3D742E7265706C616365282F5C642B2F672C2222293B72657475726E20742E6C';
wwv_flow_api.g_varchar2_table(8) := '656E6774683D3D3D732E6C656E67746826266C3D3D3D72262628653D6E2E696E6465784F662822444422293D3D3D2D313F227878223A742E737562737472696E67286E2E696E6465784F662822444422292C6E2E696E6465784F662822444422292B3229';
wwv_flow_api.g_varchar2_table(9) := '2C693D6E2E696E6465784F6628224D4D22293D3D3D2D313F227878223A742E737562737472696E67286E2E696E6465784F6628224D4D22292C6E2E696E6465784F6628224D4D22292B32292C613D6E2E696E6465784F6628225959595922293D3D3D2D31';
wwv_flow_api.g_varchar2_table(10) := '3F6E2E696E6465784F6628225252525222293D3D3D2D313F6E2E696E6465784F662822595922293D3D3D2D313F6E2E696E6465784F662822525222293D3D3D2D313F2278787878223A742E737562737472696E67286E2E696E6465784F66282252522229';
wwv_flow_api.g_varchar2_table(11) := '2C6E2E696E6465784F662822525222292B32293A742E737562737472696E67286E2E696E6465784F662822595922292C6E2E696E6465784F662822595922292B32293A742E737562737472696E67286E2E696E6465784F6628225252525222292C6E2E69';
wwv_flow_api.g_varchar2_table(12) := '6E6465784F6628225252525222292B34293A742E737562737472696E67286E2E696E6465784F6628225959595922292C6E2E696E6465784F6628225959595922292B3429292C652B222F222B692B222F222B617D7D2C616C762E76616C696461746F7273';
wwv_flow_api.g_varchar2_table(13) := '3D7B7574696C3A616C762E7574696C2C6973456D7074793A66756E6374696F6E2874297B72657475726E20743D3D3D22227D2C6973457175616C3A66756E6374696F6E28742C73297B72657475726E20743D3D3D737D2C72656765783A66756E6374696F';
wwv_flow_api.g_varchar2_table(14) := '6E28742C73297B72657475726E205265674578702873292E746573742874297C7C746869732E6973456D7074792874297D2C6973416C7068616E756D657269633A66756E6374696F6E2874297B72657475726E20746869732E726567657828742C2F5E5B';
wwv_flow_api.g_varchar2_table(15) := '612D7A302D395D2B242F69297D2C69734E756D6265723A66756E6374696F6E28742C73297B72657475726E20733D3D3D222C2E223F746869732E726567657828742C2F5E2D3F283F3A5C642B7C5C647B312C337D283F3A2E5C647B337D292B293F283F3A';
wwv_flow_api.g_varchar2_table(16) := '5C2C5C642B293F242F293A746869732E726567657828742C2F5E2D3F283F3A5C642B7C5C647B312C337D283F3A2C5C647B337D292B293F283F3A5C2E5C642B293F242F297D2C697344696769743A66756E6374696F6E2874297B72657475726E20746869';
wwv_flow_api.g_varchar2_table(17) := '732E726567657828742C2F5E5C642B242F297D2C6973456D61696C3A66756E6374696F6E2874297B72657475726E20746869732E726567657828742C2F5E5B5E5C73405D2B405B5E5C73405D2B5C2E5B5E5C73405D2B242F297D2C697355726C3A66756E';
wwv_flow_api.g_varchar2_table(18) := '6374696F6E2874297B72657475726E20746869732E726567657828742C2F28687474707C6674707C6874747073293A5C2F5C2F5B5C772D5D2B285C2E5B5C772D5D2B292B285B5C772E2C403F5E3D2526616D703B3A5C2F7E2B232D5D2A5B5C77403F5E3D';
wwv_flow_api.g_varchar2_table(19) := '2526616D703B5C2F7E2B232D5D293F2F297D2C6973446174653A66756E6374696F6E28742C73297B76617220653D52656745787028225E28335B30315D7C5B31325D5B302D395D7C303F5B312D395D292F28315B302D325D7C303F5B312D395D292F283F';
wwv_flow_api.g_varchar2_table(20) := '3A5B302D395D7B327D293F5B302D395D7B327D2422292C693D746869732E7574696C2E636F6E766572744461746528742C73293B696628692E6D61746368286529297B76617220613D692E73706C697428222F22292C6E3D7061727365496E7428615B32';
wwv_flow_api.g_varchar2_table(21) := '5D292C723D7061727365496E7428615B315D2C3130292C6C3D7061727365496E7428615B305D2C3130292C6F3D6E65772044617465286E2C722D312C6C293B6966286F2E6765744D6F6E746828292B313D3D3D7226266F2E6765744461746528293D3D3D';
wwv_flow_api.g_varchar2_table(22) := '6C26266F2E67657446756C6C5965617228293D3D3D6E2972657475726E21307D72657475726E20746869732E6973456D7074792874297D2C6D696E4C656E6774683A66756E6374696F6E28742C73297B72657475726E20742E6C656E6774683E3D737C7C';
wwv_flow_api.g_varchar2_table(23) := '746869732E6973456D7074792874297D2C6D61784C656E6774683A66756E6374696F6E28742C73297B72657475726E20733E3D742E6C656E6774687C7C746869732E6973456D7074792874297D2C72616E67654C656E6774683A66756E6374696F6E2874';
wwv_flow_api.g_varchar2_table(24) := '2C732C65297B72657475726E20746869732E6D696E4C656E67746828742C73292626746869732E6D61784C656E67746828742C65297C7C746869732E6973456D7074792874297D2C6D696E4E756D6265723A66756E6374696F6E28742C732C65297B7265';
wwv_flow_api.g_varchar2_table(25) := '7475726E21746869732E6973456D707479287429262621746869732E6973456D7074792873292626746869732E69734E756D62657228742C65292626746869732E69734E756D62657228732C65293F743E3D733A21307D2C6D61784E756D6265723A6675';
wwv_flow_api.g_varchar2_table(26) := '6E6374696F6E28742C732C65297B72657475726E21746869732E6973456D707479287429262621746869732E6973456D7074792873292626746869732E69734E756D62657228742C65292626746869732E69734E756D62657228732C65293F733E3D743A';
wwv_flow_api.g_varchar2_table(27) := '21307D2C72616E67654E756D6265723A66756E6374696F6E28742C732C652C69297B72657475726E20746869732E6973456D7074792874297C7C746869732E6973456D7074792873297C7C746869732E6973456D7074792865297C7C2128746869732E69';
wwv_flow_api.g_varchar2_table(28) := '734E756D62657228742C69292626746869732E69734E756D62657228732C69292626746869732E69734E756D62657228652C6929297C7C733E653F21303A746869732E6D696E4E756D62657228742C732C69292626746869732E6D61784E756D62657228';
wwv_flow_api.g_varchar2_table(29) := '742C652C69297D2C6D696E436865636B3A66756E6374696F6E28742C732C65297B76617220693D242874292E66696C74657228223A636865636B656422292E6C656E6774683B72657475726E20653F746869732E6D696E4E756D62657228692C732C6E75';
wwv_flow_api.g_varchar2_table(30) := '6C6C297C7C693D3D3D303A746869732E6D696E4E756D62657228692C732C6E756C6C297D2C6D6178436865636B3A66756E6374696F6E28742C73297B76617220653D242874292E66696C74657228223A636865636B656422292E6C656E6774683B726574';
wwv_flow_api.g_varchar2_table(31) := '75726E20746869732E6D61784E756D62657228652C732C6E756C6C297C7C653D3D3D307D2C72616E6765436865636B3A66756E6374696F6E28742C732C65297B76617220693D242874292E66696C74657228223A636865636B656422292E6C656E677468';
wwv_flow_api.g_varchar2_table(32) := '3B72657475726E20746869732E72616E67654E756D62657228692C732C652C6E756C6C297C7C693D3D3D307D2C6D696E446174653A66756E6374696F6E28742C732C65297B76617220693D6E657720446174652C613D6E657720446174653B7265747572';
wwv_flow_api.g_varchar2_table(33) := '6E21746869732E6973456D707479287429262621746869732E6973456D7074792873292626746869732E69734461746528742C65292626746869732E69734461746528732C65293F28693D746869732E7574696C2E6765744461746546726F6D53747269';
wwv_flow_api.g_varchar2_table(34) := '6E6728746869732E7574696C2E636F6E766572744461746528742C6529292C613D746869732E7574696C2E6765744461746546726F6D537472696E6728746869732E7574696C2E636F6E766572744461746528732C6529292C693E3D61293A21307D2C6D';
wwv_flow_api.g_varchar2_table(35) := '6178446174653A66756E6374696F6E28742C732C65297B76617220693D6E657720446174652C613D6E657720446174653B72657475726E21746869732E6973456D707479287429262621746869732E6973456D7074792873292626746869732E69734461';
wwv_flow_api.g_varchar2_table(36) := '746528742C65292626746869732E69734461746528732C65293F28693D746869732E7574696C2E6765744461746546726F6D537472696E6728746869732E7574696C2E636F6E766572744461746528742C6529292C613D746869732E7574696C2E676574';
wwv_flow_api.g_varchar2_table(37) := '4461746546726F6D537472696E6728746869732E7574696C2E636F6E766572744461746528732C6529292C613E3D69293A21307D2C72616E6765446174653A66756E6374696F6E28742C732C652C69297B76617220613D6E657720446174652C6E3D6E65';
wwv_flow_api.g_varchar2_table(38) := '7720446174652C723D6E657720446174653B72657475726E20746869732E6973456D7074792874297C7C746869732E6973456D7074792873297C7C746869732E6973456D7074792865297C7C2128746869732E69734461746528742C6929262674686973';
wwv_flow_api.g_varchar2_table(39) := '2E69734461746528732C69292626746869732E69734461746528652C6929297C7C28613D746869732E7574696C2E6765744461746546726F6D537472696E6728746869732E7574696C2E636F6E766572744461746528742C6929292C6E3D746869732E75';
wwv_flow_api.g_varchar2_table(40) := '74696C2E6765744461746546726F6D537472696E6728746869732E7574696C2E636F6E766572744461746528732C6929292C723D746869732E7574696C2E6765744461746546726F6D537472696E6728746869732E7574696C2E636F6E76657274446174';
wwv_flow_api.g_varchar2_table(41) := '6528652C6929292C6E3E72293F21303A613E3D6E2626723E3D617D7D2C66756E6374696F6E28242C7574696C2C76616C696461746F7273297B2275736520737472696374223B242E666E2E616C763D66756E6374696F6E286D6574686F642C6F7074696F';
wwv_flow_api.g_varchar2_table(42) := '6E73297B66756E6374696F6E20726573746F7265506C7567696E53657474696E67732874297B76617220733D242874293B72657475726E20732E6461746128636F6E7374616E74732E706C7567696E496429213D3D766F696420303F28242E657874656E';
wwv_flow_api.g_varchar2_table(43) := '642873657474696E67732C732E6461746128636F6E7374616E74732E706C7567696E496429292C2130293A21317D66756E6374696F6E20657874656E6453657474696E67732874297B742626242E657874656E642873657474696E67732C74297D66756E';
wwv_flow_api.g_varchar2_table(44) := '6374696F6E2062696E6453657474696E677328742C73297B657874656E6453657474696E67732873292C242874292E6461746128636F6E7374616E74732E706C7567696E49642C73657474696E6773297D66756E6374696F6E20696E69742874297B7661';
wwv_flow_api.g_varchar2_table(45) := '7220733D242874292C653D2223222B732E617474722822696422292C693D242822626F647922292C613D73657474696E67732E74726967676572696E674576656E742B222E222B636F6E7374616E74732E706C7567696E5072656669782C6E3D22636861';
wwv_flow_api.g_varchar2_table(46) := '6E67652E222B636F6E7374616E74732E706C7567696E5072656669783B7377697463682873657474696E67732E76616C6964617465297B63617365226E6F74456D707479223A28732E686173436C61737328636F6E7374616E74732E6170657843686563';
wwv_flow_api.g_varchar2_table(47) := '6B626F78436C617373297C7C732E686173436C61737328636F6E7374616E74732E61706578526164696F436C617373297C7C732E686173436C61737328636F6E7374616E74732E6170657853687574746C65436C617373297C7C732E70726F7028227461';
wwv_flow_api.g_varchar2_table(48) := '674E616D6522293D3D3D2253454C454354227C7C732E6174747228227479706522293D3D3D2266696C65227C7C732E686173436C61737328636F6E7374616E74732E61706578446174657069636B6572436C6173732929262673657474696E67732E7472';
wwv_flow_api.g_varchar2_table(49) := '6967676572696E674576656E74213D3D226368616E676522262628613D612B2220222B6E292C692E64656C656761746528652C612C6973456D70747948616E646C6572293B627265616B3B63617365226974656D54797065223A73657474696E67732E69';
wwv_flow_api.g_varchar2_table(50) := '74656D547970653D3D3D226461746522262673657474696E67732E74726967676572696E674576656E74213D3D226368616E676522262628613D612B2220222B6E292C692E64656C656761746528652C612C6974656D5479706548616E646C6572293B62';
wwv_flow_api.g_varchar2_table(51) := '7265616B3B6361736522657175616C223A692E64656C656761746528652C612C6973457175616C48616E646C6572293B627265616B3B63617365227265676578223A692E64656C656761746528652C612C726567657848616E646C6572293B627265616B';
wwv_flow_api.g_varchar2_table(52) := '3B6361736522636861724C656E677468223A692E64656C656761746528652C612C636861724C656E67746848616E646C6572293B627265616B3B63617365226E756D62657253697A65223A692E64656C656761746528652C612C6E756D62657253697A65';
wwv_flow_api.g_varchar2_table(53) := '48616E646C6572293B627265616B3B6361736522646174654F72646572223A73657474696E67732E74726967676572696E674576656E74213D3D226368616E676522262628613D612B2220222B6E292C692E64656C656761746528652C612C646174654F';
wwv_flow_api.g_varchar2_table(54) := '7264657248616E646C6572293B627265616B3B6361736522746F74616C436865636B6564223A692E64656C656761746528652C6E2C746F74616C436865636B656448616E646C6572293B627265616B3B64656661756C743A7D72657475726E2061646456';
wwv_flow_api.g_varchar2_table(55) := '616C69646174696F6E4576656E7428732C61292C747D66756E6374696F6E2061646456616C69646174696F6E4576656E7428742C73297B76617220653D242874292C693D652E6461746128636F6E7374616E74732E76616C69646174696F6E4576656E74';
wwv_flow_api.g_varchar2_table(56) := '73292C613D21313B69213D3D766F696420303F28242E6561636828692E73706C697428222022292C66756E6374696F6E28742C65297B653D3D3D73262628613D2130297D292C617C7C652E6461746128636F6E7374616E74732E76616C69646174696F6E';
wwv_flow_api.g_varchar2_table(57) := '4576656E74732C692B2220222B7329293A652E6461746128636F6E7374616E74732E76616C69646174696F6E4576656E74732C73297D66756E6374696F6E206973456D70747948616E646C657228297B76617220742C733D7365744D7367287365747469';
wwv_flow_api.g_varchar2_table(58) := '6E67732E6572726F724D73672C2276616C756520726571756972656422293B616C6C6F7756616C69646174696F6E28746869732C636F6E7374616E74732E6E6F74456D707479436C61737329262628743D242874686973292E686173436C61737328636F';
wwv_flow_api.g_varchar2_table(59) := '6E7374616E74732E61706578436865636B626F78436C617373297C7C242874686973292E686173436C61737328636F6E7374616E74732E61706578526164696F436C617373293F2176616C696461746F72732E6D696E436865636B28242874686973292E';
wwv_flow_api.g_varchar2_table(60) := '66696E6428223A636865636B626F782C203A726164696F22292C312C2131293A242874686973292E686173436C61737328636F6E7374616E74732E6170657853687574746C65436C617373293F21242874686973292E66696E64282273656C6563742E73';
wwv_flow_api.g_varchar2_table(61) := '687574746C655F726967687422292E6368696C6472656E28292E6C656E6774683A242874686973292E70726F7028227461674E616D6522293D3D3D2253454C454354227C7C242874686973292E6174747228227479706522293D3D3D2266696C65223F76';
wwv_flow_api.g_varchar2_table(62) := '616C696461746F72732E6973456D70747928746869732E76616C7565293A73657474696E67732E616C6C6F77576869746573706163653F76616C696461746F72732E6973456D70747928746869732E76616C7565293A76616C696461746F72732E697345';
wwv_flow_api.g_varchar2_table(63) := '6D707479287574696C2E7472696D28746869732E76616C756529292C7426267574696C2E676574436F6E646974696F6E526573756C742873657474696E67732E636F6E646974696F6E293F2861646456616C69646174696F6E526573756C742824287468';
wwv_flow_api.g_varchar2_table(64) := '6973292C636F6E7374616E74732E6E6F74456D707479436C6173732C223022292C73686F774D65737361676528746869732C7329293A2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E6E6F74456D7074';
wwv_flow_api.g_varchar2_table(65) := '79436C6173732C223122292C686964654D65737361676528746869732929297D66756E6374696F6E206973457175616C48616E646C657228297B76617220743D7365744D73672873657474696E67732E6572726F724D73672C2276616C75657320646F20';
wwv_flow_api.g_varchar2_table(66) := '6E6F7420657175616C22293B616C6C6F7756616C69646174696F6E28746869732C636F6E7374616E74732E657175616C436C61737329262676616C696461746F72732E6D696E4C656E67746828746869732E76616C75652C73657474696E67732E76616C';
wwv_flow_api.g_varchar2_table(67) := '69646174696F6E4D696E4C656E677468292626282176616C696461746F72732E6973457175616C28746869732E76616C75652C242873657474696E67732E657175616C292E76616C28292926267574696C2E676574436F6E646974696F6E526573756C74';
wwv_flow_api.g_varchar2_table(68) := '2873657474696E67732E636F6E646974696F6E293F2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E657175616C436C6173732C223022292C73686F774D65737361676528746869732C7429293A286164';
wwv_flow_api.g_varchar2_table(69) := '6456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E657175616C436C6173732C223122292C686964654D65737361676528746869732929297D66756E6374696F6E20726567657848616E646C657228297B76617220';
wwv_flow_api.g_varchar2_table(70) := '743D7365744D73672873657474696E67732E6572726F724D73672C22696E76616C69642076616C756522293B616C6C6F7756616C69646174696F6E28746869732C636F6E7374616E74732E7265676578436C61737329262676616C696461746F72732E6D';
wwv_flow_api.g_varchar2_table(71) := '696E4C656E67746828746869732E76616C75652C73657474696E67732E76616C69646174696F6E4D696E4C656E677468292626282176616C696461746F72732E726567657828746869732E76616C75652C73657474696E67732E72656765782926267574';
wwv_flow_api.g_varchar2_table(72) := '696C2E676574436F6E646974696F6E526573756C742873657474696E67732E636F6E646974696F6E293F2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E7265676578436C6173732C223022292C73686F';
wwv_flow_api.g_varchar2_table(73) := '774D65737361676528746869732C7429293A2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E7265676578436C6173732C223122292C686964654D65737361676528746869732929297D66756E6374696F';
wwv_flow_api.g_varchar2_table(74) := '6E206974656D5479706548616E646C657228297B76617220742C733B696628616C6C6F7756616C69646174696F6E28746869732C636F6E7374616E74732E6974656D54797065436C61737329262676616C696461746F72732E6D696E4C656E6774682874';
wwv_flow_api.g_varchar2_table(75) := '6869732E76616C75652C73657474696E67732E76616C69646174696F6E4D696E4C656E67746829297B7377697463682873657474696E67732E6974656D54797065297B6361736522616C7068616E756D65726963223A743D76616C696461746F72732E69';
wwv_flow_api.g_varchar2_table(76) := '73416C7068616E756D6572696328746869732E76616C7565292C733D7365744D73672873657474696E67732E6572726F724D73672C226E6F7420616E20616C7068616E756D657269632076616C756522293B627265616B3B63617365226E756D62657222';
wwv_flow_api.g_varchar2_table(77) := '3A743D76616C696461746F72732E69734E756D62657228746869732E76616C75652C73657474696E67732E6E756D6572696343686172616374657273292C733D7365744D73672873657474696E67732E6572726F724D73672C226E6F7420612076616C69';
wwv_flow_api.g_varchar2_table(78) := '64206E756D62657222293B627265616B3B63617365226469676974223A743D76616C696461746F72732E6973446967697428746869732E76616C7565292C733D7365744D73672873657474696E67732E6572726F724D73672C226E6F7420612076616C69';
wwv_flow_api.g_varchar2_table(79) := '6420646967697420636F6D62696E6174696F6E22293B627265616B3B6361736522656D61696C223A743D76616C696461746F72732E6973456D61696C28746869732E76616C7565292C733D7365744D73672873657474696E67732E6572726F724D73672C';
wwv_flow_api.g_varchar2_table(80) := '226E6F7420612076616C696420652D6D61696C206164647265737322293B627265616B3B636173652275726C223A743D76616C696461746F72732E697355726C28746869732E76616C7565292C733D7365744D73672873657474696E67732E6572726F72';
wwv_flow_api.g_varchar2_table(81) := '4D73672C226E6F7420612076616C69642055524C22293B627265616B3B636173652264617465223A743D76616C696461746F72732E69734461746528746869732E76616C75652C73657474696E67732E64617465466F726D6174292C733D7265706C6163';
wwv_flow_api.g_varchar2_table(82) := '654D736756617273287365744D73672873657474696E67732E6572726F724D73672C226E6F7420612076616C69642064617465202826312922292C73657474696E67732E64617465466F726D6174293B627265616B3B64656661756C743A7D2174262675';
wwv_flow_api.g_varchar2_table(83) := '74696C2E676574436F6E646974696F6E526573756C742873657474696E67732E636F6E646974696F6E293F2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E6974656D54797065436C6173732C22302229';
wwv_flow_api.g_varchar2_table(84) := '2C73686F774D65737361676528746869732C7329293A2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E6974656D54797065436C6173732C223122292C686964654D657373616765287468697329297D7D';
wwv_flow_api.g_varchar2_table(85) := '66756E6374696F6E20636861724C656E67746848616E646C657228297B76617220742C733B616C6C6F7756616C69646174696F6E28746869732C636F6E7374616E74732E636861724C656E677468436C61737329262676616C696461746F72732E6D696E';
wwv_flow_api.g_varchar2_table(86) := '4C656E67746828746869732E76616C75652C73657474696E67732E76616C69646174696F6E4D696E4C656E6774682926262876616C696461746F72732E6973456D7074792873657474696E67732E6D6178293F28743D76616C696461746F72732E6D696E';
wwv_flow_api.g_varchar2_table(87) := '4C656E67746828746869732E76616C75652C73657474696E67732E6D696E292C733D7265706C6163654D736756617273287365744D73672873657474696E67732E6572726F724D73672C2276616C7565206C656E67746820746F6F2073686F7274202D20';
wwv_flow_api.g_varchar2_table(88) := '6D696E2E20263122292C73657474696E67732E6D696E29293A76616C696461746F72732E6973456D7074792873657474696E67732E6D696E293F28743D76616C696461746F72732E6D61784C656E67746828746869732E76616C75652C73657474696E67';
wwv_flow_api.g_varchar2_table(89) := '732E6D6178292C733D7265706C6163654D736756617273287365744D73672873657474696E67732E6572726F724D73672C2276616C7565206C656E67746820746F6F206C6F6E67202D206D61782E20263122292C73657474696E67732E6D617829293A28';
wwv_flow_api.g_varchar2_table(90) := '743D76616C696461746F72732E72616E67654C656E67746828746869732E76616C75652C73657474696E67732E6D696E2C73657474696E67732E6D6178292C733D7265706C6163654D736756617273287365744D73672873657474696E67732E6572726F';
wwv_flow_api.g_varchar2_table(91) := '724D73672C22696E76616C69642076616C7565206C656E677468202D206265747765656E20263120616E64202632206F6E6C7922292C73657474696E67732E6D696E2C73657474696E67732E6D617829292C217426267574696C2E676574436F6E646974';
wwv_flow_api.g_varchar2_table(92) := '696F6E526573756C742873657474696E67732E636F6E646974696F6E293F2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E636861724C656E677468436C6173732C223022292C73686F774D6573736167';
wwv_flow_api.g_varchar2_table(93) := '6528746869732C7329293A2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E636861724C656E677468436C6173732C223122292C686964654D65737361676528746869732929297D66756E6374696F6E20';
wwv_flow_api.g_varchar2_table(94) := '6E756D62657253697A6548616E646C657228297B76617220742C732C653D7574696C2E6765744E756D62657246726F6D537472696E6728746869732E76616C7565292C693D7574696C2E6765744E756D62657246726F6D537472696E67287574696C2E67';
wwv_flow_api.g_varchar2_table(95) := '6574506167654974656D56616C75652873657474696E67732E6D696E29292C613D7574696C2E6765744E756D62657246726F6D537472696E67287574696C2E676574506167654974656D56616C75652873657474696E67732E6D617829293B616C6C6F77';
wwv_flow_api.g_varchar2_table(96) := '56616C69646174696F6E28746869732C636F6E7374616E74732E6E756D62657253697A65436C61737329262676616C696461746F72732E6D696E4C656E67746828746869732E76616C75652C73657474696E67732E76616C69646174696F6E4D696E4C65';
wwv_flow_api.g_varchar2_table(97) := '6E6774682926262876616C696461746F72732E6973456D7074792873657474696E67732E6D6178293F28743D76616C696461746F72732E6D696E4E756D62657228652C692C73657474696E67732E6E756D6572696343686172616374657273292C733D72';
wwv_flow_api.g_varchar2_table(98) := '65706C6163654D736756617273287365744D73672873657474696E67732E6572726F724D73672C226E756D62657220746F6F20736D616C6C202D206D696E2E20263122292C6929293A76616C696461746F72732E6973456D7074792873657474696E6773';
wwv_flow_api.g_varchar2_table(99) := '2E6D696E293F28743D76616C696461746F72732E6D61784E756D62657228652C612C73657474696E67732E6E756D6572696343686172616374657273292C733D7265706C6163654D736756617273287365744D73672873657474696E67732E6572726F72';
wwv_flow_api.g_varchar2_table(100) := '4D73672C226E756D62657220746F6F206C61726765202D206D61782E20263122292C6129293A28743D76616C696461746F72732E72616E67654E756D62657228652C692C612C73657474696E67732E6E756D6572696343686172616374657273292C733D';
wwv_flow_api.g_varchar2_table(101) := '7265706C6163654D736756617273287365744D73672873657474696E67732E6572726F724D73672C22696E76616C6964206E756D6265722073697A65202D206265747765656E20263120616E64202632206F6E6C7922292C692C6129292C217426267574';
wwv_flow_api.g_varchar2_table(102) := '696C2E676574436F6E646974696F6E526573756C742873657474696E67732E636F6E646974696F6E293F2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E6E756D62657253697A65436C6173732C223022';
wwv_flow_api.g_varchar2_table(103) := '292C73686F774D65737361676528746869732C7329293A2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E6E756D62657253697A65436C6173732C223122292C686964654D657373616765287468697329';
wwv_flow_api.g_varchar2_table(104) := '29297D66756E6374696F6E20746F74616C436865636B656448616E646C657228297B76617220742C732C653D242874686973292E66696E6428223A636865636B626F782C203A726164696F22293B616C6C6F7756616C69646174696F6E28746869732C63';
wwv_flow_api.g_varchar2_table(105) := '6F6E7374616E74732E746F74616C436865636B6564436C6173732926262876616C696461746F72732E6973456D7074792873657474696E67732E6D6178293F28743D76616C696461746F72732E6D696E436865636B28652C73657474696E67732E6D696E';
wwv_flow_api.g_varchar2_table(106) := '2C2130292C733D7265706C6163654D736756617273287365744D73672873657474696E67732E6572726F724D73672C22706C656173652073656C656374206174206C656173742026312063686F69636528732922292C73657474696E67732E6D696E2929';
wwv_flow_api.g_varchar2_table(107) := '3A76616C696461746F72732E6973456D7074792873657474696E67732E6D696E293F28743D76616C696461746F72732E6D6178436865636B28652C73657474696E67732E6D6178292C733D7265706C6163654D736756617273287365744D736728736574';
wwv_flow_api.g_varchar2_table(108) := '74696E67732E6572726F724D73672C22706C656173652073656C656374206E6F206D6F7265207468616E2026312063686F69636528732922292C73657474696E67732E6D617829293A28743D76616C696461746F72732E72616E6765436865636B28652C';
wwv_flow_api.g_varchar2_table(109) := '73657474696E67732E6D696E2C73657474696E67732E6D6178292C733D7265706C6163654D736756617273287365744D73672873657474696E67732E6572726F724D73672C22706C656173652073656C656374206265747765656E20263120616E642026';
wwv_flow_api.g_varchar2_table(110) := '322063686F69636528732922292C73657474696E67732E6D696E2C73657474696E67732E6D617829292C217426267574696C2E676574436F6E646974696F6E526573756C742873657474696E67732E636F6E646974696F6E293F2861646456616C696461';
wwv_flow_api.g_varchar2_table(111) := '74696F6E526573756C7428242874686973292C636F6E7374616E74732E746F74616C436865636B6564436C6173732C223022292C73686F774D65737361676528746869732C7329293A2861646456616C69646174696F6E526573756C7428242874686973';
wwv_flow_api.g_varchar2_table(112) := '292C636F6E7374616E74732E746F74616C436865636B6564436C6173732C223122292C686964654D65737361676528746869732929297D66756E6374696F6E20646174654F7264657248616E646C657228297B76617220742C732C653D7574696C2E6765';
wwv_flow_api.g_varchar2_table(113) := '74506167654974656D56616C75652873657474696E67732E6D696E292C693D7574696C2E676574506167654974656D56616C75652873657474696E67732E6D6178293B616C6C6F7756616C69646174696F6E28746869732C636F6E7374616E74732E6461';
wwv_flow_api.g_varchar2_table(114) := '74654F72646572436C61737329262676616C696461746F72732E6D696E4C656E67746828746869732E76616C75652C73657474696E67732E76616C69646174696F6E4D696E4C656E6774682926262876616C696461746F72732E6973456D707479287365';
wwv_flow_api.g_varchar2_table(115) := '7474696E67732E6D6178293F28743D76616C696461746F72732E6D696E4461746528746869732E76616C75652C652C73657474696E67732E64617465466F726D6174292C733D7265706C6163654D736756617273287365744D73672873657474696E6773';
wwv_flow_api.g_varchar2_table(116) := '2E6572726F724D73672C227468697320646174652073686F756C64206C696520616674657220263122292C6529293A76616C696461746F72732E6973456D7074792873657474696E67732E6D696E293F28743D76616C696461746F72732E6D6178446174';
wwv_flow_api.g_varchar2_table(117) := '6528746869732E76616C75652C692C73657474696E67732E64617465466F726D6174292C733D7265706C6163654D736756617273287365744D73672873657474696E67732E6572726F724D73672C227468697320646174652073686F756C64206C696520';
wwv_flow_api.g_varchar2_table(118) := '6265666F726520263122292C6929293A28743D76616C696461746F72732E72616E67654461746528746869732E76616C75652C652C692C73657474696E67732E64617465466F726D6174292C733D7265706C6163654D736756617273287365744D736728';
wwv_flow_api.g_varchar2_table(119) := '73657474696E67732E6572726F724D73672C227468697320646174652073686F756C64206C6965206265747765656E20263120616E6420263222292C652C6929292C217426267574696C2E676574436F6E646974696F6E526573756C742873657474696E';
wwv_flow_api.g_varchar2_table(120) := '67732E636F6E646974696F6E293F2861646456616C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E646174654F72646572436C6173732C223022292C73686F774D65737361676528746869732C7329293A286164645661';
wwv_flow_api.g_varchar2_table(121) := '6C69646174696F6E526573756C7428242874686973292C636F6E7374616E74732E646174654F72646572436C6173732C223122292C686964654D65737361676528746869732929297D66756E6374696F6E2073686F774D65737361676528742C73297B76';
wwv_flow_api.g_varchar2_table(122) := '617220653D242874292C693D273C7370616E20636C6173733D22272B636F6E7374616E74732E6572726F724D7367436C6173732B2220222B742E69642B27223E272B732B223C2F7370616E3E223B696628652E686173436C61737328636F6E7374616E74';
wwv_flow_api.g_varchar2_table(123) := '732E6974656D4572726F72436C61737329297B76617220613D2428227370616E2E222B636F6E7374616E74732E6572726F724D7367436C6173732B222E222B742E6964292C6E3D612E696E64657828292C723D652E696E64657828293B723E6E26267365';
wwv_flow_api.g_varchar2_table(124) := '7474696E67732E6572726F724D73674C6F636174696F6E3D3D3D226265666F7265223F612E746578742873293A723E6E262673657474696E67732E6572726F724D73674C6F636174696F6E3D3D3D226166746572223F28612E72656D6F766528292C652E';
wwv_flow_api.g_varchar2_table(125) := '6166746572286929293A6E3E72262673657474696E67732E6572726F724D73674C6F636174696F6E3D3D3D226166746572223F612E746578742873293A28612E72656D6F766528292C652E6265666F7265286929297D656C736520652E616464436C6173';
wwv_flow_api.g_varchar2_table(126) := '7328636F6E7374616E74732E6974656D4572726F72436C617373292C2428225B666F723D222B742E69642B225D22292E616464436C61737328636F6E7374616E74732E6C6162656C4572726F72436C617373292C73657474696E67732E6572726F724D73';
wwv_flow_api.g_varchar2_table(127) := '674C6F636174696F6E3D3D3D226265666F7265223F652E6265666F72652869293A652E61667465722869297D66756E6374696F6E20686964654D6573736167652874297B76617220733D242874293B732E686173436C61737328636F6E7374616E74732E';
wwv_flow_api.g_varchar2_table(128) := '6974656D4572726F72436C61737329262628732E72656D6F7665436C61737328636F6E7374616E74732E6974656D4572726F72436C617373292C2428225B666F723D222B742E69642B225D22292E72656D6F7665436C61737328636F6E7374616E74732E';
wwv_flow_api.g_varchar2_table(129) := '6C6162656C4572726F72436C617373292C2428227370616E2E222B636F6E7374616E74732E6572726F724D7367436C6173732B222E222B742E6964292E72656D6F76652829297D66756E6374696F6E207365744D736728742C73297B72657475726E2076';
wwv_flow_api.g_varchar2_table(130) := '616C696461746F72732E6973456D7074792874293F733A747D66756E6374696F6E207265706C6163654D7367566172732874297B666F722876617220733D742C653D312C693D617267756D656E74732E6C656E6774683B693E653B652B2B29733D732E72';
wwv_flow_api.g_varchar2_table(131) := '65706C616365282226222B652C617267756D656E74735B655D293B72657475726E20737D66756E6374696F6E20616C6C6F7756616C69646174696F6E28742C73297B76617220653D21302C693D242874292C613D692E6461746128636F6E7374616E7473';
wwv_flow_api.g_varchar2_table(132) := '2E76616C69646174696F6E526573756C7473293B72657475726E2061213D3D766F69642030262628612E696E6465784F662873293D3D3D2D313F242E6561636828612E73706C697428222022292C66756E6374696F6E28742C73297B653D3D3D21302626';
wwv_flow_api.g_varchar2_table(133) := '732E736C696365282D3129213D3D223122262628653D2131297D293A692E72656D6F76654461746128636F6E7374616E74732E76616C69646174696F6E526573756C747329292C657D66756E6374696F6E2061646456616C69646174696F6E526573756C';
wwv_flow_api.g_varchar2_table(134) := '7428742C732C65297B76617220693D242874292C613D692E6461746128636F6E7374616E74732E76616C69646174696F6E526573756C7473292C6E3D21312C723D732B223A222B653B61213D3D766F696420303F28242E6561636828612E73706C697428';
wwv_flow_api.g_varchar2_table(135) := '222022292C66756E6374696F6E28742C72297B696628722E73756273747228302C722E696E6465784F6628223A2229293D3D3D73297B766172206C3D612E696E6465784F662872292B722E6C656E6774682D313B613D7574696C2E7265706C6163654368';
wwv_flow_api.g_varchar2_table(136) := '6172496E537472696E6728612C6C2C65292C692E6461746128636F6E7374616E74732E76616C69646174696F6E526573756C74732C61292C6E3D21307D7D292C6E7C7C692E6461746128636F6E7374616E74732E76616C69646174696F6E526573756C74';
wwv_flow_api.g_varchar2_table(137) := '732C612B2220222B7229293A692E6461746128636F6E7374616E74732E76616C69646174696F6E526573756C74732C72292C653D3D3D2231223F2873657474696E67732E6974656D537563636573732E63616C6C2874686973292C692E74726967676572';
wwv_flow_api.g_varchar2_table(138) := '2822616C766974656D737563636573732229293A2873657474696E67732E6974656D4661696C2E63616C6C2874686973292C692E747269676765722822616C766974656D6661696C2229297D66756E6374696F6E20666F726D4861734572726F72732874';
wwv_flow_api.g_varchar2_table(139) := '297B76617220732C653D21312C693D242874292E66696E642822696E7075742C2074657874617265612C2073656C6563742C206669656C6473657422293B72657475726E20242E6561636828692C66756E6374696F6E28297B733D242874686973292C73';
wwv_flow_api.g_varchar2_table(140) := '2E6461746128636F6E7374616E74732E76616C69646174696F6E4576656E747329213D3D766F696420302626242E6561636828732E6461746128636F6E7374616E74732E76616C69646174696F6E4576656E7473292E73706C697428222022292C66756E';
wwv_flow_api.g_varchar2_table(141) := '6374696F6E28742C65297B732E747269676765722865297D297D292C692E686173436C61737328636F6E7374616E74732E6974656D4572726F72436C61737329262628242869292E66696C74657228222E222B636F6E7374616E74732E6974656D457272';
wwv_flow_api.g_varchar2_table(142) := '6F72436C617373292E666972737428292E666F63757328292C653D2130292C657D66756E6374696F6E2076616C6964617465466F726D4265666F72655375626D69742870466972696E67456C656D297B76617220666972696E67456C656D3D2428704669';
wwv_flow_api.g_varchar2_table(143) := '72696E67456C656D292C6F726967436C69636B4576656E742C6669784572726F72734D73673D7365744D73672873657474696E67732E6572726F724D73672C22506C656173652066697820616C6C206572726F7273206265666F726520636F6E74696E75';
wwv_flow_api.g_varchar2_table(144) := '696E6722292C626F6479456C656D3D242822626F647922292C6D657373616765426F7849643D2223616C762D6D73672D626F78222C6D7367426F783D273C64697620636C6173733D22616C762D616C6572742D6D7367223E3C6120687265663D22232220';
wwv_flow_api.g_varchar2_table(145) := '636C6173733D22616C762D636C6F736522206F6E636C69636B3D2224285C27272B6D657373616765426F7849642B2227292E6368696C6472656E28292E666164654F757428293B72657475726E2066616C73653B5C223E783C2F613E3C703E222B666978';
wwv_flow_api.g_varchar2_table(146) := '4572726F72734D73672B223C2F703E3C2F6469763E223B666972696E67456C656D2E6C656E677468262628666972696E67456C656D2E70726F7028227461674E616D6522293D3D3D2241223F286F726967436C69636B4576656E743D666972696E67456C';
wwv_flow_api.g_varchar2_table(147) := '656D2E6174747228226872656622292C666972696E67456C656D2E6461746128636F6E7374616E74732E6F726967436C69636B4576656E742C6F726967436C69636B4576656E74292C666972696E67456C656D2E72656D6F766541747472282268726566';
wwv_flow_api.g_varchar2_table(148) := '2229293A286F726967436C69636B4576656E743D666972696E67456C656D2E6174747228226F6E636C69636B22292C666972696E67456C656D2E6461746128636F6E7374616E74732E6F726967436C69636B4576656E742C6F726967436C69636B457665';
wwv_flow_api.g_varchar2_table(149) := '6E74292C666972696E67456C656D2E72656D6F76654174747228226F6E636C69636B2229292C626F6479456C656D2E64656C6567617465282223222B666972696E67456C656D2E617474722822696422292C22636C69636B222C66756E6374696F6E2829';
wwv_flow_api.g_varchar2_table(150) := '7B666F726D4861734572726F72732873657474696E67732E666F726D73546F5375626D6974293F2873657474696E67732E666F726D4661696C2E63616C6C2874686973292C666972696E67456C656D2E747269676765722822616C76666F726D6661696C';
wwv_flow_api.g_varchar2_table(151) := '22292C24286D657373616765426F784964292E6C656E6774687C7C626F6479456C656D2E617070656E6428273C6469762069643D22272B6D657373616765426F7849642E737562737472696E672831292B27223E3C2F6469763E27292C24286D65737361';
wwv_flow_api.g_varchar2_table(152) := '6765426F784964292E68746D6C286D7367426F7829293A2873657474696E67732E666F726D537563636573732E63616C6C2874686973292C666972696E67456C656D2E747269676765722822616C76666F726D7375636365737322292C6576616C282428';
wwv_flow_api.g_varchar2_table(153) := '74686973292E6461746128636F6E7374616E74732E6F726967436C69636B4576656E742929297D29297D76617220636F6E7374616E74733D7B706C7567696E49643A2262652E6374622E6A712E616C76222C706C7567696E4E616D653A2241504558204C';
wwv_flow_api.g_varchar2_table(154) := '6976652056616C69646174696F6E222C706C7567696E5072656669783A22616C76222C61706578436865636B626F78436C6173733A22636865636B626F785F67726F7570222C61706578526164696F436C6173733A22726164696F5F67726F7570222C61';
wwv_flow_api.g_varchar2_table(155) := '70657853687574746C65436C6173733A2273687574746C65222C61706578446174657069636B6572436C6173733A22646174657069636B6572227D3B242E657874656E6428636F6E7374616E74732C7B76616C69646174696F6E4576656E74733A636F6E';
wwv_flow_api.g_varchar2_table(156) := '7374616E74732E706C7567696E5072656669782B222D76616C4576656E7473222C76616C69646174696F6E526573756C74733A636F6E7374616E74732E706C7567696E5072656669782B222D76616C526573756C7473222C6F726967436C69636B457665';
wwv_flow_api.g_varchar2_table(157) := '6E743A636F6E7374616E74732E706C7567696E5072656669782B222D6F726967436C69636B4576656E74222C6E6F74456D707479436C6173733A636F6E7374616E74732E706C7567696E5072656669782B222D6E6F74456D707479222C6974656D547970';
wwv_flow_api.g_varchar2_table(158) := '65436C6173733A636F6E7374616E74732E706C7567696E5072656669782B222D6974656D54797065222C657175616C436C6173733A636F6E7374616E74732E706C7567696E5072656669782B222D657175616C222C7265676578436C6173733A636F6E73';
wwv_flow_api.g_varchar2_table(159) := '74616E74732E706C7567696E5072656669782B222D7265676578222C636861724C656E677468436C6173733A636F6E7374616E74732E706C7567696E5072656669782B222D636861724C656E677468222C6E756D62657253697A65436C6173733A636F6E';
wwv_flow_api.g_varchar2_table(160) := '7374616E74732E706C7567696E5072656669782B222D6E756D62657253697A65222C646174654F72646572436C6173733A636F6E7374616E74732E706C7567696E5072656669782B222D646174654F72646572222C746F74616C436865636B6564436C61';
wwv_flow_api.g_varchar2_table(161) := '73733A636F6E7374616E74732E706C7567696E5072656669782B222D746F74616C436865636B6564222C6974656D4572726F72436C6173733A636F6E7374616E74732E706C7567696E5072656669782B222D6974656D2D6572726F72222C6C6162656C45';
wwv_flow_api.g_varchar2_table(162) := '72726F72436C6173733A636F6E7374616E74732E706C7567696E5072656669782B222D6C6162656C2D6572726F72222C6572726F724D7367436C6173733A636F6E7374616E74732E706C7567696E5072656669782B222D6572726F722D6D7367227D293B';
wwv_flow_api.g_varchar2_table(163) := '7661722073657474696E67733D7B76616C69646174653A226E6F74456D707479222C74726967676572696E674576656E743A22626C7572222C636F6E646974696F6E3A22222C76616C69646174696F6E4D696E4C656E6774683A302C6572726F724D7367';
wwv_flow_api.g_varchar2_table(164) := '3A22222C6572726F724D73674C6F636174696F6E3A226166746572222C616C6C6F77576869746573706163653A21302C6974656D547970653A22222C64617465466F726D61743A22222C6E756D65726963436861726163746572733A22222C6D696E3A22';
wwv_flow_api.g_varchar2_table(165) := '222C6D61783A22222C657175616C3A22222C72656765783A22222C666F726D73546F5375626D69743A22222C6974656D537563636573733A66756E6374696F6E28297B7D2C6974656D4661696C3A66756E6374696F6E28297B7D2C666F726D5375636365';
wwv_flow_api.g_varchar2_table(166) := '73733A66756E6374696F6E28297B7D2C666F726D4661696C3A66756E6374696F6E28297B7D7D2C6D6574686F64733D7B696E69743A66756E6374696F6E2874297B76617220733D242874686973293B62696E6453657474696E677328732C74292C696E69';
wwv_flow_api.g_varchar2_table(167) := '742873297D2C76616C6964617465466F726D3A66756E6374696F6E2874297B76617220733D242874686973293B62696E6453657474696E677328732C74292C76616C6964617465466F726D4265666F72655375626D69742873297D2C72656D6F76653A66';
wwv_flow_api.g_varchar2_table(168) := '756E6374696F6E28297B76617220743D242874686973293B726573746F7265506C7567696E53657474696E677328742926266D6574686F6428297D7D3B72657475726E20242874686973292E656163682866756E6374696F6E28297B72657475726E206D';
wwv_flow_api.g_varchar2_table(169) := '6574686F64735B6D6574686F645D3F6D6574686F64735B6D6574686F645D2E63616C6C28242874686973292C6F7074696F6E73293A747970656F66206D6574686F64213D226F626A6563742226266D6574686F643F28242E6572726F7228224D6574686F';
wwv_flow_api.g_varchar2_table(170) := '6420222B6D6574686F642B2220646F6573206E6F74206578697374206F6E206A51756572792E20222B636F6E7374616E74732E706C7567696E4E616D65292C2131293A6D6574686F64732E696E69742E63616C6C28242874686973292C6D6574686F6429';
wwv_flow_api.g_varchar2_table(171) := '7D297D7D286A51756572792C616C762E7574696C2C616C762E76616C696461746F727329';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(17664391275244530)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_file_name=>'jquery.alv.js'
,p_mime_type=>'application/javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A20696E6C696E65202A2F0A696E7075742E616C762D6974656D2D6572726F722C0A74657874617265612E616C762D6974656D2D6572726F722C0A73656C6563742E616C762D6974656D2D6572726F72207B0A20202020626F726465723A2031707820';
wwv_flow_api.g_varchar2_table(2) := '736F6C696420236239346134383B0A202020206261636B67726F756E642D636F6C6F723A20236635656165613B0A7D0A0A2E616C762D6C6162656C2D6572726F72207B0A20202020636F6C6F723A20236239346134383B0A7D0A0A2E616C762D6572726F';
wwv_flow_api.g_varchar2_table(3) := '722D6D7367207B0A20202020646973706C61793A20626C6F636B3B0A20202020636F6C6F723A20236239346134383B0A20202020666F6E742D73697A653A20313370783B0A202020206C696E652D6865696768743A20323070783B0A7D0A0A2F2A206E6F';
wwv_flow_api.g_varchar2_table(4) := '74696669636174696F6E202A2F0A23616C762D6D73672D626F78207B0A20202020706F736974696F6E3A2066697865643B0A20202020746F703A20303B0A202020206C6566743A203530253B0A2020202077696474683A2036303070783B0A202020206D';
wwv_flow_api.g_varchar2_table(5) := '617267696E2D6C6566743A202D33303070783B0A202020206D696E2D6865696768743A20303B0A20202020626F726465723A20303B0A202020207A2D696E6465783A20393939393B0A7D0A0A2E616C762D616C6572742D6D7367207B0A20202020626163';
wwv_flow_api.g_varchar2_table(6) := '6B67726F756E642D636F6C6F723A20236632646564653B0A20202020636F6C6F723A20236239346134383B0A20202020746578742D736861646F773A20302031707820302072676261283235352C203235352C203235352C20302E35293B0A2020202062';
wwv_flow_api.g_varchar2_table(7) := '6F726465723A2031707820736F6C696420236565643364373B0A2020202070616464696E673A20313470782033357078203134707820313470783B0A202020202D7765626B69742D626F726465722D7261646975733A2030203020347078203470783B0A';
wwv_flow_api.g_varchar2_table(8) := '202020202D6D6F7A2D626F726465722D7261646975733A2030203020347078203470783B0A20202020626F726465722D7261646975733A2030203020347078203470783B0A20202020626F782D736861646F773A20302032707820357078207267626128';
wwv_flow_api.g_varchar2_table(9) := '302C20302C20302C20302E31293B0A7D0A0A2E616C762D636C6F7365207B0A20202020666C6F61743A2072696768743B0A20202020706F736974696F6E3A2072656C61746976653B0A20202020746F703A202D3270783B0A2020202072696768743A202D';
wwv_flow_api.g_varchar2_table(10) := '323170783B0A20202020666F6E742D73697A653A20313670783B0A20202020666F6E742D7765696768743A20626F6C643B0A202020206C696E652D6865696768743A20323070783B0A20202020636F6C6F723A20233030303030303B0A20202020746578';
wwv_flow_api.g_varchar2_table(11) := '742D6465636F726174696F6E3A206E6F6E653B0A20202020746578742D736861646F773A203020317078203020236666666666663B0A202020206F7061636974793A202E323B0A2020202066696C7465723A20616C706861286F7061636974793D323029';
wwv_flow_api.g_varchar2_table(12) := '3B0A7D0A0A2E616C762D636C6F73653A686F766572207B0A20202020636F6C6F723A20233030303030303B0A20202020746578742D6465636F726174696F6E3A206E6F6E653B0A202020206F7061636974793A202E353B0A2020202066696C7465723A20';
wwv_flow_api.g_varchar2_table(13) := '616C706861286F7061636974793D3530293B0A7D0A0A2E616C762D616C6572742D6D73672070207B0A20202020666F6E742D73697A653A20313670783B0A20202020666F6E742D7765696768743A20626F6C643B0A202020206C696E652D686569676874';
wwv_flow_api.g_varchar2_table(14) := '3A20323070783B0A202020206D617267696E3A20303B0A7D0A0A406D6564696120286D61782D77696474683A20393739707829207B0A2020202023616C762D6D73672D626F78207B0A202020202020202077696474683A2034303070783B0A2020202020';
wwv_flow_api.g_varchar2_table(15) := '2020206D617267696E2D6C6566743A202D32303070783B0A202020207D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(34818301398508634)
,p_plugin_id=>wwv_flow_api.id(32656238987998412)
,p_file_name=>'style.alv.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/be_ctb_alertify
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(27902094145958200569)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'BE.CTB.ALERTIFY'
,p_display_name=>'Alertify'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','BE.CTB.ALERTIFY'),'')
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render(p_dynamic_action in apex_plugin.t_dynamic_action',
'              , p_plugin         in apex_plugin.t_plugin)',
'return apex_plugin.t_dynamic_action_render_result is',
'  l_theme                varchar2(4000) := p_plugin.attribute_01;',
'  l_def_ok_btn_label     varchar2(4000) := p_plugin.attribute_02;',
'  l_def_cancel_btn_label varchar2(4000) := p_plugin.attribute_03;',
'',
'  l_message_type       varchar2(4000) := p_dynamic_action.attribute_01;',
'  l_dialog_type        varchar2(4000) := p_dynamic_action.attribute_02;',
'  l_notification_type  varchar2(4000) := p_dynamic_action.attribute_03;',
'  l_message            varchar2(4000) := p_dynamic_action.attribute_04;',
'  l_default_value      varchar2(4000) := p_dynamic_action.attribute_05;',
'  l_return_into_item   varchar2(4000) := p_dynamic_action.attribute_06;',
'  l_ok_btn_label       varchar2(4000) := p_dynamic_action.attribute_07;',
'  l_cancel_btn_label   varchar2(4000) := p_dynamic_action.attribute_08;',
'  l_btn_order          varchar2(4000) := p_dynamic_action.attribute_09;',
'  l_btn_focus          varchar2(4000) := p_dynamic_action.attribute_10;',
'  l_notification_delay varchar2(4000) := p_dynamic_action.attribute_11;',
'',
'  l_function_call varchar2(4000);',
'  l_render_result apex_plugin.t_dynamic_action_render_result;',
'',
'',
'  function get_properties',
'  return varchar2 is',
'    l_ok_label     varchar2(4000);',
'    l_cancel_label varchar2(4000);',
'    l_props        varchar2(32767);',
'  begin',
'    l_ok_label := nvl(l_ok_btn_label, nvl(l_def_ok_btn_label, ''OK''));',
'    l_cancel_label := nvl(l_cancel_btn_label, nvl(l_def_cancel_btn_label, ''Cancel''));',
'',
'    l_props := ''alertify.set({labels:{ok:"'' || l_ok_label || ''",cancel:"'' || l_cancel_label || ''"},'';',
'',
'    if (l_dialog_type = ''ALERT'') then',
'      l_props := l_props || ''buttonReverse:false,buttonFocus:"ok"'';',
'    else',
'      if (l_btn_order = ''REVERSE'') then',
'        l_props := l_props || ''buttonReverse:true,'';',
'      else',
'        l_props := l_props || ''buttonReverse:false,'';',
'      end if;',
'',
'      if (l_btn_focus = ''OK'') then',
'        l_props := l_props || ''buttonFocus:"ok"'';',
'      elsif (l_btn_focus = ''CANCEL'') then',
'        l_props := l_props || ''buttonFocus:"cancel"'';',
'      else',
'        l_props := l_props || ''buttonFocus:"none"'';',
'      end if;',
'    end if;',
'',
'    l_props := l_props || ''});'';',
'',
'    return l_props;',
'  end get_properties;',
'begin',
'  if (apex_application.g_debug) then',
'    apex_plugin_util.debug_dynamic_action(p_plugin, p_dynamic_action);',
'  end if;',
'',
'  apex_javascript.add_library(',
'    p_name      => ''alertify.min'',',
'    p_directory => p_plugin.file_prefix,',
'    p_version   => null',
'  );',
'  apex_javascript.add_library(',
'    p_name      => ''apex.alertify'',',
'    p_directory => p_plugin.file_prefix,',
'    p_version   => null',
'  );',
'  apex_css.add_file(',
'    p_name      => ''alertify.core'',',
'    p_directory => p_plugin.file_prefix,',
'    p_version   => null',
'  );',
'  if (l_theme = ''DEFAULT'') then',
'    apex_css.add_file(',
'      p_name      => ''alertify.default'',',
'      p_directory => p_plugin.file_prefix,',
'      p_version   => null',
'    );',
'  else',
'    apex_css.add_file(',
'      p_name      => ''alertify.bootstrap'',',
'      p_directory => p_plugin.file_prefix,',
'      p_version   => null',
'    );',
'  end if;',
'',
'  l_render_result.attribute_03 := l_notification_type;',
'  l_render_result.attribute_04 := l_message;',
'  l_render_result.attribute_05 := l_default_value;',
'  l_render_result.attribute_06 := l_return_into_item;',
'  l_render_result.attribute_11 := nvl(l_notification_delay, 5000);',
'',
'  if (l_message_type = ''DIALOG'') then',
'    if (l_dialog_type = ''ALERT'') then',
'      l_function_call := ''beCtbAlertify.dialog.alert(this);'';',
'    elsif (l_dialog_type = ''CONFIRM'') then',
'      l_function_call := ''beCtbAlertify.dialog.confirm(this);'';',
'    else',
'      l_function_call := ''beCtbAlertify.dialog.prompt(this);'';',
'    end if;',
'    l_render_result.javascript_function := ''function() {'' || get_properties || '' '' || l_function_call || ''}'';',
'  else',
'    l_function_call := ''beCtbAlertify.notification.log(this);'';',
'    l_render_result.javascript_function := ''function() {'' || l_function_call || ''}'';',
'  end if;',
'',
'  return l_render_result;',
'end render;'))
,p_render_function=>'render'
,p_standard_attributes=>'ONLOAD:WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'http://apex.oracle.com/pls/apex/f?p=64237:30'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27902171153925147481)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Theme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'DEFAULT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902172951984148440)
,p_plugin_attribute_id=>wwv_flow_api.id(27902171153925147481)
,p_display_sequence=>10
,p_display_value=>'Default'
,p_return_value=>'DEFAULT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902214849397149644)
,p_plugin_attribute_id=>wwv_flow_api.id(27902171153925147481)
,p_display_sequence=>20
,p_display_value=>'Twitter Bootstrap'
,p_return_value=>'BOOTSTRAP'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27918467550631611288)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'OK Button Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>15
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27918490845455613648)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Cancel Button Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>15
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27902271938614154599)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Message Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'DIALOG'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902276134300156634)
,p_plugin_attribute_id=>wwv_flow_api.id(27902271938614154599)
,p_display_sequence=>10
,p_display_value=>'Dialog'
,p_return_value=>'DIALOG'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902285131928157679)
,p_plugin_attribute_id=>wwv_flow_api.id(27902271938614154599)
,p_display_sequence=>20
,p_display_value=>'Notification'
,p_return_value=>'NOTIFICATION'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27902407353913162694)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Dialog Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ALERT'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(27902271938614154599)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'DIALOG'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902413952403163453)
,p_plugin_attribute_id=>wwv_flow_api.id(27902407353913162694)
,p_display_sequence=>10
,p_display_value=>'Alert'
,p_return_value=>'ALERT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902416650247164407)
,p_plugin_attribute_id=>wwv_flow_api.id(27902407353913162694)
,p_display_sequence=>20
,p_display_value=>'Confirm'
,p_return_value=>'CONFIRM'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902480047443165743)
,p_plugin_attribute_id=>wwv_flow_api.id(27902407353913162694)
,p_display_sequence=>30
,p_display_value=>'Prompt'
,p_return_value=>'PROMPT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27902487137092170505)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Notification Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'STANDARD'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(27902271938614154599)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'NOTIFICATION'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902174935366235879)
,p_plugin_attribute_id=>wwv_flow_api.id(27902487137092170505)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STANDARD'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902490733425172187)
,p_plugin_attribute_id=>wwv_flow_api.id(27902487137092170505)
,p_display_sequence=>20
,p_display_value=>'Success'
,p_return_value=>'SUCCESS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27902497031700173041)
,p_plugin_attribute_id=>wwv_flow_api.id(27902487137092170505)
,p_display_sequence=>30
,p_display_value=>'Error'
,p_return_value=>'ERROR'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27902508949588179868)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>The following substitution syntax is available:</p>',
'',
'<ul>',
'  <li>Static substitution: replaces a placeholder during rendering of the page - e.g. &amp;P30_PROMPT_RESULT.</li>',
'  <li>Dynamic substitution: replaces a placeholder with the current value of the browser - e.g. #P30_PROMPT_RESULT#</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27902558139020249380)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Default Value'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(27902407353913162694)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PROMPT'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>The following substitution syntax is available:</p>',
'',
'<ul>',
'  <li>Static substitution: replaces a placeholder during rendering of the page - e.g. &amp;P30_PROMPT_RESULT.</li>',
'  <li>Dynamic substitution: replaces a placeholder with the current value of the browser - e.g. #P30_PROMPT_RESULT#</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27902826143105198074)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Return Value Into Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(27902407353913162694)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PROMPT'
,p_help_text=>'The value entered in the prompt box will be returned in the item you select.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27903107959699205597)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'OK Button Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>15
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(27902271938614154599)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'DIALOG'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27903192953660208396)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Cancel Button Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>15
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(27902407353913162694)
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'ALERT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27903202454295223262)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Button Order'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'DEFAULT'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(27902407353913162694)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'CONFIRM,PROMPT'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27903253262465314420)
,p_plugin_attribute_id=>wwv_flow_api.id(27903202454295223262)
,p_display_sequence=>10
,p_display_value=>'Cancel - OK'
,p_return_value=>'DEFAULT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27903258359662315696)
,p_plugin_attribute_id=>wwv_flow_api.id(27903202454295223262)
,p_display_sequence=>20
,p_display_value=>'OK - Cancel'
,p_return_value=>'REVERSE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27903305237880325817)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Button Focus'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'OK'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(27902407353913162694)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'CONFIRM,PROMPT'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27903422036586326488)
,p_plugin_attribute_id=>wwv_flow_api.id(27903305237880325817)
,p_display_sequence=>10
,p_display_value=>'OK'
,p_return_value=>'OK'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27903422735076327115)
,p_plugin_attribute_id=>wwv_flow_api.id(27903305237880325817)
,p_display_sequence=>20
,p_display_value=>'Cancel'
,p_return_value=>'CANCEL'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(27903435431626264197)
,p_plugin_attribute_id=>wwv_flow_api.id(27903305237880325817)
,p_display_sequence=>30
,p_display_value=>'None'
,p_return_value=>'NONE'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(27903466544553337948)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Delay in Milliseconds'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>10
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(27902271938614154599)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'NOTIFICATION'
,p_help_text=>'The default delay is 5000 milliseconds. Enter 0 if you want to display a sticky notification.'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2120616C657274696679202D2076302E332E3130202D20323031332D30372D3036202A2F0A2166756E6374696F6E28612C62297B2275736520737472696374223B76617220632C643D612E646F63756D656E743B633D66756E6374696F6E28297B76';
wwv_flow_api.g_varchar2_table(2) := '617220632C652C662C672C682C692C6A2C6B2C6C2C6D2C6E2C6F2C703D7B7D2C713D7B7D2C723D21312C733D7B454E5445523A31332C4553433A32372C53504143453A33327D2C743D5B5D3B72657475726E20713D7B627574746F6E733A7B686F6C6465';
wwv_flow_api.g_varchar2_table(3) := '723A273C6E617620636C6173733D22616C6572746966792D627574746F6E73223E7B7B627574746F6E737D7D3C2F6E61763E272C7375626D69743A273C627574746F6E20747970653D227375626D69742220636C6173733D22616C6572746966792D6275';
wwv_flow_api.g_varchar2_table(4) := '74746F6E20616C6572746966792D627574746F6E2D6F6B222069643D22616C6572746966792D6F6B223E7B7B6F6B7D7D3C2F627574746F6E3E272C6F6B3A273C627574746F6E20636C6173733D22616C6572746966792D627574746F6E20616C65727469';
wwv_flow_api.g_varchar2_table(5) := '66792D627574746F6E2D6F6B222069643D22616C6572746966792D6F6B223E7B7B6F6B7D7D3C2F627574746F6E3E272C63616E63656C3A273C627574746F6E20636C6173733D22616C6572746966792D627574746F6E20616C6572746966792D62757474';
wwv_flow_api.g_varchar2_table(6) := '6F6E2D63616E63656C222069643D22616C6572746966792D63616E63656C223E7B7B63616E63656C7D7D3C2F627574746F6E3E277D2C696E7075743A273C64697620636C6173733D22616C6572746966792D746578742D77726170706572223E3C696E70';
wwv_flow_api.g_varchar2_table(7) := '757420747970653D22746578742220636C6173733D22616C6572746966792D74657874222069643D22616C6572746966792D74657874223E3C2F6469763E272C6D6573736167653A273C7020636C6173733D22616C6572746966792D6D65737361676522';
wwv_flow_api.g_varchar2_table(8) := '3E7B7B6D6573736167657D7D3C2F703E272C6C6F673A273C61727469636C6520636C6173733D22616C6572746966792D6C6F677B7B636C6173737D7D223E7B7B6D6573736167657D7D3C2F61727469636C653E277D2C6F3D66756E6374696F6E28297B76';
wwv_flow_api.g_varchar2_table(9) := '617220612C632C653D21312C663D642E637265617465456C656D656E74282266616B65656C656D656E7422292C673D7B5765626B69745472616E736974696F6E3A227765626B69745472616E736974696F6E456E64222C4D6F7A5472616E736974696F6E';
wwv_flow_api.g_varchar2_table(10) := '3A227472616E736974696F6E656E64222C4F5472616E736974696F6E3A226F7472616E736974696F6E656E64222C7472616E736974696F6E3A227472616E736974696F6E656E64227D3B666F72286120696E206729696628662E7374796C655B615D213D';
wwv_flow_api.g_varchar2_table(11) := '3D62297B633D675B615D2C653D21303B627265616B7D72657475726E7B747970653A632C737570706F727465643A657D7D2C633D66756E6374696F6E2861297B72657475726E20642E676574456C656D656E74427949642861297D2C703D7B6C6162656C';
wwv_flow_api.g_varchar2_table(12) := '733A7B6F6B3A224F4B222C63616E63656C3A2243616E63656C227D2C64656C61793A3565332C627574746F6E526576657273653A21312C627574746F6E466F6375733A226F6B222C7472616E736974696F6E3A622C6164644C697374656E6572733A6675';
wwv_flow_api.g_varchar2_table(13) := '6E6374696F6E2861297B76617220622C632C682C692C6A2C6B3D22756E646566696E656422213D747970656F6620662C6C3D22756E646566696E656422213D747970656F6620652C6F3D22756E646566696E656422213D747970656F66206E2C703D2222';
wwv_flow_api.g_varchar2_table(14) := '2C713D746869733B623D66756E6374696F6E2862297B72657475726E22756E646566696E656422213D747970656F6620622E70726576656E7444656661756C742626622E70726576656E7444656661756C7428292C682862292C22756E646566696E6564';
wwv_flow_api.g_varchar2_table(15) := '22213D747970656F66206E262628703D6E2E76616C7565292C2266756E6374696F6E223D3D747970656F66206126262822756E646566696E656422213D747970656F66206E3F612821302C70293A6128213029292C21317D2C633D66756E6374696F6E28';
wwv_flow_api.g_varchar2_table(16) := '62297B72657475726E22756E646566696E656422213D747970656F6620622E70726576656E7444656661756C742626622E70726576656E7444656661756C7428292C682862292C2266756E6374696F6E223D3D747970656F662061262661282131292C21';
wwv_flow_api.g_varchar2_table(17) := '317D2C683D66756E6374696F6E28297B712E6869646528292C712E756E62696E6428642E626F64792C226B65797570222C69292C712E756E62696E6428672C22666F637573222C6A292C6F2626712E756E62696E64286D2C227375626D6974222C62292C';
wwv_flow_api.g_varchar2_table(18) := '6B2626712E756E62696E6428662C22636C69636B222C62292C6C2626712E756E62696E6428652C22636C69636B222C63297D2C693D66756E6374696F6E2861297B76617220643D612E6B6579436F64653B64213D3D732E53504143457C7C6F7C7C622861';
wwv_flow_api.g_varchar2_table(19) := '292C643D3D3D732E45534326266C2626632861297D2C6A3D66756E6374696F6E28297B6F3F6E2E666F63757328293A216C7C7C712E627574746F6E526576657273653F662E666F63757328293A652E666F63757328297D2C746869732E62696E6428672C';
wwv_flow_api.g_varchar2_table(20) := '22666F637573222C6A292C6B2626746869732E62696E6428662C22636C69636B222C62292C6C2626746869732E62696E6428652C22636C69636B222C63292C746869732E62696E6428642E626F64792C226B65797570222C69292C6F2626746869732E62';
wwv_flow_api.g_varchar2_table(21) := '696E64286D2C227375626D6974222C62292C746869732E7472616E736974696F6E2E737570706F727465647C7C746869732E736574466F63757328297D2C62696E643A66756E6374696F6E28612C622C63297B2266756E6374696F6E223D3D747970656F';
wwv_flow_api.g_varchar2_table(22) := '6620612E6164644576656E744C697374656E65723F612E6164644576656E744C697374656E657228622C632C2131293A612E6174746163684576656E742626612E6174746163684576656E7428226F6E222B622C63297D2C68616E646C654572726F7273';
wwv_flow_api.g_varchar2_table(23) := '3A66756E6374696F6E28297B69662822756E646566696E656422213D747970656F6620612E6F6E6572726F72297B76617220623D746869733B72657475726E20612E6F6E6572726F723D66756E6374696F6E28612C632C64297B622E6572726F7228225B';
wwv_flow_api.g_varchar2_table(24) := '222B612B22206F6E206C696E6520222B642B22206F6620222B632B225D222C30297D2C21307D72657475726E21317D2C617070656E64427574746F6E733A66756E6374696F6E28612C62297B72657475726E20746869732E627574746F6E526576657273';
wwv_flow_api.g_varchar2_table(25) := '653F622B613A612B627D2C6275696C643A66756E6374696F6E2861297B76617220623D22222C633D612E747970652C643D612E6D6573736167652C653D612E637373436C6173737C7C22223B73776974636828622B3D273C64697620636C6173733D2261';
wwv_flow_api.g_varchar2_table(26) := '6C6572746966792D6469616C6F67223E272C226E6F6E65223D3D3D702E627574746F6E466F637573262628622B3D273C6120687265663D2223222069643D22616C6572746966792D6E6F6E65466F6375732220636C6173733D22616C6572746966792D68';
wwv_flow_api.g_varchar2_table(27) := '696464656E223E3C2F613E27292C2270726F6D7074223D3D3D63262628622B3D273C666F726D2069643D22616C6572746966792D666F726D223E27292C622B3D273C61727469636C6520636C6173733D22616C6572746966792D696E6E6572223E272C62';
wwv_flow_api.g_varchar2_table(28) := '2B3D712E6D6573736167652E7265706C61636528227B7B6D6573736167657D7D222C64292C2270726F6D7074223D3D3D63262628622B3D712E696E707574292C622B3D712E627574746F6E732E686F6C6465722C622B3D223C2F61727469636C653E222C';
wwv_flow_api.g_varchar2_table(29) := '2270726F6D7074223D3D3D63262628622B3D223C2F666F726D3E22292C622B3D273C612069643D22616C6572746966792D7265736574466F6375732220636C6173733D22616C6572746966792D7265736574466F6375732220687265663D2223223E5265';
wwv_flow_api.g_varchar2_table(30) := '73657420466F6375733C2F613E272C622B3D223C2F6469763E222C63297B6361736522636F6E6669726D223A623D622E7265706C61636528227B7B627574746F6E737D7D222C746869732E617070656E64427574746F6E7328712E627574746F6E732E63';
wwv_flow_api.g_varchar2_table(31) := '616E63656C2C712E627574746F6E732E6F6B29292C623D622E7265706C61636528227B7B6F6B7D7D222C746869732E6C6162656C732E6F6B292E7265706C61636528227B7B63616E63656C7D7D222C746869732E6C6162656C732E63616E63656C293B62';
wwv_flow_api.g_varchar2_table(32) := '7265616B3B636173652270726F6D7074223A623D622E7265706C61636528227B7B627574746F6E737D7D222C746869732E617070656E64427574746F6E7328712E627574746F6E732E63616E63656C2C712E627574746F6E732E7375626D697429292C62';
wwv_flow_api.g_varchar2_table(33) := '3D622E7265706C61636528227B7B6F6B7D7D222C746869732E6C6162656C732E6F6B292E7265706C61636528227B7B63616E63656C7D7D222C746869732E6C6162656C732E63616E63656C293B627265616B3B6361736522616C657274223A623D622E72';
wwv_flow_api.g_varchar2_table(34) := '65706C61636528227B7B627574746F6E737D7D222C712E627574746F6E732E6F6B292C623D622E7265706C61636528227B7B6F6B7D7D222C746869732E6C6162656C732E6F6B297D72657475726E206B2E636C6173734E616D653D22616C657274696679';
wwv_flow_api.g_varchar2_table(35) := '20616C6572746966792D222B632B2220222B652C6A2E636C6173734E616D653D22616C6572746966792D636F766572222C627D2C636C6F73653A66756E6374696F6E28612C62297B76617220632C642C653D6226262169734E614E2862293F2B623A7468';
wwv_flow_api.g_varchar2_table(36) := '69732E64656C61792C663D746869733B746869732E62696E6428612C22636C69636B222C66756E6374696F6E28297B632861297D292C643D66756E6374696F6E2861297B612E73746F7050726F7061676174696F6E28292C662E756E62696E6428746869';
wwv_flow_api.g_varchar2_table(37) := '732C662E7472616E736974696F6E2E747970652C64292C6C2E72656D6F76654368696C642874686973292C6C2E6861734368696C644E6F64657328297C7C286C2E636C6173734E616D652B3D2220616C6572746966792D6C6F67732D68696464656E2229';
wwv_flow_api.g_varchar2_table(38) := '7D2C633D66756E6374696F6E2861297B22756E646566696E656422213D747970656F6620612626612E706172656E744E6F64653D3D3D6C262628662E7472616E736974696F6E2E737570706F727465643F28662E62696E6428612C662E7472616E736974';
wwv_flow_api.g_varchar2_table(39) := '696F6E2E747970652C64292C612E636C6173734E616D652B3D2220616C6572746966792D6C6F672D6869646522293A286C2E72656D6F76654368696C642861292C6C2E6861734368696C644E6F64657328297C7C286C2E636C6173734E616D652B3D2220';
wwv_flow_api.g_varchar2_table(40) := '616C6572746966792D6C6F67732D68696464656E222929297D2C30213D3D62262673657454696D656F75742866756E6374696F6E28297B632861297D2C65297D2C6469616C6F673A66756E6374696F6E28612C622C632C652C66297B693D642E61637469';
wwv_flow_api.g_varchar2_table(41) := '7665456C656D656E743B76617220673D66756E6374696F6E28297B6C26266E756C6C213D3D6C2E7363726F6C6C546F7026266A26266E756C6C213D3D6A2E7363726F6C6C546F707C7C6728297D3B69662822737472696E6722213D747970656F66206129';
wwv_flow_api.g_varchar2_table(42) := '7468726F77206E6577204572726F7228226D657373616765206D757374206265206120737472696E6722293B69662822737472696E6722213D747970656F662062297468726F77206E6577204572726F72282274797065206D7573742062652061207374';
wwv_flow_api.g_varchar2_table(43) := '72696E6722293B69662822756E646566696E656422213D747970656F66206326262266756E6374696F6E22213D747970656F662063297468726F77206E6577204572726F722822666E206D75737420626520612066756E6374696F6E22293B7265747572';
wwv_flow_api.g_varchar2_table(44) := '6E2266756E6374696F6E223D3D747970656F6620746869732E696E6974262628746869732E696E697428292C672829292C742E70757368287B747970653A622C6D6573736167653A612C63616C6C6261636B3A632C706C616365686F6C6465723A652C63';
wwv_flow_api.g_varchar2_table(45) := '7373436C6173733A667D292C727C7C746869732E736574757028292C746869737D2C657874656E643A66756E6374696F6E2861297B69662822737472696E6722213D747970656F662061297468726F77206E6577204572726F722822657874656E64206D';
wwv_flow_api.g_varchar2_table(46) := '6574686F64206D75737420686176652065786163746C79206F6E6520706172616D74657222293B72657475726E2066756E6374696F6E28622C63297B72657475726E20746869732E6C6F6728622C612C63292C746869737D7D2C686964653A66756E6374';
wwv_flow_api.g_varchar2_table(47) := '696F6E28297B76617220612C623D746869733B742E73706C69636528302C31292C742E6C656E6774683E303F746869732E7365747570282130293A28723D21312C613D66756E6374696F6E2863297B632E73746F7050726F7061676174696F6E28292C6B';
wwv_flow_api.g_varchar2_table(48) := '2E636C6173734E616D652B3D2220616C6572746966792D697348696464656E222C622E756E62696E64286B2C622E7472616E736974696F6E2E747970652C61297D2C746869732E7472616E736974696F6E2E737570706F727465643F28746869732E6269';
wwv_flow_api.g_varchar2_table(49) := '6E64286B2C746869732E7472616E736974696F6E2E747970652C61292C6B2E636C6173734E616D653D22616C65727469667920616C6572746966792D6869646520616C6572746966792D68696464656E22293A6B2E636C6173734E616D653D22616C6572';
wwv_flow_api.g_varchar2_table(50) := '7469667920616C6572746966792D6869646520616C6572746966792D68696464656E20616C6572746966792D697348696464656E222C6A2E636C6173734E616D653D22616C6572746966792D636F76657220616C6572746966792D636F7665722D686964';
wwv_flow_api.g_varchar2_table(51) := '64656E222C692E666F6375732829297D2C696E69743A66756E6374696F6E28297B642E637265617465456C656D656E7428226E617622292C642E637265617465456C656D656E74282261727469636C6522292C642E637265617465456C656D656E742822';
wwv_flow_api.g_varchar2_table(52) := '73656374696F6E22292C6A3D642E637265617465456C656D656E74282264697622292C6A2E73657441747472696275746528226964222C22616C6572746966792D636F76657222292C6A2E636C6173734E616D653D22616C6572746966792D636F766572';
wwv_flow_api.g_varchar2_table(53) := '20616C6572746966792D636F7665722D68696464656E222C642E626F64792E617070656E644368696C64286A292C6B3D642E637265617465456C656D656E74282273656374696F6E22292C6B2E73657441747472696275746528226964222C22616C6572';
wwv_flow_api.g_varchar2_table(54) := '7469667922292C6B2E636C6173734E616D653D22616C65727469667920616C6572746966792D68696464656E222C642E626F64792E617070656E644368696C64286B292C6C3D642E637265617465456C656D656E74282273656374696F6E22292C6C2E73';
wwv_flow_api.g_varchar2_table(55) := '657441747472696275746528226964222C22616C6572746966792D6C6F677322292C6C2E636C6173734E616D653D22616C6572746966792D6C6F677320616C6572746966792D6C6F67732D68696464656E222C642E626F64792E617070656E644368696C';
wwv_flow_api.g_varchar2_table(56) := '64286C292C642E626F64792E7365744174747269627574652822746162696E646578222C223022292C746869732E7472616E736974696F6E3D6F28292C64656C65746520746869732E696E69747D2C6C6F673A66756E6374696F6E28612C622C63297B76';
wwv_flow_api.g_varchar2_table(57) := '617220643D66756E6374696F6E28297B6C26266E756C6C213D3D6C2E7363726F6C6C546F707C7C6428297D3B72657475726E2266756E6374696F6E223D3D747970656F6620746869732E696E6974262628746869732E696E697428292C642829292C6C2E';
wwv_flow_api.g_varchar2_table(58) := '636C6173734E616D653D22616C6572746966792D6C6F6773222C746869732E6E6F7469667928612C622C63292C746869737D2C6E6F746966793A66756E6374696F6E28612C622C63297B76617220653D642E637265617465456C656D656E742822617274';
wwv_flow_api.g_varchar2_table(59) := '69636C6522293B652E636C6173734E616D653D22616C6572746966792D6C6F67222B2822737472696E67223D3D747970656F66206226262222213D3D623F2220616C6572746966792D6C6F672D222B623A2222292C652E696E6E657248544D4C3D612C6C';
wwv_flow_api.g_varchar2_table(60) := '2E617070656E644368696C642865292C73657454696D656F75742866756E6374696F6E28297B652E636C6173734E616D653D652E636C6173734E616D652B2220616C6572746966792D6C6F672D73686F77227D2C3530292C746869732E636C6F73652865';
wwv_flow_api.g_varchar2_table(61) := '2C63297D2C7365743A66756E6374696F6E2861297B76617220623B696628226F626A65637422213D747970656F66206126266120696E7374616E63656F66204172726179297468726F77206E6577204572726F72282261726773206D7573742062652061';
wwv_flow_api.g_varchar2_table(62) := '6E206F626A65637422293B666F72286220696E206129612E6861734F776E50726F7065727479286229262628746869735B625D3D615B625D297D2C736574466F6375733A66756E6374696F6E28297B6E3F286E2E666F63757328292C6E2E73656C656374';
wwv_flow_api.g_varchar2_table(63) := '2829293A682E666F63757328297D2C73657475703A66756E6374696F6E2861297B76617220642C693D745B305D2C6A3D746869733B723D21302C643D66756E6374696F6E2861297B612E73746F7050726F7061676174696F6E28292C6A2E736574466F63';
wwv_flow_api.g_varchar2_table(64) := '757328292C6A2E756E62696E64286B2C6A2E7472616E736974696F6E2E747970652C64297D2C746869732E7472616E736974696F6E2E737570706F72746564262621612626746869732E62696E64286B2C746869732E7472616E736974696F6E2E747970';
wwv_flow_api.g_varchar2_table(65) := '652C64292C6B2E696E6E657248544D4C3D746869732E6275696C642869292C673D632822616C6572746966792D7265736574466F63757322292C663D632822616C6572746966792D6F6B22297C7C622C653D632822616C6572746966792D63616E63656C';
wwv_flow_api.g_varchar2_table(66) := '22297C7C622C683D2263616E63656C223D3D3D702E627574746F6E466F6375733F653A226E6F6E65223D3D3D702E627574746F6E466F6375733F632822616C6572746966792D6E6F6E65466F63757322293A662C6E3D632822616C6572746966792D7465';
wwv_flow_api.g_varchar2_table(67) := '787422297C7C622C6D3D632822616C6572746966792D666F726D22297C7C622C22737472696E67223D3D747970656F6620692E706C616365686F6C64657226262222213D3D692E706C616365686F6C6465722626286E2E76616C75653D692E706C616365';
wwv_flow_api.g_varchar2_table(68) := '686F6C646572292C612626746869732E736574466F63757328292C746869732E6164644C697374656E65727328692E63616C6C6261636B297D2C756E62696E643A66756E6374696F6E28612C622C63297B2266756E6374696F6E223D3D747970656F6620';
wwv_flow_api.g_varchar2_table(69) := '612E72656D6F76654576656E744C697374656E65723F612E72656D6F76654576656E744C697374656E657228622C632C2131293A612E6465746163684576656E742626612E6465746163684576656E7428226F6E222B622C63297D7D2C7B616C6572743A';
wwv_flow_api.g_varchar2_table(70) := '66756E6374696F6E28612C622C63297B72657475726E20702E6469616C6F6728612C22616C657274222C622C22222C63292C746869737D2C636F6E6669726D3A66756E6374696F6E28612C622C63297B72657475726E20702E6469616C6F6728612C2263';
wwv_flow_api.g_varchar2_table(71) := '6F6E6669726D222C622C22222C63292C746869737D2C657874656E643A702E657874656E642C696E69743A702E696E69742C6C6F673A66756E6374696F6E28612C622C63297B72657475726E20702E6C6F6728612C622C63292C746869737D2C70726F6D';
wwv_flow_api.g_varchar2_table(72) := '70743A66756E6374696F6E28612C622C632C64297B72657475726E20702E6469616C6F6728612C2270726F6D7074222C622C632C64292C746869737D2C737563636573733A66756E6374696F6E28612C62297B72657475726E20702E6C6F6728612C2273';
wwv_flow_api.g_varchar2_table(73) := '756363657373222C62292C746869737D2C6572726F723A66756E6374696F6E28612C62297B72657475726E20702E6C6F6728612C226572726F72222C62292C746869737D2C7365743A66756E6374696F6E2861297B702E7365742861297D2C6C6162656C';
wwv_flow_api.g_varchar2_table(74) := '733A702E6C6162656C732C64656275673A702E68616E646C654572726F72737D7D2C2266756E6374696F6E223D3D747970656F6620646566696E653F646566696E65285B5D2C66756E6374696F6E28297B72657475726E206E657720637D293A22756E64';
wwv_flow_api.g_varchar2_table(75) := '6566696E6564223D3D747970656F6620612E616C657274696679262628612E616C6572746966793D6E65772063297D2874686973293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(27903465349443275327)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_file_name=>'alertify.min.js'
,p_mime_type=>'text/javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0A202A205477697474657220426F6F747374726170204C6F6F6B20616E64204665656C0A202A204261736564206F6E20687474703A2F2F747769747465722E6769746875622E636F6D2F626F6F7473747261702F0A202A2F0A2E616C6572746966';
wwv_flow_api.g_varchar2_table(2) := '792C0A2E616C6572746966792D6C6F67207B0A09666F6E742D66616D696C793A2073616E732D73657269663B0A7D0A2E616C657274696679207B0A096261636B67726F756E643A20234646463B0A09626F726465723A2031707820736F6C696420233845';
wwv_flow_api.g_varchar2_table(3) := '384538453B202F2A2062726F7773657273207468617420646F6E277420737570706F72742072676261202A2F0A09626F726465723A2031707820736F6C6964207267626128302C302C302C2E33293B0A09626F726465722D7261646975733A203670783B';
wwv_flow_api.g_varchar2_table(4) := '0A09626F782D736861646F773A20302033707820377078207267626128302C302C302C2E33293B0A092D7765626B69742D6261636B67726F756E642D636C69703A2070616464696E673B20202020202F2A2053616661726920343F204368726F6D652036';
wwv_flow_api.g_varchar2_table(5) := '3F202A2F0A092020202D6D6F7A2D6261636B67726F756E642D636C69703A2070616464696E673B20202020202F2A2046697265666F7820332E36202A2F0A0920202020202020206261636B67726F756E642D636C69703A2070616464696E672D626F783B';
wwv_flow_api.g_varchar2_table(6) := '202F2A2046697265666F7820342C2053616661726920352C204F706572612031302C2049452039202A2F0A7D0A2E616C6572746966792D6469616C6F67207B0A0970616464696E673A20303B0A7D0A092E616C6572746966792D696E6E6572207B0A0909';
wwv_flow_api.g_varchar2_table(7) := '746578742D616C69676E3A206C6566743B0A097D0A09092E616C6572746966792D6D657373616765207B0A09090970616464696E673A20313570783B0A0909096D617267696E3A20303B0A09097D0A09092E616C6572746966792D746578742D77726170';
wwv_flow_api.g_varchar2_table(8) := '706572207B0A09090970616464696E673A203020313570783B0A09097D0A0909092E616C6572746966792D74657874207B0A09090909636F6C6F723A20233535353B0A09090909626F726465722D7261646975733A203470783B0A090909097061646469';
wwv_flow_api.g_varchar2_table(9) := '6E673A203870783B0A090909096261636B67726F756E642D636F6C6F723A20234646463B0A09090909626F726465723A2031707820736F6C696420234343433B0A09090909626F782D736861646F773A20696E7365742030203170782031707820726762';
wwv_flow_api.g_varchar2_table(10) := '6128302C302C302C2E303735293B0A0909097D0A0909092E616C6572746966792D746578743A666F637573207B0A09090909626F726465722D636F6C6F723A20726762612838322C3136382C3233362C2E38293B0A090909096F75746C696E653A20303B';
wwv_flow_api.g_varchar2_table(11) := '0A09090909626F782D736861646F773A20696E73657420302031707820317078207267626128302C302C302C2E303735292C203020302038707820726762612838322C3136382C3233362C2E36293B0A0909097D0A0A09092E616C6572746966792D6275';
wwv_flow_api.g_varchar2_table(12) := '74746F6E73207B0A09090970616464696E673A2031347078203135707820313570783B0A0909096261636B67726F756E643A20234635463546353B0A090909626F726465722D746F703A2031707820736F6C696420234444443B0A090909626F72646572';
wwv_flow_api.g_varchar2_table(13) := '2D7261646975733A2030203020367078203670783B0A090909626F782D736861646F773A20696E736574203020317078203020234646463B0A090909746578742D616C69676E3A2072696768743B0A09097D0A0909092E616C6572746966792D62757474';
wwv_flow_api.g_varchar2_table(14) := '6F6E2C0A0909092E616C6572746966792D627574746F6E3A686F7665722C0A0909092E616C6572746966792D627574746F6E3A666F6375732C0A0909092E616C6572746966792D627574746F6E3A616374697665207B0A090909096D617267696E2D6C65';
wwv_flow_api.g_varchar2_table(15) := '66743A20313070783B0A09090909626F726465722D7261646975733A203470783B0A09090909666F6E742D7765696768743A206E6F726D616C3B0A0909090970616464696E673A2034707820313270783B0A09090909746578742D6465636F726174696F';
wwv_flow_api.g_varchar2_table(16) := '6E3A206E6F6E653B0A09090909626F782D736861646F773A20696E73657420302031707820302072676261283235352C203235352C203235352C202E32292C20302031707820327078207267626128302C20302C20302C202E3035293B0A090909096261';
wwv_flow_api.g_varchar2_table(17) := '636B67726F756E642D696D6167653A202D7765626B69742D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A090909096261636B67726F';
wwv_flow_api.g_varchar2_table(18) := '756E642D696D6167653A202020202D6D6F7A2D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A090909096261636B67726F756E642D69';
wwv_flow_api.g_varchar2_table(19) := '6D6167653A20202020202D6D732D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A090909096261636B67726F756E642D696D6167653A';
wwv_flow_api.g_varchar2_table(20) := '2020202020202D6F2D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A090909096261636B67726F756E642D696D6167653A2020202020';
wwv_flow_api.g_varchar2_table(21) := '202020206C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A0909097D0A0909092E616C6572746966792D627574746F6E3A666F63757320';
wwv_flow_api.g_varchar2_table(22) := '7B0A090909096F75746C696E653A206E6F6E653B0A09090909626F782D736861646F773A203020302035707820233242373244353B0A0909097D0A0909092E616C6572746966792D627574746F6E3A616374697665207B0A09090909706F736974696F6E';
wwv_flow_api.g_varchar2_table(23) := '3A2072656C61746976653B0A09090909626F782D736861646F773A20696E73657420302032707820347078207267626128302C302C302C2E3135292C20302031707820327078207267626128302C302C302C2E3035293B0A0909097D0A090909092E616C';
wwv_flow_api.g_varchar2_table(24) := '6572746966792D627574746F6E2D63616E63656C2C0A090909092E616C6572746966792D627574746F6E2D63616E63656C3A686F7665722C0A090909092E616C6572746966792D627574746F6E2D63616E63656C3A666F6375732C0A090909092E616C65';
wwv_flow_api.g_varchar2_table(25) := '72746966792D627574746F6E2D63616E63656C3A616374697665207B0A0909090909746578742D736861646F773A2030202D31707820302072676261283235352C3235352C3235352C2E3735293B0A09090909096261636B67726F756E642D636F6C6F72';
wwv_flow_api.g_varchar2_table(26) := '3A20234536453645363B0A0909090909626F726465723A2031707820736F6C696420234242423B0A0909090909636F6C6F723A20233333333B0A09090909096261636B67726F756E642D696D6167653A202D7765626B69742D6C696E6561722D67726164';
wwv_flow_api.g_varchar2_table(27) := '69656E7428746F702C20234646462C2023453645364536293B0A09090909096261636B67726F756E642D696D6167653A202020202D6D6F7A2D6C696E6561722D6772616469656E7428746F702C20234646462C2023453645364536293B0A090909090962';
wwv_flow_api.g_varchar2_table(28) := '61636B67726F756E642D696D6167653A20202020202D6D732D6C696E6561722D6772616469656E7428746F702C20234646462C2023453645364536293B0A09090909096261636B67726F756E642D696D6167653A2020202020202D6F2D6C696E6561722D';
wwv_flow_api.g_varchar2_table(29) := '6772616469656E7428746F702C20234646462C2023453645364536293B0A09090909096261636B67726F756E642D696D6167653A2020202020202020206C696E6561722D6772616469656E7428746F702C20234646462C2023453645364536293B0A0909';
wwv_flow_api.g_varchar2_table(30) := '09097D0A090909092E616C6572746966792D627574746F6E2D63616E63656C3A686F7665722C0A090909092E616C6572746966792D627574746F6E2D63616E63656C3A666F6375732C0A090909092E616C6572746966792D627574746F6E2D63616E6365';
wwv_flow_api.g_varchar2_table(31) := '6C3A616374697665207B0A09090909096261636B67726F756E643A20234536453645363B0A090909097D0A090909092E616C6572746966792D627574746F6E2D6F6B2C0A090909092E616C6572746966792D627574746F6E2D6F6B3A686F7665722C0A09';
wwv_flow_api.g_varchar2_table(32) := '0909092E616C6572746966792D627574746F6E2D6F6B3A666F6375732C0A090909092E616C6572746966792D627574746F6E2D6F6B3A616374697665207B0A0909090909746578742D736861646F773A2030202D3170782030207267626128302C302C30';
wwv_flow_api.g_varchar2_table(33) := '2C2E3235293B0A09090909096261636B67726F756E642D636F6C6F723A20233034433B0A0909090909626F726465723A2031707820736F6C696420233034433B0A0909090909626F726465722D636F6C6F723A2023303443202330344320233030324138';
wwv_flow_api.g_varchar2_table(34) := '303B0A0909090909626F726465722D636F6C6F723A207267626128302C20302C20302C20302E3129207267626128302C20302C20302C20302E3129207267626128302C20302C20302C20302E3235293B0A0909090909636F6C6F723A20234646463B0A09';
wwv_flow_api.g_varchar2_table(35) := '0909097D0A090909092E616C6572746966792D627574746F6E2D6F6B3A686F7665722C0A090909092E616C6572746966792D627574746F6E2D6F6B3A666F6375732C0A090909092E616C6572746966792D627574746F6E2D6F6B3A616374697665207B0A';
wwv_flow_api.g_varchar2_table(36) := '09090909096261636B67726F756E643A20233034433B0A090909097D0A0A2E616C6572746966792D6C6F67207B0A096261636B67726F756E643A20234439454446373B0A0970616464696E673A2038707820313470783B0A09626F726465722D72616469';
wwv_flow_api.g_varchar2_table(37) := '75733A203470783B0A09636F6C6F723A20233341384142463B0A09746578742D736861646F773A20302031707820302072676261283235352C3235352C3235352C2E35293B0A09626F726465723A2031707820736F6C696420234243453846313B0A7D0A';
wwv_flow_api.g_varchar2_table(38) := '092E616C6572746966792D6C6F672D6572726F72207B0A0909636F6C6F723A20234239344134383B0A09096261636B67726F756E643A20234632444544453B0A0909626F726465723A2031707820736F6C696420234545443344373B0A097D0A092E616C';
wwv_flow_api.g_varchar2_table(39) := '6572746966792D6C6F672D73756363657373207B0A0909636F6C6F723A20233436383834373B0A09096261636B67726F756E643A20234446463044383B0A0909626F726465723A2031707820736F6C696420234436453943363B0A097D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(27903469758171342926)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_file_name=>'alertify.bootstrap.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0A202A2044656661756C74204C6F6F6B20616E64204665656C0A202A2F0A2E616C6572746966792C0A2E616C6572746966792D6C6F67207B0A09666F6E742D66616D696C793A2073616E732D73657269663B0A7D0A2E616C657274696679207B0A';
wwv_flow_api.g_varchar2_table(2) := '096261636B67726F756E643A20234646463B0A09626F726465723A203130707820736F6C696420233333333B202F2A2062726F7773657273207468617420646F6E277420737570706F72742072676261202A2F0A09626F726465723A203130707820736F';
wwv_flow_api.g_varchar2_table(3) := '6C6964207267626128302C302C302C2E37293B0A09626F726465722D7261646975733A203870783B0A09626F782D736861646F773A20302033707820337078207267626128302C302C302C2E33293B0A092D7765626B69742D6261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(4) := '636C69703A2070616464696E673B20202020202F2A2053616661726920343F204368726F6D6520363F202A2F0A092020202D6D6F7A2D6261636B67726F756E642D636C69703A2070616464696E673B20202020202F2A2046697265666F7820332E36202A';
wwv_flow_api.g_varchar2_table(5) := '2F0A0920202020202020206261636B67726F756E642D636C69703A2070616464696E672D626F783B202F2A2046697265666F7820342C2053616661726920352C204F706572612031302C2049452039202A2F0A7D0A092E616C6572746966792D74657874';
wwv_flow_api.g_varchar2_table(6) := '207B0A0909626F726465723A2031707820736F6C696420234343433B0A090970616464696E673A20313070783B0A0909626F726465722D7261646975733A203470783B0A097D0A092E616C6572746966792D627574746F6E207B0A0909626F726465722D';
wwv_flow_api.g_varchar2_table(7) := '7261646975733A203470783B0A0909636F6C6F723A20234646463B0A0909666F6E742D7765696768743A20626F6C643B0A090970616464696E673A2036707820313570783B0A0909746578742D6465636F726174696F6E3A206E6F6E653B0A0909746578';
wwv_flow_api.g_varchar2_table(8) := '742D736861646F773A20317078203170782030207267626128302C302C302C2E35293B0A0909626F782D736861646F773A20696E736574203020317078203020302072676261283235352C3235352C3235352C2E35293B0A09096261636B67726F756E64';
wwv_flow_api.g_varchar2_table(9) := '2D696D6167653A202D7765626B69742D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A09096261636B67726F756E642D696D6167653A';
wwv_flow_api.g_varchar2_table(10) := '202020202D6D6F7A2D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A09096261636B67726F756E642D696D6167653A20202020202D6D';
wwv_flow_api.g_varchar2_table(11) := '732D6C696E6561722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A09096261636B67726F756E642D696D6167653A2020202020202D6F2D6C696E6561';
wwv_flow_api.g_varchar2_table(12) := '722D6772616469656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A09096261636B67726F756E642D696D6167653A2020202020202020206C696E6561722D6772616469';
wwv_flow_api.g_varchar2_table(13) := '656E7428746F702C2072676261283235352C3235352C3235352C2E33292C2072676261283235352C3235352C3235352C3029293B0A097D0A092E616C6572746966792D627574746F6E3A686F7665722C0A092E616C6572746966792D627574746F6E3A66';
wwv_flow_api.g_varchar2_table(14) := '6F637573207B0A09096F75746C696E653A206E6F6E653B0A09096261636B67726F756E642D696D6167653A202D7765626B69742D6C696E6561722D6772616469656E7428746F702C207267626128302C302C302C2E31292C207267626128302C302C302C';
wwv_flow_api.g_varchar2_table(15) := '3029293B0A09096261636B67726F756E642D696D6167653A202020202D6D6F7A2D6C696E6561722D6772616469656E7428746F702C207267626128302C302C302C2E31292C207267626128302C302C302C3029293B0A09096261636B67726F756E642D69';
wwv_flow_api.g_varchar2_table(16) := '6D6167653A20202020202D6D732D6C696E6561722D6772616469656E7428746F702C207267626128302C302C302C2E31292C207267626128302C302C302C3029293B0A09096261636B67726F756E642D696D6167653A2020202020202D6F2D6C696E6561';
wwv_flow_api.g_varchar2_table(17) := '722D6772616469656E7428746F702C207267626128302C302C302C2E31292C207267626128302C302C302C3029293B0A09096261636B67726F756E642D696D6167653A2020202020202020206C696E6561722D6772616469656E7428746F702C20726762';
wwv_flow_api.g_varchar2_table(18) := '6128302C302C302C2E31292C207267626128302C302C302C3029293B0A097D0A092E616C6572746966792D627574746F6E3A666F637573207B0A0909626F782D736861646F773A20302030203135707820233242373244353B0A097D0A092E616C657274';
wwv_flow_api.g_varchar2_table(19) := '6966792D627574746F6E3A616374697665207B0A0909706F736974696F6E3A2072656C61746976653B0A0909626F782D736861646F773A20696E73657420302032707820347078207267626128302C302C302C2E3135292C203020317078203270782072';
wwv_flow_api.g_varchar2_table(20) := '67626128302C302C302C2E3035293B0A097D0A09092E616C6572746966792D627574746F6E2D63616E63656C2C0A09092E616C6572746966792D627574746F6E2D63616E63656C3A686F7665722C0A09092E616C6572746966792D627574746F6E2D6361';
wwv_flow_api.g_varchar2_table(21) := '6E63656C3A666F637573207B0A0909096261636B67726F756E642D636F6C6F723A20234645314130303B0A090909626F726465723A2031707820736F6C696420234438333532363B0A09097D0A09092E616C6572746966792D627574746F6E2D6F6B2C0A';
wwv_flow_api.g_varchar2_table(22) := '09092E616C6572746966792D627574746F6E2D6F6B3A686F7665722C0A09092E616C6572746966792D627574746F6E2D6F6B3A666F637573207B0A0909096261636B67726F756E642D636F6C6F723A20233543423831313B0A090909626F726465723A20';
wwv_flow_api.g_varchar2_table(23) := '31707820736F6C696420233342373830383B0A09097D0A0A2E616C6572746966792D6C6F67207B0A096261636B67726F756E643A20233146314631463B0A096261636B67726F756E643A207267626128302C302C302C2E39293B0A0970616464696E673A';
wwv_flow_api.g_varchar2_table(24) := '20313570783B0A09626F726465722D7261646975733A203470783B0A09636F6C6F723A20234646463B0A09746578742D736861646F773A202D317078202D3170782030207267626128302C302C302C2E35293B0A7D0A092E616C6572746966792D6C6F67';
wwv_flow_api.g_varchar2_table(25) := '2D6572726F72207B0A09096261636B67726F756E643A20234645314130303B0A09096261636B67726F756E643A2072676261283235342C32362C302C2E39293B0A097D0A092E616C6572746966792D6C6F672D73756363657373207B0A09096261636B67';
wwv_flow_api.g_varchar2_table(26) := '726F756E643A20233543423831313B0A09096261636B67726F756E643A20726762612839322C3138342C31372C2E39293B0A097D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(27903472548169277106)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_file_name=>'alertify.default.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E616C6572746966792C0A2E616C6572746966792D73686F772C0A2E616C6572746966792D6C6F67207B0A092D7765626B69742D7472616E736974696F6E3A20616C6C203530306D732063756269632D62657A69657228302E3137352C20302E3838352C';
wwv_flow_api.g_varchar2_table(2) := '20302E3332302C20312E323735293B0A092020202D6D6F7A2D7472616E736974696F6E3A20616C6C203530306D732063756269632D62657A69657228302E3137352C20302E3838352C20302E3332302C20312E323735293B0A09202020202D6D732D7472';
wwv_flow_api.g_varchar2_table(3) := '616E736974696F6E3A20616C6C203530306D732063756269632D62657A69657228302E3137352C20302E3838352C20302E3332302C20312E323735293B0A0920202020202D6F2D7472616E736974696F6E3A20616C6C203530306D732063756269632D62';
wwv_flow_api.g_varchar2_table(4) := '657A69657228302E3137352C20302E3838352C20302E3332302C20312E323735293B0A0920202020202020207472616E736974696F6E3A20616C6C203530306D732063756269632D62657A69657228302E3137352C20302E3838352C20302E3332302C20';
wwv_flow_api.g_varchar2_table(5) := '312E323735293B202F2A20656173654F75744261636B202A2F0A7D0A2E616C6572746966792D68696465207B0A092D7765626B69742D7472616E736974696F6E3A20616C6C203235306D732063756269632D62657A69657228302E3630302C202D302E32';
wwv_flow_api.g_varchar2_table(6) := '38302C20302E3733352C20302E303435293B0A092020202D6D6F7A2D7472616E736974696F6E3A20616C6C203235306D732063756269632D62657A69657228302E3630302C202D302E3238302C20302E3733352C20302E303435293B0A09202020202D6D';
wwv_flow_api.g_varchar2_table(7) := '732D7472616E736974696F6E3A20616C6C203235306D732063756269632D62657A69657228302E3630302C202D302E3238302C20302E3733352C20302E303435293B0A0920202020202D6F2D7472616E736974696F6E3A20616C6C203235306D73206375';
wwv_flow_api.g_varchar2_table(8) := '6269632D62657A69657228302E3630302C202D302E3238302C20302E3733352C20302E303435293B0A0920202020202020207472616E736974696F6E3A20616C6C203235306D732063756269632D62657A69657228302E3630302C202D302E3238302C20';
wwv_flow_api.g_varchar2_table(9) := '302E3733352C20302E303435293B202F2A2065617365496E4261636B202A2F0A7D0A2E616C6572746966792D6C6F672D68696465207B0A092D7765626B69742D7472616E736974696F6E3A20616C6C203530306D732063756269632D62657A6965722830';
wwv_flow_api.g_varchar2_table(10) := '2E3630302C202D302E3238302C20302E3733352C20302E303435293B0A092020202D6D6F7A2D7472616E736974696F6E3A20616C6C203530306D732063756269632D62657A69657228302E3630302C202D302E3238302C20302E3733352C20302E303435';
wwv_flow_api.g_varchar2_table(11) := '293B0A09202020202D6D732D7472616E736974696F6E3A20616C6C203530306D732063756269632D62657A69657228302E3630302C202D302E3238302C20302E3733352C20302E303435293B0A0920202020202D6F2D7472616E736974696F6E3A20616C';
wwv_flow_api.g_varchar2_table(12) := '6C203530306D732063756269632D62657A69657228302E3630302C202D302E3238302C20302E3733352C20302E303435293B0A0920202020202020207472616E736974696F6E3A20616C6C203530306D732063756269632D62657A69657228302E363030';
wwv_flow_api.g_varchar2_table(13) := '2C202D302E3238302C20302E3733352C20302E303435293B202F2A2065617365496E4261636B202A2F0A7D0A2E616C6572746966792D636F766572207B0A09706F736974696F6E3A2066697865643B207A2D696E6465783A2039393939393B0A09746F70';
wwv_flow_api.g_varchar2_table(14) := '3A20303B2072696768743A20303B20626F74746F6D3A20303B206C6566743A20303B0A096261636B67726F756E642D636F6C6F723A77686974653B0A0966696C7465723A616C706861286F7061636974793D30293B0A096F7061636974793A303B0A7D0A';
wwv_flow_api.g_varchar2_table(15) := '092E616C6572746966792D636F7665722D68696464656E207B0A0909646973706C61793A206E6F6E653B0A097D0A2E616C657274696679207B0A09706F736974696F6E3A2066697865643B207A2D696E6465783A2039393939393B0A09746F703A203530';
wwv_flow_api.g_varchar2_table(16) := '70783B206C6566743A203530253B0A0977696474683A2035353070783B0A096D617267696E2D6C6566743A202D32373570783B0A096F7061636974793A20313B0A7D0A092E616C6572746966792D68696464656E207B0A09092D7765626B69742D747261';
wwv_flow_api.g_varchar2_table(17) := '6E73666F726D3A207472616E736C61746528302C2D3135307078293B0A09092020202D6D6F7A2D7472616E73666F726D3A207472616E736C61746528302C2D3135307078293B0A0909202020202D6D732D7472616E73666F726D3A207472616E736C6174';
wwv_flow_api.g_varchar2_table(18) := '6528302C2D3135307078293B0A090920202020202D6F2D7472616E73666F726D3A207472616E736C61746528302C2D3135307078293B0A090920202020202020207472616E73666F726D3A207472616E736C61746528302C2D3135307078293B0A09096F';
wwv_flow_api.g_varchar2_table(19) := '7061636974793A20303B0A0909646973706C61793A206E6F6E653B0A097D0A092F2A206F766572777269746520646973706C61793A206E6F6E653B20666F722065766572797468696E6720657863657074204945362D38202A2F0A093A726F6F74202A3E';
wwv_flow_api.g_varchar2_table(20) := '202E616C6572746966792D68696464656E207B0A0909646973706C61793A20626C6F636B3B0A09097669736962696C6974793A2068696464656E3B0A097D0A2E616C6572746966792D6C6F6773207B0A09706F736974696F6E3A2066697865643B0A097A';
wwv_flow_api.g_varchar2_table(21) := '2D696E6465783A20353030303B0A09626F74746F6D3A20313070783B0A0972696768743A20313070783B0A0977696474683A2033303070783B0A7D0A2E616C6572746966792D6C6F67732D68696464656E207B0A09646973706C61793A206E6F6E653B0A';
wwv_flow_api.g_varchar2_table(22) := '7D0A092E616C6572746966792D6C6F67207B0A0909646973706C61793A20626C6F636B3B0A09096D617267696E2D746F703A20313070783B0A0909706F736974696F6E3A2072656C61746976653B0A090972696768743A202D33303070783B0A09096F70';
wwv_flow_api.g_varchar2_table(23) := '61636974793A20303B0A097D0A092E616C6572746966792D6C6F672D73686F77207B0A090972696768743A20303B0A09096F7061636974793A20313B0A097D0A092E616C6572746966792D6C6F672D68696465207B0A09092D7765626B69742D7472616E';
wwv_flow_api.g_varchar2_table(24) := '73666F726D3A207472616E736C6174652833303070782C2030293B0A09092020202D6D6F7A2D7472616E73666F726D3A207472616E736C6174652833303070782C2030293B0A0909202020202D6D732D7472616E73666F726D3A207472616E736C617465';
wwv_flow_api.g_varchar2_table(25) := '2833303070782C2030293B0A090920202020202D6F2D7472616E73666F726D3A207472616E736C6174652833303070782C2030293B0A090920202020202020207472616E73666F726D3A207472616E736C6174652833303070782C2030293B0A09096F70';
wwv_flow_api.g_varchar2_table(26) := '61636974793A20303B0A097D0A092E616C6572746966792D6469616C6F67207B0A090970616464696E673A20323570783B0A097D0A09092E616C6572746966792D7265736574466F637573207B0A090909626F726465723A20303B0A090909636C69703A';
wwv_flow_api.g_varchar2_table(27) := '20726563742830203020302030293B0A0909096865696768743A203170783B0A0909096D617267696E3A202D3170783B0A0909096F766572666C6F773A2068696464656E3B0A09090970616464696E673A20303B0A090909706F736974696F6E3A206162';
wwv_flow_api.g_varchar2_table(28) := '736F6C7574653B0A09090977696474683A203170783B0A09097D0A09092E616C6572746966792D696E6E6572207B0A090909746578742D616C69676E3A2063656E7465723B0A09097D0A09092E616C6572746966792D74657874207B0A0909096D617267';
wwv_flow_api.g_varchar2_table(29) := '696E2D626F74746F6D3A20313570783B0A09090977696474683A20313030253B0A0909092D7765626B69742D626F782D73697A696E673A20626F726465722D626F783B0A0909092020202D6D6F7A2D626F782D73697A696E673A20626F726465722D626F';
wwv_flow_api.g_varchar2_table(30) := '783B0A0909092020202020202020626F782D73697A696E673A20626F726465722D626F783B0A090909666F6E742D73697A653A20313030253B0A09097D0A09092E616C6572746966792D627574746F6E73207B0A09097D0A0909092E616C657274696679';
wwv_flow_api.g_varchar2_table(31) := '2D627574746F6E2C0A0909092E616C6572746966792D627574746F6E3A686F7665722C0A0909092E616C6572746966792D627574746F6E3A6163746976652C0A0909092E616C6572746966792D627574746F6E3A76697369746564207B0A090909096261';
wwv_flow_api.g_varchar2_table(32) := '636B67726F756E643A206E6F6E653B0A09090909746578742D6465636F726174696F6E3A206E6F6E653B0A09090909626F726465723A206E6F6E653B0A090909092F2A206C696E652D68656967687420616E6420666F6E742D73697A6520666F7220696E';
wwv_flow_api.g_varchar2_table(33) := '70757420627574746F6E202A2F0A090909096C696E652D6865696768743A20312E353B0A09090909666F6E742D73697A653A20313030253B0A09090909646973706C61793A20696E6C696E652D626C6F636B3B0A09090909637572736F723A20706F696E';
wwv_flow_api.g_varchar2_table(34) := '7465723B0A090909096D617267696E2D6C6566743A203570783B0A0909097D0A0A2E616C6572746966792D697348696464656E207B0A09646973706C61793A206E6F6E653B0A7D0A0A23616C6572746966792D666F726D207B0A20206D617267696E3A20';
wwv_flow_api.g_varchar2_table(35) := '303B0A7D0A0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A20363830707829207B0A092E616C6572746966792C0A092E616C6572746966792D6C6F6773207B0A090977696474683A203930253B0A09092D776562';
wwv_flow_api.g_varchar2_table(36) := '6B69742D626F782D73697A696E673A20626F726465722D626F783B0A09092020202D6D6F7A2D626F782D73697A696E673A20626F726465722D626F783B0A09092020202020202020626F782D73697A696E673A20626F726465722D626F783B0A097D0A09';
wwv_flow_api.g_varchar2_table(37) := '2E616C657274696679207B0A09096C6566743A2035253B0A09096D617267696E3A20303B0A097D0A7D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(27965187246220636242)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_file_name=>'alertify.core.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '766172206265437462416C657274696679203D207B7D3B0D0A0D0A6265437462416C6572746966792E7574696C203D207B0D0A20207265706C6163654974656D733A2066756E6374696F6E2028704D736729207B0D0A20202020766172206974656D3B0D';
wwv_flow_api.g_varchar2_table(2) := '0A20202020766172206974656D4F6E506167653B0D0A20202020766172206974656D73203D206E6577205265674578702822235C5C772B23222C20226722293B0D0A20202020766172207265706C616365644D7367203D20704D73673B0D0A0D0A202020';
wwv_flow_api.g_varchar2_table(3) := '207768696C6520286974656D203D206974656D732E6578656328704D73672929207B0D0A20202020202020206974656D4F6E50616765203D202478286974656D5B305D2E7265706C616365282F232F672C20222229293B0D0A2020202020202020696620';
wwv_flow_api.g_varchar2_table(4) := '286974656D4F6E5061676529207B0D0A2020202020202020202020207265706C616365644D7367203D207265706C616365644D73672E7265706C616365286974656D5B305D2C202476286974656D4F6E5061676529293B0D0A20202020202020207D0D0A';
wwv_flow_api.g_varchar2_table(5) := '202020207D0D0A2020202072657475726E207265706C616365644D73673B0D0A20207D0D0A7D3B0D0A0D0A6265437462416C6572746966792E6469616C6F67203D207B0D0A20207574696C3A206265437462416C6572746966792E7574696C2C0D0A0D0A';
wwv_flow_api.g_varchar2_table(6) := '2020616C6572743A2066756E6374696F6E2028705468697329207B0D0A20202020616C6572746966792E616C65727428746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653034292C206675';
wwv_flow_api.g_varchar2_table(7) := '6E6374696F6E20286529207B0D0A202020202020617065782E64612E726573756D652870546869732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A202020207D293B0D0A20207D2C0D0A2020636F6E6669726D3A2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(8) := '2028705468697329207B0D0A20202020616C6572746966792E636F6E6669726D28746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653034292C2066756E6374696F6E20286529207B0D0A20';
wwv_flow_api.g_varchar2_table(9) := '2020202020696620286529207B0D0A20202020202020206966202870546869732E616374696F6E2E77616974466F72526573756C7429207B0D0A20202020202020202020617065782E64612E726573756D652870546869732E726573756D6543616C6C62';
wwv_flow_api.g_varchar2_table(10) := '61636B2C2066616C7365293B0D0A20202020202020207D0D0A2020202020207D20656C7365207B0D0A20202020202020203B0D0A2020202020207D0D0A202020207D293B0D0A20207D2C0D0A202070726F6D70743A2066756E6374696F6E202870546869';
wwv_flow_api.g_varchar2_table(11) := '7329207B0D0A20202020616C6572746966792E70726F6D707428746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653034292C2066756E6374696F6E2028652C2073747229207B0D0A202020';
wwv_flow_api.g_varchar2_table(12) := '202020696620286529207B0D0A20202020202020206966202870546869732E616374696F6E2E77616974466F72526573756C7429207B0D0A2020202020202020202024732870546869732E616374696F6E2E61747472696275746530362C20737472293B';
wwv_flow_api.g_varchar2_table(13) := '0D0A20202020202020202020617065782E64612E726573756D652870546869732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A20202020202020207D0D0A2020202020207D20656C7365207B0D0A20202020202020203B0D0A20202020';
wwv_flow_api.g_varchar2_table(14) := '20207D0D0A202020207D2C20746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E617474726962757465303529293B0D0A20207D0D0A7D3B0D0A0D0A6265437462416C6572746966792E6E6F74696669636174696F';
wwv_flow_api.g_varchar2_table(15) := '6E203D207B0D0A20207574696C3A206265437462416C6572746966792E7574696C2C0D0A0D0A20206C6F673A2066756E6374696F6E2028705468697329207B0D0A20202020616C6572746966792E6C6F6728746869732E7574696C2E7265706C61636549';
wwv_flow_api.g_varchar2_table(16) := '74656D732870546869732E616374696F6E2E6174747269627574653034292C2070546869732E616374696F6E2E61747472696275746530332E746F4C6F7765724361736528292C204E756D6265722870546869732E616374696F6E2E6174747269627574';
wwv_flow_api.g_varchar2_table(17) := '65313129293B0D0A20202020617065782E64612E726573756D652870546869732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A20207D0D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(27971953440429400302)
,p_plugin_id=>wwv_flow_api.id(27902094145958200569)
,p_file_name=>'apex.alertify.js'
,p_mime_type=>'text/javascript'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
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
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.BIG_VALUE_LIST'),'')
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
prompt --application/shared_components/plugins/region_type/com_oracle_apex_css_bar_chart
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(63575691394248868053)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.CSS_BAR_CHART'
,p_display_name=>'CSS Bar Chart'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.CSS_BAR_CHART'),'#IMAGE_PREFIX#eba/css/')
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
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(5593958646562303)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_navigation_list_id=>wwv_flow_api.id(5551591327562272)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(5587597554562293)
,p_nav_list_template_options=>'#DEFAULT#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(5593843763562302)
,p_nav_bar_list_template_id=>wwv_flow_api.id(5584279634562292)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Definición Integraciones'
,p_page_mode=>'NORMAL'
,p_step_title=>'Definición Integraciones'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161014113949'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5595725452562312)
,p_plug_name=>'Grupo Roble'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<center><h1>Grupo Roble</h1></center>',
'<p style="text-align:center;"><img src="#WORKSPACE_IMAGES#gruporoble.jpg" width="150px" align="middle"/></p>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5922761205247609)
,p_plug_name=>'Verano Ingenieria'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<center><h1>Verano Ingenieria</h1></center>',
'<p style="text-align:center;"><img src="#WORKSPACE_IMAGES#verano_logo.png" width="150px" align="middle"/></p>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5922874071247610)
,p_plug_name=>'Integración 1'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Una vez que se configura en Primavera la estructura de líneas de costo para un proyecto, esta debe ser transmitida a Oracle EBS para alimentar una lista de valores que servirá para validar el registro de dicho dato en las diferentes transacciones en '
||'donde sea requerido y enviar información a Primavera con dichas referencias cada vez sea necesario. La integración envía toda la estructura de líneas de costo, indicando la organización de inventario y si es una línea imputable o no:',
'- Organización de inventario',
'- Código del valor',
'- Descripción',
'- Código del valor padre',
'- Imputable (identifica si la línea permite registro de costo o no)',
'Solo se permiten modificaciones cuando la línea no ha tenido imputaciones'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5922960800247611)
,p_plug_name=>'Integración 2'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>'Cuando se requieren materiales que no tienen disponibilidad en el inventario, o la contratación de servicios se elabora en Oracle una requisición o una liberación desde un acuerdo de compra abierto, dando así inicio al flujo de compras en Oracle EBS.'
||' En ambos casos, se debe confirmar en Primavera Unifier que exista presupuesto disponible para la compra'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5923007553247612)
,p_plug_name=>'Integración 3'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_source=>'Informar a Primavera Unifier el valor de las líneas de las solicitudes de compra o liberaciones de acuerdos de compra abierto en el momento mismo que son aprobadas, cuando estas tengan asociado un registro de líneas de costo, de manera que Primavera '
||'pueda tomar dicho valor e incorporarlo como valor comprometido para dichas líneas de costo'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5923152148247613)
,p_plug_name=>'Integración 4'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'Cuando se realiza el cierre final de una orden de compra o de una liberación de acuerdo de compra abierto en Oracle EBS, que tengan asociado registro de líneas de costo de Primavera, se debe para realizar en dicho sistema el registro de una devolució'
||'n en el monto comprometido, caso que se presenta cuando hay una recepción de bienes o servicios inferior a lo pactado en la orden de compra o liberación correspondiente'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5923230420247614)
,p_plug_name=>'Integración 5'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>3
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>'Cuando en Oracle EBS se realice la recepción de bienes o servicios que NO sean inventariables y que correspondan a compras que tienen asociadas líneas de costo de Primavera, se debe informar a dicho sistema para que haga el registro correspondiente a'
||'l valor ejecutado para la línea de costo correspondiente.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5923375160247615)
,p_plug_name=>'Integración 6'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>'A partir de las facturas no asociadas con orden de compra que se registren en el módulo de AP de Oracle EBS, se transmite a Primavera Unifier los valores de éstas por línea de costo. Para ello, quien registre cada uno de los mencionados documentos en'
||' Oracle EBS debe indicar los datos de proyecto y línea de costo a asignar por parte del responsable de aprobar el registro de la factura en el sistema'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5923467092247616)
,p_plug_name=>'Integración 7'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_source=>'Cada vez que se realice una transacción miscelánea para registrar la salida o entrada de materiales inventariables y que esté asociada a transacciones en Primavera, el usuario encargado de tramitarla debe registrar la línea de costo correspondiente p'
||'ara que en las noches se realice un envío que agrupe todas las transacciones de este tipo, acumuladas por proyecto y línea de costo y las envíe indicando además la cantidad y el costo total por cada material'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5923504415247617)
,p_plug_name=>'Integración 8'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'Cada vez que se procese un asiento contable dentro del módulo de GL de Oracle EBS, cuyas líneas deban asociarse a transacciones en Primavera, la integración toma los valores por organización de inventario (proyecto) más línea de costo y los envíe a P'
||'rimavera. Si el asiento es creado directamente en el módulo de GL, el usuario que crea dicho asiento debe registrar las líneas de costo correspondiente. Si el asiento proviene de otro módulo diferente de los considerados en este documento, se debe pe'
||'rmitir la captura de la información de líneas de costo en dicho módulo y transferirla a GL para poder realizar esta integración.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Proyectos'
,p_page_mode=>'NORMAL'
,p_step_title=>'Proyectos'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20170416164345'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5609476663668056)
,p_plug_name=>'Proyectos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select "ID_PROYECTO", ',
'"PROJECTCODE_U",',
'"STATUS_U",',
'"PROJECTNAME",',
'"PROJECTEBS",',
'"TYPE_PROJECT",',
'CASE WHEN "PROJECTEBS" IS NULL ',
'     THEN NULL',
'     ELSE ''<a href="f?p=&APP_ID.:17:''||:APP_SESSION||''::::P17_UNIFIER:''||PROJECTCODE_U||''">Cargar</a>''',
'     END "Cuenta Contable"',
'from "#OWNER#"."INT_PROJECT_LIST" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5609871317668057)
,p_name=>'Proyectos'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:3:&APP_SESSION.::::P3_ID_PROYECTO:#ID_PROYECTO#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif"  border="0">'
,p_owner=>'EBS_UNIFIER'
,p_internal_uid=>5609871317668057
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5609990524668061)
,p_db_column_name=>'ID_PROYECTO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Proyecto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5610386380668062)
,p_db_column_name=>'PROJECTCODE_U'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Proyecto Unifier'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5610756249668062)
,p_db_column_name=>'STATUS_U'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Estatus'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5611179979668062)
,p_db_column_name=>'PROJECTNAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nombre Proyecto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5611541069668063)
,p_db_column_name=>'PROJECTEBS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Proyecto EBS'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5611925406668063)
,p_db_column_name=>'TYPE_PROJECT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Proyecto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6356151487741315)
,p_db_column_name=>'Cuenta Contable'
,p_display_order=>16
,p_column_identifier=>'K'
,p_column_label=>'Cuenta contable'
,p_column_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP:P17_EBS,P17_UNIFIER,P17_TYPEPROJECT:#PROJECTEBS#,#PROJECTCODE_U#,#TYPE_PROJECT#'
,p_column_linktext=>'Cargar'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5614660186669939)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'56147'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID_PROYECTO:PROJECTCODE_U:STATUS_U:PROJECTNAME:PROJECTEBS:TYPE_PROJECT:Cuenta Contable'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5910537615881702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5609476663668056)
,p_button_name=>'ACTUALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Actualizar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5612363603668063)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(5609476663668056)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5612898748668064)
,p_event_id=>wwv_flow_api.id(5612363603668063)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5609476663668056)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5910711472881704)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ACTUALIZAR'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'INT_SP_ADDPROJECTS;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5910537615881702)
,p_process_success_message=>'Proyectos Actualizados Exitosamente'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Asignación Proyecto EBS'
,p_page_mode=>'MODAL'
,p_step_title=>'Asignación Proyecto EBS'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161028103636'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5601667482667937)
,p_plug_name=>'Asignación Proyecto EBS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5559647771562285)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5602118106667937)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5564147699562286)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5614010570668066)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5602517249667938)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5602118106667937)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5602092620667937)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5602118106667937)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P3_ID_PROYECTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5604110977668015)
,p_name=>'P3_ID_PROYECTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5601667482667937)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Proyecto'
,p_source=>'ID_PROYECTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5604434806668031)
,p_name=>'P3_PROJECTCODE_U'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5601667482667937)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proyecto Unifier:'
,p_source=>'PROJECTCODE_U'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5604862270668032)
,p_name=>'P3_STATUS_U'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5601667482667937)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estatus:'
,p_source=>'STATUS_U'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5605276515668033)
,p_name=>'P3_PROJECTNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5601667482667937)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre Proyecto:'
,p_source=>'PROJECTNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5605694871668033)
,p_name=>'P3_PROJECTEBS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5601667482667937)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proyecto EBS:'
,p_source=>'PROJECTEBS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5606070692668033)
,p_name=>'P3_TYPE_PROJECT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5601667482667937)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Proyecto'
,p_source=>'TYPE_PROJECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5602687464667938)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5602517249667938)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5603492666667938)
,p_event_id=>wwv_flow_api.id(5602687464667938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5606845037668034)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from INT_PROJECT_LIST'
,p_attribute_02=>'INT_PROJECT_LIST'
,p_attribute_03=>'P3_ID_PROYECTO'
,p_attribute_04=>'ID_PROYECTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5607244782668034)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Row of INT_PROJECT_LIST'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'update INT_PROJECT_LIST set PROJECTEBS=:P3_PROJECTEBS where PROJECTCODE_U=:P3_PROJECTCODE_U;',
'end;'))
,p_process_error_message=>'Error actualizando el proyecto'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Proyecto Actualizado Exitosamente'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5607696368668034)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5608066941668034)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'BPS'
,p_page_mode=>'NORMAL'
,p_step_title=>'BPS'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161004105433'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5626421299731217)
,p_plug_name=>'BPS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select "ID_BP_PROJECT", ',
'"PROJECT_CODE",',
'"BPNAME",',
'b."NAME_INTERFACES",',
'"BP_ACTIVE"',
'from "#OWNER#"."INT_BP_PROJECT" A, INT_INTERFACES B where A.id_interfaces=b.ID_INTERFACES '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5626871457731217)
,p_name=>'BPS'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:5:&APP_SESSION.::::P5_ID_BP_PROJECT:#ID_BP_PROJECT#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif"  border="0">'
,p_owner=>'EBS_UNIFIER'
,p_internal_uid=>5626871457731217
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5626918428731218)
,p_db_column_name=>'ID_BP_PROJECT'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Bp Project'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5627381704731218)
,p_db_column_name=>'PROJECT_CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Proyecto Unifier'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5627755805731218)
,p_db_column_name=>'BPNAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Nombre Proceso de Negocio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5628590967731219)
,p_db_column_name=>'BP_ACTIVE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Estatus'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5632172269761301)
,p_db_column_name=>'NAME_INTERFACES'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'Nombre Interfaz'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5631419592738062)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'56315'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID_BP_PROJECT:PROJECT_CODE:BPNAME:BP_ACTIVE:NAME_INTERFACES'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5629507311731219)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5628931782731219)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5626421299731217)
,p_button_name=>'Agregar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Agregar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5'
,p_grid_new_grid=>false
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Asignación BPs'
,p_page_mode=>'MODAL'
,p_step_title=>'Asignación BPs'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161012114815'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5619899656731189)
,p_plug_name=>'Asignación BPs'
,p_region_name=>'frmBP'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5630173543731220)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5620334352731189)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5619899656731189)
,p_button_name=>'SAVE'
,p_button_static_id=>'btnUpdate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition=>'P5_ID_BP_PROJECT'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5620482295731189)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5619899656731189)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5620215665731189)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5619899656731189)
,p_button_name=>'CREATE'
,p_button_static_id=>'btnSave'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P5_ID_BP_PROJECT'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5621508006731190)
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5621967581731190)
,p_name=>'P5_ID_BP_PROJECT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5619899656731189)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Bp Project'
,p_source=>'ID_BP_PROJECT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5622389900731202)
,p_name=>'P5_PROJECT_CODE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5619899656731189)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Proyecto unifier:'
,p_source=>'PROJECT_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select PROJECTNAME||'' (''||PROJECTCODE_U||'')'' as display_value, PROJECTCODE_U as return_value  from INT_PROJECT_LIST where PROJECTEBS is not null;'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5622632245731202)
,p_name=>'P5_BPNAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5619899656731189)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre Proceso de Negocio:'
,p_source=>'BPNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select BP_NAME as display_value, BP_NAME as return_value from INT_MV_SYS_BPNAME;'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5623033243731202)
,p_name=>'P5_ID_INTERFACES'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5619899656731189)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Interfaces:'
,p_source=>'ID_INTERFACES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name_interfaces as display_value, id_interfaces as return_value from int_interfaces;'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5623483318731203)
,p_name=>'P5_BP_ACTIVE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5619899656731189)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estatus:'
,p_source=>'BP_ACTIVE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Si;Y,No;N'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5635651351761336)
,p_name=>'REFRESCAR_VISTA'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_BPNAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5635732251761337)
,p_event_id=>wwv_flow_api.id(5635651351761336)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'DBMS_MVIEW.REFRESH(''INT_MV_SYS_BPNAME'') ;',
'',
'END;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5636237002761342)
,p_name=>'VALIDATION'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5636360828761343)
,p_event_id=>wwv_flow_api.id(5636237002761342)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'form'
,p_attribute_12=>'#frmBP'
,p_attribute_13=>'#btnSave,#btnUpdate'
,p_attribute_14=>'Verifique los campos antes de continuar'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5636403980761344)
,p_event_id=>wwv_flow_api.id(5636237002761342)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P5_PROJECT_CODE'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Seleccione código de proyecto Unifier'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5636542301761345)
,p_event_id=>wwv_flow_api.id(5636237002761342)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P5_BPNAME'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Seleccione nombre de BP'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5636613678761346)
,p_event_id=>wwv_flow_api.id(5636237002761342)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P5_ID_INTERFACES'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Seleccione interfaz de integración'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5636795755761347)
,p_event_id=>wwv_flow_api.id(5636237002761342)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P5_BP_ACTIVE'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Verifique si esta activo'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5624222536731203)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from INT_BP_PROJECT'
,p_attribute_02=>'INT_BP_PROJECT'
,p_attribute_03=>'P5_ID_BP_PROJECT'
,p_attribute_04=>'ID_BP_PROJECT'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5624677230731203)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of INT_BP_PROJECT'
,p_attribute_02=>'INT_BP_PROJECT'
,p_attribute_03=>'P5_ID_BP_PROJECT'
,p_attribute_04=>'ID_BP_PROJECT'
,p_attribute_11=>'I:U'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5625008789731203)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Interfaces'
,p_page_mode=>'NORMAL'
,p_step_title=>'Interfaces'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20160927131644'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5654039874423236)
,p_plug_name=>'Interfaces'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select "ID_INTERFACES", ',
'"NAME_INTERFACES",',
'"DESCRIPTION_INTERFACES"',
'from "#OWNER#"."INT_INTERFACES" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5654425539423236)
,p_name=>'Interfaces'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:7:&APP_SESSION.::::P7_ID_INTERFACES:#ID_INTERFACES#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif"  border="0">'
,p_owner=>'EBS_UNIFIER'
,p_internal_uid=>5654425539423236
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5654572590423236)
,p_db_column_name=>'ID_INTERFACES'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Interfaces'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5654934867423236)
,p_db_column_name=>'NAME_INTERFACES'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nombre Interfaz'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5655354819423237)
,p_db_column_name=>'DESCRIPTION_INTERFACES'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Descripción'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5662356309450403)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'56624'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID_INTERFACES:NAME_INTERFACES:DESCRIPTION_INTERFACES'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5658100631423238)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5656615197423237)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5654039874423236)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Agregar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5655715526423237)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(5654039874423236)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5656233331423237)
,p_event_id=>wwv_flow_api.id(5655715526423237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5654039874423236)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5657066518423237)
,p_name=>'Create Button - Dialog Closed'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5656615197423237)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5657502069423237)
,p_event_id=>wwv_flow_api.id(5657066518423237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5654039874423236)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Asignacion Interfaces'
,p_page_mode=>'MODAL'
,p_step_title=>'Asignacion Interfaces'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161012114401'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5646919817423209)
,p_plug_name=>'Asignacion Interfaces'
,p_region_name=>'frmInterfaz'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5559647771562285)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5647551029423209)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5564147699562286)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5658780671423238)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5647984907423209)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5647551029423209)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5647468484423209)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5647551029423209)
,p_button_name=>'SAVE'
,p_button_static_id=>'btnUpdate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P7_ID_INTERFACES'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5647316815423209)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5647551029423209)
,p_button_name=>'CREATE'
,p_button_static_id=>'btnSave'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P7_ID_INTERFACES'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5649884905423210)
,p_name=>'P7_ID_INTERFACES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5646919817423209)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Interfaces'
,p_source=>'ID_INTERFACES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5650284529423222)
,p_name=>'P7_NAME_INTERFACES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5646919817423209)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre Interfaz:'
,p_source=>'NAME_INTERFACES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5650674314423222)
,p_name=>'P7_DESCRIPTION_INTERFACES'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5646919817423209)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Descripción'
,p_source=>'DESCRIPTION_INTERFACES'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5648080745423209)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5647984907423209)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5648807410423210)
,p_event_id=>wwv_flow_api.id(5648080745423209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5635862172761338)
,p_name=>'VALIDATION'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5636080074761340)
,p_event_id=>wwv_flow_api.id(5635862172761338)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'form'
,p_attribute_12=>'#frmInterfaz'
,p_attribute_13=>'#btnSave,#btnUpdate'
,p_attribute_14=>'Verifique todos los campos antes de continuar'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5635952753761339)
,p_event_id=>wwv_flow_api.id(5635862172761338)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P7_NAME_INTERFACES'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Nombre Requerido'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5636113734761341)
,p_event_id=>wwv_flow_api.id(5635862172761338)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P7_DESCRIPTION_INTERFACES'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Descripción requerida'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5651441854423223)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from INT_INTERFACES'
,p_attribute_02=>'INT_INTERFACES'
,p_attribute_03=>'P7_ID_INTERFACES'
,p_attribute_04=>'ID_INTERFACES'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5651800470423223)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of INT_INTERFACES'
,p_attribute_02=>'INT_INTERFACES'
,p_attribute_03=>'P7_ID_INTERFACES'
,p_attribute_04=>'ID_INTERFACES'
,p_attribute_11=>'I:U'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5652270411423223)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5652678919423223)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Credenciales'
,p_page_mode=>'NORMAL'
,p_step_title=>'Credenciales'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161012115841'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5663612403470549)
,p_name=>'Credenciales'
,p_region_name=>'frmCredenciales'
,p_template=>wwv_flow_api.id(5567722550562287)
,p_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ',
'"ID_AUTH",',
'"ID_AUTH" ID_AUTH_DISPLAY,',
'"SHORTNAME",',
'"AUTHCODE",',
'"ACTIVE"',
'from "#OWNER#"."INT_AUTH"',
''))
,p_source_type=>'NATIVE_TABFORM'
,p_ajax_enabled=>'N'
,p_query_row_template=>wwv_flow_api.id(5576510027562290)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'(null)'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_query_row_count_max=>500
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5664346330470551)
,p_query_column_id=>1
,p_column_alias=>'ID_AUTH'
,p_column_display_sequence=>1
,p_column_heading=>'Id Auth'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_display_as=>'HIDDEN'
,p_column_width=>16
,p_pk_col_source_type=>'T'
,p_ref_schema=>'EBS_UNIFIER'
,p_ref_table_name=>'INT_AUTH'
,p_ref_column_name=>'ID_AUTH'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5664773539470551)
,p_query_column_id=>2
,p_column_alias=>'ID_AUTH_DISPLAY'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_ref_schema=>'EBS_UNIFIER'
,p_ref_table_name=>'INT_AUTH'
,p_ref_column_name=>'ID_AUTH_DISPLAY'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5665169889470551)
,p_query_column_id=>3
,p_column_alias=>'SHORTNAME'
,p_column_display_sequence=>3
,p_column_heading=>'Shortname'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>16
,p_ref_schema=>'EBS_UNIFIER'
,p_ref_table_name=>'INT_AUTH'
,p_ref_column_name=>'SHORTNAME'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5665557727470551)
,p_query_column_id=>4
,p_column_alias=>'AUTHCODE'
,p_column_display_sequence=>4
,p_column_heading=>'Authcode'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>12
,p_ref_schema=>'EBS_UNIFIER'
,p_ref_table_name=>'INT_AUTH'
,p_ref_column_name=>'AUTHCODE'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5665980993470551)
,p_query_column_id=>5
,p_column_alias=>'ACTIVE'
,p_column_display_sequence=>5
,p_column_heading=>'Active'
,p_disable_sort_column=>'N'
,p_display_as=>'TEXT'
,p_column_width=>12
,p_ref_schema=>'EBS_UNIFIER'
,p_ref_table_name=>'INT_AUTH'
,p_ref_column_name=>'ACTIVE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5670550346470555)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5667942792470554)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5663612403470549)
,p_button_name=>'SUBMIT'
,p_button_static_id=>'btnSave'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5667883746470554)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5663612403470549)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5670099777470555)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5667942792470554)
,p_branch_sequence=>1
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5668934703470554)
,p_tabular_form_region_id=>wwv_flow_api.id(5663612403470549)
,p_validation_name=>'SHORTNAME not null'
,p_validation_sequence=>30
,p_validation=>'SHORTNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# requiere un valor.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(5667942792470554)
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'SHORTNAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5669327161470554)
,p_tabular_form_region_id=>wwv_flow_api.id(5663612403470549)
,p_validation_name=>'AUTHCODE not null'
,p_validation_sequence=>40
,p_validation=>'AUTHCODE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# requiere un valor.'
,p_always_execute=>'N'
,p_when_button_pressed=>wwv_flow_api.id(5667942792470554)
,p_only_for_changed_rows=>'Y'
,p_associated_column=>'AUTHCODE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5636847379761348)
,p_name=>'VALIDATION'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5636956064761349)
,p_event_id=>wwv_flow_api.id(5636847379761348)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'form'
,p_attribute_12=>'#frmCredenciales'
,p_attribute_13=>'#btnSave'
,p_attribute_14=>'Verifique los campos de credenciales antes de continuar'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5669646067470555)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(5663612403470549)
,p_process_type=>'NATIVE_TABFORM_UPDATE'
,p_process_name=>'ApplyMRU'
,p_attribute_02=>'INT_AUTH'
,p_attribute_03=>'ID_AUTH'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5667942792470554)
,p_process_success_message=>'#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.'
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Codigo Errores'
,p_page_mode=>'NORMAL'
,p_step_title=>'Codigo Errores'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161013162522'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5678987824509438)
,p_plug_name=>'Codigo Errores'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select "ID_STATUS_CODE", ',
'"STATUS_CODE",',
'"DESCRIPTION","TYPE"',
'from "#OWNER#"."INT_STATUS_CODE" ',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5679354463509438)
,p_name=>'Codigo Errores'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:10:&APP_SESSION.::::P10_ID_STATUS_CODE:#ID_STATUS_CODE#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif"  border="0">'
,p_owner=>'EBS_UNIFIER'
,p_internal_uid=>5679354463509438
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5679413794509438)
,p_db_column_name=>'ID_STATUS_CODE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Status Code'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5679812717509439)
,p_db_column_name=>'STATUS_CODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Código Respuesta'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5680202421509439)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Descripción'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5890744392814402)
,p_db_column_name=>'TYPE'
,p_display_order=>13
,p_column_identifier=>'D'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5687110013530429)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'56872'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID_STATUS_CODE:STATUS_CODE:DESCRIPTION:TYPE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5683021620509440)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5681584760509439)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5678987824509438)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Agregar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:10'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5680642644509439)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(5678987824509438)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5681186328509439)
,p_event_id=>wwv_flow_api.id(5680642644509439)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5678987824509438)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5681994227509440)
,p_name=>'Create Button - Dialog Closed'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5681584760509439)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5682405406509440)
,p_event_id=>wwv_flow_api.id(5681994227509440)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5678987824509438)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Crear Código Estatus'
,p_page_mode=>'MODAL'
,p_step_title=>'Crear Código Estatus'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161013162633'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5672504670509411)
,p_plug_name=>'Crear Código Estatus'
,p_region_name=>'frmCodigo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5559647771562285)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5673126698509411)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5564147699562286)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5683643951509440)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5673550223509411)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5673126698509411)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5673009869509411)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5673126698509411)
,p_button_name=>'SAVE'
,p_button_static_id=>'btnUpdate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P10_ID_STATUS_CODE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5672919178509411)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5673126698509411)
,p_button_name=>'CREATE'
,p_button_static_id=>'btnSave'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Agregar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P10_ID_STATUS_CODE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5675490905509412)
,p_name=>'P10_ID_STATUS_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5672504670509411)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id Status Code'
,p_source=>'ID_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5675883130509425)
,p_name=>'P10_STATUS_CODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5672504670509411)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Código Error (Max. 3):'
,p_source=>'STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5676221307509425)
,p_name=>'P10_DESCRIPTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5672504670509411)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Descripción:'
,p_source=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5890642680814401)
,p_name=>'P10_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5672504670509411)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Type'
,p_source=>'TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Error;ERROR,Exito;EXITO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5673638194509411)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5673550223509411)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5674479985509411)
,p_event_id=>wwv_flow_api.id(5673638194509411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5823399637590901)
,p_name=>'VALIDATION'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5823484032590902)
,p_event_id=>wwv_flow_api.id(5823399637590901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'form'
,p_attribute_12=>'#frmCodigo'
,p_attribute_13=>'#btnSave,#btnUpdate'
,p_attribute_14=>'Verifique los campo antes de continuar'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5823502981590903)
,p_event_id=>wwv_flow_api.id(5823399637590901)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'charLength'
,p_attribute_03=>'P10_STATUS_CODE'
,p_attribute_04=>'blur'
,p_attribute_10=>'1'
,p_attribute_11=>'3'
,p_attribute_14=>'*Máximo 3 caracteres'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5823612068590904)
,p_event_id=>wwv_flow_api.id(5823399637590901)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P10_STATUS_CODE'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Código requerido'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5823701680590905)
,p_event_id=>wwv_flow_api.id(5823399637590901)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P10_DESCRIPTION'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Descripción requerida'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5890809451814403)
,p_event_id=>wwv_flow_api.id(5823399637590901)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_BE.CTB.JQ.ALV'
,p_attribute_01=>'notEmpty'
,p_attribute_03=>'P10_TYPE'
,p_attribute_04=>'blur'
,p_attribute_14=>'*Seleccione el tipo de error'
,p_attribute_15=>'after'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5677076056509425)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from INT_STATUS_CODE'
,p_attribute_02=>'INT_STATUS_CODE'
,p_attribute_03=>'P10_ID_STATUS_CODE'
,p_attribute_04=>'ID_STATUS_CODE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5677498662509425)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of INT_STATUS_CODE'
,p_attribute_02=>'INT_STATUS_CODE'
,p_attribute_03=>'P10_ID_STATUS_CODE'
,p_attribute_04=>'ID_STATUS_CODE'
,p_attribute_11=>'I:U'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5677890055509426)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5678277532509426)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Auditoria'
,p_page_mode=>'NORMAL'
,p_step_title=>'Auditoria'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161021074019'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5633677025761316)
,p_plug_name=>'Objetos Integrados'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select label, value, url from (',
'select 1 display_sequence,''Proyectos'' label ,to_char(count(*),''999G999G990'') value,''f?p=''||:APP_ID||'':2:''||:APP_SESSION||'':::2,RIR:IRNN_PROJECTEBS'' url from int_project_list where PROJECTEBS is not null',
'union all',
'select 2 display_sequence,''Interfaces de Integración'' as label,to_char(count(*),''999G999G990'') value,''f?p=''||:APP_ID||'':6:''||:APP_SESSION||'':::6,RIR,RP'' url from INT_INTERFACES',
'union all',
'select 3 display_sequence,''Procesos de Negocio'' label,to_char(count(*),''999G999G990'') value,''f?p=''||:APP_ID||'':4:''||:APP_SESSION||'':::4,RIR,RP'' url from INT_BP_PROJECT)  order by display_sequence;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BIG_VALUE_LIST'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'LABEL'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'&URL.'
,p_attribute_05=>'3'
,p_attribute_06=>'B'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5824052820590908)
,p_plug_name=>'Registro Transacciones por día'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>5
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(5824125671590909)
,p_default_chart_type=>'StackedHorizontal3DColumn'
,p_chart_title=>'Registro Transacciones por día'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_width=>700
,p_chart_height=>400
,p_display_attr=>':H:N:V:X::N::::Default:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>':::N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(5824255436590910)
,p_chart_id=>wwv_flow_api.id(5824125671590909)
,p_series_seq=>10
,p_series_name=>'Registro Transacciones'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null link,to_char(date_transaction,''MM/DD/YYYY'') FECHA_TRANSACCION,',
'count(*) NUMERO_TRANSACCIONES',
'from LOG_BP_PROCESS ',
'where DATE_TRANSACTION is not null group by to_char(date_transaction,''MM/DD/YYYY'') order by to_char(date_transaction,''MM/DD/YYYY'');'))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'No hay datos disponibles para mostrar'
,p_series_query_row_count_max=>300
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5824300187590911)
,p_plug_name=>'Registros de transacciones por interfaz'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>5
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(5824413265590912)
,p_default_chart_type=>'2DLine'
,p_chart_title=>'Transacciones por Interfaz'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_width=>700
,p_chart_height=>400
,p_display_attr=>':H:N:V:X::N::::Default:N:N::N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>':::N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(5824512436590913)
,p_chart_id=>wwv_flow_api.id(5824413265590912)
,p_series_seq=>10
,p_series_name=>'Registros por Interfaz'
,p_series_query=>'select ''f?p=''||:APP_ID||'':15:''||:APP_SESSION||'':::15,RIR:IREQ_NAME_INTERFACES:''||NAME_INTERFACES link,NAME_INTERFACES,count(*) NUMERO_TRANSACCIONES from LOG_BP_PROCESS A,INT_INTERFACES B where a.INTERFACE_CODE=b.ID_INTERFACES and INTERFACE_CODE is no'
||'t null group by NAME_INTERFACES;'
,p_series_type=>'Line'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_row_count_max=>300
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5824866498590916)
,p_plug_name=>'Log de transacciones por día'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>5
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(5824927245590917)
,p_default_chart_type=>'StackedHorizontal3DColumn'
,p_chart_title=>'Log Transacciones por día'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_width=>700
,p_chart_height=>400
,p_display_attr=>':H:N:V:X::Bottom::V:Y:Default:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>':::N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'1'
,p_x_axis_title=>'Fecha Registros'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_title=>'Número Registros'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'Tahoma:10:#000000'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:10:#000000'
,p_y_axis_title_font=>'Tahoma:10:#000000'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(5825032486590918)
,p_chart_id=>wwv_flow_api.id(5824927245590917)
,p_series_seq=>10
,p_series_name=>'LOG'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select null link,FECHA,count(decode(tipo,''EXITO'',response,null)) EXITO,count(decode(tipo,''ERROR'',response,null)) ERRORES from (',
'select to_char(A.DATE_TRANSACTION,''mm/dd/yyyy'') FECHA ,a.response,b.type tipo',
'from LOG_BP_PROCESS A, INT_STATUS_CODE B ',
'where b.STATUS_CODE=A.RESPONSE and A.DATE_TRANSACTION is not null) group by fecha;'))
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'No existen datos'
,p_series_query_row_count_max=>100
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5921915564247601)
,p_plug_name=>'Registro transacciones por BP'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_column=>7
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(5922031769247602)
,p_default_chart_type=>'StackedHorizontal3DColumn'
,p_chart_title=>'Transacciones por BP'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_width=>700
,p_chart_height=>400
,p_display_attr=>':H:N:V:N::Bottom::V:Y:Diamond:N:N:N:N:N:Default:N::S:'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>':::'
,p_map_attr=>':::N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'1'
,p_x_axis_label_font=>'Tahoma:10:#000000'
,p_y_axis_label_font=>'Tahoma:10:#000000'
,p_async_update=>'N'
,p_legend_title=>'BP''s'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'Tahoma:10:#000000'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(5922192592247603)
,p_chart_id=>wwv_flow_api.id(5922031769247602)
,p_series_seq=>10
,p_series_name=>'Transacciones por BP'
,p_series_query=>'SELECT ''f?p=''||:APP_ID||'':15:''||:APP_SESSION||'':::15,RIR:IREQ_BPNAME:''||A.BPNAME link,A.BPNAME,COUNT(*) Registros FROM LOG_BP_PROCESS A,INT_BP_PROJECT B WHERE B.BPNAME=A.BPNAME AND A.DATE_TRANSACTION IS NOT NULL GROUP BY A.BPNAME;'
,p_series_type=>'Bar'
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_row_count_max=>300
,p_show_action_link=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5922214379247604)
,p_plug_name=>'Registros por Proyecto'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_column=>4
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(5922335059247605)
,p_default_chart_type=>'2DDoughnut'
,p_chart_title=>'Registros por Proyecto'
,p_chart_rendering=>'SVG_ONLY'
,p_chart_width=>700
,p_chart_height=>400
,p_display_attr=>':H:N:V:::N::::Default::N:N:::::::'
,p_dial_tick_attr=>':::::::::::'
,p_gantt_attr=>':::::::::::::::::::'
,p_pie_attr=>'Outside:::'
,p_map_attr=>':::N:N:Series:::::'
,p_margins=>':::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_grid_gradient_rotation=>0
,p_color_scheme=>'6'
,p_x_axis_label_font=>'::'
,p_y_axis_label_font=>'::'
,p_async_update=>'N'
, p_names_font=> null
, p_names_rotation=> null
,p_values_font=>'Tahoma:10:#000000'
,p_hints_font=>'Tahoma:10:#000000'
,p_legend_font=>'::'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'::'
,p_y_axis_title_font=>'::'
,p_gauge_labels_font=>'::'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(5922494788247606)
,p_chart_id=>wwv_flow_api.id(5922335059247605)
,p_series_seq=>10
,p_series_name=>'Registros por Proyecto'
,p_series_query=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT ''f?p=''||:APP_ID||'':15:''||:APP_SESSION||'':::15,RIR:IREQ_PROJECT_CODE:''||b.PROJECTCODE_U link,b.PROJECTNAME,COUNT(*) REGISTROS FROM LOG_BP_PROCESS A,INT_PROJECT_LIST b  ',
'where a.PROJECT_CODE=b.PROJECTCODE_U and PROJECT_CODE is not null group by b.PROJECTNAME,b.PROJECTCODE_U;'))
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_row_count_max=>300
,p_show_action_link=>'N'
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Presupuestos Disponibles'
,p_page_mode=>'NORMAL'
,p_step_title=>'Presupuestos Disponibles'
,p_step_sub_title=>'Presupuestos Disponibles'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20160927144250'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5688868052732312)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5571092665562288)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5595254435562311)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5589201002562294)
,p_plug_query_row_template=>1
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5689498045732313)
,p_plug_name=>'Presupuestos Disponibles'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ID_BP_AMOUNT,',
'       PROJECT_BPA,',
'       BITEMID_CS,',
'       AMOUNT_BPA,',
'       STATUS_BPA,',
'       DISPONIBLE_BPA,',
'       FLAG_EBS,',
'       PROJECTUNIFIER,',
'       EFFECTIVE_YEAR,',
'       TO_CHAR(EFFECTIVE_DATE,''MON'') EFFECTIVE_DATE',
'  from INT_BP_AMOUNT'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5689533197732313)
,p_name=>'Presupuestos Disponibles'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'EBS_UNIFIER'
,p_internal_uid=>5689533197732313
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5689959968732314)
,p_db_column_name=>'ID_BP_AMOUNT'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Bp Amount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5690383489732314)
,p_db_column_name=>'PROJECT_BPA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Proyecto EBS'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5690731399732314)
,p_db_column_name=>'BITEMID_CS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Linea de Costo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5691185697732315)
,p_db_column_name=>'AMOUNT_BPA'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Monto Original'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5691520311732315)
,p_db_column_name=>'STATUS_BPA'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Estatus'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5691918650732315)
,p_db_column_name=>'DISPONIBLE_BPA'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Disponible = Original + Transferencias + Ordenes de Cambio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5692378120732315)
,p_db_column_name=>'FLAG_EBS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Flag Ebs'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5692742246732315)
,p_db_column_name=>'PROJECTUNIFIER'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Proyecto Unifier'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5693184384732315)
,p_db_column_name=>'EFFECTIVE_YEAR'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Año Efectivo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5632436979761304)
,p_db_column_name=>'EFFECTIVE_DATE'
,p_display_order=>19
,p_column_identifier=>'M'
,p_column_label=>'Mes Efectivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5693957491733455)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'56940'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID_BP_AMOUNT:PROJECT_BPA:BITEMID_CS:AMOUNT_BPA:STATUS_BPA:DISPONIBLE_BPA:FLAG_EBS:PROJECTUNIFIER:EFFECTIVE_YEAR'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Gestión estructura de costos'
,p_page_mode=>'NORMAL'
,p_step_title=>'Estructura de Costos'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20170117122616'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5632503955761305)
,p_plug_name=>'Lista de proyectos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5632665011761306)
,p_plug_name=>'Estructura de Costos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>5
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select case WHEN connect_by_isleaf = 1 THEN 0 WHEN level = 1 THEN 1 ELSE -1 END as status,',
'level,WBSCODE_CS||''         ''||WBSITEM_CS as title, ''icon-tree-folder'' as icon,PARENTID_CS as value,STATUS_CS as tooltip, null as link from (',
'select * from int_cost_sheet where UNIFIERPROJECT=:P13_PROYECTO)',
'START WITH PARENTID_CS = (select PARENTID_RN from INT_ROOTNODE where PROJECT_RN=:P13_PROYECTO)',
'      CONNECT BY PRIOR WBSCODEID_CS = PARENTID_CS order by ORDERID_CS;'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_04=>'DB'
,p_attribute_07=>'APEX_TREE'
,p_attribute_08=>'a-Icon'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5827705863590945)
,p_plug_name=>'Actualización lineas de costo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5632872717761308)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5632503955761305)
,p_button_name=>'APLICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_image_alt=>'Aplicar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5828248112590950)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5827705863590945)
,p_button_name=>'MODIFICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Modificar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5632703700761307)
,p_name=>'P13_PROYECTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5632503955761305)
,p_prompt=>'Proyecto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select PROJECTNAME||'' (''||PROJECTCODE_U||'')'' as display_value, PROJECTCODE_U as return_value  from INT_PROJECT_LIST where PROJECTEBS is not null;'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5827801109590946)
,p_name=>'P13_BITEMID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5827705863590945)
,p_prompt=>'Línea de Costo:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select WBSCODE_CS as display_value,ID_COST_SHEET as return_value from (',
'select ID_COST_SHEET,WBSCODE_CS,CONNECT_BY_ISLEAF IMPTBLE  from (select * ',
'                                                         from int_cost_sheet ',
'                                                         where UNIFIERPROJECT=:P13_PROYECTO)',
'START WITH PARENTID_CS = (select PARENTID_RN from INT_ROOTNODE where PROJECT_RN=:P13_PROYECTO)',
'      CONNECT BY PRIOR WBSCODEID_CS = PARENTID_CS order by ORDERID_CS',
'      ) where imptble =0;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_lov_cascade_parent_items=>'P13_PROYECTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5827994051590947)
,p_name=>'P13_DESCRIPTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5827705863590945)
,p_prompt=>'Descripción:'
,p_placeholder=>'Descripción linea de costo...'
,p_source=>'select WBSITEM_CS from INT_COST_SHEET where ID_COST_SHEET=:P13_BITEMID;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6232906250994101)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'begin',
'update INT_COST_SHEET set WBSITEM_CS=:P13_DESCRIPTION, flag_ebs=''N'' where ID_COST_SHEET=:P13_BITEMID;',
'end;'))
,p_process_error_message=>'Error actualizando la línea de costo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5828248112590950)
,p_process_success_message=>'Línea de costo modificada exitosamente'
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Control de Cambio y Transferencias'
,p_page_mode=>'NORMAL'
,p_step_title=>'Control de Cambio y Transferencias'
,p_step_sub_title=>'Control de Cambio y Transferencias'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20170117082201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5832236085081515)
,p_plug_name=>'Control de Cambio y Transferencias'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'select ID_UPDATE_AMOUNT,PROJECT_EBS,BITEMID_CS,PROJECT_UNIFIER,RECORD_NO,FLAG,STATUS,AMOUNT,EFFECTIVE_DATE,',
'case when TYPE_AMOUNT=''IP'' then ''Presupuesto Inicial''',
'     when TYPE_AMOUNT=''CO'' then ''Orden de Cambio'' ',
'     when TYPE_AMOUNT=''AT'' then ''Transferencia entre líneas de costo'' end TYPE_AMOUNT from INT_UPDATE_AMOUNT;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5826599810590933)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'EBS_UNIFIER'
,p_internal_uid=>5826599810590933
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5826744382590935)
,p_db_column_name=>'ID_UPDATE_AMOUNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id update amount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5826818366590936)
,p_db_column_name=>'PROJECT_EBS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Proyecto EBS'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5826959640590937)
,p_db_column_name=>'BITEMID_CS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Línea de Costo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5827079675590938)
,p_db_column_name=>'PROJECT_UNIFIER'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Proyecto Unifier'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5827135836590939)
,p_db_column_name=>'RECORD_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Registro Unifier'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5827206948590940)
,p_db_column_name=>'FLAG'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Proceso'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5827328288590941)
,p_db_column_name=>'STATUS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Estatus'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5827461264590942)
,p_db_column_name=>'AMOUNT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5827512939590943)
,p_db_column_name=>'EFFECTIVE_DATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Fecha Effectiva'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5827611395590944)
,p_db_column_name=>'TYPE_AMOUNT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Tipo de Transacción'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(6221254708330519)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'62213'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID_UPDATE_AMOUNT:PROJECT_EBS:BITEMID_CS:PROJECT_UNIFIER:RECORD_NO:FLAG:STATUS:AMOUNT:EFFECTIVE_DATE:TYPE_AMOUNT'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Log de Eventos'
,p_page_mode=>'NORMAL'
,p_step_title=>'Log de Eventos'
,p_step_sub_title=>'Log de Eventos'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161014105347'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5844350010424071)
,p_plug_name=>'Log de Eventos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'select ID_LOG_BP_PROCESS, RESPONSE,XMLPROCESS,BPNAME,PROJECT_CODE,b.NAME_INTERFACES,TRANSACTION_EBS,trunc(DATE_TRANSACTION) DATE_TRANSACTION from LOG_BP_PROCESS A, INT_INTERFACES B where a.interface_code=b.ID_INTERFACES and rownum <=100 and A.DATE_TR'
||'ANSACTION is not null order by ID_LOG_BP_PROCESS desc;'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5844490586424071)
,p_name=>'Log de Eventos'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'Sin datos para mostrar'
,p_base_pk1=>'ID_LOG_BP_PROCESS'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'EBS_UNIFIER'
,p_internal_uid=>5844490586424071
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5844814155424071)
,p_db_column_name=>'ID_LOG_BP_PROCESS'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Log Bp Process'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5845281231424072)
,p_db_column_name=>'RESPONSE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Código Respuesta'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5845683712424072)
,p_db_column_name=>'XMLPROCESS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Proceso'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5846013028424072)
,p_db_column_name=>'BPNAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nombre BP'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5846474066424072)
,p_db_column_name=>'PROJECT_CODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Código de Proyecto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5847257253424072)
,p_db_column_name=>'TRANSACTION_EBS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Número Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5823979319590907)
,p_db_column_name=>'NAME_INTERFACES'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>'Interfaz de Integración'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5922613939247608)
,p_db_column_name=>'DATE_TRANSACTION'
,p_display_order=>28
,p_column_identifier=>'K'
,p_column_label=>'Date transaction'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5850987571498946)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'58510'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID_LOG_BP_PROCESS:RESPONSE:XMLPROCESS:BPNAME:PROJECT_CODE:TRANSACTION_EBS:NAME_INTERFACES'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Datos EBS'
,p_page_mode=>'NORMAL'
,p_step_title=>'Datos EBS'
,p_step_sub_title=>'Datos EBS'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161012145127'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5854443515599559)
,p_plug_name=>'Datos EBS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567285753562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'select ID_EBS,PROJECT_EBS,BITEMID_EBS,AMOUNT_EBS,INT_SOURCE,INT_BATCH_ID,INT_SOURCE_DESC,TRANSACTION_EBS,LAST_ITEM_EBS from INT_EBS_AMOUNT where rownum <=100 order by ID_EBS desc;'
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5854584312599559)
,p_name=>'Datos EBS'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'ID_EBS'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_owner=>'EBS_UNIFIER'
,p_internal_uid=>5854584312599559
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5854917213599560)
,p_db_column_name=>'ID_EBS'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Ebs'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5855351894599560)
,p_db_column_name=>'PROJECT_EBS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Proyecto EBS'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5855757997599560)
,p_db_column_name=>'BITEMID_EBS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Línea de Costo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5856184545599560)
,p_db_column_name=>'AMOUNT_EBS'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Monto'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5856535331599561)
,p_db_column_name=>'INT_SOURCE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Interfaz de Integración'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5856980125599561)
,p_db_column_name=>'INT_BATCH_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Batch ID'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5857302425599561)
,p_db_column_name=>'INT_SOURCE_DESC'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Descripción Integración'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5857723601599561)
,p_db_column_name=>'TRANSACTION_EBS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Transacción EBS'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5858175084599561)
,p_db_column_name=>'LAST_ITEM_EBS'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Verificación de Ítem'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5861756114618747)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'58618'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID_EBS:PROJECT_EBS:BITEMID_EBS:AMOUNT_EBS:INT_SOURCE:INT_BATCH_ID:INT_SOURCE_DESC:TRANSACTION_EBS:LAST_ITEM_EBS'
,p_flashback_enabled=>'N'
);
end;
/
prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Cuenta Contable'
,p_page_mode=>'MODAL'
,p_step_title=>'Cuenta Contable'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20170420100444'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6355611660741310)
,p_plug_name=>'Cargar cuenta contable'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5567722550562287)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6356245610741316)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(6355611660741310)
,p_button_name=>'CARGAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Iniciar Carga'
,p_button_position=>'BODY'
,p_button_condition=>'P17_EBS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>7
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5910867418881705)
,p_name=>'P17_YEAR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6355611660741310)
,p_item_default=>'2017'
,p_prompt=>'Año'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P17_TYPEPROJECT'
,p_display_when2=>'FM-RE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5910958159881706)
,p_name=>'P17_MONTH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6355611660741310)
,p_item_default=>'3'
,p_prompt=>'Mes(Número)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P17_TYPEPROJECT'
,p_display_when2=>'FM-RE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6355756808741311)
,p_name=>'P17_UNIFIER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6355611660741310)
,p_prompt=>'Proyecto Unifier'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6355824676741312)
,p_name=>'P17_EBS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6355611660741310)
,p_prompt=>'Proyecto EBS'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6355999419741313)
,p_name=>'P17_TYPEPROJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6355611660741310)
,p_prompt=>'Tipo de proyecto'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6356044589741314)
,p_name=>'P17_COLUMNNAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6355611660741310)
,p_item_default=>'Cuenta Contable'
,p_prompt=>'Nombre Columna'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(5588235400562293)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6356369082741317)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGAR'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'INT_SP_ACCOUNTING_ACCOUNT(:P17_UNIFIER,:P17_EBS,:P17_TYPEPROJECT,:P17_COLUMNNAME,:P17_YEAR,:P17_MONTH);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6356245610741316)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6356445087741318)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CARGAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(5593958646562303)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_page_mode=>'NORMAL'
,p_step_title=>'CAI - Log In'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' /* Imagen del logo */',
'',
' span.t-Login-logo {',
'',
'background: url("#WORKSPACE_IMAGES#gruporoble.jpg");',
'',
'background-size: cover;',
'',
'width: 180px;',
'',
'height: 180px;',
'}',
'/*Color fondo boton ingresar*/',
'',
'.t-Button .t-Button--hot   .t-Button--stretch {',
'  ',
'background-color: #57BB97',
'}',
'/* Color de fondo de la región Conectar */',
'',
'.t-Login-region {',
'',
'   background-color: #ECF6CE;',
'  margin:0px;',
'  right:25em;',
' /* background: url("#WORKSPACE_IMAGES#huellas_perro.png");*/',
'  ',
'',
'}',
'',
'/* Color del título Conectar que está debajo del logo */',
'',
'body .t-Login-title {',
'',
'   color: #000;',
'',
'}',
''))
,p_step_template=>wwv_flow_api.id(5553528728562282)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'Y'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'EBS_UNIFIER'
,p_last_upd_yyyymmddhh24miss=>'20161109125725'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5594426833562309)
,p_plug_name=>'Administración de Integración'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5567561930562287)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5594719829562311)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5594426833562309)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(5588746689562294)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ingresar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5594517086562310)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5594426833562309)
,p_prompt=>'Usuario:'
,p_placeholder=>'Usuario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(5588120720562293)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5594694110562310)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5594426833562309)
,p_prompt=>'Contraseña'
,p_placeholder=>'Contraseña'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(5588120720562293)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5594964961562311)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5594860246562311)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5595122993562311)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5595073976562311)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
prompt --application/deployment/definition
begin
null;
end;
/
prompt --application/deployment/install
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, true));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
