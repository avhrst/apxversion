prompt --application/shared_components/web_sources/movie_database
begin
--   Manifest
--     WEB SOURCE: Movie Database
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_web_source_module(
 p_id=>wwv_flow_api.id(5994170574873164812)
,p_name=>'Movie Database'
,p_static_id=>'Movie_Database'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_api.id(5994166083197164808)
,p_remote_server_id=>wwv_flow_api.id(1976948581686065332)
,p_url_path_prefix=>'/10'
,p_credential_id=>wwv_flow_api.id(4444150511227711220)
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(5994171563754164813)
,p_web_src_module_id=>wwv_flow_api.id(5994170574873164812)
,p_name=>'language'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'en-US'
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(5994170682917164813)
,p_web_src_module_id=>wwv_flow_api.id(5994170574873164812)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
,p_caching=>'ALL_USERS'
,p_invalidate_when=>'3600'
);
wwv_flow_api.component_end;
end;
/
