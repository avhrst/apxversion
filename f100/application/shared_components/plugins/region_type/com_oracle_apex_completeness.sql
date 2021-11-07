prompt --application/shared_components/plugins/region_type/com_oracle_apex_completeness
begin
--   Manifest
--     PLUGIN: COM.ORACLE.APEX.COMPLETENESS
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
 p_id=>wwv_flow_api.id(14972160312785882151)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.COMPLETENESS'
,p_display_name=>'Completeness'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.COMPLETENESS'),'')
,p_css_file_urls=>'#PLUGIN_FILES#completeness.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'is',
'    c_region_static_id constant varchar2(255) := apex_escape.html_attribute( p_region.static_id );',
'',
'    -- Constants for the columns of our region source query',
'    c_metric_col       constant pls_integer := 1;',
'    c_score_col        constant pls_integer := 2;',
'    c_maxval_col       constant pls_integer := 3;',
'',
'    -- attributes of the plug-in',
'    l_score      number         := 0;',
'    l_max        number         := 0;',
'    l_pct        number         := 0;',
'    l_color      varchar(30)    := '' is-danger'';',
'    l_label      varchar2(255)  := null;',
'    l_trshld1    number         := nvl(to_number(p_region.attribute_01), 66);',
'    l_t1_lbl     varchar2(100)  := nvl(p_region.attribute_02, ''Strong'');',
'    l_trshld2    number         := nvl(to_number(p_region.attribute_03), 33);',
'    l_t2_lbl     varchar2(100)  := nvl(p_region.attribute_04,''Moderate'');',
'    l_trshld3    number         := nvl(to_number(p_region.attribute_05), 0);',
'    l_t3_lbl     varchar2(100)  := nvl(p_region.attribute_06,''Weak'');',
'    l_0p_lbl     varchar2(100)  := nvl(p_region.attribute_07,''Very Weak'');',
'    l_mdl_title  varchar2(255)  := nvl(p_region.attribute_08,''Completeness Score Details'');',
'    l_rslt_hdr   varchar2(4000) := ''<p>'' || p_region.attribute_09 || ''</p>'';',
'    l_rslt_ftr   varchar2(4000) := ''<p>'' || p_region.attribute_10 || ''</p>'';',
'',
'    l_valid_data_type_list wwv_flow_global.vc_arr2;',
'    l_column_value_list    apex_plugin_util.t_column_value_list2;',
'begin',
'    -- define the valid column data types for the region query',
'    l_valid_data_type_list(c_metric_col) := apex_plugin_util.c_data_type_varchar2;',
'    l_valid_data_type_list(c_score_col)  := apex_plugin_util.c_data_type_number;',
'    l_valid_data_type_list(c_maxval_col) := apex_plugin_util.c_data_type_number;',
'',
'    -- get the data to be displayed',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'                               p_sql_statement  => p_region.source,',
'                               p_min_columns    => 3,',
'                               p_max_columns    => 3,',
'                               p_data_type_list => l_valid_data_type_list,',
'                               p_component_name => p_region.name);',
'',
'    sys.htp.p(''',
'<div class="js-regionDialog js-resizable js-modal js-draggable js-dialog-size480x320" title="''||apex_escape.html_attribute(l_mdl_title)||''" id="status-completeness-modal-'' || c_region_static_id || ''" style="display:none;">',
'  <div class="t-Completeness-dialog">'' || l_rslt_hdr || ''',
'    <table class="u-Report">',
'      <thead>',
'        <tr>',
'          <th id="h_metric_'' || c_region_static_id || ''">Metric</th>',
'          <th id="h_score_'' || c_region_static_id || ''">Score</th>',
'          <th id="h_maximum_'' || c_region_static_id || ''">Maximum Score</th>',
'        </tr>',
'      </thead>',
'      <tbody>'' );',
'',
'    for i in 1 .. l_column_value_list(c_metric_col).value_list.count',
'    loop',
'        l_score := l_score + nvl(l_column_value_list(c_score_col).value_list(i).number_value, 0);',
'        l_score := greatest(l_score,0);',
'        l_max   := l_max + nvl(l_column_value_list(c_maxval_col).value_list(i).number_value, 0);',
'        if nvl(l_column_value_list(c_score_col).value_list(i).number_value, 0) < 0 then',
'            sys.htp.p(''',
'<tr>',
'  <td headers="h_metric_'' || c_region_static_id || ''" class="t-Completeness-negScore">'' || apex_escape.html(l_column_value_list(c_metric_col).value_list(i).varchar2_value) || ''</td>',
'  <td headers="h_score_'' || c_region_static_id || ''" class="t-Completeness-negScore u-tR">'' || nvl(l_column_value_list(c_score_col).value_list(i).number_value, 0) || ''</td>',
'  <td headers="h_maximum_'' || c_region_static_id || ''" class="t-Completeness-negScore u-tR">'' || nvl(l_column_value_list(c_maxval_col).value_list(i).number_value, 0) || ''</td>',
'</tr>'' );',
'        else',
'            sys.htp.p(''',
'<tr>',
'  <td headers="h_metric_'' || c_region_static_id || ''">'' || apex_escape.html(l_column_value_list(c_metric_col).value_list(i).varchar2_value) || ''</td>',
'  <td headers="h_score_'' || c_region_static_id || ''" class="u-tR">'' || nvl(l_column_value_list(c_score_col).value_list(i).number_value, 0) || ''</td>',
'  <td headers="h_maximum_'' || c_region_static_id || ''" class="u-tR">'' || nvl(l_column_value_list(c_maxval_col).value_list(i).number_value, 0) || ''</td>',
'</tr>'' );',
'        end if;',
'    end loop;',
'',
'    sys.htp.p(''',
'</tbody>',
'<tfoot>',
'<tr>',
'  <td><strong>Report Total</strong></td>',
'  <td class="u-tR"><strong>'' || apex_escape.html( l_score ) || ''</strong></td>',
'  <td class="u-tR"><strong>'' || apex_escape.html( l_max ) || ''</strong></td>',
'</tr>',
'</tfoot>',
'</table>'' || l_rslt_ftr || ''</div></div>'' );',
'',
'    l_max := l_max + 10; -- don''t fill circle completely',
'',
'    if l_max > 0 then',
'        l_pct := round( 100 * (l_score / l_max));',
'    end if;',
'',
'    if l_pct >= to_number(l_trshld1) then ',
'        l_color := '' is-success'';',
'        l_label := l_t1_lbl;',
'    elsif l_pct >= to_number(l_trshld2) then ',
'        l_color := '' is-warning'';',
'        l_label := l_t2_lbl;',
'    elsif l_pct >= to_number(l_trshld3) then ',
'        l_color := '' is-danger'';',
'        l_label := l_t3_lbl;',
'    else',
'        l_color := '' is-danger'';',
'        l_label := l_0p_lbl;',
'    end if;',
'',
'/*    if l_score < to_number(l_trshld3) then',
'        l_label := l_0p_lbl;',
'    end if;',
'*/',
'    sys.htp.p(''',
'<a href="javascript:openModal(''''status-completeness-modal-'' || c_region_static_id||'''''',''''link_''||c_region_static_id||'''''');" id="link_''||c_region_static_id||''" class="t-Completeness''||l_color||''">',
'  <span class="t-Completeness-labelWrap"><span class="t-Completeness-label">''||apex_escape.html(l_label)||''</span></span>',
'  <span class="t-Completeness-fill" style="width:''||l_pct||''%"></span>',
'</a>'' );',
'',
'    -- sys.htp.p(''<div class="db-FillChart">',
'    --     <a href="javascript:openModal(''''status-completeness-modal-'' || c_region_static_id||'''''',''''link_''||c_region_static_id||'''''');" id="link_''||c_region_static_id||''" class="db-FillChart-link">',
'    --     <div class="db-FillChart-fillWrapper">',
'    --       <div class="db-FillChart-heading">''||apex_escape.html(l_label)||''</div>',
'    --         <div class="db-FillChart-fill ''||l_color||''" style="height: ''||l_pct||''%"></div></div>',
'    --     </a>',
'    -- </div>'');',
'',
'    return null;',
'end render;'))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'SOURCE_SQL'
,p_substitute_attributes=>true
,p_reference_id=>4148893751397913941
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This plug-in takes a query and displays a &quot;completeness&quot; orb that shows the end-user at a glance how complete the current page content is.</p>',
'<p>A modal region is also generated which lists the individual score details used to determine the overall completeness. This modal region is accessed by clicking on the completeness region.</p>'))
,p_version_identifier=>'5.1.0'
,p_about_url=>'http://apex.oracle.com/plugins'
,p_files_version=>3
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90205181503365713)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Threshold 1 Percentage'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>2
,p_max_length=>2
,p_unit=>'%'
,p_is_translatable=>false
,p_help_text=>'Enter the first threshold percentage that should be met to be considered complete or almost complete.  The default value is 66, which represents above 66% complete.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90205613958365713)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Threshold 1 Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>100
,p_is_translatable=>true
,p_help_text=>'Enter the text displayed when completeness percentage meets or exceeds the first threshold percentage.  The default value is "Strong".'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90205997345365713)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Threshold 2 Percentage'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>2
,p_max_length=>2
,p_unit=>'%'
,p_is_translatable=>false
,p_help_text=>'Enter the second threshold percentage that should be met to be considered moderately complete. He default value is 33,  which represents above 33% complete and less than 66%, or the setting for Threshold 1 percentage.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90206362607365715)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Threshold 2 Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>100
,p_is_translatable=>true
,p_help_text=>'Enter the text displayed when completeness percentage meets or exceeds the second threshold percentage. The default value is "Moderate".'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90206748521365715)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Threshold 3 Percentage'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_display_length=>2
,p_max_length=>2
,p_unit=>'%'
,p_is_translatable=>false
,p_help_text=>'Enter the third threshold percentage that should be met to be considered barely complete. He default value is 0,  which represents above 0% complete and less than 33%, or the setting for Threshold 2 percentage.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90207132334365715)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Threshold 3 Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>100
,p_is_translatable=>true
,p_help_text=>'Enter the text displayed when completeness percentage meets or exceeds the third threshold percentage.  The default value is "Weak".'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90207618932365715)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Under Threshold 3 Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>100
,p_is_translatable=>true
,p_help_text=>'Enter the text displayed when completeness percentage is below the third threshold percentage. The default value is "Very Weak".'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90207937305365715)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Title for Results Modal'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>30
,p_max_length=>255
,p_is_translatable=>true
,p_help_text=>'Enter the title for the modal region that is displayed when the end-user clicks the completeness status link. The default value is "Completeness Score Details".'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90208411905365716)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Header Text for Results Modal'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_max_length=>4000
,p_is_translatable=>false
,p_help_text=>'Enter informational text displayed above the table of scores in the modal region that is displayed when the end-user clicks the completeness status link.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90208746643365716)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Footer Text for Results Modal'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_max_length=>4000
,p_is_translatable=>false
,p_help_text=>'Enter informational text below the table of scores in the modal region that is displayed when the end-user clicks the completeness status link.'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(90209795505365719)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_name=>'SOURCE_SQL'
,p_sql_min_column_count=>3
,p_sql_max_column_count=>3
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
wwv_flow_api.g_varchar2_table(1) := '2F2A2066696C6C206368617274202A2F0D0A0D0A2E64622D46696C6C4368617274207B0D0A2020706F736974696F6E3A2072656C61746976653B0D0A202077696474683A2031373270783B0D0A20206865696768743A2031373270783B0D0A20206D6172';
wwv_flow_api.g_varchar2_table(2) := '67696E3A2031327078206175746F3B0D0A7D0D0A2E64622D46696C6C43686172742D66696C6C57726170706572207B0D0A20206865696768743A20313030253B0D0A202077696474683A20313030253B0D0A2020626F726465722D7261646975733A2031';
wwv_flow_api.g_varchar2_table(3) := '3030253B0D0A2020626F726465723A2032707820736F6C696420234630463046303B0D0A2020626F782D73697A696E673A20626F726465722D626F783B0D0A2020706F736974696F6E3A2072656C61746976653B0D0A20206F766572666C6F773A206869';
wwv_flow_api.g_varchar2_table(4) := '6464656E3B0D0A20206261636B67726F756E643A20234646463B0D0A7D0D0A2E64622D46696C6C43686172742D77726170706572207B0D0A2020626F782D736861646F773A20302030203020347078207267626128302C302C302C2E352920696E736574';
wwv_flow_api.g_varchar2_table(5) := '3B0D0A7D0D0A2E64622D46696C6C43686172742D66696C6C207B0D0A20206261636B67726F756E642D636F6C6F723A20233639444532393B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A2020626F74746F6D3A20303B0D0A2020776964';
wwv_flow_api.g_varchar2_table(6) := '74683A20313030253B0D0A20207472616E736974696F6E3A206261636B67726F756E642D636F6C6F72202E32733B0D0A7D0D0A2E64622D46696C6C43686172742D66696C6C2E726564207B0D0A20206261636B67726F756E642D636F6C6F723A20234630';
wwv_flow_api.g_varchar2_table(7) := '323933363B0D0A7D0D0A2E64622D46696C6C43686172742D66696C6C2E79656C6C6F77207B0D0A20206261636B67726F756E642D636F6C6F723A20234633443833343B0D0A7D0D0A2E64622D46696C6C43686172742D66696C6C577261707065723A6265';
wwv_flow_api.g_varchar2_table(8) := '666F7265207B0D0A2020636F6E74656E743A2027273B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A2020626F726465722D7261646975733A20313030253B0D0A20206865696768743A20313030253B0D0A202077696474683A20313030';
wwv_flow_api.g_varchar2_table(9) := '253B0D0A20207A2D696E6465783A2039303B0D0A2020626F782D736861646F773A20302030203020327078207267626128302C302C302C2E31302920696E7365743B0D0A2020626F782D73697A696E673A20626F726465722D626F783B0D0A7D0D0A2E64';
wwv_flow_api.g_varchar2_table(10) := '622D46696C6C43686172742D68656164696E67207B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A2020746578742D616C69676E3A2063656E7465723B0D0A20206C696E652D6865696768743A20343070783B0D0A2020746F703A203530';
wwv_flow_api.g_varchar2_table(11) := '253B0D0A20207A2D696E6465783A2039303B0D0A20206C6566743A20303B0D0A202072696768743A20303B0D0A20206D617267696E3A202D323070782032307078203020323070783B0D0A2020666F6E742D7765696768743A20626F6C643B0D0A202062';
wwv_flow_api.g_varchar2_table(12) := '6F726465722D7261646975733A203270783B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C3235352C3235352C2E35293B0D0A2020626F782D736861646F773A2030203470782031327078202D347078207267626128302C';
wwv_flow_api.g_varchar2_table(13) := '302C302C2E3135293B0D0A20207472616E736974696F6E3A20626F782D736861646F77202E34732C206261636B67726F756E642D636F6C6F72202E32733B0D0A7D0D0A2E64622D46696C6C43686172742D6C696E6B207B0D0A2020646973706C61793A20';
wwv_flow_api.g_varchar2_table(14) := '626C6F636B3B0D0A2020706F736974696F6E3A2072656C61746976653B0D0A20206865696768743A20313030253B0D0A202077696474683A20313030253B0D0A20206F75746C696E653A206E6F6E653B0D0A7D0D0A2E64622D46696C6C43686172742D6C';
wwv_flow_api.g_varchar2_table(15) := '696E6B202E64622D46696C6C43686172742D68656164696E67207B0D0A2020636F6C6F723A20233030303B0D0A2020746578742D6465636F726174696F6E3A20756E6465726C696E653B0D0A7D0D0A2E64622D46696C6C43686172742D6C696E6B3A686F';
wwv_flow_api.g_varchar2_table(16) := '766572202E64622D46696C6C43686172742D68656164696E67207B0D0A20206261636B67726F756E642D636F6C6F723A2072676261283235352C3235352C3235352C2E3835293B0D0A2020626F782D736861646F773A2030203470782031327078203270';
wwv_flow_api.g_varchar2_table(17) := '78207267626128302C302C302C2E3135293B0D0A7D0D0A2E64622D46696C6C43686172742D6C696E6B3A686F766572202E64622D46696C6C43686172742D66696C6C577261707065723A6265666F7265207B0D0A2020626F782D736861646F773A203020';
wwv_flow_api.g_varchar2_table(18) := '30203020327078207267626128302C302C302C2E32352920696E7365743B0D0A7D0D0A2E64622D46696C6C43686172742D6C696E6B3A686F766572202E64622D46696C6C43686172742D66696C6C57726170706572207B0D0A2020626F726465722D636F';
wwv_flow_api.g_varchar2_table(19) := '6C6F723A20234430443044303B0D0A7D0D0A2E64622D46696C6C43686172744D6F64616C207B0D0A202070616464696E673A20303B0D0A7D0D0A2E64622D46696C6C43686172744D6F64616C2070207B0D0A2020636F6C6F723A20233730373037303B0D';
wwv_flow_api.g_varchar2_table(20) := '0A2020666F6E742D73697A653A20313270783B0D0A20206D617267696E3A20303B0D0A7D0D0A2E64622D46696C6C43686172744D6F64616C2D7461626C65207B0D0A202077696474683A20313030253B0D0A2020626F726465722D636F6C6C617073653A';
wwv_flow_api.g_varchar2_table(21) := '20636F6C6C617073653B0D0A2020626F726465722D73706163696E673A20303B0D0A2020626F726465723A2031707820736F6C696420234530453045303B0D0A20206D617267696E3A2038707820303B0D0A7D0D0A2E64622D46696C6C43686172744D6F';
wwv_flow_api.g_varchar2_table(22) := '64616C2D7461626C65207468656164207468207B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420234530453045303B0D0A20206261636B67726F756E642D636F6C6F723A20234630463046303B0D0A202070616464696E673A20';
wwv_flow_api.g_varchar2_table(23) := '3870783B0D0A2020746578742D616C69676E3A2072696768743B0D0A2020666F6E742D73697A653A20313270783B0D0A2020636F6C6F723A20233430343034303B0D0A2020666F6E742D7765696768743A20626F6C643B0D0A7D0D0A2E64622D46696C6C';
wwv_flow_api.g_varchar2_table(24) := '43686172744D6F64616C2D7461626C652074686561642074683A66697273742D6368696C64207B0D0A2020746578742D616C69676E3A206C6566743B0D0A7D0D0A2E64622D46696C6C43686172744D6F64616C2D7461626C652074626F6479207464207B';
wwv_flow_api.g_varchar2_table(25) := '0D0A2020746578742D616C69676E3A2072696768743B0D0A2020666F6E742D73697A653A20313270783B0D0A2020636F6C6F723A20233430343034303B0D0A202070616464696E673A203870783B0D0A2020626F726465722D626F74746F6D3A20317078';
wwv_flow_api.g_varchar2_table(26) := '20736F6C696420234530453045303B0D0A7D0D0A2E64622D46696C6C43686172744D6F64616C2D7461626C65202E6E656761746976652D73636F7265207B0D0A2020636F6C6F723A20234541303030303B0D0A7D0D0A2E64622D46696C6C43686172744D';
wwv_flow_api.g_varchar2_table(27) := '6F64616C2D7461626C652074626F64792074643A66697273742D6368696C64207B0D0A2020746578742D616C69676E3A206C6566743B0D0A7D0D0A2E64622D46696C6C43686172744D6F64616C2D7461626C652074666F6F74207468207B0D0A2020666F';
wwv_flow_api.g_varchar2_table(28) := '6E742D73697A653A20313270783B0D0A2020636F6C6F723A20233430343034303B0D0A202070616464696E673A203870783B0D0A2020746578742D616C69676E3A2072696768743B0D0A2020626F726465722D746F703A2032707820736F6C6964202345';
wwv_flow_api.g_varchar2_table(29) := '30453045303B0D0A2020666F6E742D7765696768743A20626F6C643B0D0A7D0D0A2E64622D46696C6C43686172744D6F64616C2D7461626C652074666F6F742074683A66697273742D6368696C64207B0D0A2020746578742D616C69676E3A206C656674';
wwv_flow_api.g_varchar2_table(30) := '3B0D0A7D';
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
 p_id=>wwv_flow_api.id(90210488558365720)
,p_plugin_id=>wwv_flow_api.id(14972160312785882151)
,p_file_name=>'completeness.css'
,p_mime_type=>'text/css'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
