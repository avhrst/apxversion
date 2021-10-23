prompt --application/shared_components/plugins/region_type/com_oracle_auth_administration
begin
--   Manifest
--     PLUGIN: COM.ORACLE.AUTH_ADMINISTRATION
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
 p_id=>wwv_flow_api.id(14900209312057359268)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.AUTH_ADMINISTRATION'
,p_display_name=>'Authorization Administration'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.AUTH_ADMINISTRATION'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function auth_admin (   p_region              in apex_plugin.t_region,',
'                        p_plugin              in apex_plugin.t_plugin,',
'                        p_is_printer_friendly in boolean ) return apex_plugin.t_region_render_result is',
'    l_retval         apex_plugin.t_region_render_result;',
'    --',
'    c_page_report_page constant number        := p_region.attribute_01;',
'    c_public_pages_msg constant varchar2(255) := apex_escape.html(p_region.attribute_02);',
'    c_auth_pages_msg   constant varchar2(255) := apex_escape.html(p_region.attribute_03);',
'    c_custom_auth_msg  constant varchar2(255) := apex_escape.html(p_region.attribute_04);',
'',
'    l_app_session     varchar2(255) := :APP_SESSION;',
'    l_app_id          number := :APP_ID;',
'    l_cnt             number := 0;',
'    l_auth_scheme     number := 0;',
'    l_auth_required   number := 0;',
'    l_auth_scheme_name     varchar2(255);',
'begin',
'    for c1 in ( select count(*) c,',
'                    sum(decode(authorization_scheme,null,0,1)) auth_scheme,',
'                    sum(decode(page_requires_authentication,''Yes'',1,0)) auth_required',
'                from apex_application_pages',
'                where application_id =  l_app_id',
'                    and page_function != ''Global Page'' ) loop',
'        l_cnt := c1.c;',
'        l_auth_scheme := c1.auth_scheme;',
'        l_auth_required := c1.auth_required;',
'    end loop;',
'',
'    for c1 in ( select authentication_scheme ',
'                from apex_applications ',
'                where application_id = l_app_id ) loop',
'        l_auth_scheme_name := c1.authentication_scheme;',
'    end loop;',
'',
'    sys.htp.p(''<div class="container">'');',
'    sys.htp.p(''<div class="row">'');',
'    sys.htp.p(''<div class="col col-12 ">'');',
'    sys.htp.p(''<div class="t-ConfigPanel">'');',
'    sys.htp.p(''<div class="t-ConfigPanel-body">'');',
'    sys.htp.p(''<div class="t-ConfigPanel-main">'');',
'    sys.htp.p(''<span class="t-ConfigPanel-icon a-Icon auth-scheme"></span>'');',
'    sys.htp.p(''<span class="t-ConfigPanel-setting">Authentication Scheme</span>'');',
'    sys.htp.p(''<span class="t-ConfigPanel-status">''||apex_escape.html(l_auth_scheme_name)||''</span>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''<div class="t-ConfigPanel-list">'');',
'    sys.htp.p(''<ul class="t-ConfigPanel-attrs">'');',
'    sys.htp.p(''<li class="t-ConfigPanel-attr">'');',
'    sys.htp.p(''<a href="''',
'        ||case when c_page_report_page is not null then',
'                apex_util.prepare_url(''f?p=''||l_app_id||'':''||c_page_report_page||'':''||l_app_session',
'                                     ||'':::''||c_page_report_page||'',RIR:IREQ_REQUIRES_AUTH:No'')',
'            else',
'                ''#''',
'        end',
'        ||''" class="t-ConfigPanel-attrLink">'');',
'    sys.htp.p(''<span class="t-ConfigPanel-attrLabel">''||c_public_pages_msg||''</span>'');',
'    sys.htp.p(''<span class="t-ConfigPanel-attrValue">''||to_char((l_cnt - l_auth_required),''999G999G990'')',
'        ||''</span>'');',
'    sys.htp.p(''</a>'');',
'    sys.htp.p(''</li>'');',
'    sys.htp.p(''<li class="t-ConfigPanel-attr">'');',
'    sys.htp.p(''<a href="''',
'        ||case when c_page_report_page is not null then',
'                apex_util.prepare_url(''f?p=''||l_app_id||'':''||c_page_report_page||'':''||l_app_session',
'                                     ||'':::''||c_page_report_page||'',RIR:IREQ_REQUIRES_AUTH:Yes'')',
'            else',
'                ''#''',
'        end',
'        ||''" class="t-ConfigPanel-attrLink">'');',
'    sys.htp.p(''<span class="t-ConfigPanel-attrLabel">''||c_auth_pages_msg||''</span>'');',
'    sys.htp.p(''<span class="t-ConfigPanel-attrValue">''||to_char(l_auth_required,''999G999G990'')||',
'      ''</span>'');',
'    sys.htp.p(''</a>'');',
'    sys.htp.p(''</li>'');',
'    sys.htp.p(''<li class="t-ConfigPanel-attr">'');',
'    sys.htp.p(''<a href="''',
'        ||case when c_page_report_page is not null then',
'                apex_util.prepare_url(''f?p=''||l_app_id||'':''||c_page_report_page||'':''||l_app_session',
'                                     ||'':::''||c_page_report_page||'',RIR:IRNEQ_AUTHORIZATION_SCHEME:No Scheme Applied'')',
'            else',
'                ''#''',
'        end',
'        ||''" class="t-ConfigPanel-attrLink">'');',
'    sys.htp.p(''<span class="t-ConfigPanel-attrLabel">''||c_custom_auth_msg||''</span>'');',
'    sys.htp.p(''<span class="t-ConfigPanel-attrValue">''||to_char(l_auth_scheme,''999G999G990'')||',
'          ''</span>'');',
'    sys.htp.p(''</a>'');',
'    sys.htp.p(''</li>'');',
'    sys.htp.p(''</ul>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''</div>'');',
'    --',
'    return l_retval;    ',
'end auth_admin;'))
,p_api_version=>1
,p_render_function=>'auth_admin'
,p_substitute_attributes=>true
,p_reference_id=>1436051286839742672
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Authorization Administration displays the current authentication scheme together with a count of public pages, pages requiring authentication, and pages with an authorization defined.</p>',
'<p>This plug-in is suitable for adding to the main Administration page to provide an overview of high level security settings.</p>'))
,p_version_identifier=>'5.0.1'
,p_about_url=>'http://apex.oracle.com/plugins'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90202922680363050)
,p_plugin_id=>wwv_flow_api.id(14900209312057359268)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Page Report Page'
,p_attribute_type=>'PAGE NUMBER'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'Enter or select the page number which has a report listing the pages within the application and the respective role required to access that page.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90203325974363050)
,p_plugin_id=>wwv_flow_api.id(14900209312057359268)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Public Pages Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Public Pages'
,p_is_translatable=>true
,p_help_text=>'Enter the label displayed for pages with no authorization defined.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90203688882363050)
,p_plugin_id=>wwv_flow_api.id(14900209312057359268)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Authenticated Pages Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Login Required Pages'
,p_is_translatable=>true
,p_help_text=>'Enter the label displayed for pages that require authentication.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90204099372363050)
,p_plugin_id=>wwv_flow_api.id(14900209312057359268)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Authorized Pages Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Authorization Protected'
,p_is_translatable=>true
,p_help_text=>'Enter the label displayed for pages where a specific authorization is defined.'
);
wwv_flow_api.component_end;
end;
/
