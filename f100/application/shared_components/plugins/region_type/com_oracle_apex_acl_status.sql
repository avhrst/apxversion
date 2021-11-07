prompt --application/shared_components/plugins/region_type/com_oracle_apex_acl_status
begin
--   Manifest
--     PLUGIN: COM.ORACLE.APEX.ACL_STATUS
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
 p_id=>wwv_flow_api.id(14900206273761359263)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.ACL_STATUS'
,p_display_name=>'ACL Status'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.ACL_STATUS'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function acl_status (   p_region              in apex_plugin.t_region,',
'                        p_plugin              in apex_plugin.t_plugin,',
'                        p_is_printer_friendly in boolean ) return apex_plugin.t_region_render_result is',
'    l_retval         apex_plugin.t_region_render_result;',
'    --',
'    c_config_page constant varchar2(30)   := p_region.attribute_01;',
'    c_acl_page    constant varchar2(30)   := p_region.attribute_02;',
'    c_admin_alias constant varchar2(255)  := p_region.attribute_03;',
'    c_cont_alias  constant varchar2(255)  := p_region.attribute_04;',
'    c_read_alias  constant varchar2(255)  := p_region.attribute_05;',
'    c_scope_pref  constant varchar2(4000) := p_region.attribute_06;',
'    c_acl_status  constant varchar2(4000) := p_region.attribute_07;',
'    --',
'    l_app_id            varchar2(255) := :APP_ID;',
'    l_session_id        varchar2(255) := :APP_SESSION;',
'    -- TODO: Make this handle generic ACL levels.',
'    l_column_value_list apex_plugin_util.t_column_value_list2;',
'    l_admin_column_number pls_integer;',
'    l_admin_count         number := null;',
'    l_cont_column_number  pls_integer;',
'    l_cont_count          number := null;',
'    l_read_column_number  pls_integer;',
'    l_read_count          number := null;',
'    --',
'    l_scope             varchar2(255);',
'    l_acl_mode          varchar2(255);',
'    l_acl_enabled       varchar2(1) := ''N'';',
'begin',
'    l_column_value_list := apex_plugin_util.get_data2(',
'        p_sql_statement  => p_region.source,',
'        p_min_columns    => 3,',
'        p_max_columns    => null,',
'        p_component_name => p_region.name',
'    );',
'',
'    l_admin_column_number := apex_plugin_util.get_column_no (',
'        p_attribute_label   => ''ADMINCOUNT'',',
'        p_column_alias      => c_admin_alias,',
'        p_column_value_list => l_column_value_list,',
'        p_is_required       => true,',
'        p_data_type         => apex_plugin_util.c_data_type_number',
'    );',
'    l_cont_column_number := apex_plugin_util.get_column_no (',
'        p_attribute_label   => ''CONTCOUNT'',',
'        p_column_alias      => c_cont_alias,',
'        p_column_value_list => l_column_value_list,',
'        p_is_required       => true,',
'        p_data_type         => apex_plugin_util.c_data_type_number',
'    );',
'    l_read_column_number := apex_plugin_util.get_column_no (',
'        p_attribute_label   => ''READCOUNT'',',
'        p_column_alias      => c_read_alias,',
'        p_column_value_list => l_column_value_list,',
'        p_is_required       => true,',
'        p_data_type         => apex_plugin_util.c_data_type_number',
'    );',
'',
'    l_scope := apex_plugin_util.get_plsql_expression_result( p_plsql_expression => c_scope_pref );',
'    l_acl_enabled := apex_plugin_util.get_plsql_expression_result( p_plsql_expression => c_acl_status );',
'',
'    for l_row_number in 1 .. l_column_value_list(1).value_list.count loop',
'        l_admin_count := l_column_value_list(l_admin_column_number).value_list(l_row_number).number_value;',
'        l_cont_count  := l_column_value_list(l_cont_column_number).value_list(l_row_number).number_value;',
'        l_read_count  := l_column_value_list(l_read_column_number).value_list(l_row_number).number_value;',
'    end loop;',
'',
'    if l_acl_enabled = ''N'' then',
'        l_acl_mode := ''Disabled'';',
'    else',
'        l_acl_mode := ''Enabled'';',
'    end if;',
'',
'    sys.htp.p(''<div class="t-ConfigPanel">'');',
'    sys.htp.p(''  <div class="t-ConfigPanel-about">'');',
'        if l_acl_mode = ''Disabled'' then',
'           sys.htp.p(apex_lang.message(''ACL_DISABLED''));',
'        else',
'           if l_scope = ''ACL_ONLY'' then sys.htp.p(apex_lang.message(''ACL_ENABLED'')); end if;',
'           if l_scope = ''PUBLIC_CONTRIBUTE'' then sys.htp.p(apex_lang.message(''ACL_PUBLIC_CONTRIBUTE'')); end if;',
'           if l_scope = ''PUBLIC_READONLY'' then sys.htp.p(apex_lang.message(''ACL_PUBLIC_READONLY'')); end if;',
'        end if;',
'    sys.htp.p(''  </div>'');',
'    sys.htp.p(''  <div class="t-ConfigPanel-body">'');',
'    sys.htp.p(''    <div class="t-ConfigPanel-main">'');',
'    sys.htp.p(''      <span class="t-ConfigPanel-icon a-Icon'');',
'      if l_acl_mode = ''Enabled'' then',
'        sys.htp.prn(''is-enabled'');',
'      else',
'        sys.htp.prn(''is-disabled'');',
'      end if;',
'    sys.htp.p(''"></span>'');',
'    sys.htp.p(''      <span class="t-ConfigPanel-setting">Access Control</span>'');',
'        if l_acl_mode = ''Disabled'' then',
'            sys.htp.p(''      <span class="t-ConfigPanel-status">Disabled</span>'');',
'            sys.htp.p(''      <span class="t-ConfigPanel-actions">'');',
'            sys.htp.p(''        <button class="t-Button t-Button--small" onclick="openModal(''''confirmEnableACL'''');" type="button">Enable Access Control</button>'');',
'            sys.htp.p(''      </span>'');',
'        else',
'            sys.htp.p(''      <span class="t-ConfigPanel-status">Enabled</span>'');',
'            sys.htp.p(''      <span class="t-ConfigPanel-actions">'');',
'            sys.htp.p(''        <button class="t-Button t-Button--small" onclick="apex.navigation.redirect(''''''||apex_util.prepare_url(''f?p=''||l_app_id||'':''||c_config_page||'':''||l_session_id)||'''''');" type="button">Configure</button>'');',
'            sys.htp.p(''      </span>'');',
'        end if;',
'    sys.htp.p(''      </span>'');',
'    sys.htp.p(''    </div>'');',
'    sys.htp.p(''    <div class="t-ConfigPanel-list">'');',
'    sys.htp.p(''      <ul class="t-ConfigPanel-attrs">'');',
'    sys.htp.p(''        <li class="t-ConfigPanel-attr">'');',
'    sys.htp.p(''          <a href="''||apex_util.prepare_url(''f?p=''||l_app_id||'':''||c_acl_page||'':''||l_session_id|| '':::''||c_acl_page||'',RIR:IREQ_ACCESS_LEVEL_ID:Administrator'')||''" class="t-ConfigPanel-attrLink">'');',
'    sys.htp.p(''            <span class="t-ConfigPanel-attrLabel">Administrators</span>'');',
'    sys.htp.p(''            <span class="t-ConfigPanel-attrValue">'');',
'        if l_acl_mode = ''Disabled'' then',
'            sys.htp.p(apex_escape.html(apex_lang.message(''ANY_AUTHENTICATED_USER'')));',
'        else',
'            sys.htp.p(to_char(l_admin_count,''999G999G990''));',
'        end if;',
'    sys.htp.p(''            </span>'');',
'    sys.htp.p(''          </a>'');',
'    sys.htp.p(''        </li>'');',
'',
'    sys.htp.p(''        <li class="t-ConfigPanel-attr">'');',
'    sys.htp.p(''          <a href="''||apex_util.prepare_url(''f?p=''||l_app_id||'':''||c_acl_page||'':''||l_session_id||'':::''||c_acl_page||'',RIR:IREQ_ACCESS_LEVEL_ID:Contributor'')||''" class="t-ConfigPanel-attrLink">'');',
'    sys.htp.p(''            <span class="t-ConfigPanel-attrLabel">Contributors</span>'');',
'    sys.htp.p(''            <span class="t-ConfigPanel-attrValue">'');',
'        if l_acl_mode = ''Disabled'' then ',
'            sys.htp.p(apex_escape.html(apex_lang.message(''ANY_AUTHENTICATED_USER'')));',
'        elsif l_scope = ''ACL_ONLY'' or l_scope = ''PUBLIC_READONLY'' then',
'            sys.htp.p(to_char(nvl(l_cont_count,0),''999G999G990''));',
'        else',
'            sys.htp.p(apex_escape.html(apex_lang.message(''ANY_AUTHENTICATED_USER'')));',
'        end if;',
'    sys.htp.p(''            </span>'');',
'    sys.htp.p(''          </a>'');',
'    sys.htp.p(''        </li>'');',
'',
'    sys.htp.p(''        <li class="t-ConfigPanel-attr">'');',
'    sys.htp.p(''          <a href="''||apex_util.prepare_url(''f?p=''||l_app_id||'':''||c_acl_page||'':''||l_session_id||'':::''||c_acl_page||'',RIR:IREQ_ACCESS_LEVEL_ID:Reader'')||''" class="t-ConfigPanel-attrLink">'');',
'    sys.htp.p(''            <span class="t-ConfigPanel-attrLabel">Readers</span>'');',
'    sys.htp.p(''            <span class="t-ConfigPanel-attrValue">'');',
'    sys.htp.p(  case',
'                    when l_acl_mode = ''Disabled'' then ',
'                        apex_escape.html(apex_lang.message(''ANY_AUTHENTICATED_USER''))',
'                    when l_scope = ''ACL_ONLY'' then',
'                        to_char(nvl(l_read_count,0),''999G999G990'')',
'                    when l_scope = ''PUBLIC_READONLY'' or l_scope = ''PUBLIC_CONTRIBUTE'' then',
'                        apex_escape.html(apex_lang.message(''ANY_AUTHENTICATED_USER''))',
'                    else',
'                        to_char(nvl(l_read_count,0),''999G999G990'')',
'                end );',
'    sys.htp.p(''            </span>'');',
'    sys.htp.p(''          </a>'');',
'    sys.htp.p(''        </li>'');',
'',
'    sys.htp.p(''      </ul>'');',
'    sys.htp.p(''    </div>'');',
'    sys.htp.p(''  </div>'');',
'    sys.htp.p(''</div>'');',
'',
'    return l_retval;    ',
'end;'))
,p_api_version=>1
,p_render_function=>'acl_status'
,p_standard_attributes=>'SOURCE_SQL'
,p_substitute_attributes=>true
,p_reference_id=>1420925848444088670
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>ACL Status is designed for those applications that use the built-in Application Express authentication Access Control List (ACL), to control access to the application and features. The plug-in displays the current ACL status together with a count '
||'of Administrators, Contributors, and Readers.</p>',
'<p>This plug-in is suitable for adding to the main Administration page to provide an overview of user security settings.</p>'))
,p_version_identifier=>'5.0.1'
,p_about_url=>'http://apex.oracle.com/plugins'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90197793922360604)
,p_plugin_id=>wwv_flow_api.id(14900206273761359263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Configuration Page'
,p_attribute_type=>'PAGE NUMBER'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Enter the application page number used to maintain the ACL settings.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90198220647360605)
,p_plugin_id=>wwv_flow_api.id(14900206273761359263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'ACL Page'
,p_attribute_type=>'PAGE NUMBER'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Enter the application page number used to maintain users and their access level.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90198540421360605)
,p_plugin_id=>wwv_flow_api.id(14900206273761359263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Administrator Count Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which holds the count of Administrators.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90199022074360606)
,p_plugin_id=>wwv_flow_api.id(14900206273761359263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Contributor Count Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which holds the count of Contributors.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90199418769360606)
,p_plugin_id=>wwv_flow_api.id(14900206273761359263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Reader Count Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'NUMBER'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which holds the count of Readers.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90199732241360606)
,p_plugin_id=>wwv_flow_api.id(14900206273761359263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Scope Preference Value'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>'eba_plugin_fw.get_preference_value(''ACCESS_CONTROL_SCOPE'')'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Enter a function which returns the appropriate scope for the ACL.',
'Allowable values are:</p>',
'<dl>',
'  <dt>ACL_ONLY</dt><dd>Rights are determined by ACL access levels. Public users cannot access the application.</dd>',
'  <dt>PUBLIC_CONTRIBUTE</dt><dd>Public users can contribute, but cannot access Administrative tasks.</dd>',
'  <dt>PUBLIC_READONLY</dt><dd>Public users can access the application, but cannot update records.</dd>',
'</dl>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90200142271360607)
,p_plugin_id=>wwv_flow_api.id(14900206273761359263)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'ACL Enabled Preference'
,p_attribute_type=>'PLSQL EXPRESSION'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>'eba_plugin_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'')'
,p_help_text=>'<p>Enter a function which returns if ACL is currently enabled or disabled.</p>'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(90201205203360613)
,p_plugin_id=>wwv_flow_api.id(14900206273761359263)
,p_name=>'SOURCE_SQL'
,p_sql_min_column_count=>3
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(case when access_level_id = 1 then 1 else 0 end) reader_count',
',      sum(case when access_level_id = 2 then 1 else 0 end) contributor_count',
',      sum(case when access_level_id = 3 then 1 else 0 end) admin_count',
'from eba_plugin_users'))
);
wwv_flow_api.component_end;
end;
/
