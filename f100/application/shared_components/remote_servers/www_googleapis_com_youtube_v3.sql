prompt --application/shared_components/remote_servers/www_googleapis_com_youtube_v3
begin
--   Manifest
--     REMOTE SERVER: www-googleapis-com-youtube-v3
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(1373490037684242402)
,p_name=>'www-googleapis-com-youtube-v3'
,p_static_id=>'www_googleapis_com_youtube_v3'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('www_googleapis_com_youtube_v3'),'https://www.googleapis.com/youtube/v3/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('www_googleapis_com_youtube_v3'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('www_googleapis_com_youtube_v3'),'')
,p_prompt_on_install=>false
);
wwv_flow_api.component_end;
end;
/
