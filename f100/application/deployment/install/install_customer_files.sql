prompt --application/deployment/install/install_customer_files
begin
--   Manifest
--     INSTALL: INSTALL-customer files
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
 p_id=>wwv_flow_api.id(16698614534428600009)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'customer files'
,p_sequence=>280
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_files (',
'    id                      number         not null,',
'    row_version_number      number         not null,',
'    customer_id             number         not null,',
'    --',
'    file_name               varchar2(512),',
'    file_mimetype           varchar2(512),',
'    file_charset            varchar2(512),',
'    file_lastupd            date,',
'    file_blob               blob,',
'    file_comments           varchar2(4000),',
'    tags                    varchar2(4000),',
'    --',
'    created               timestamp with time zone not null,',
'    created_by            varchar2(255) not null,',
'    updated               timestamp with time zone,',
'    updated_by            varchar2(255)',
'   )',
'/',
'alter table eba_cust_files',
'   add constraint eba_cust_files_pk',
'       primary key (id)',
'/',
'alter table eba_cust_files',
'   add constraint eba_cust_files_fk',
'       foreign key (customer_id)',
'       references eba_cust_customers (id) on delete cascade',
'/',
'',
'create index eba_cust_files_01 on eba_cust_files (customer_id);',
'',
'',
''))
);
wwv_flow_api.component_end;
end;
/
