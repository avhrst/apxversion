prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(5986434899414449227)
,p_name=>'Conditional Actions'
,p_alias=>'CONDITIONAL-ACTIONS'
,p_step_title=>'&APP_NAME. - Conditional Actions'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20210609091738'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(800239968602022644)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5986359118609449112)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(5986295761768449043)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(5986413625192449192)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3612371856978405635)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-link'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5986332685085449090)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can add multiple actions per Card.  Also, an action can display conditionally based on the column values for each row.</p>',
'<p>This example displays 2 actions per card.  Title action displays without any condition.  Edit button action displays only if employee belongs to department 10.</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6195644602506666808)
,p_plug_name=>'Conditional Card Actions'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>wwv_flow_api.id(6035650877292955000)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_CARD_EMP'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_card(
 p_id=>wwv_flow_api.id(5394854421930575986)
,p_region_id=>wwv_flow_api.id(6195644602506666808)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'JOB'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'BLOB'
,p_icon_blob_column_name=>'PROFILE_IMAGE'
,p_icon_position=>'START'
,p_icon_description=>'&ENAME. - &JOB.'
,p_badge_column_name=>'DEPTNO'
,p_badge_label=>'Department: '
,p_media_adv_formatting=>false
,p_pk1_column_name=>'EMPNO'
,p_mime_type_column_name=>'MIMETYPE'
,p_last_updated_column_name=>'IMAGE_LAST_UPDATE'
);
wwv_flow_api.create_card_action(
 p_id=>wwv_flow_api.id(5390328646058148278)
,p_card_id=>wwv_flow_api.id(5394854421930575986)
,p_action_type=>'TITLE'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RR,13:IR_DEPTNO:&DEPTNO.'
,p_authorization_scheme=>wwv_flow_api.id(5986437516220449236)
);
wwv_flow_api.create_card_action(
 p_id=>wwv_flow_api.id(5390328351847148275)
,p_card_id=>wwv_flow_api.id(5394854421930575986)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>30
,p_label=>'Edit'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-file-o'
,p_is_hot=>true
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>':JOB = ''DEVEOPER'' or :DEPTNO = 10'
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_api.component_end;
end;
/
