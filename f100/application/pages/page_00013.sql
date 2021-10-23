prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(14582016822628385285)
,p_name=>'Customer Usage Metrics'
,p_alias=>'CUSTOMER-USAGE-METRICS'
,p_step_title=>'Customer Usage Metrics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(14758150710393128197)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20210218140138'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14977648713166197922)
,p_plug_name=>'Customer Usage Metrics'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897221875819526806)
,p_plug_display_sequence=>20
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    trunc(view_timestamp) view_timestamp,',
'    trim(to_char(count(*),''999G999G999G990'')) ||'' Views / ''||',
'    trim(to_char(count(distinct app_username),''999G999G999G990'')) ||'' Users'' Events',
'from',
'    eba_cust_clicks',
'where',
'    cust_id = :P13_ID ',
'and',
'    view_timestamp > sysdate - 90',
'group by trunc(view_timestamp ) '))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'VIEW_TIMESTAMP'
,p_attribute_03=>'EVENTS'
,p_attribute_07=>'N'
,p_attribute_09=>'list:navigation'
,p_attribute_13=>'N'
,p_attribute_17=>'Y'
,p_attribute_19=>'Y'
,p_attribute_21=>'10'
,p_attribute_22=>'Y'
,p_attribute_23=>'3'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14977649934998197928)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(14897221875819526806)
,p_plug_display_sequence=>30
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14977650514086197929)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(14897238104700526831)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(17878114474105061390)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(14897253604799526876)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14977647910653197920)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(14977650514086197929)
,p_button_name=>'RETURN_TO_CUSTOMER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(14897253374800526875)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Return to Customer'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50:P50_ID:&P13_ID.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14977649125785197922)
,p_name=>'P13_CALENDAR_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(14977648713166197922)
,p_use_cache_before_default=>'NO'
,p_source=>'P13_CALENDAR_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_item_comment=>'Generated by Calendar wizard on 11/08/2013'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14977649306116197924)
,p_name=>'P13_CALENDAR_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(14977648713166197922)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return sysdate;'
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source=>'P13_CALENDAR_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_item_comment=>'Generated by Calendar wizard on 11/08/2013'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14977649519574197927)
,p_name=>'P13_CALENDAR_END_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(14977648713166197922)
,p_use_cache_before_default=>'NO'
,p_item_default=>'return sysdate+3;'
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source=>'P13_CALENDAR_END_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_item_comment=>'Generated by Calendar wizard on 11/08/2013'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14977650130746197928)
,p_name=>'P13_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(14977649934998197928)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.component_end;
end;
/