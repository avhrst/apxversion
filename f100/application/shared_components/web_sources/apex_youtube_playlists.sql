prompt --application/shared_components/web_sources/apex_youtube_playlists
begin
--   Manifest
--     WEB SOURCE: APEX YouTube Playlists
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
 p_id=>wwv_flow_api.id(5394771461146340766)
,p_name=>'APEX YouTube Playlists'
,p_static_id=>'APEX_Youtube_Playlists'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_api.id(5394763145061340745)
,p_remote_server_id=>wwv_flow_api.id(1373490037684242402)
,p_url_path_prefix=>'/playlists'
,p_credential_id=>wwv_flow_api.id(4444148457097671317)
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(5394772058768340779)
,p_web_src_module_id=>wwv_flow_api.id(5394771461146340766)
,p_name=>'channelId'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'UCEpIXFjcQIztReQNLymvYrQ'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(5394772810076340783)
,p_web_src_module_id=>wwv_flow_api.id(5394771461146340766)
,p_name=>'maxResults'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'25'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(5394773226272340783)
,p_web_src_module_id=>wwv_flow_api.id(5394771461146340766)
,p_name=>'part'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'snippet,contentDetails,player'
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(5394771689120340774)
,p_web_src_module_id=>wwv_flow_api.id(5394771461146340766)
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
