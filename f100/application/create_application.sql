prompt --application/create_application
begin
--   Manifest
--     FLOW: 100
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'VCONTROL')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Sample Cards')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'SAMPLE-CARDS')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'DC3B57DF032DF3D7C54C284D2D6738BC030825C40A9B92DD69352778FE7C348E'
,p_bookmark_checksum_function=>'MD5'
,p_compatibility_mode=>'19.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2020.08.14.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(5986295422761449042)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Sample Cards'
,p_app_builder_icon_name=>'app-icon.svg'
,p_favicons=>'<link rel="shortcut icon" href="#APP_IMAGES#app-sample-cards.ico"><link rel="icon" sizes="16x16" href="#APP_IMAGES#app-sample-cards-16x16.png"><link rel="icon" sizes="32x32" href="#APP_IMAGES#app-sample-cards-32x32.png"><link rel="apple-touch-icon" s'
||'izes="180x180" href="#APP_IMAGES#app-sample-cards.png">'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Sample Cards'
,p_substitution_string_02=>'JET_VISUALIZATION_URL'
,p_substitution_value_02=>'https://www.oracle.com/webfolder/technetwork/jet/jetCookbook.html?component=home&demo=rootVisualizations'
,p_substitution_string_03=>'MOVIEDB_API'
,p_substitution_value_03=>'https://www.themoviedb.org/documentation/api'
,p_substitution_string_04=>'GOOGLE_API'
,p_substitution_value_04=>'https://developers.google.com/youtube/v3/docs'
,p_substitution_string_05=>'PRODUCT_NAME'
,p_substitution_value_05=>'Oracle Application Express (APEX)'
,p_last_updated_by=>'TEST'
,p_last_upd_yyyymmddhh24miss=>'20210929131354'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>38
,p_ui_type_name => null
,p_print_server_type=>'INSTANCE'
);
wwv_flow_api.component_end;
end;
/
