prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(5986434899414449227)
,p_name=>'Application Static Files'
,p_alias=>'APP-STATIC-FILES'
,p_step_title=>'&APP_NAME. - Application Static Files'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.urlImages .a-CardView-media--widescreen:before {',
'    padding-top: 20%;',
'}',
'',
'.urlImages .a-CardView-iconWrap {',
'    margin-top: calc(var(--a-cv-icon-container-size) / 2 * -1 - var(--a-cv-header-padding-y));',
'}',
'.urlImages .a-CardView-icon {',
'    box-shadow: #fff 0 0 0 4px;',
'}',
'',
'.apex-theme-redwood-light .urlImages .a-CardView-icon {',
'    background-color: #508223;',
'    color: #fff;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20210609090740'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(687810272466228358)
,p_plug_name=>'Float with Custom CSS'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6035650877292955000)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''fa-apex''  icon_class,',
'       :APP_IMAGES || file_name image_url',
'from apex_application_static_files',
'where file_name = ''apex-mountain-range_light.png''',
'and application_id = :APP_ID'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
);
wwv_flow_api.create_card(
 p_id=>wwv_flow_api.id(687810362632228359)
,p_region_id=>wwv_flow_api.id(687810272466228358)
,p_layout_type=>'FLOAT'
,p_card_css_classes=>'urlImages'
,p_title_adv_formatting=>true
,p_title_html_expr=>'<h3 class="a-CardView-title ">What is Oracle APEX?</h3>'
,p_title_css_classes=>'a-CardView-title'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Oracle Application Express (APEX) is a low-code development platform that enables you to build scalable, secure enterprise apps, with world-class features, that can be deployed anywhere.</p>',
'',
'<p>Using APEX, developers can quickly develop and deploy compelling apps that solve real problems and provide immediate value. You won''t need to be an expert in a vast array of technologies to deliver sophisticated solutions. Focus on solving the pro'
||'blem and let APEX take care of the rest.</p>'))
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'ICON_CLASS'
,p_icon_css_classes=>'fa'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'STATIC_URL'
,p_media_url=>'&IMAGE_URL!ATTR.'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'WIDESCREEN'
,p_media_sizing=>'COVER'
,p_media_description=>'Redwood Mountain'
);
wwv_flow_api.create_card_action(
 p_id=>wwv_flow_api.id(687810403226228360)
,p_card_id=>wwv_flow_api.id(687810362632228359)
,p_action_type=>'TITLE'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'https://apex.oracle.com'
,p_link_attributes=>'target="_blank"'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(687810505943228361)
,p_plug_name=>'Horizontal Media Background'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6035650877292955000)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''fa-apex''  icon_class,',
'       :APP_IMAGES || file_name image_url',
'from apex_application_static_files',
'where file_name = ''apex-mountain-range_light.png''',
'and application_id = :APP_ID'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
);
wwv_flow_api.create_card(
 p_id=>wwv_flow_api.id(687810673764228362)
,p_region_id=>wwv_flow_api.id(687810505943228361)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>true
,p_title_html_expr=>'<h3 class="a-CardView-title ">What is Oracle APEX?</h3>'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Oracle Application Express (APEX) is a low-code development platform that enables you to build scalable, secure enterprise apps, with world-class features, that can be deployed anywhere.</p>',
'',
'<p>Using APEX, developers can quickly develop and deploy compelling apps that solve real problems and provide immediate value. You won''t need to be an expert in a vast array of technologies to deliver sophisticated solutions. Focus on solving the pro'
||'blem and let APEX take care of the rest.</p>'))
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'ICON_CLASS'
,p_icon_css_classes=>'fa'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'DYNAMIC_URL'
,p_media_url_column_name=>'IMAGE_URL'
,p_media_display_position=>'BACKGROUND'
,p_media_sizing=>'COVER'
,p_media_description=>'Redwood Mountain'
);
wwv_flow_api.create_card_action(
 p_id=>wwv_flow_api.id(687810756908228363)
,p_card_id=>wwv_flow_api.id(687810673764228362)
,p_action_type=>'TITLE'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'https://apex.oracle.com'
,p_link_attributes=>'target="_blank"'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(687810832419228364)
,p_plug_name=>'Horizontal Media First'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6035650877292955000)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''fa-apex''  icon_class,',
'       :APP_IMAGES || file_name image_url',
'from apex_application_static_files',
'where file_name = ''apex-mountain-range_light.png''',
'and application_id = :APP_ID'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
);
wwv_flow_api.create_card(
 p_id=>wwv_flow_api.id(687810908582228365)
,p_region_id=>wwv_flow_api.id(687810832419228364)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>true
,p_title_html_expr=>'<h3 class="a-CardView-title ">What is Oracle APEX?</h3>'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Oracle Application Express (APEX) is a low-code development platform that enables you to build scalable, secure enterprise apps, with world-class features, that can be deployed anywhere.</p>',
'',
'<p>Using APEX, developers can quickly develop and deploy compelling apps that solve real problems and provide immediate value. You won''t need to be an expert in a vast array of technologies to deliver sophisticated solutions. Focus on solving the pro'
||'blem and let APEX take care of the rest.</p>'))
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'ICON_CLASS'
,p_icon_css_classes=>'fa'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'DYNAMIC_URL'
,p_media_url_column_name=>'IMAGE_URL'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'WIDESCREEN'
,p_media_sizing=>'COVER'
,p_media_description=>'Redwood Mountain'
);
wwv_flow_api.create_card_action(
 p_id=>wwv_flow_api.id(687811038269228366)
,p_card_id=>wwv_flow_api.id(687810908582228365)
,p_action_type=>'TITLE'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'https://apex.oracle.com'
,p_link_attributes=>'target="_blank"'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(687811142476228367)
,p_plug_name=>'RDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5986322540101449078)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(800239799718022643)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5986359118609449112)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5986295761768449043)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5986413625192449192)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2073582411090518382)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-file-image-o'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5986332685085449090)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can reference application static files as images in Cards regions.  Please note Cards regions expect the ampersand (&.) substitution syntax. The usual way of referencing application static files cannot be used. i.e. <code>#APP_IMAGE#myAppImage'
||'.png</code>. Also, <strong>APP_IMAGES</strong> substituions need to be done in the query using a bind variable as it is an unsupported client-side substitution.</p>',
'',
'<p>Let''s say you are using an <code>IMAGE_URL</code> column as the Cards region''s media image value, use the following query to reference the application static file:</p>',
'',
'<pre>',
'select :APP_IMAGES || file_name as image_url',
'from apex_application_static_files',
'where file_name = ''myAppImage.png''',
'and application_id = :APP_ID',
'</pre>',
'',
'<p>You can also define your own CSS classes to customize Cards styles. The <strong>Float with Custom CSS</strong> example displays Cards Icon and Media differently using definitions in the page''s Inline CSS section.</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.component_end;
end;
/
