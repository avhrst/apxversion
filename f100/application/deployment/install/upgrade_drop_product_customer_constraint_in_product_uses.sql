prompt --application/deployment/install/upgrade_drop_product_customer_constraint_in_product_uses
begin
--   Manifest
--     INSTALL: UPGRADE-Drop product/customer constraint in product uses
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
 p_id=>wwv_flow_api.id(14281564709905827161)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'Drop product/customer constraint in product uses'
,p_sequence=>230
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_constraints',
'where constraint_name = ''EBA_CUST_PRODUCT_USES_UK'''))
,p_script_clob=>'alter table eba_cust_product_uses drop constraint EBA_CUST_PRODUCT_USES_UK;'
);
wwv_flow_api.component_end;
end;
/
