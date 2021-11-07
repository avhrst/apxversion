prompt --application/deployment/install/install_timezone
begin
--   Manifest
--     INSTALL: INSTALL-timezone
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
 p_id=>wwv_flow_api.id(16649375007373011345)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'timezone'
,p_sequence=>50
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_tz_pref (',
'  id                        number not null',
'                            constraint eba_cust_tz_pref_pk',
'                            primary key,',
'  row_version_number        integer,',
'  userid                    varchar2(255) not null,',
'  TIMEZONE_PREFERENCE       varchar2(255) not null,',
'  created                   timestamp with time zone,',
'  created_by                varchar2(255),',
'  updated                   timestamp with time zone,',
'  updated_by                varchar2(255)',
'  );',
'  ',
'create or replace trigger biu_eba_cust_tz_pref',
'   before insert or update on eba_cust_tz_pref',
'   for each row',
'begin',
'   if :new."ID" is null then',
'     select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from dual;',
'   end if;',
'   if inserting then',
'       :new.created := current_timestamp;',
'       :new.created_by := nvl(wwv_flow.g_user,user);',
'       :new.updated := current_timestamp;',
'       :new.updated_by := nvl(wwv_flow.g_user,user);',
'       :new.row_version_number := 1;',
'   elsif updating then',
'       :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'   end if;',
'   if inserting or updating then',
'       :new.updated := current_timestamp;',
'       :new.updated_by := nvl(wwv_flow.g_user,user);',
'   end if;',
'   if :new.TIMEZONE_PREFERENCE is null then',
'       :new.timezone_preference := ''UTC'';',
'   end if;',
'end;',
'/',
'alter trigger biu_eba_cust_tz_pref enable;    ',
'    ',
'create or replace procedure eba_cust_tz_init',
'as',
'  c integer := 0;',
'  l_app_user varchar2(255);',
'begin',
'l_app_user := nvl(v(''APP_USER''),user);',
'for c1 in (',
'   select TIMEZONE_PREFERENCE',
'   from   eba_cust_tz_pref',
'   where  USERID = l_app_user) loop',
'   --',
'   if c1.TIMEZONE_PREFERENCE is not null then',
'       c := c + 1;',
'       APEX_UTIL.SET_SESSION_TIME_ZONE (P_TIME_ZONE => c1.TIMEZONE_PREFERENCE ); ',
'   end if;',
'   exit;',
'end loop;',
'if c = 0 then',
'    if apex_util.get_session_time_zone is null then',
'        APEX_UTIL.SET_SESSION_TIME_ZONE (P_TIME_ZONE => ''US/Pacific''); ',
'    end if;',
'end if;',
'end;',
'/',
'show errors'))
);
wwv_flow_api.component_end;
end;
/
