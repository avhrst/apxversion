prompt --application/deployment/install/install_eba_cust_sample_data_spec
begin
--   Manifest
--     INSTALL: INSTALL-eba_cust_sample_data spec
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
 p_id=>wwv_flow_api.id(16626270225875691858)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'eba_cust_sample_data spec'
,p_sequence=>70
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_cust_sample_data as',
'',
'    -------------------------------------------------------------------------',
'    procedure create_sample_data;',
'    ',
'    -------------------------------------------------------------------------',
'    procedure remove_sample_data;',
'        ',
'end eba_cust_sample_data;',
'/',
'show errors',
''))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(15123652074065567180)
,p_script_id=>wwv_flow_api.id(16626270225875691858)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_CUST_SAMPLE_DATA'
,p_last_updated_on=>to_date('20141219062058','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062058','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
