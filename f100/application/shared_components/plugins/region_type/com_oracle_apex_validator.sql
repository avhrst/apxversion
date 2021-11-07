prompt --application/shared_components/plugins/region_type/com_oracle_apex_validator
begin
--   Manifest
--     PLUGIN: COM.ORACLE.APEX.VALIDATOR
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
 p_id=>wwv_flow_api.id(14971955711620487682)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.VALIDATOR'
,p_display_name=>'Validate Content'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.VALIDATOR'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render',
'(',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean',
') return apex_plugin.t_region_render_result',
'is',
'    c_region_link          constant varchar2(4000) := apex_util.prepare_url(p_region.attribute_01);',
'    -- Constants for the columns of our region source query',
'    c_verified_by_col constant pls_integer := 1;',
'    c_created_col     constant pls_integer := 2;',
'',
'    l_valid_data_type_list wwv_flow_global.vc_arr2;',
'    l_column_value_list    apex_plugin_util.t_column_value_list2;',
'    l_color                varchar2(30) := ''green'';',
'    l_verified_by          varchar2(300);',
'    l_created              timestamp with time zone;',
'    l_message              varchar2(4000);',
'    c                      integer := 0;',
'begin',
'    apex_css.add_file(',
'        p_name => ''validate'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version => null',
'    );',
'',
'    -- define the valid column data types for the region query',
'    l_valid_data_type_list(c_verified_by_col) := apex_plugin_util.c_data_type_varchar2;',
'    l_valid_data_type_list(c_created_col)     := apex_plugin_util.c_data_type_timestamp_tz;',
'',
'    -- get the data to be displayed',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'    p_sql_statement => p_region.source,',
'    p_min_columns => 2,',
'    p_max_columns => 2,',
'    p_data_type_list => l_valid_data_type_list,',
'    p_component_name => p_region.name);',
'',
'    for i in 1 .. l_column_value_list(c_created_col).value_list.count',
'    loop',
'        c := c + 1;',
'        l_verified_by := apex_escape.html(lower(l_column_value_list(c_verified_by_col).value_list(i).varchar2_value));',
'        l_created     := l_column_value_list(c_created_col).value_list(i).timestamp_tz_value;',
'        exit;',
'    end loop;',
'',
'    if l_created is null then',
'        l_color := ''red'';',
'        l_verified_by := ''Unvalidated'';',
'    elsif l_created > (current_timestamp - interval ''7'' day) then',
'        l_color := ''green'';',
'    else',
'        l_color := ''yellow'';',
'    end if;',
'',
'    sys.htp.p(''<div class="t-Validation is-''',
'        ||case l_color when ''green'' then ''valid''',
'            when ''yellow'' then ''warning''',
'            else ''invalid''',
'        end||''">'');',
'    sys.htp.p(''<div class="t-Validation-icon">'');',
'    sys.htp.p(''<span class="a-Icon icon-''',
'        ||case l_color when ''green'' then ''check''',
'            when ''yellow'' then ''warning''',
'            else ''remove''',
'        end||''"></span>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''<div class="t-Validation-body">'');',
'    sys.htp.p(''<span class="t-Validation-date">''||apex_util.get_since(l_created)||''</span>'');',
'    sys.htp.p(''<span class="t-Validation-user">''||l_verified_by||''</span>'');',
'    sys.htp.p(''<span class="t-Validation-actions">'');',
'    sys.htp.prn(''<button class="t-Button t-Button--pill t-Button--pillStart" ''',
'        ||''onclick="apex.navigation.redirect(''''''||c_region_link||'''''');" type="button">Validate</button>'');',
'    sys.htp.p(''<button class="t-Button t-Button--pill t-Button--pillEnd t-Button--icon t-Button--slim" ''',
'        ||''onclick="apex.navigation.redirect(''''''||c_region_link||'''''');" type="button" alt="Validate">''',
'        ||''<span class="a-Icon icon-open-in-dialog"></span></button>'');',
'    sys.htp.p(''</span>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''</div>'');',
'',
'    return null;',
'end render;'))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'SOURCE_SQL'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'	This plugin displays when the page content was last validated and who validated the content. To implement this plugin correctly you will need to also do the following 3 things:</p>',
'<ol>',
'  <li>Create a modal region on the page that has this plugin that does a report of past validations.</li>',
'  <li>Create a validation page. This is a form that captures validation text entered by the end-user who is validating the content.</li>',
'  <li>Create a button in the region that takes the user to the validation page (described above).</li>',
'</ol>'))
,p_version_identifier=>'5.0.1'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(15735710669462408800)
,p_plugin_id=>wwv_flow_api.id(14971955711620487682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Validation Link'
,p_attribute_type=>'LINK'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Enter a target page to be called when the user clicks the <strong>Validate</strong> button.'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(1095037408883234029)
,p_plugin_id=>wwv_flow_api.id(14971955711620487682)
,p_name=>'SOURCE_SQL'
,p_is_required=>false
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    verified_by,',
'    to_char(created,''DD-MON-YYYY HH.MI.SS.FF PM'') as created',
'from',
'    your_content_validation_table ',
'where',
'    primary_key_column = :P###_ID',
'order by',
'    created desc',
''))
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E64622D56616C6964537461747573207B0D0A2020202070616464696E673A2038707820313670783B0D0A20202020746578742D616C69676E3A2063656E7465723B0D0A7D0D0A2E64622D56616C69645374617475732D737461747573207B0D0A202020';
wwv_flow_api.g_varchar2_table(2) := '2070616464696E673A203870783B0D0A20202020626F726465722D7261646975733A203470783B0D0A20202020746578742D616C69676E3A2063656E7465723B0D0A20202020626F782D736861646F773A20302030203020327078207267626128302C30';
wwv_flow_api.g_varchar2_table(3) := '2C302C2E312920696E7365743B0D0A202020206D617267696E2D626F74746F6D3A203870783B0D0A20202020636F6C6F723A20233030303B0D0A7D0D0A2E64622D56616C69645374617475732D7374617475732E677265656E207B0D0A20202020626163';
wwv_flow_api.g_varchar2_table(4) := '6B67726F756E642D636F6C6F723A20234133463037393B0D0A7D0D0A2E64622D56616C69645374617475732D7374617475732E726564207B0D0A202020206261636B67726F756E642D636F6C6F723A20234630303030303B0D0A20202020636F6C6F723A';
wwv_flow_api.g_varchar2_table(5) := '20234646463B0D0A7D0D0A2E64622D56616C69645374617475732D7374617475732E79656C6C6F77207B0D0A202020206261636B67726F756E642D636F6C6F723A20234633443833343B0D0A7D0D0A2E64622D56616C69645374617475732D6C696E6B20';
wwv_flow_api.g_varchar2_table(6) := '7B0D0A20202020666F6E742D73697A653A20313170783B0D0A20202020636F6C6F723A20233730373037303B0D0A7D0D0A2E7553696465526567696F6E207370616E2E75427574746F6E436F6E7461696E6572207B0D0A646973706C61793A20626C6F63';
wwv_flow_api.g_varchar2_table(7) := '6B3B0D0A70616464696E673A2038707820313670783B0D0A7D0D0A2E7553696465526567696F6E207370616E2E75427574746F6E436F6E7461696E6572202E75427574746F6E4C61726765207B0D0A20202020646973706C61793A20626C6F636B3B0D0A';
wwv_flow_api.g_varchar2_table(8) := '7D';
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(15735711749312408801)
,p_plugin_id=>wwv_flow_api.id(14971955711620487682)
,p_file_name=>'validate.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
