prompt --application/shared_components/legacy_data_loads/eba_cust_contacts
begin
--   Manifest
--     EBA_CUST_CONTACTS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_load_table(
 p_id=>wwv_flow_api.id(15925722816658767109)
,p_name=>'contacts'
,p_owner=>'#OWNER#'
,p_table_name=>'EBA_CUST_CONTACTS'
,p_unique_column_1=>'CUSTOMER_ID'
,p_is_uk1_case_sensitive=>'N'
,p_unique_column_2=>'NAME'
,p_is_uk2_case_sensitive=>'N'
,p_is_uk3_case_sensitive=>'N'
,p_skip_validation=>'N'
);
wwv_flow_api.create_load_table_lookup(
 p_id=>wwv_flow_api.id(15925723127155767126)
,p_load_table_id=>wwv_flow_api.id(15925722816658767109)
,p_load_column_name=>'CONTACT_TYPE_ID'
,p_lookup_owner=>'#OWNER#'
,p_lookup_table_name=>'EBA_CUST_CONTACT_TYPES'
,p_key_column=>'ID'
,p_display_column=>'CONTACT_TYPE'
,p_insert_new_value=>'N'
);
wwv_flow_api.create_load_table_lookup(
 p_id=>wwv_flow_api.id(15925722934544767124)
,p_load_table_id=>wwv_flow_api.id(15925722816658767109)
,p_load_column_name=>'CUSTOMER_ID'
,p_lookup_owner=>'#OWNER#'
,p_lookup_table_name=>'EBA_CUST_CUSTOMERS'
,p_key_column=>'ID'
,p_display_column=>'CUSTOMER_NAME'
,p_insert_new_value=>'N'
);
wwv_flow_api.component_end;
end;
/
