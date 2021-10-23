prompt --application/deployment/install/upgrade_sales_channel
begin
--   Manifest
--     INSTALL: UPGRADE-sales channel
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
 p_id=>wwv_flow_api.id(15882027675943420369)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'sales channel'
,p_sequence=>190
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_CUST_SALES_CHANNEL'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_sales_channel (',
'   id                      number       not null,',
'   channel                 varchar2(60) not null,',
'   description             varchar2(4000),',
'   --',
'   created               timestamp with time zone not null,',
'   created_by            varchar2(255) not null,',
'   updated               timestamp with time zone,',
'   updated_by            varchar2(255)',
'  )',
'/',
'alter table eba_cust_sales_channel add ',
'constraint eba_cust_sales_channel_pk primary key (id)',
'/',
'',
'create unique index eba_cust_sales_channel_uk on eba_cust_sales_channel(channel)',
'/',
'',
'alter table eba_cust_sales_channel',
'   add constraint eba_cust_sales_channel_uk',
'       unique (channel)',
'       using index eba_cust_sales_channel_uk',
'/',
'',
'',
'create or replace trigger biu_eba_cust_sales_channel',
'   before insert or update on eba_cust_sales_channel',
'   for each row',
'begin',
'   if inserting then',
'      if :NEW.ID is null then',
'        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'        into :new.id',
'        from dual;',
'      end if;',
'      :NEW.CREATED := current_timestamp;',
'      :NEW.CREATED_BY := nvl(v(''APP_USER''),USER);',
'      :NEW.UPDATED := current_timestamp;',
'      :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'   end if;',
'   if updating then',
'      :NEW.UPDATED := current_timestamp;',
'      :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'   end if;',
'end;',
'/',
'show errors',
'',
'insert into eba_cust_sales_channel (id, channel) values (1, ''Direct'');',
'insert into eba_cust_sales_channel (id, channel) values (2, ''Field'');',
'insert into eba_cust_sales_channel (id, channel) values (3, ''Store'');',
'insert into eba_cust_sales_channel (id, channel) values (4, ''Partner'');',
'commit;'))
);
wwv_flow_api.component_end;
end;
/
