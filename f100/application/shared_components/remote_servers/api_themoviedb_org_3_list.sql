prompt --application/shared_components/remote_servers/api_themoviedb_org_3_list
begin
--   Manifest
--     REMOTE SERVER: api-themoviedb-org-3-list
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
 p_id=>wwv_flow_api.id(1976948581686065332)
,p_name=>'api-themoviedb-org-3-list'
,p_static_id=>'api_themoviedb_org_3_list'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('api_themoviedb_org_3_list'),'https://api.themoviedb.org/3/list/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('api_themoviedb_org_3_list'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('api_themoviedb_org_3_list'),'')
,p_prompt_on_install=>false
);
wwv_flow_api.component_end;
end;
/
