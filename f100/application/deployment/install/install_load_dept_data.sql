prompt --application/deployment/install/install_load_dept_data
begin
--   Manifest
--     INSTALL: INSTALL-load dept data
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>5389331382356895884
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(4472867238974746361)
,p_install_id=>wwv_flow_api.id(5394817275311454157)
,p_name=>'load dept data'
,p_sequence=>50
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_demo_card_dept (DEPTNO,DNAME,LOC) values (10,''ACCOUNTING'',''NEW YORK'');',
'insert into eba_demo_card_dept (DEPTNO,DNAME,LOC) values (20,''RESEARCH'',''DALLAS'');',
'insert into eba_demo_card_dept (DEPTNO,DNAME,LOC) values (30,''SALES'',''CHICAGO'');',
'insert into eba_demo_card_dept (DEPTNO,DNAME,LOC) values (40,''OPERATIONS'',''BOSTON'');'))
);
wwv_flow_api.component_end;
end;
/
