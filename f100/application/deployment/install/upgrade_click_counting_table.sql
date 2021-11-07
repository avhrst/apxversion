prompt --application/deployment/install/upgrade_click_counting_table
begin
--   Manifest
--     INSTALL: UPGRADE-Click Counting Table
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
 p_id=>wwv_flow_api.id(14971515106969958739)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'Click Counting Table'
,p_sequence=>130
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_CUST_CLICKS'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_cust_clicks (    ',
'    id                number primary key,',
'    cust_id           number,',
'    app_username      varchar2(255),',
'    view_timestamp    timestamp(6) with time zone,',
'    app_session       varchar2(255)',
');',
'/',
'',
'',
'create index eba_cust_clicks_idx1 on eba_cust_clicks (cust_id);',
'create index eba_cust_clicks_idx2 on eba_cust_clicks (view_timestamp);',
'',
'create or replace trigger eba_cust_clicks_biu',
'    before insert on eba_cust_clicks',
'    for each row',
'begin',
'     if :new.id is null then',
'         :new.id := eba_cust_seq.nextval;',
'     end if;',
'     :new.view_timestamp := current_timestamp;',
'     :new.app_username := nvl(v(''APP_USER''),user);',
'     :new.app_session := v(''APP_SESSION'');',
'end;',
'/',
'',
'alter trigger eba_cust_clicks_biu enable;',
''))
);
wwv_flow_api.component_end;
end;
/
