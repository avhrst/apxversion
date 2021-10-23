prompt --application/shared_components/plugins/region_type/com_oracle_apex_translated_message
begin
--   Manifest
--     PLUGIN: COM.ORACLE.APEX.TRANSLATED_MESSAGE
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
 p_id=>wwv_flow_api.id(14872966827028324961)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_display_name=>'Translated Message'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.TRANSLATED_MESSAGE'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result',
'is',
'    c_message     constant varchar2(255) := p_region.attribute_01;',
'    c_add_p_tags  constant varchar2(1) := p_region.attribute_12;',
'',
'    type subs_t is varray(10) of varchar2(4000);',
'    type colnos_t is varray(10) of pls_integer;',
'',
'    c_subs_columns constant subs_t :=',
'        subs_t (',
'            p_region.attribute_02,',
'            p_region.attribute_03,',
'            p_region.attribute_04,',
'            p_region.attribute_05,',
'            p_region.attribute_06,',
'            p_region.attribute_07,',
'            p_region.attribute_08,',
'            p_region.attribute_09,',
'            p_region.attribute_10,',
'            p_region.attribute_11',
'        );',
'',
'    l_column_value_list apex_plugin_util.t_column_value_list2;',
'    l_subs_column_nos colnos_t := colnos_t( null, null, null, null, null, null, null, null, null, null );',
'',
'    l_subs subs_t := subs_t( null, null, null, null, null,',
'                             null, null, null, null, null );',
'    l_label varchar2(50);',
'    l_message clob;',
'begin',
'    if p_region.source is not null then',
'        -- Read the data based on the region source query',
'        l_column_value_list := apex_plugin_util.get_data2 (',
'                                   p_sql_statement  => p_region.source,',
'                                   p_min_columns    => 1,',
'                                   p_max_columns    => null,',
'                                   p_component_name => p_region.name );',
'',
'        -- Get the actual column# for faster access and also verify that the data type',
'        -- of the column matches with what we are looking for',
'        for i in 0..9 loop',
'            l_label := ''Substitution Column ''',
'                        ||to_char(i)||'' (%''||to_char(i)||'')'';',
'            l_subs_column_nos(i+1) := apex_plugin_util.get_column_no (',
'                                        p_attribute_label   => l_label,',
'                                        p_column_alias      => c_subs_columns(i+1),',
'                                        p_column_value_list => l_column_value_list,',
'                                        p_is_required       => false,',
'                                        p_data_type         => apex_plugin_util.c_data_type_varchar2 );',
'        end loop;',
'',
'        -- Set the column values of the first row so that apex_plugin_util.replace_substitutions',
'        -- can do substitutions for columns contained in the region source query.',
'        apex_plugin_util.set_component_values (',
'            p_column_value_list => l_column_value_list,',
'            p_row_num           => 1 );',
'',
'        -- get the substitution values',
'        for i in 0..9 loop',
'            if l_subs_column_nos(i+1) is not null then',
'                l_subs(i+1) := apex_plugin_util.escape (',
'                                apex_plugin_util.get_value_as_varchar2 (',
'                                    p_data_type => l_column_value_list(l_subs_column_nos(i+1)).data_type,',
'                                    p_value     => l_column_value_list(l_subs_column_nos(i+1)).value_list(1) ),',
'                                p_region.escape_output );',
'            end if;',
'        end loop;',
'    end if;',
'',
'    l_message := apex_application.do_substitutions(',
'        apex_lang.message( p_name => c_message,',
'                           p0     => l_subs(1),',
'                           p1     => l_subs(2),',
'                           p2     => l_subs(3),',
'                           p3     => l_subs(4),',
'                           p4     => l_subs(5),',
'                           p5     => l_subs(6),',
'                           p6     => l_subs(7),',
'                           p7     => l_subs(8),',
'                           p8     => l_subs(9),',
'                           p9     => l_subs(10)',
'                      )',
'        );',
'    if c_add_p_tags = ''Y'' and instr( l_message, ''<p'' ) = 0 then',
'        l_message := ''<p>''||l_message||''</p>'';',
'    end if;',
'    sys.htp.p(l_message);',
'    return null;',
'end;'))
,p_api_version=>1
,p_render_function=>'render'
,p_standard_attributes=>'SOURCE_SQL:ESCAPE_OUTPUT'
,p_substitute_attributes=>true
,p_reference_id=>1367551240532222793
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This region plug-in is used to allow text messages to readily be translated into different languages. Up to nine values can be substituted into the text message.</p>',
'<p>The text message, with appropriate substitution variables, must be defined as a system message.</p>'))
,p_version_identifier=>'5.0.1'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90265363777378422)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Text Message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Enter the name of the Text Message (from shared components) to be displayed.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90265780955378423)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Substitution Column 0 (%0)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%0</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90266179632378423)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Substitution Column 1 (%1)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%1</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90266534934378423)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Substitution Column 2 (%2)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%2</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90266995507378423)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Substitution Column 3 (%3)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%3</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90267342250378423)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Substitution Column 4 (%4)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%4</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90267806755378424)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Substitution Column 5 (%5)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%5</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90268167559378424)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Substitution Column 6 (%6)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%6</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90268539546378426)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Substitution Column 7 (%7)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%7</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90269027246378426)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Substitution Column 8 (%8)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%8</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90269345594378426)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Substitution Column 9 (%9)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query which is used to replace any <strong>%9</strong> values in the displayed message.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(90269788790378426)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Add Paragraph Tags'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select whether paragraph tags are added around the text message.</p>',
'<p>Note: If the message already starts with a paragraph tag, no changes are made.</p>'))
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(90271666711378428)
,p_plugin_id=>wwv_flow_api.id(14872966827028324961)
,p_name=>'SOURCE_SQL'
,p_is_required=>false
,p_sql_min_column_count=>1
,p_examples=>'This SQL is optional. If the message you are translating has substitutions built in (%0 through %9), select the values you wish to replace them with within Attributes.'
);
wwv_flow_api.component_end;
end;
/
