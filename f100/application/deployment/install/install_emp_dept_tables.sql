prompt --application/deployment/install/install_emp_dept_tables
begin
--   Manifest
--     INSTALL: INSTALL-emp dept tables
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
 p_id=>wwv_flow_api.id(4472867133011742592)
,p_install_id=>wwv_flow_api.id(5394817275311454157)
,p_name=>'emp dept tables'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_demo_card_dept (',
'    deptno    number not null constraint eba_demo_card_dept_pk primary key,',
'    dname     varchar2(50),',
'    loc       varchar2(255) );',
'',
'create table eba_demo_card_emp (',
'    empno            number not null constraint eba_demo_card_emp_pk  primary key,',
'    ename            varchar2(255),',
'    job              varchar2(255),',
'    mgr              number,',
'    hiredate         date,',
'    sal              number,',
'    comm             number,',
'    deptno           number,',
'    profile_image    blob,',
'    mimetype         varchar2(255),',
'    filename         varchar2(400),',
'    image_last_update date,',
'    tags             varchar2(4000) );',
'',
'alter table eba_demo_card_emp add constraint eba_demo_card_emp_mgr_fk foreign key (mgr)',
'      references eba_demo_card_emp (empno) enable;',
'',
'alter table eba_demo_card_emp add constraint eba_demo_card_emp_dept_fk foreign key (deptno)',
'      references eba_demo_card_dept (deptno) enable;',
''))
);
wwv_flow_api.component_end;
end;
/
