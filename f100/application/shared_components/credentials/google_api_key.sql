prompt --application/shared_components/credentials/google_api_key
begin
--   Manifest
--     CREDENTIAL: Google API Key
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_credential(
 p_id=>wwv_flow_api.id(4444148457097671317)
,p_name=>'Google API Key'
,p_static_id=>'google_api_key'
,p_authentication_type=>'HTTP_QUERY_STRING'
,p_prompt_on_install=>true
);
wwv_flow_api.component_end;
end;
/
