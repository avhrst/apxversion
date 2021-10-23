prompt --application/deployment/install/install_customer_view_log
begin
--   Manifest
--     INSTALL: INSTALL-customer view log
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
 p_id=>wwv_flow_api.id(16698614916897604335)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'customer view log'
,p_sequence=>300
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_views_log (',
'   id                 number          not null,',
'   row_version_number NUMBER,',
'   table_primary_id   number,',
'   view_type          varchar2(10),',
'   view_count         NUMBER default 1,',
'   --',
'   created               timestamp with time zone not null,',
'   created_by            varchar2(255) not null,',
'   updated               timestamp with time zone,',
'   updated_by            varchar2(255)',
'  )',
'/',
'alter table eba_cust_views_log',
'   add constraint eba_cust_views_log_pk',
'       primary key (id)',
'/',
'',
'create or replace trigger bi_eba_cust_views_log',
'   before insert on eba_cust_views_log',
'   for each row',
'   begin',
'      if inserting then',
'         if :NEW.ID is null then',
'            select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'              into :new.id',
'              from dual;',
'         End if;',
'         :NEW.CREATED := current_timestamp;',
'         :NEW.CREATED_BY := nvl(v(''APP_USER''),USER);',
'         :NEW.UPDATED := current_timestamp;',
'         :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'         :new.row_version_number := 1;',
'      end if;',
'   ',
'      if updating then',
'         :NEW.UPDATED := current_timestamp;',
'         :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'         :new.row_version_number := nvl(:new.row_version_number,0) + 1;',
'      end if;',
'   end;',
'/',
'',
'',
'',
''))
);
wwv_flow_api.component_end;
end;
/
