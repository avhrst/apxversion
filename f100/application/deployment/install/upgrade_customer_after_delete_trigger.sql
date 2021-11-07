prompt --application/deployment/install/upgrade_customer_after_delete_trigger
begin
--   Manifest
--     INSTALL: UPGRADE-customer after delete trigger
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
 p_id=>wwv_flow_api.id(4052489386628820312)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'customer after delete trigger'
,p_sequence=>490
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger ad_eba_cust_customers',
'    after delete on eba_cust_customers',
'    for each row',
'begin',
'    insert into eba_cust_history (table_name, component_rowkey, component_id, column_name, old_value, new_value)',
'    values ',
'    (''CUSTOMERS'', :old.row_key, :old.id, ''CUSTOMER_REMOVED'', substr(:old.customer_name,0,4000), null ); ',
'end ad_eba_cust_customers;',
'/',
'alter trigger ad_eba_cust_customers enable',
'/'))
);
wwv_flow_api.component_end;
end;
/
