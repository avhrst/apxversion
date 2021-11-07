prompt --application/shared_components/security/authorizations/edit_competitors
begin
--   Manifest
--     SECURITY SCHEME: Edit Competitors
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1398482905247979583)
,p_name=>'Edit Competitors'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return eba_cust.get_feature_level(:APP_USER, ''EDIT_COMPETITORS'');'
,p_error_message=>'Insufficient privileges, user is not allowed to edit competitors.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.component_end;
end;
/
