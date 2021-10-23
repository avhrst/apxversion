prompt --application/deployment/install/install_tags
begin
--   Manifest
--     INSTALL: INSTALL-tags
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
 p_id=>wwv_flow_api.id(16698615333866609225)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'tags'
,p_sequence=>320
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_cust_tags (',
'    tag_id                      number not null,',
'    tag                         varchar2(255) not null enable,',
'    content_id                  number,',
'    content_type                varchar2(30),',
'    --',
'    created               timestamp with time zone not null,',
'    created_by            varchar2(255) not null,',
'    updated               timestamp with time zone,',
'    updated_by            varchar2(255)',
'   )',
'/',
'alter table eba_cust_tags',
'   add constraint eba_cust_tags_pk',
'       primary key (tag_id)',
'/',
'alter table eba_cust_tags',
'   add constraint eba_cust_tags_ck check',
'       (content_type in (''CUSTOMER'',''CONTACT'',''PRODUCT'',''FILE''))',
'/',
'',
'create table eba_cust_tags_type_sum (',
'    tag                             varchar2(255),',
'    content_type                    varchar2(30),',
'    tag_count                       number,',
'    constraint eba_cust_tags_type_sum_pk primary key (tag,content_type)',
'    )',
'/',
'',
'create table eba_cust_tags_sum (',
'    tag                             varchar2(255),',
'    tag_count                       number,',
'    constraint eba_cust_tags_sum_pk primary key (tag)',
'    )',
'/',
''))
);
wwv_flow_api.component_end;
end;
/
