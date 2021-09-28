prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
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
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(5986434899414449227)
,p_name=>'Color Coded Cards'
,p_alias=>'COLOR-CODED-CARDS'
,p_step_title=>'&APP_NAME. - Color Coded Cards'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root {',
'    --a-cv-subtitle-text-color: inherit;',
'    --a-cv-subcontent-text-color: inherit;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20210609085834'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(800238991700022634)
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
 p_id=>wwv_flow_api.id(815401194177285821)
,p_plug_name=>'Icons'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6035650877292955000)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPNO,',
'       ENAME,',
'       JOB,',
'       MGR,',
'       HIREDATE,',
'       SAL,',
'       COMM,',
'       DEPTNO,',
'       case when deptno = 10 then',
'           ''u-color-2''',
'       when deptno = 20 then',
'           ''u-color-3''',
'       when deptno = 30 then',
'           ''u-color-4''',
'       when deptno = 40 then',
'           ''u-color-5''',
'       end card_color',
'  from EBA_DEMO_CARD_EMP'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
);
wwv_flow_api.create_card(
 p_id=>wwv_flow_api.id(815401254388285822)
,p_region_id=>wwv_flow_api.id(815401194177285821)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'DEPTNO'
,p_body_adv_formatting=>false
,p_body_column_name=>'JOB'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'ENAME'
,p_icon_css_classes=>'&CARD_COLOR!ATTR.'
,p_icon_position=>'TOP'
,p_media_adv_formatting=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(815401392949285823)
,p_plug_name=>'RDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5986322540101449078)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1559882173059262764)
,p_plug_name=>'Cards'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(6035650877292955000)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPNO,',
'       ENAME,',
'       JOB,',
'       MGR,',
'       HIREDATE,',
'       SAL,',
'       COMM,',
'       DEPTNO,',
'       case when deptno = 10 then',
'           ''u-color-2''',
'       when deptno = 20 then',
'           ''u-color-3''',
'       when deptno = 30 then',
'           ''u-color-4''',
'       when deptno = 40 then',
'           ''u-color-5''',
'       end card_color',
'  from EBA_DEMO_CARD_EMP'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_card(
 p_id=>wwv_flow_api.id(790445915963125909)
,p_region_id=>wwv_flow_api.id(1559882173059262764)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'DEPTNO'
,p_body_adv_formatting=>false
,p_body_column_name=>'JOB'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3659428396265576744)
,p_plug_name=>'About this page'
,p_icon_css_classes=>'fa-paint-brush'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(5986332685085449090)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can color code cards or icons based on a column value.</p>',
'<p>This page color codes cards and icon background colors by departments. The region query uses <a href="https://apex.oracle.com/pls/apex/apex_pm/r/ut/color-and-status-modifiers" target="_blank">Universal Theme Color Modifiers</a> and selects this as'
||' column:',
'<pre>',
'case when deptno = 10 then',
'    ''u-color-2''',
'when deptno = 20 then',
'    ''u-color-3''',
'when deptno = 30 then',
'    ''u-color-4''',
'when deptno = 40 then',
'    ''u-color-5''',
'end card_color',
'</pre>',
'<strong>Cards CSS Classes</strong> and <strong>Icon CSS Classes</strong> use this column substitution, <code>&CARD_COLOR !ATTR.</code>, to get the value.',
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.component_end;
end;
/
