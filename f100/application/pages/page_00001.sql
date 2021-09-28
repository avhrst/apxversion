prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(5986434899414449227)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Sample Cards'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'CBCHO'
,p_last_upd_yyyymmddhh24miss=>'20210505100711'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4459460509036976930)
,p_plug_name=>'About This App'
,p_region_css_classes=>'mxw800'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>wwv_flow_api.id(5986338155561449095)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Cards is a native report region type in Oracle Application Express (APEX). The Cards region type gives developers a powerful, flexible, new way of displaying data in bite-sized blocks. Card regions are ideal for use in faceted search or presenting'
||' at-a-glance information.</p>',
'',
'<p>This flagship feature of APEX allows you to effortlessly customize every aspect of a Cards region''s UI (layout, appearance, icon, badge, and media).  Cards regions can contain advanced HTML expressions that support client-side templating, and the '
||'ability to define multiple actions per card. A Cards region''s media can be sourced from BLOB column, URL, video in an iFrame or Oracle JET Data Visualizations.  You can use Cards regions to delight your end users by presenting data in new ways.</p>',
'',
'<p><strong>Note:</strong> Cards regions can be sourced by REST Data Sources.  The <strong>Embedded Video</strong> and <strong>Background Image</strong> pages (in <strong>Images and Media</strong> section) rely on REST Data Sources.  To run these page'
||'s without error, please use the links and instructions below.  You will need to get your own API keys that you will then use to create the necessary <strong>Web Credentials</strong> (in Shared Components) after importing this sample application.',
'',
'<ul>',
'    <li><a href="&GOOGLE_API." title="Google API Key" target="_blank">Google API Key</a>',
'        <ul>',
'        <li>Credential Name: <em>key</em></li>',
'        <li>Credential Secret: <em>{your key}</em></li>',
'        </ul>',
'    </li>',
'    <li><a href="&MOVIEDB_API." title="Movie Database API" target="_blank">The Movie Database (TMDb) API Key</a>',
'        <ul>',
'        <li>Credential Name: <em>api_key</em></li>',
'        <li>Credential Secret: <em>{your key}</em></li>',
'        </ul>',
'    </li>',
'</ul>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5986446947759449282)
,p_plug_name=>'Sample Cards'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(5986340181755449096)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'Cards report region examples for APEX apps'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5986450687120449306)
,p_plug_name=>'App Navigation'
,p_region_css_classes=>'mxw800'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors'
,p_plug_template=>wwv_flow_api.id(5986349694881449102)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(813627432237681581)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(5986396622451449162)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.component_end;
end;
/
