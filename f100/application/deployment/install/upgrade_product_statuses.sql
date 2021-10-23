prompt --application/deployment/install/upgrade_product_statuses
begin
--   Manifest
--     INSTALL: UPGRADE-product statuses
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
 p_id=>wwv_flow_api.id(14318301563520973405)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'product statuses'
,p_sequence=>260
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_CUST_PRODUCT_STATUSES'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_product_statuses (',
'    id          number         not NULL,',
'    status      varchar2(255),',
'    description varchar2(512),',
'    is_current_yn varchar2(1),',
'    --',
'    created     timestamp with time zone not null,',
'    created_by  varchar2(255) not null,',
'    updated     timestamp with time zone,',
'    updated_by  varchar2(255)',
'   )',
'/',
'alter table eba_cust_product_statuses',
'   add constraint eba_cust_product_statuses_pk',
'       primary key (id)',
'/',
'',
'create or replace trigger  eba_cust_product_statuses_biu',
'   before insert or update on eba_cust_product_statuses',
'   for each row',
'begin',
'    if :NEW.ID is null then',
'           select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'           into :new.id',
'           from dual;',
'    end if;',
'',
'    if inserting then',
'       :NEW.CREATED := current_timestamp;',
'       :NEW.CREATED_BY := nvl(v(''APP_USER''),USER);',
'       :NEW.UPDATED := current_timestamp;',
'       :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'    end if;',
'  ',
'    if updating then',
'       :NEW.UPDATED := current_timestamp;',
'       :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'    end if;',
'end;',
'/',
'',
'',
'insert into eba_cust_product_statuses (status, description, is_current_yn) values (''Phase 1'', ''Candidates and Discovery'', ''N'');',
'insert into eba_cust_product_statuses (status, description, is_current_yn) values (''Phase 2'', ''Active Discussions'', ''N'');',
'insert into eba_cust_product_statuses (status, description, is_current_yn) values (''Phase 3'', ''Engaged With Customer'', ''N'');',
'insert into eba_cust_product_statuses (status, description, is_current_yn) values (''Phase 4'', ''Reference Available and Published'', ''Y'');',
'commit;'))
);
wwv_flow_api.component_end;
end;
/
