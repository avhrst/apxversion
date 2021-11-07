prompt --application/deployment/install/upgrade_add_eba_cust_prod_uses_contact_fk
begin
--   Manifest
--     INSTALL: UPGRADE-add eba_cust_prod_uses_contact_fk
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
 p_id=>wwv_flow_api.id(14325007217002451414)
,p_install_id=>wwv_flow_api.id(17831599860251942603)
,p_name=>'add eba_cust_prod_uses_contact_fk'
,p_sequence=>250
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_constraints',
'where constraint_name = ''EBA_CUST_PROD_USES_CONTACT_FK'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_cust_product_uses',
'   add constraint eba_cust_prod_uses_contact_fk',
'       foreign key (customer_contact_id)',
'       references eba_cust_contacts (id) on delete cascade',
'/',
'show errors'))
);
wwv_flow_api.component_end;
end;
/
