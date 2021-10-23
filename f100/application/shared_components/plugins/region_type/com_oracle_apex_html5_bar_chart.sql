prompt --application/shared_components/plugins/region_type/com_oracle_apex_html5_bar_chart
begin
--   Manifest
--     PLUGIN: COM.ORACLE.APEX.HTML5_BAR_CHART
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
 p_id=>wwv_flow_api.id(15659029639291898925)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_display_name=>'HTML 5 Bar Chart'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.HTML5_BAR_CHART'),'#IMAGE_PREFIX#plugins/com.oracle.apex.html5_bar_chart/1.1/')
,p_javascript_file_urls=>'#PLUGIN_FILES#com_oracle_apex_html5_bar_chart#MIN#.js'
,p_css_file_urls=>'#PLUGIN_FILES#com_oracle_apex_html5_bar_chart#MIN#.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render (',
'    p_region in apex_plugin.t_region,',
'    p_plugin in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean',
') return apex_plugin.t_region_render_result is',
'begin',
'    sys.htp.prn(''<div id="''||apex_escape.html_attribute(p_region.static_id)||''_chart" class="hbc">'');',
'    sys.htp.prn(''</div>'');',
'    ',
'    apex_javascript.add_onload_code (',
'        p_code => ''com_oracle_apex_html5_bar_chart(''||',
'            apex_javascript.add_value(p_region.static_id)||',
'            ''{''||',
'                -- Why is this attribute needed if is not used?',
'                apex_javascript.add_attribute(',
'                    ''pageItems'', ',
'                    apex_plugin_util.page_item_names_to_jquery(p_region.ajax_items_to_submit)',
'                )||',
'                apex_javascript.add_attribute(',
'                    ''ajaxIdentifier'', ',
'                    apex_plugin.get_ajax_identifier, ',
'                    FALSE, ',
'                    FALSE',
'                )||',
'            ''}''||',
'        '');''',
'    );',
'    ',
'    return null;',
'end render;',
'',
'function ajax (',
'    p_region in apex_plugin.t_region,',
'    p_plugin in apex_plugin.t_plugin',
') return apex_plugin.t_region_ajax_result is',
'    -- Map region attributes to function constants',
'    -- MODERN, CLASSIC',
'    c_chart_type                 constant varchar2(7)     := p_region.attribute_15;',
'    -- MODERN, MODERN_2, SOLAR, METRO, CUSTOM, COLUMN',
'    c_color_scheme               constant varchar2(8)     := p_region.attribute_17;',
'    c_custom_chart_colors        constant varchar2(4000)  := p_region.attribute_10;',
'    c_color_column               constant varchar2(255)   := p_region.attribute_19;',
'    -- NONE, IMAGE, ICON, INITIALS',
'    c_icon_type                  constant varchar2(8)     := case when c_chart_type = ''ICON'' then p_region.attribute_01 end;',
'    c_label_column               constant varchar2(255)   := p_region.attribute_02;',
'    c_label_link                 constant varchar2(255)   := p_region.attribute_03;',
'    c_value_column               constant varchar2(255)   := p_region.attribute_04;',
'    c_value_link                 constant varchar2(255)   := p_region.attribute_05;',
'    c_value_format_mask          constant varchar2(4000)  := p_region.attribute_21;',
'',
'    -- ABOVE, AROUND',
'    c_text_position              varchar2(6)              := p_region.attribute_18;',
'    c_chart_css_classes          constant varchar2(32767) := p_region.attribute_06;',
'    c_image_url                  constant varchar2(4000)  := p_region.attribute_07;',
'    c_css_icon_class_name        constant varchar2(255)   := p_region.attribute_08;',
'    c_initials_column            constant varchar2(255)   := p_region.attribute_09;',
'    -- ABSOLUTE, RELATIVE',
'    c_bar_width_calculation      constant varchar2(8)     := p_region.attribute_16;',
'    c_display                    constant varchar2(19)    := p_region.attribute_11;',
'    c_prefix_for_value           constant varchar2(4000)  := p_region.attribute_12;',
'    c_postfix_for_value          constant varchar2(4000)  := p_region.attribute_13;',
'    c_maximum_rows               constant number          := p_region.attribute_14;',
'    c_message_when_no_data_found constant varchar2(4000)  := p_region.attribute_20;',
'    ',
'    l_color_column_number        pls_integer;',
'    l_label_column_number        pls_integer;',
'    l_value_column_number        pls_integer;',
'    l_initials_column_number     pls_integer;',
'    ',
'    l_column_value_list          apex_plugin_util.t_column_value_list2;',
'    ',
'    l_color                      varchar2(4000)           := NULL;',
'    l_label                      varchar2(4000)           := NULL;',
'    l_label_link                 varchar2(4000)           := NULL;',
'    l_value                      varchar2(4000)           := NULL;',
'    l_display_value              varchar2(4000)           := NULL;',
'    l_value_link                 varchar2(4000)           := NULL;',
'    l_image_url                  varchar2(4000)           := NULL;',
'    l_css_icon_class_name        varchar2(4000)           := NULL;',
'    l_initials                   varchar2(4000)           := NULL;',
'    l_message_when_no_data_found varchar2(4000)           := NULL;',
'',
'    l_custom_chart_colors_table  apex_application_global.vc_arr2;',
'    l_custom_chart_colors        varchar2(32767)          := NULL;',
'begin',
'    l_column_value_list := apex_plugin_util.get_data2(',
'                               P_SQL_STATEMENT  => p_region.source,',
'                               P_MIN_COLUMNS    => 1,',
'                               P_MAX_COLUMNS    => NULL,',
'                               P_COMPONENT_NAME => p_region.name,',
'                               P_MAX_ROWS => c_maximum_rows);',
'',
'    l_color_column_number := apex_plugin_util.get_column_no (',
'                                 p_attribute_label   => ''Color Column'',',
'                                 p_column_alias      => c_color_column,',
'                                 p_column_value_list => l_column_value_list,',
'                                 p_is_required       => c_color_scheme = ''COLUMN'',',
'                                 P_data_type         => apex_plugin_util.c_data_type_varchar2);',
'    l_label_column_number := apex_plugin_util.get_column_no (',
'                                 p_attribute_label   => ''Label Column'',',
'                                 p_column_alias      => c_label_column,',
'                                 p_column_value_list => l_column_value_list,',
'                                 p_is_required       => TRUE,',
'                                 P_data_type         => apex_plugin_util.c_data_type_varchar2);',
'    l_value_column_number := apex_plugin_util.get_column_no (',
'                                 p_attribute_label   => ''Value Column'',',
'                                 p_column_alias      => c_value_column,',
'                                 p_column_value_list => l_column_value_list,',
'                                 p_is_required       => TRUE,',
'                                 P_data_type         => apex_plugin_util.c_data_type_varchar2);',
'    if c_icon_type = ''INITIALS'' then',
'        l_initials_column_number := apex_plugin_util.get_column_no (',
'                                        p_attribute_label   => ''Initials Column'',',
'                                        p_column_alias      => c_initials_column,',
'                                        p_column_value_list => l_column_value_list,',
'                                        p_is_required       => true,',
'                                        P_data_type         => apex_plugin_util.c_data_type_varchar2);',
'    end if;',
'    -- begin output as JSON',
'    owa_util.mime_header(''application/json'', FALSE);',
'    sys.htp.p(''Cache-Control: no-store'');',
'    sys.htp.p(''Pragma: no-cache'');',
'    owa_util.http_header_close;',
'    ',
'    if c_color_scheme = ''CUSTOM'' then',
'        l_custom_chart_colors_table := apex_util.string_to_table(case when c_custom_chart_colors is not NULL then TRIM(BOTH '''''''' from apex_escape.js_literal(c_custom_chart_colors)) end, '':'');',
'        l_custom_chart_colors := ''"color_scheme":['';',
'        for I in l_custom_chart_colors_table.first .. l_custom_chart_colors_table.last loop',
'            if I > 1 then',
'                l_custom_chart_colors := l_custom_chart_colors||'','';',
'            end if;',
'            l_custom_chart_colors := l_custom_chart_colors||''"''||l_custom_chart_colors_table(I)||''"'';',
'        end loop;',
'        l_custom_chart_colors := l_custom_chart_colors||''],'';',
'    end if;',
'',
'    l_message_when_no_data_found := apex_escape.html_whitelist(',
'                                        apex_plugin_util.replace_substitutions (',
'                                            p_value  => c_message_when_no_data_found,',
'                                            p_escape => FALSE));',
'',
'    sys.htp.prn(',
'        ''{''||',
'            apex_javascript.add_attribute (',
'                ''chart_type'',',
'                c_chart_type,',
'                FALSE,',
'                TRUE',
'            ));',
'    sys.htp.prn(',
'        apex_javascript.add_attribute (',
'            ''message_when_no_data_found'',',
'            l_message_when_no_data_found,',
'            TRUE,',
'            TRUE',
'        ));',
'    sys.htp.prn(',
'        apex_javascript.add_attribute (',
'            ''chart_css_class_names'',',
'            c_chart_css_classes,',
'            TRUE,',
'            TRUE',
'        ));',
'    sys.htp.prn(',
'        apex_javascript.add_attribute (',
'            ''icon_type'',',
'            c_icon_type,',
'            TRUE,',
'            TRUE',
'        ));',
'    if c_color_scheme = ''CUSTOM'' then',
'        sys.htp.prn(',
'            l_custom_chart_colors',
'        );',
'    else',
'        sys.htp.prn(',
'            apex_javascript.add_attribute (',
'                ''color_scheme'',',
'                c_color_scheme,',
'                TRUE,',
'                TRUE',
'            ));',
'    end if;',
'    sys.htp.prn(',
'            apex_javascript.add_attribute (',
'                ''text_position'',',
'                c_text_position,',
'                FALSE,',
'                TRUE',
'            )||',
'            apex_javascript.add_attribute (',
'                ''bar_width_calculation'',',
'                c_bar_width_calculation,',
'                FALSE,',
'                TRUE',
'            )||',
'            apex_javascript.add_attribute (',
'                ''display'',',
'                c_display,',
'                FALSE,',
'                TRUE',
'            )||',
'            case ',
'              when c_display in (''VALUE'') then',
'                  apex_javascript.add_attribute (',
'                      ''prefix_for_value'',',
'                      c_prefix_for_value,',
'                      TRUE,',
'                      TRUE',
'                  )||',
'                  apex_javascript.add_attribute (',
'                      ''postfix_for_value'',',
'                      c_postfix_for_value,',
'                      TRUE,',
'                      TRUE',
'                  )',
'            end||',
'            ''"items":[''',
'    );',
'    ',
'    --for l_row_number in l_column_value_list(1).value_list.first .. l_column_value_list(1).value_list.last loop',
'    for l_row_number in 1 .. l_column_value_list(1).value_list.count loop',
'        begin',
'            apex_plugin_util.set_component_values (',
'                p_column_value_list => l_column_value_list,',
'                p_row_num => l_row_number ',
'            );',
'            ',
'            if l_row_number > 1 then',
'              sys.htp.prn('', '');',
'            end if;',
'            ',
'            sys.htp.prn(''{'');',
'            ',
'            l_label := apex_plugin_util.escape (',
'                apex_plugin_util.get_value_as_varchar2 (',
'                    P_data_type => l_column_value_list(l_label_column_number).data_type,',
'                    p_value => l_column_value_list(l_label_column_number).value_list(l_row_number)',
'                ),',
'                p_region.escape_output',
'            );',
'            sys.htp.prn(',
'              apex_javascript.add_attribute (',
'                    ''label'',',
'                    l_label,',
'                    FALSE',
'              ));',
'            l_label_link := ',
'                case ',
'                    when c_label_link is not NULL then ',
'                        apex_util.prepare_url (',
'                            apex_plugin_util.replace_substitutions (',
'                                p_value  => c_label_link,',
'                                p_escape => FALSE',
'                            ))',
'                end;',
'            sys.htp.prn(',
'              apex_javascript.add_attribute (',
'                    ''label_link'',',
'                    l_label_link',
'                ));',
'            ',
'            l_value := apex_plugin_util.escape (',
'                           apex_plugin_util.get_value_as_varchar2 (',
'                               P_data_type => l_column_value_list(l_value_column_number).data_type,',
'                               p_value => l_column_value_list(l_value_column_number).value_list(l_row_number)),',
'                           p_region.escape_output);',
'            --',
'            l_display_value :=',
'                case ',
'                    when c_value_format_mask is not NULL then',
'                      to_char(to_number(l_value),c_value_format_mask)',
'                    else',
'                      l_value',
'                end;',
'',
'            sys.htp.prn(',
'              apex_javascript.add_attribute (',
'                    ''display_value'',',
'                    l_display_value,',
'                    FALSE,',
'                    TRUE',
'                ));',
'            --',
'            sys.htp.prn(',
'              apex_javascript.add_attribute (',
'                    ''value'',',
'                    l_value,',
'                    FALSE,',
'                    c_value_link is not NULL or l_color_column_number is not NULL or c_chart_type = ''ICON''',
'                ));',
'',
'            l_value_link := ',
'                case ',
'                    when c_value_link is not NULL then ',
'                        apex_util.prepare_url (',
'                            apex_plugin_util.replace_substitutions (',
'                                p_value  => c_value_link,',
'                                p_escape => FALSE',
'                            ))',
'                end;',
'             sys.htp.prn(',
'              apex_javascript.add_attribute (',
'                    ''value_link'',',
'                    l_value_link,',
'                    TRUE,',
'                    l_color_column_number is not NULL or c_chart_type = ''ICON''',
'                ));',
'            if l_color_column_number is not NULL then',
'                l_color := apex_plugin_util.escape (',
'                               apex_plugin_util.get_value_as_varchar2 (',
'                                   P_data_type => l_column_value_list(l_color_column_number).data_type,',
'                                   p_value => l_column_value_list(l_color_column_number).value_list(l_row_number)),',
'                               p_region.escape_output);',
'                sys.htp.prn(',
'                    apex_javascript.add_attribute (',
'                        ''color'',',
'                        l_color,',
'                        FALSE,',
'                        c_chart_type = ''ICON''',
'                    ));',
'            end if;',
'            if c_icon_type = ''IMAGE'' then',
'                l_image_url := ',
'                    case ',
'                        when c_image_url is not NULL then ',
'                            apex_util.prepare_url (',
'                                apex_plugin_util.replace_substitutions (',
'                                    p_value  => c_image_url,',
'                                    p_escape => FALSE',
'                                ))',
'                    end;',
'                sys.htp.prn(',
'                    apex_javascript.add_attribute (',
'                        ''image_url'',',
'                        l_image_url,',
'                        FALSE,',
'                        FALSE',
'                    ));',
'            elsif c_icon_type = ''ICON'' then',
'                l_css_icon_class_name := apex_plugin_util.replace_substitutions (',
'                                             p_value  => c_css_icon_class_name,',
'                                             p_escape => TRUE);',
'                sys.htp.prn(',
'                    apex_javascript.add_attribute (',
'                        ''icon_css_class_name'',',
'                        l_css_icon_class_name,',
'                        FALSE,',
'                        FALSE',
'                    ));',
'            elsif c_icon_type = ''INITIALS'' then',
'                l_initials := apex_plugin_util.escape (',
'                                  apex_plugin_util.get_value_as_varchar2 (',
'                                      P_data_type => l_column_value_list(l_initials_column_number).data_type,',
'                                      p_value => l_column_value_list(l_initials_column_number).value_list(l_row_number)),',
'                                  p_region.escape_output);',
'                sys.htp.prn(',
'                    apex_javascript.add_attribute (',
'                        ''initials'',',
'                        l_initials,',
'                        FALSE,',
'                        FALSE',
'                    ));',
'            end if;',
'            ',
'            sys.htp.prn(''}'');',
'            ',
'            apex_plugin_util.clear_component_values;',
'        exception',
'            when OTHERS then',
'                apex_plugin_util.clear_component_values;',
'                raise;',
'        end;',
'    end loop;',
'    sys.htp.prn(',
'            '']''||',
'        ''}''',
'    );',
'    ',
'    return NULL;',
'end ajax;'))
,p_api_version=>1
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL:AJAX_ITEMS_TO_SUBMIT:ESCAPE_OUTPUT'
,p_substitute_attributes=>false
,p_reference_id=>3608178075541198815
,p_subscribe_plugin_settings=>true
,p_help_text=>'<p>This plugin draws horizontal bar charts containing labels, values and even icons</p>'
,p_version_identifier=>'20.2'
,p_about_url=>'http://apex.oracle.com/plugins'
,p_files_version=>16
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361235050909007943)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>100
,p_prompt=>'Icon Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'INITIALS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(361243144193007955)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ICON'
,p_lov_type=>'STATIC'
,p_help_text=>'Select the icon type to be displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361235490430007944)
,p_plugin_attribute_id=>wwv_flow_api.id(361235050909007943)
,p_display_sequence=>10
,p_display_value=>'Image'
,p_return_value=>'IMAGE'
,p_help_text=>'Displays an image HTML element on the left side of the chart.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361235993144007944)
,p_plugin_attribute_id=>wwv_flow_api.id(361235050909007943)
,p_display_sequence=>20
,p_display_value=>'CSS Icon'
,p_return_value=>'ICON'
,p_help_text=>'Displays an icon with the given CSS class.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361236446878007944)
,p_plugin_attribute_id=>wwv_flow_api.id(361235050909007943)
,p_display_sequence=>30
,p_display_value=>'Initials'
,p_return_value=>'INITIALS'
,p_help_text=>'Displays a colored circle containing the first two initials for each entry.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361236970405007947)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>10
,p_prompt=>'Label Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the labels for the chart.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361237404221007947)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Label Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_reference_scope=>'ROW'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked entry.',
'<pre>f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.</pre>',
'</p>',
'<p>Example 2: Display the EMPNO value of the clicked entry in a JavaScript alert',
'<pre>javascript:alert(''current empno: &amp;EMPNO.'');</pre>',
'</p>'))
,p_help_text=>'<p>Enter a target page to be called when the user clicks a label.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361237771065007948)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>20
,p_prompt=>'Value Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the column from the region SQL Query that holds the values for the chart.</p>',
'<p>Note: This value is not displayed on the chart items when the chart has been configured to display the bar width percentage instead.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361238133772007948)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>40
,p_prompt=>'Value Link Target'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
,p_reference_scope=>'ROW'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Example 1: URL to navigate to page 10 and set P10_EMPNO to the EMPNO value of the clicked entry.',
'<pre>f?p=&amp;APP_ID.:10:&amp;APP_SESSION.::&amp;DEBUG.:RP,10:P10_EMPNO:&amp;EMPNO.</pre>',
'</p>',
'<p>Example 2: Display the EMPNO value of the clicked entry in a JavaScript alert',
'<pre>javascript:alert(''current empno: &amp;EMPNO.'');</pre>',
'</p>'))
,p_help_text=>'<p>Enter a target page to be called when the user clicks a value.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361238589670007949)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>190
,p_prompt=>'CSS Class Names'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'<p>Enter CSS class names to be added to the root element of the chart separated with spaces.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361238944236007950)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>120
,p_prompt=>'Image URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(361235050909007943)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IMAGE'
,p_help_text=>'<p>Enter the Image URL to be displayed as the chart icon. This attribute supports Substitution strings, such as query columns, <strong>&amp;IMAGE_URL.</strong>. Notice that substitutions with no value will be replaced with an empty string.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361239365887007952)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>110
,p_prompt=>'Icon CSS Class Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(361235050909007943)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ICON'
,p_help_text=>'<p>Enter the Icon CSS Class Name.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361239796899007953)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>130
,p_prompt=>'Initials Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(361235050909007943)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'INITIALS'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the column from the region SQL Query that holds the initials to be displayed as an icon.</p>',
'<p>Note: If the columns has more than two letters than the icon will includes three ellipses (...). Therefore, it is not recommended to use the label column.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361240204140007953)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>170
,p_prompt=>'Custom Colors'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'CUSTOM'
,p_help_text=>'<p>Enter a list of CSS supported colors separated by colons.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361240611638007953)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>50
,p_prompt=>'Value Display'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'VALUE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select whether to display  the item value or the percentage as the right most text in the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361240971992007953)
,p_plugin_attribute_id=>wwv_flow_api.id(361240611638007953)
,p_display_sequence=>10
,p_display_value=>'Value'
,p_return_value=>'VALUE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361241445627007954)
,p_plugin_attribute_id=>wwv_flow_api.id(361240611638007953)
,p_display_sequence=>20
,p_display_value=>'Percentage'
,p_return_value=>'BAR_WIDTH'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361241958800007954)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>60
,p_prompt=>'Value Prefix'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(361240611638007953)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'VALUE'
,p_help_text=>'<p>Enter the text that prefixes the value.<p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361242340964007954)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>70
,p_prompt=>'Value Suffix'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(361240611638007953)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'VALUE'
,p_help_text=>'Enter the text that is appended to the value.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361242732076007954)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>180
,p_prompt=>'Maximum Rows'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'5'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Enter the maximum number of items to be displayed inside the region.</p>',
'<p>Note: Bar width calculations are based on the number of items displayed.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361243144193007955)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>90
,p_prompt=>'Display Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'TEXT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select how to display the chart information.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361243577003007955)
,p_plugin_attribute_id=>wwv_flow_api.id(361243144193007955)
,p_display_sequence=>10
,p_display_value=>'Icon Chart'
,p_return_value=>'ICON'
,p_help_text=>'Displays bars with the label and value above and add an icon on the left.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361244068952007955)
,p_plugin_attribute_id=>wwv_flow_api.id(361243144193007955)
,p_display_sequence=>20
,p_display_value=>'Text Chart'
,p_return_value=>'TEXT'
,p_help_text=>'Displays bars with the label and value either above or inline with the bar.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361244600308007955)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>16
,p_display_sequence=>80
,p_prompt=>'Bar Width Calculation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ABSOLUTE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select how to calculate the width of the bars in the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361244934188007956)
,p_plugin_attribute_id=>wwv_flow_api.id(361244600308007955)
,p_display_sequence=>10
,p_display_value=>'Absolute'
,p_return_value=>'ABSOLUTE'
,p_help_text=>'100% bar width is represented by the maximum value displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361245512475007956)
,p_plugin_attribute_id=>wwv_flow_api.id(361244600308007955)
,p_display_sequence=>20
,p_display_value=>'Relative'
,p_return_value=>'RELATIVE'
,p_help_text=>'100% bar width is represented by the sum of the values of all the displayed chart items.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361246000750007956)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>17
,p_display_sequence=>150
,p_prompt=>'Color Scheme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'MODERN'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select the color scheme used to render the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361246349008007956)
,p_plugin_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_display_sequence=>5
,p_display_value=>'Default'
,p_return_value=>'DEFAULT'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361246895973007957)
,p_plugin_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_display_sequence=>10
,p_display_value=>'Theme Colors'
,p_return_value=>'MODERN'
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
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361247363021007957)
,p_plugin_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_display_sequence=>20
,p_display_value=>'Modern 2'
,p_return_value=>'MODERN_2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361247919645007957)
,p_plugin_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_display_sequence=>30
,p_display_value=>'Solar'
,p_return_value=>'SOLAR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361248334749007958)
,p_plugin_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_display_sequence=>40
,p_display_value=>'Metro'
,p_return_value=>'METRO'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361248885617007958)
,p_plugin_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_display_sequence=>50
,p_display_value=>'Custom'
,p_return_value=>'CUSTOM'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361249422987007958)
,p_plugin_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_display_sequence=>60
,p_display_value=>'SQL Query Column'
,p_return_value=>'COLUMN'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361249844412007958)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>18
,p_display_sequence=>140
,p_prompt=>'Text Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'AROUND'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(361243144193007955)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'TEXT'
,p_lov_type=>'STATIC'
,p_help_text=>'<p>Select where to display the text within the chart.</p>'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361250284939007959)
,p_plugin_attribute_id=>wwv_flow_api.id(361249844412007958)
,p_display_sequence=>10
,p_display_value=>'Above'
,p_return_value=>'ABOVE'
,p_help_text=>'The label and value are displayed above the bar, to the left and right sides of the chart.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(361250731583007960)
,p_plugin_attribute_id=>wwv_flow_api.id(361249844412007958)
,p_display_sequence=>20
,p_display_value=>'Inline'
,p_return_value=>'AROUND'
,p_help_text=>'The label, bar, and value are all displayed in a single line.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361251279816007961)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>19
,p_display_sequence=>160
,p_prompt=>'Colors Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(361246000750007956)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'COLUMN'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dl>',
'  <dt>Hexadecimal (hex) notation</dt><dd><pre>#FF3377</pre>;</dd>',
'  <dt>HTML colors</dt><dd><pre>blue</pre>.</dd>',
'</dl>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the column from the region SQL Query that holds the color codes for the chart. The color can be set using hex values or as the name of the color.</p>',
'<p>Note: If no column is entered then the color will automatically be calculated.</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361251723444007961)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>20
,p_display_sequence=>200
,p_prompt=>'Message When No Data Found'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'No data found.'
,p_is_translatable=>true
,p_help_text=>'<p>Enter the message to be displayed when no data is found.</p>'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(361252061429007961)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>21
,p_display_sequence=>25
,p_prompt=>'Format Mask'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(361240611638007953)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'VALUE'
,p_examples=>'999G999G999G999G999G990'
,p_help_text=>'Enter a numerical format mask to apply to the value column.  You can learn more about format models here: https://docs.oracle.com/cd/B28359_01/server.111/b28286/sql_elements004.htm'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(361256684943007968)
,p_plugin_id=>wwv_flow_api.id(15659029639291898925)
,p_name=>'SOURCE_SQL'
,p_sql_min_column_count=>1
);
wwv_flow_api.component_end;
end;
/
