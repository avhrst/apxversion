prompt --application/deployment/install/install_eba_cust_email_package_spec
begin
--   Manifest
--     INSTALL: INSTALL-eba_cust_email package spec
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(18773121574409215594)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'eba_cust_email package spec'
,p_sequence=>540
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_cust_email as',
'',
'    procedure send_feedback_email',
'    (',
'        p_app_id        in number,',
'        p_page_id       in number,',
'        p_submitter     in varchar2,',
'        p_feedback_type in varchar2,',
'        p_feedback      in varchar2',
'    );',
'',
'end eba_cust_email;',
'/',
'show errors'))
);
wwv_flow_api.component_end;
end;
/
