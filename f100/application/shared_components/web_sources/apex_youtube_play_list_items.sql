prompt --application/shared_components/web_sources/apex_youtube_play_list_items
begin
--   Manifest
--     WEB SOURCE: APEX YouTube Play List Items
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
 p_id=>wwv_flow_api.id(5394782517464340790)
,p_name=>'APEX YouTube Play List Items'
,p_static_id=>'APEX_Youtube_PlayList_Items'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_api.id(5394773668229340784)
,p_remote_server_id=>wwv_flow_api.id(1373490037684242402)
,p_url_path_prefix=>'playlistItems'
,p_credential_id=>wwv_flow_api.id(4444148457097671317)
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(5394783515957340791)
,p_web_src_module_id=>wwv_flow_api.id(5394782517464340790)
,p_name=>'maxResults'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'25'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(5394783929728340791)
,p_web_src_module_id=>wwv_flow_api.id(5394782517464340790)
,p_name=>'part'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'snippet,contentDetails'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(5394784341318340791)
,p_web_src_module_id=>wwv_flow_api.id(5394782517464340790)
,p_name=>'playlistId'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'PLUo-NIMouZ_vsHnHudl3W0JfeB-3F4J8_'
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(5394782697743340790)
,p_web_src_module_id=>wwv_flow_api.id(5394782517464340790)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
,p_caching=>'ALL_USERS'
,p_invalidate_when=>'10080'
);
wwv_flow_api.component_end;
end;
/
