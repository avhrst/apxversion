prompt --application/shared_components/plugins/region_type/com_oracle_apex_acl_warning
begin
--   Manifest
--     PLUGIN: COM.ORACLE.APEX.ACL_WARNING
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(15292188740577548342)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.ACL_WARNING'
,p_display_name=>'ACL Warning'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.ACL_WARNING'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render (   p_region              in apex_plugin.t_region,',
'                        p_plugin              in apex_plugin.t_plugin,',
'                        p_is_printer_friendly in boolean ) return apex_plugin.t_region_render_result is',
'    l_retval         apex_plugin.t_region_render_result;',
'    --',
'    c_admin_page  constant varchar2(512)   := p_region.attribute_01;',
'begin',
'    -- This plugin displays a warning message if the ACL is disabled. To use:',
'    --    1) Add this plugin region to the top of the application home page.',
'    --    2) Set the template to Alert region, with the Warning template option.',
'    --    3) Add a PL/SQL expression condition to the region, following this pattern:',
'    --        eba_XXX_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'') = ''N''',
'',
'    sys.htp.p(''Access control for this application is currently disabled. ''',
'        ||''All users are currently Administrators. Navigate to <a href="''',
'        ||apex_util.prepare_url(c_admin_page)||''">application administration</a> ''',
'        ||''to enable access control.'');',
'',
'    return l_retval;    ',
'end;'))
,p_api_version=>1
,p_render_function=>'render'
,p_substitute_attributes=>true
,p_reference_id=>1830928929089695217
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>ACL Warning is designed for those applications that use the built-in Application Express authentication Access Control List (ACL), to control access to the application and features. The plug-in displays a warning when ACL is disabled.</p>',
'<p>This plug-in is suitable for adding to the Home page to provide warnings when ACL is not enabled, allowing every user to act as an Administrator.</p>'))
,p_version_identifier=>'5.0.1'
,p_about_url=>'http://apex.oracle.com/plugins'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90201884910361975)
,p_plugin_id=>wwv_flow_api.id(15292188740577548342)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Administration Page Link'
,p_attribute_type=>'LINK'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked entry.',
'<pre>f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.</pre>',
'</p>',
'<p>Example 2: Display the EMPNO value of the clicked entry in a JavaScript alert',
'<pre>javascript:alert(''current empno: &amp;EMPNO.'');</pre>',
'</p>'))
,p_help_text=>'<p>Enter a target page to be called when the user clicks the associated link.</p>'
);
wwv_flow_api.component_end;
end;
/
