prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 100
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>4200481731648079
,p_default_application_id=>100
,p_default_id_offset=>39500229701756973
,p_default_owner=>'VCONTROL'
);
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(17831599860251942603)
,p_welcome_message=>'This is a basic customer tracking application. Use the application to manage your Customers, their Contacts and related information.'
,p_configuration_message=>'Customers Installation. You can configure the following attributes of your application.'
,p_build_options_message=>'Customers Installation. You can choose to include the following build options.'
,p_validation_message=>'Customers Installation. The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Customers Installation. Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_get_version_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tables',
' where table_name like ''EBA_CUST_%'''))
,p_deinstall_success_message=>'Customers deinstallation complete.'
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'drop sequence eba_cust_seq;',
'',
'drop table eba_cust_errors               cascade constraints;',
'drop table eba_cust_history              cascade constraints;',
'drop table eba_cust_countries            cascade constraints;',
'drop table eba_cust_error_lookup         cascade constraints;',
'drop table eba_cust_files                cascade constraints;',
'drop table eba_cust_links                cascade constraints;',
'drop table eba_cust_notes                cascade constraints;',
'drop table eba_cust_notifications        cascade constraints;',
'drop table eba_cust_preferences          cascade constraints;',
'drop table eba_cust_product_uses         cascade constraints;',
'drop table eba_cust_tags                 cascade constraints;',
'drop table eba_cust_tags_sum             cascade constraints;',
'drop table eba_cust_tags_type_sum        cascade constraints;',
'drop table eba_cust_users                cascade constraints;',
'drop table eba_cust_administrators       cascade constraints;',
'drop table eba_cust_views_log            cascade constraints;',
'drop table eba_cust_access_levels        cascade constraints;',
'drop table eba_cust_contacts             cascade constraints;',
'drop table eba_cust_sales_channel        cascade constraints;',
'drop table eba_cust_customers            cascade constraints;',
'drop table eba_cust_geographies          cascade constraints;',
'drop table eba_cust_industries           cascade constraints;',
'drop table eba_cust_product_families     cascade constraints;',
'drop table eba_cust_products             cascade constraints;',
'drop table eba_cust_status               cascade constraints;',
'drop table eba_cust_contact_types        cascade constraints;',
'drop table eba_cust_customer_reftype_ref cascade constraints;',
'drop table eba_cust_reference_types      cascade constraints;',
'drop table eba_cust_categories           cascade constraints;',
'drop table eba_cust_tz_pref              cascade constraints;',
'drop table eba_cust_clicks               cascade constraints;',
'drop table eba_cust_verifications        cascade constraints;',
'drop table EBA_CUST_REF_PHASE            cascade constraints;',
'drop table EBA_CUST_PRODUCT_STATUSES     cascade constraints;',
'drop table eba_cust_type                 cascade constraints;',
'drop table eba_cust_use_case             cascade constraints;',
'drop table EBA_CUST_COMPETITORS          cascade constraints;',
'drop table EBA_CUST_CUST_COMPETITOR_REF  cascade constraints;',
'drop table EBA_CUST_CUST_PARTNER_REF     cascade constraints;',
'drop table EBA_CUST_IMPL_PARTNERS        cascade constraints;',
'drop table eba_cust_activity_ref         cascade constraints;',
'drop table eba_cust_activity_files       cascade constraints;',
'drop table eba_cust_activities           cascade constraints;',
'drop table eba_cust_activity_types       cascade constraints;',
'drop table eba_cust_feedback_types       cascade constraints;',
'drop table eba_cust_feedback             cascade constraints;',
'drop table eba_cust_email_log            cascade constraints;',
'drop table eba_cust_acl_features         cascade constraints;',
'drop table eba_cust_issue_statuses       cascade constraints;',
'drop table eba_cust_issues               cascade constraints;',
'',
'',
'drop view eba_cust_customers_v;',
'',
'drop package eba_cust;',
'drop package eba_cust_sample_data;',
'drop package eba_cust_fw;',
'drop package eba_cust_email;',
'',
'drop procedure eba_cust_tz_init;'))
,p_required_free_kb=>1856
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TRIGGER'
,p_required_names_available=>'EBA_CUST_ACCESS_LEVELS:EBA_CUST_ADMINISTRATORS:EBA_CUST_CATEGORIES:EBA_CUST_CONTACT_TYPES:EBA_CUST_CONTACTS:EBA_CUST_COUNTRIES:EBA_CUST_CUSTOMERS:EBA_CUST_ERROR_LOOKUP:EBA_CUST_FILES:EBA_CUST_GEOGRAPHIES:EBA_CUST_HISTORY:EBA_CUST_INDUSTRIES:EBA_CUST_'
||'LINKS:EBA_CUST_NOTES:EBA_CUST_NOTIFICATIONS:EBA_CUST_PREFERENCES:EBA_CUST_PRODUCT_USES:EBA_CUST_PRODUCTS:EBA_CUST_STATUS:EBA_CUST_TAGS:EBA_CUST_TAGS_SUM:EBA_CUST_TAGS_TYPE_SUM:EBA_CUST_TZ_PREF:EBA_CUST_USERS:EBA_CUST_VIEWS_LOG:EBA_CUST:EBA_CUST_SAMPL'
||'E_DATA:EBA_CUST_TZ_INIT:EBA_CUST_CUSTOMERS_V:EBA_CUST_SEQ:EBA_CUST_FW:EBA_CUST_CLICKS:EBA_CUST_VERIFICATIONS:EBA_CUST_TYPE:EBA_CUST_USE_CASE:EBA_CUST_COMPETITORS:EBA_CUST_CUST_COMPETITOR_REF:EBA_CUST_CUST_PARTNER_REF:EBA_CUST_IMPL_PARTNERS:EBA_CUST_P'
||'RODUCT_FAMILIES:EBA_CUST_ACTIVITIES:EBA_CUST_ACTIVITY_FILES:EBA_CUST_ACTIVITY_REF:EBA_CUST_ACTIVITY_TYPES:EBA_CUST_FEEDBACK_TYPES:EBA_CUST_FEEDBACK:EBA_CUST_EMAIL_LOG:EBA_CUST_EMAIL:EBA_CUST_ISSUE_STATUSES:EBA_CUST_ISSUES'
,p_deinstall_message=>'This operation will completely remove this application from your workspace.'
);
wwv_flow_api.component_end;
end;
/
