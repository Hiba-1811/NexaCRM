-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: temp_crm
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1


--
-- Table structure for table "attachments"
--

DROP TABLE IF EXISTS "attachments";
CREATE TABLE "attachments" (
  "attachment_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "attachment_uniqiueid" varchar(100) NOT NULL,
  "attachment_created" TIMESTAMP DEFAULT NULL,
  "attachment_updated" TIMESTAMP DEFAULT NULL,
  "attachment_creatorid" int NOT NULL,
  "attachment_clientid" int DEFAULT NULL,
  "attachment_directory" varchar(100) NOT NULL,
  "attachment_filename" varchar(250) NOT NULL,
  "attachment_extension" varchar(20) DEFAULT NULL,
  "attachment_type" varchar(20) DEFAULT NULL,
  "attachment_size" varchar(30) DEFAULT NULL,
  "attachment_thumbname" varchar(250) DEFAULT NULL,
  "attachmentresource_type" varchar(50) NOT NULL,
  "attachmentresource_id" int NOT NULL,
  PRIMARY KEY ("attachment_id")
);

--
-- Dumping data for table "attachments"
--


--
-- Table structure for table "automation_assigned"
--

DROP TABLE IF EXISTS "automation_assigned";
CREATE TABLE "automation_assigned" (
  "automationassigned_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "automationassigned_created" TIMESTAMP DEFAULT NULL,
  "automationassigned_updated" int DEFAULT NULL,
  "automationassigned_userid" int DEFAULT NULL,
  "automationassigned_resource_type" varchar(150) DEFAULT NULL,
  "automationassigned_resource_id" int DEFAULT NULL,
  PRIMARY KEY ("automationassigned_id")
);

--
-- Dumping data for table "automation_assigned"
--


--
-- Table structure for table "calendar_events"
--

DROP TABLE IF EXISTS "calendar_events";
CREATE TABLE "calendar_events" (
  "calendar_event_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "calendar_event_uniqueid" varchar(100) DEFAULT NULL,
  "calendar_event_created" TIMESTAMP NOT NULL,
  "calendar_event_updated" TIMESTAMP NOT NULL,
  "calendar_event_creatorid" int DEFAULT NULL,
  "calendar_event_title" varchar(200) DEFAULT NULL,
  "calendar_event_description" text,
  "calendar_event_location" text,
  "calendar_event_all_day" varchar(50) DEFAULT 'yes',
  "calendar_event_start_date" date DEFAULT NULL,
  "calendar_event_start_time" time DEFAULT NULL,
  "calendar_event_end_date" date DEFAULT NULL,
  "calendar_event_end_time" time DEFAULT NULL,
  "calendar_event_sharing" varchar(100) DEFAULT 'self',
  "calendar_event_reminder" varchar(100) DEFAULT 'no',
  "calendar_event_reminder_sent" varchar(20) DEFAULT 'no',
  "calendar_event_timezoe" text,
  "calendar_event_reminder_date_sent" TIMESTAMP DEFAULT NULL,
  "calendar_event_reminder_duration" int DEFAULT NULL,
  "calendar_event_reminder_period" text,
  "calendar_event_colour" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("calendar_event_id")
);

--
-- Dumping data for table "calendar_events"
--


--
-- Table structure for table "calendar_events_sharing"
--

DROP TABLE IF EXISTS "calendar_events_sharing";
CREATE TABLE "calendar_events_sharing" (
  "calendarsharing_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "calendarsharing_created" TIMESTAMP DEFAULT NULL,
  "calendarsharing_updated" TIMESTAMP DEFAULT NULL,
  "calendarsharing_eventid" int NOT NULL,
  "calendarsharing_userid" int DEFAULT NULL,
  PRIMARY KEY ("calendarsharing_id")
);

--
-- Dumping data for table "calendar_events_sharing"
--


--
-- Table structure for table "canned"
--

DROP TABLE IF EXISTS "canned";
CREATE TABLE "canned" (
  "canned_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "canned_created" TIMESTAMP NOT NULL,
  "canned_updated" TIMESTAMP NOT NULL,
  "canned_creatorid" int DEFAULT NULL,
  "canned_categoryid" int DEFAULT NULL,
  "canned_title" varchar(250) DEFAULT NULL,
  "canned_message" text,
  "canned_visibility" varchar(20) DEFAULT 'public',
  PRIMARY KEY ("canned_id")
);

--
-- Dumping data for table "canned"
--


--
-- Table structure for table "canned_recently_used"
--

DROP TABLE IF EXISTS "canned_recently_used";
CREATE TABLE "canned_recently_used" (
  "cannedrecent_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "cannedrecent_created" TIMESTAMP NOT NULL,
  "cannedrecent_updated" TIMESTAMP NOT NULL,
  "cannedrecent_userid" int NOT NULL,
  "cannedrecent_cannedid" int NOT NULL,
  PRIMARY KEY ("cannedrecent_id")
);

--
-- Dumping data for table "canned_recently_used"
--


--
-- Table structure for table "categories"
--

DROP TABLE IF EXISTS "categories";
CREATE TABLE "categories" (
  "category_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "category_uniqueid" varchar(100) NOT NULL,
  "category_created" TIMESTAMP DEFAULT NULL,
  "category_updated" TIMESTAMP DEFAULT NULL,
  "category_creatorid" int DEFAULT NULL,
  "category_name" varchar(150) DEFAULT NULL,
  "category_description" varchar(150) DEFAULT NULL,
  "category_system_default" varchar(20) DEFAULT 'no',
  "category_visibility" varchar(20) DEFAULT 'everyone',
  "category_icon" varchar(100) DEFAULT 'sl-icon-docs',
  "category_type" varchar(50) NOT NULL,
  "category_slug" varchar(250) NOT NULL,
  "category_meta_1" int DEFAULT NULL,
  "category_meta_2" TIMESTAMP DEFAULT NULL,
  "category_meta_3" TIMESTAMP DEFAULT NULL,
  "category_meta_4" text,
  "category_meta_5" text,
  "category_meta_6" text,
  "category_meta_7" text,
  "category_meta_8" text,
  "category_meta_9" text,
  "category_meta_10" text,
  "category_meta_11" text,
  "category_meta_12" text,
  "category_meta_13" text,
  "category_meta_14" text,
  "category_meta_15" text,
  "category_meta_16" text,
  "category_meta_17" text,
  "category_meta_18" text,
  "category_meta_19" text,
  "category_meta_20" text,
  "category_meta_22" timestamp NULL DEFAULT NULL,
  "category_meta_21" timestamp NULL DEFAULT NULL,
  "category_meta_23" int DEFAULT '0',
  "category_meta_24" int DEFAULT '0',
  "category_meta_25" int DEFAULT '0',
  "category_meta_26" int DEFAULT '0',
  PRIMARY KEY ("category_id")
);

--
-- Dumping data for table "categories"
--


--
-- Table structure for table "category_users"
--

DROP TABLE IF EXISTS "category_users";
CREATE TABLE "category_users" (
  "categoryuser_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "categoryuser_categoryid" int NOT NULL,
  "categoryuser_userid" int NOT NULL,
  "categoryuser_created" TIMESTAMP NOT NULL,
  "categoryuser_updated" TIMESTAMP NOT NULL,
  PRIMARY KEY ("categoryuser_id")
);

--
-- Dumping data for table "category_users"
--


--
-- Table structure for table "checklists"
--

DROP TABLE IF EXISTS "checklists";
CREATE TABLE "checklists" (
  "checklist_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "checklist_position" int NOT NULL,
  "checklist_created" TIMESTAMP NOT NULL,
  "checklist_updated" TIMESTAMP NOT NULL,
  "checklist_creatorid" int NOT NULL,
  "checklist_clientid" int DEFAULT NULL,
  "checklist_text" text NOT NULL,
  "checklist_status" varchar(250) NOT NULL DEFAULT 'pending',
  "checklistresource_type" varchar(50) NOT NULL,
  "checklistresource_id" int NOT NULL,
  "checklist_mapping_type" text,
  "checklist_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("checklist_id")
);

--
-- Dumping data for table "checklists"
--


--
-- Table structure for table "clients"
--

DROP TABLE IF EXISTS "clients";
CREATE TABLE "clients" (
  "client_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "client_importid" varchar(100) DEFAULT NULL,
  "client_created" TIMESTAMP DEFAULT NULL,
  "client_updated" TIMESTAMP DEFAULT NULL,
  "client_creatorid" int NOT NULL,
  "client_created_from_leadid" int NOT NULL,
  "client_categoryid" int DEFAULT '2',
  "client_company_name" varchar(150) NOT NULL,
  "client_description" text,
  "client_phone" varchar(50) DEFAULT NULL,
  "client_logo_folder" varchar(50) DEFAULT NULL,
  "client_logo_filename" varchar(50) DEFAULT NULL,
  "client_website" varchar(250) DEFAULT NULL,
  "client_vat" varchar(50) DEFAULT NULL,
  "client_billing_street" varchar(200) DEFAULT NULL,
  "client_billing_city" varchar(100) DEFAULT NULL,
  "client_billing_state" varchar(100) DEFAULT NULL,
  "client_billing_zip" varchar(50) DEFAULT NULL,
  "client_billing_country" varchar(100) DEFAULT NULL,
  "client_shipping_street" varchar(250) DEFAULT NULL,
  "client_shipping_city" varchar(100) DEFAULT NULL,
  "client_shipping_state" varchar(100) DEFAULT NULL,
  "client_shipping_zip" varchar(50) DEFAULT NULL,
  "client_shipping_country" varchar(100) DEFAULT NULL,
  "client_status" varchar(50) NOT NULL DEFAULT 'active',
  "client_app_modules" varchar(50) DEFAULT 'system',
  "client_settings_modules_projects" varchar(50) DEFAULT 'enabled',
  "client_settings_modules_invoices" varchar(50) DEFAULT 'enabled',
  "client_settings_modules_payments" varchar(50) DEFAULT 'enabled',
  "client_settings_modules_knowledgebase" varchar(50) DEFAULT 'enabled',
  "client_settings_modules_estimates" varchar(50) DEFAULT 'enabled',
  "client_settings_modules_subscriptions" varchar(50) DEFAULT 'enabled',
  "client_settings_modules_tickets" varchar(50) DEFAULT 'enabled',
  "client_import_first_name" varchar(100) DEFAULT NULL,
  "client_import_last_name" varchar(100) DEFAULT NULL,
  "client_import_email" varchar(100) DEFAULT NULL,
  "client_import_job_title" varchar(100) DEFAULT NULL,
  "client_custom_field_1" TEXT,
  "client_custom_field_2" TEXT,
  "client_custom_field_3" TEXT,
  "client_custom_field_4" TEXT,
  "client_custom_field_5" TEXT,
  "client_custom_field_6" TEXT,
  "client_custom_field_7" TEXT,
  "client_custom_field_8" TEXT,
  "client_custom_field_9" TEXT,
  "client_custom_field_10" TEXT,
  "client_custom_field_11" TIMESTAMP DEFAULT NULL,
  "client_custom_field_12" TIMESTAMP DEFAULT NULL,
  "client_custom_field_13" TIMESTAMP DEFAULT NULL,
  "client_custom_field_14" TIMESTAMP DEFAULT NULL,
  "client_custom_field_15" TIMESTAMP DEFAULT NULL,
  "client_custom_field_16" TIMESTAMP DEFAULT NULL,
  "client_custom_field_17" TIMESTAMP DEFAULT NULL,
  "client_custom_field_18" TIMESTAMP DEFAULT NULL,
  "client_custom_field_19" TIMESTAMP DEFAULT NULL,
  "client_custom_field_20" TIMESTAMP DEFAULT NULL,
  "client_custom_field_21" text,
  "client_custom_field_22" text,
  "client_custom_field_23" text,
  "client_custom_field_24" text,
  "client_custom_field_25" text,
  "client_custom_field_26" text,
  "client_custom_field_27" text,
  "client_custom_field_28" text,
  "client_custom_field_29" text,
  "client_custom_field_30" text,
  "client_custom_field_31" varchar(20) DEFAULT NULL,
  "client_custom_field_32" varchar(20) DEFAULT NULL,
  "client_custom_field_33" varchar(20) DEFAULT NULL,
  "client_custom_field_34" varchar(20) DEFAULT NULL,
  "client_custom_field_35" varchar(20) DEFAULT NULL,
  "client_custom_field_36" varchar(20) DEFAULT NULL,
  "client_custom_field_37" varchar(20) DEFAULT NULL,
  "client_custom_field_38" varchar(20) DEFAULT NULL,
  "client_custom_field_39" varchar(20) DEFAULT NULL,
  "client_custom_field_40" varchar(20) DEFAULT NULL,
  "client_custom_field_41" varchar(150) DEFAULT NULL,
  "client_custom_field_42" varchar(150) DEFAULT NULL,
  "client_custom_field_43" varchar(150) DEFAULT NULL,
  "client_custom_field_44" varchar(150) DEFAULT NULL,
  "client_custom_field_45" varchar(150) DEFAULT NULL,
  "client_custom_field_46" varchar(150) DEFAULT NULL,
  "client_custom_field_47" varchar(150) DEFAULT NULL,
  "client_custom_field_48" varchar(150) DEFAULT NULL,
  "client_custom_field_49" varchar(150) DEFAULT NULL,
  "client_custom_field_50" varchar(150) DEFAULT NULL,
  "client_custom_field_51" int DEFAULT NULL,
  "client_custom_field_52" int DEFAULT NULL,
  "client_custom_field_53" int DEFAULT NULL,
  "client_custom_field_54" int DEFAULT NULL,
  "client_custom_field_55" int DEFAULT NULL,
  "client_custom_field_56" int DEFAULT NULL,
  "client_custom_field_57" int DEFAULT NULL,
  "client_custom_field_58" int DEFAULT NULL,
  "client_custom_field_59" int DEFAULT NULL,
  "client_custom_field_60" int DEFAULT NULL,
  "client_custom_field_61" decimal(10,2) DEFAULT NULL,
  "client_custom_field_62" decimal(10,2) DEFAULT NULL,
  "client_custom_field_63" decimal(10,2) DEFAULT NULL,
  "client_custom_field_64" decimal(10,2) DEFAULT NULL,
  "client_custom_field_65" decimal(10,2) DEFAULT NULL,
  "client_custom_field_66" decimal(10,2) DEFAULT NULL,
  "client_custom_field_67" decimal(10,2) DEFAULT NULL,
  "client_custom_field_68" decimal(10,2) DEFAULT NULL,
  "client_custom_field_69" decimal(10,2) DEFAULT NULL,
  "client_custom_field_70" decimal(10,2) DEFAULT NULL,
  "client_billing_invoice_terms" text,
  "client_billing_invoice_due_days" smallint DEFAULT NULL,
  "client_mapping_type" text,
  "client_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("client_id")
);

--
-- Dumping data for table "clients"
--


--
-- Table structure for table "comments"
--

DROP TABLE IF EXISTS "comments";
CREATE TABLE "comments" (
  "comment_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "comment_created" TIMESTAMP DEFAULT NULL,
  "comment_updated" TIMESTAMP DEFAULT NULL,
  "comment_creatorid" int NOT NULL,
  "comment_clientid" int DEFAULT NULL,
  "comment_text" text NOT NULL,
  "comment_client_status" varchar(20) DEFAULT 'unread',
  "comment_team_status" varchar(20) DEFAULT 'unread',
  "commentresource_type" varchar(50) NOT NULL,
  "commentresource_id" int NOT NULL,
  "comment_mapping_type" text,
  "comment_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("comment_id")
);

--
-- Dumping data for table "comments"
--


--
-- Table structure for table "contract_templates"
--

DROP TABLE IF EXISTS "contract_templates";
CREATE TABLE "contract_templates" (
  "contract_template_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "contract_template_created" TIMESTAMP NOT NULL,
  "contract_template_updated" TIMESTAMP NOT NULL,
  "contract_template_creatorid" int DEFAULT NULL,
  "contract_template_title" varchar(250) DEFAULT NULL,
  "contract_template_heading_color" varchar(30) DEFAULT '#7493a9',
  "contract_template_title_color" varchar(30) DEFAULT '#7493a9',
  "contract_template_body" text,
  "contract_template_system" varchar(20) DEFAULT 'no',
  PRIMARY KEY ("contract_template_id")
);

--
-- Dumping data for table "contract_templates"
--


--
-- Table structure for table "contracts"
--

DROP TABLE IF EXISTS "contracts";
CREATE TABLE "contracts" (
  "doc_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "doc_unique_id" varchar(150) DEFAULT NULL,
  "doc_template" varchar(150) DEFAULT NULL,
  "doc_created" TIMESTAMP NOT NULL,
  "doc_updated" TIMESTAMP NOT NULL,
  "doc_date_status_change" TIMESTAMP NOT NULL,
  "doc_creatorid" int NOT NULL,
  "doc_categoryid" int DEFAULT '11',
  "doc_heading" varchar(250) DEFAULT '#7493a9',
  "doc_heading_color" varchar(30) DEFAULT '#7493a9',
  "doc_title" varchar(250) DEFAULT NULL,
  "doc_title_color" varchar(30) DEFAULT NULL,
  "doc_hero_direcory" varchar(250) DEFAULT NULL,
  "doc_hero_filename" varchar(250) DEFAULT NULL,
  "doc_hero_updated" varchar(250) DEFAULT 'no',
  "doc_body" text,
  "doc_date_start" date DEFAULT NULL,
  "doc_date_end" date DEFAULT NULL,
  "doc_date_published" date DEFAULT NULL,
  "doc_date_last_emailed" TIMESTAMP DEFAULT NULL,
  "doc_value" decimal(10,2) DEFAULT NULL,
  "doc_client_id" int DEFAULT NULL,
  "doc_project_id" int DEFAULT NULL,
  "doc_lead_id" int DEFAULT NULL,
  "doc_notes" text,
  "doc_viewed" varchar(20) DEFAULT 'no',
  "doc_type" varchar(150) DEFAULT 'contract',
  "doc_system_type" varchar(150) DEFAULT 'document',
  "doc_provider_signed_userid" int DEFAULT NULL,
  "doc_provider_signed_date" TIMESTAMP DEFAULT NULL,
  "doc_provider_signed_first_name" varchar(150) DEFAULT NULL,
  "doc_provider_signed_last_name" varchar(150) DEFAULT NULL,
  "doc_provider_signed_signature_directory" varchar(150) DEFAULT NULL,
  "doc_provider_signed_signature_filename" varchar(150) DEFAULT NULL,
  "doc_provider_signed_ip_address" varchar(150) DEFAULT NULL,
  "doc_provider_signed_status" varchar(50) DEFAULT '',
  "doc_signed_userid" int DEFAULT NULL,
  "doc_signed_date" TIMESTAMP DEFAULT NULL,
  "doc_signed_first_name" varchar(150) DEFAULT NULL,
  "doc_signed_last_name" varchar(150) DEFAULT NULL,
  "doc_signed_signature_directory" varchar(150) DEFAULT NULL,
  "doc_signed_signature_filename" varchar(150) DEFAULT NULL,
  "doc_signed_status" varchar(50) DEFAULT '',
  "doc_signed_ip_address" varchar(150) DEFAULT NULL,
  "doc_fallback_client_first_name" varchar(150) DEFAULT NULL,
  "doc_fallback_client_last_name" varchar(150) DEFAULT NULL,
  "doc_fallback_client_email" varchar(150) DEFAULT NULL,
  "doc_status" varchar(100) DEFAULT 'draft',
  "docresource_type" varchar(100) DEFAULT NULL,
  "docresource_id" int DEFAULT NULL,
  "doc_publishing_type" varchar(20) DEFAULT 'instant',
  "doc_publishing_scheduled_date" TIMESTAMP DEFAULT NULL,
  "doc_publishing_scheduled_status" text,
  "doc_publishing_scheduled_log" text,
  "contract_mapping_type" text,
  "contract_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("doc_id")
);

--
-- Dumping data for table "contracts"
--


--
-- Table structure for table "cs_affiliate_earnings"
--

DROP TABLE IF EXISTS "cs_affiliate_earnings";
CREATE TABLE "cs_affiliate_earnings" (
  "cs_affiliate_earning_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "cs_affiliate_earning_created" TIMESTAMP NOT NULL,
  "cs_affiliate_earning_updated" TIMESTAMP NOT NULL,
  "cs_affiliate_earning_projectid" int NOT NULL,
  "cs_affiliate_earning_invoiceid" int NOT NULL,
  "cs_affiliate_earning_invoice_payment_date" TIMESTAMP DEFAULT NULL,
  "cs_affiliate_earning_commission_approval_date" TIMESTAMP DEFAULT NULL,
  "cs_affiliate_earning_affiliateid" int NOT NULL,
  "cs_affiliate_earning_amount" decimal(10,2) NOT NULL,
  "cs_affiliate_earning_commission_rate" decimal(10,2) NOT NULL DEFAULT '0.00',
  "cs_affiliate_earning_status" varchar(30) NOT NULL DEFAULT 'pending',
  PRIMARY KEY ("cs_affiliate_earning_id")
);

--
-- Dumping data for table "cs_affiliate_earnings"
--


--
-- Table structure for table "cs_affiliate_projects"
--

DROP TABLE IF EXISTS "cs_affiliate_projects";
CREATE TABLE "cs_affiliate_projects" (
  "cs_affiliate_project_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "cs_affiliate_project_created" int NOT NULL,
  "cs_affiliate_project_updated" int NOT NULL,
  "cs_affiliate_project_creatorid" int NOT NULL,
  "cs_affiliate_project_affiliateid" int NOT NULL,
  "cs_affiliate_project_projectid" int NOT NULL,
  "cs_affiliate_project_commission_rate" decimal(10,2) DEFAULT NULL,
  "cs_affiliate_project_status" varchar(100) DEFAULT 'active',
  PRIMARY KEY ("cs_affiliate_project_id")
);

--
-- Dumping data for table "cs_affiliate_projects"
--


--
-- Table structure for table "cs_events"
--

DROP TABLE IF EXISTS "cs_events";
CREATE TABLE "cs_events" (
  "cs_event_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "cs_event_created" date NOT NULL,
  "cs_event_updated" date NOT NULL,
  "cs_event_affliateid" int NOT NULL,
  "cs_event_invoiceid" int NOT NULL,
  "cs_event_project_title" varchar(250) DEFAULT NULL,
  "cs_event_amount" decimal(10,2) NOT NULL,
  PRIMARY KEY ("cs_event_id")
);

--
-- Dumping data for table "cs_events"
--


--
-- Table structure for table "currencies"
--

DROP TABLE IF EXISTS "currencies";
CREATE TABLE "currencies" (
  "currency_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "currency_created" TIMESTAMP NOT NULL,
  "currency_update" TIMESTAMP NOT NULL,
  "currency_code" varchar(50) NOT NULL,
  "currency_decimal_separator" varchar(50) NOT NULL,
  "currency_thousands_separator" varchar(50) NOT NULL,
  "currency_symbol" varchar(50) NOT NULL,
  "currency_symbol_position" varchar(50) NOT NULL,
  PRIMARY KEY ("currency_id")
);

--
-- Dumping data for table "currencies"
--


--
-- Table structure for table "customfields"
--

DROP TABLE IF EXISTS "customfields";
CREATE TABLE "customfields" (
  "customfields_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "customfields_created" TIMESTAMP NOT NULL,
  "customfields_updated" TIMESTAMP NOT NULL,
  "customfields_position" int NOT NULL DEFAULT '1',
  "customfields_datatype" varchar(50) DEFAULT 'text',
  "customfields_datapayload" text,
  "customfields_type" varchar(50) DEFAULT NULL,
  "customfields_name" varchar(250) DEFAULT NULL,
  "customfields_title" varchar(250) DEFAULT NULL,
  "customfields_required" varchar(5) DEFAULT 'no',
  "customfields_show_client_page" varchar(100) DEFAULT NULL,
  "customfields_show_project_page" varchar(100) DEFAULT NULL,
  "customfields_show_task_summary" varchar(100) DEFAULT NULL,
  "customfields_show_lead_summary" varchar(100) DEFAULT NULL,
  "customfields_show_invoice" varchar(100) DEFAULT NULL,
  "customfields_show_ticket_page" varchar(100) DEFAULT 'no',
  "customfields_show_filter_panel" varchar(100) DEFAULT 'no',
  "customfields_standard_form_status" varchar(100) DEFAULT 'disabled',
  "customfields_status" varchar(50) DEFAULT 'disabled',
  "customfields_sorting_a_z" varchar(5) DEFAULT 'z',
  PRIMARY KEY ("customfields_id")
);

--
-- Dumping data for table "customfields"
--


--
-- Table structure for table "email_log"
--

DROP TABLE IF EXISTS "email_log";
CREATE TABLE "email_log" (
  "emaillog_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "emaillog_created" TIMESTAMP DEFAULT NULL,
  "emaillog_updated" TIMESTAMP DEFAULT NULL,
  "emaillog_email" varchar(100) DEFAULT NULL,
  "emaillog_subject" varchar(200) DEFAULT NULL,
  "emaillog_body" text,
  "emaillog_attachment" varchar(250) DEFAULT 'attached file name',
  PRIMARY KEY ("emaillog_id")
);

--
-- Dumping data for table "email_log"
--


--
-- Table structure for table "email_queue"
--

DROP TABLE IF EXISTS "email_queue";
CREATE TABLE "email_queue" (
  "emailqueue_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "emailqueue_created" TIMESTAMP NOT NULL,
  "emailqueue_updated" TIMESTAMP NOT NULL,
  "emailqueue_to" varchar(150) DEFAULT NULL,
  "emailqueue_from_email" varchar(150) DEFAULT NULL,
  "emailqueue_from_name" varchar(150) DEFAULT NULL,
  "emailqueue_subject" varchar(250) DEFAULT NULL,
  "emailqueue_message" text,
  "emailqueue_type" varchar(150) DEFAULT 'general',
  "emailqueue_attachments" text,
  "emailqueue_resourcetype" varchar(50) DEFAULT NULL,
  "emailqueue_resourceid" int DEFAULT NULL,
  "emailqueue_pdf_resource_type" varchar(50) DEFAULT NULL,
  "emailqueue_pdf_resource_id" int DEFAULT NULL,
  "emailqueue_started_at" TIMESTAMP DEFAULT NULL,
  "emailqueue_status" varchar(20) DEFAULT 'new',
  "emailqueue_attempts" int DEFAULT '0',
  "emailqueue_notes" text,
  PRIMARY KEY ("emailqueue_id")
);

--
-- Dumping data for table "email_queue"
--


--
-- Table structure for table "email_templates"
--

DROP TABLE IF EXISTS "email_templates";
CREATE TABLE "email_templates" (
  "emailtemplate_module_unique_id" varchar(250) DEFAULT NULL,
  "emailtemplate_module_name" varchar(250) DEFAULT NULL,
  "emailtemplate_name" varchar(100) DEFAULT NULL,
  "emailtemplate_lang" varchar(250) DEFAULT NULL,
  "emailtemplate_type" varchar(30) DEFAULT NULL,
  "emailtemplate_category" varchar(30) DEFAULT NULL,
  "emailtemplate_subject" varchar(250) DEFAULT NULL,
  "emailtemplate_body" text,
  "emailtemplate_variables" text,
  "emailtemplate_created" TIMESTAMP DEFAULT NULL,
  "emailtemplate_updated" TIMESTAMP DEFAULT NULL,
  "emailtemplate_status" varchar(20) DEFAULT 'enabled',
  "emailtemplate_language" varchar(50) DEFAULT NULL,
  "emailtemplate_real_template" varchar(50) DEFAULT 'yes',
  "emailtemplate_show_enabled" varchar(50) DEFAULT 'yes',
  "emailtemplate_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY ("emailtemplate_id")
);

--
-- Dumping data for table "email_templates"
--


--
-- Table structure for table "estimates"
--

DROP TABLE IF EXISTS "estimates";
CREATE TABLE "estimates" (
  "bill_estimateid" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "bill_uniqueid" varchar(100) DEFAULT NULL,
  "bill_created" TIMESTAMP DEFAULT NULL,
  "bill_updated" TIMESTAMP DEFAULT NULL,
  "bill_date_sent_to_customer" TIMESTAMP DEFAULT NULL,
  "bill_date_status_change" TIMESTAMP DEFAULT NULL,
  "bill_clientid" int DEFAULT NULL,
  "bill_projectid" int DEFAULT NULL,
  "bill_proposalid" int DEFAULT NULL,
  "bill_contractid" int DEFAULT NULL,
  "bill_creatorid" int NOT NULL,
  "bill_categoryid" int NOT NULL DEFAULT '4',
  "bill_date" date NOT NULL,
  "bill_expiry_date" date DEFAULT NULL,
  "bill_subtotal" decimal(15,2) NOT NULL DEFAULT '0.00',
  "bill_discount_type" varchar(30) DEFAULT 'none',
  "bill_discount_percentage" decimal(15,2) DEFAULT '0.00',
  "bill_discount_amount" decimal(15,2) DEFAULT '0.00',
  "bill_amount_before_tax" decimal(15,2) DEFAULT '0.00',
  "bill_tax_type" varchar(20) DEFAULT 'summary',
  "bill_tax_total_percentage" decimal(15,2) DEFAULT '0.00',
  "bill_tax_total_amount" decimal(15,2) DEFAULT '0.00',
  "bill_adjustment_description" varchar(250) DEFAULT NULL,
  "bill_adjustment_amount" decimal(15,2) DEFAULT '0.00',
  "bill_final_amount" decimal(15,2) DEFAULT '0.00',
  "bill_notes" text,
  "bill_terms" text,
  "bill_status" varchar(50) NOT NULL DEFAULT 'draft',
  "bill_type" varchar(150) NOT NULL DEFAULT 'estimate',
  "bill_estimate_type" varchar(150) NOT NULL DEFAULT 'estimate',
  "bill_visibility" varchar(150) NOT NULL DEFAULT 'visible',
  "bill_viewed_by_client" varchar(20) DEFAULT 'no',
  "bill_system" varchar(20) DEFAULT 'no',
  "bill_converted_to_invoice" varchar(20) DEFAULT 'no',
  "bill_converted_to_invoice_invoiceid" int DEFAULT NULL,
  "estimate_automation_status" varchar(100) DEFAULT 'disabled',
  "estimate_automation_create_project" varchar(50) DEFAULT 'no',
  "estimate_automation_project_title" varchar(250) DEFAULT NULL,
  "estimate_automation_project_status" varchar(100) DEFAULT 'in_progress',
  "estimate_automation_create_tasks" varchar(50) DEFAULT 'no',
  "estimate_automation_project_email_client" varchar(50) DEFAULT 'no',
  "estimate_automation_create_invoice" varchar(50) DEFAULT 'no',
  "estimate_automation_invoice_due_date" int DEFAULT '7',
  "estimate_automation_invoice_email_client" varchar(50) DEFAULT 'no',
  "estimate_automation_copy_attachments" varchar(50) DEFAULT 'no',
  "estimate_automation_log_created_project_id" int DEFAULT NULL,
  "estimate_automation_log_created_invoice_id" int DEFAULT NULL,
  "bill_publishing_type" varchar(20) DEFAULT 'instant',
  "bill_publishing_scheduled_date" date DEFAULT NULL,
  "bill_publishing_scheduled_status" varchar(20) DEFAULT NULL,
  "bill_publishing_scheduled_log" text,
  "billresource_type" text,
  "billresource_id" int DEFAULT NULL,
  "estimate_mapping_type" text,
  "estimate_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("bill_estimateid")
);

--
-- Dumping data for table "estimates"
--


--
-- Table structure for table "events"
--

DROP TABLE IF EXISTS "events";
CREATE TABLE "events" (
  "event_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "event_created" TIMESTAMP DEFAULT NULL,
  "event_updated" TIMESTAMP DEFAULT NULL,
  "event_creatorid" int NOT NULL,
  "event_clientid" int DEFAULT NULL,
  "event_creator_name" varchar(150) DEFAULT NULL,
  "event_item" varchar(150) DEFAULT NULL,
  "event_item_id" int DEFAULT NULL,
  "event_item_content" text,
  "event_item_content2" text,
  "event_item_content3" text,
  "event_item_content4" text,
  "event_item_lang" varchar(150) DEFAULT NULL,
  "event_item_lang_alt" varchar(150) DEFAULT NULL,
  "event_parent_type" varchar(150) DEFAULT NULL,
  "event_parent_id" varchar(150) DEFAULT NULL,
  "event_parent_title" varchar(150) DEFAULT NULL,
  "event_show_item" varchar(150) DEFAULT 'yes',
  "event_show_in_timeline" varchar(150) DEFAULT 'yes',
  "event_notification_category" varchar(150) DEFAULT NULL,
  "eventresource_type" varchar(50) DEFAULT NULL,
  "eventresource_id" int DEFAULT NULL,
  PRIMARY KEY ("event_id")
);

--
-- Dumping data for table "events"
--


--
-- Table structure for table "events_tracking"
--

DROP TABLE IF EXISTS "events_tracking";
CREATE TABLE "events_tracking" (
  "eventtracking_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "eventtracking_created" TIMESTAMP NOT NULL,
  "eventtracking_updated" TIMESTAMP NOT NULL,
  "eventtracking_eventid" int NOT NULL,
  "eventtracking_userid" int NOT NULL,
  "eventtracking_status" varchar(30) DEFAULT 'unread',
  "eventtracking_email" varchar(50) DEFAULT 'no',
  "eventtracking_source" varchar(50) DEFAULT NULL,
  "eventtracking_source_id" varchar(50) DEFAULT NULL,
  "parent_type" varchar(50) DEFAULT NULL,
  "parent_id" int DEFAULT NULL,
  "resource_type" varchar(50) DEFAULT NULL,
  "resource_id" int DEFAULT NULL,
  PRIMARY KEY ("eventtracking_id")
);

--
-- Dumping data for table "events_tracking"
--


--
-- Table structure for table "expenses"
--

DROP TABLE IF EXISTS "expenses";
CREATE TABLE "expenses" (
  "expense_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "expense_importid" varchar(100) DEFAULT NULL,
  "expense_created" date DEFAULT NULL,
  "expense_updated" date DEFAULT NULL,
  "expense_date" date DEFAULT NULL,
  "expense_clientid" int DEFAULT NULL,
  "expense_projectid" int DEFAULT NULL,
  "expense_creatorid" int NOT NULL,
  "expense_categoryid" int NOT NULL DEFAULT '7',
  "expense_amount" decimal(10,2) NOT NULL,
  "expense_description" text,
  "expense_type" text,
  "expense_billable" varchar(30) DEFAULT 'not_billable',
  "expense_billing_status" varchar(30) DEFAULT 'not_invoiced',
  "expense_billable_invoiceid" int DEFAULT NULL,
  "expense_recurring" varchar(5) DEFAULT 'no',
  "expense_recurring_duration" int DEFAULT NULL,
  "expense_recurring_period" varchar(30) DEFAULT NULL,
  "expense_recurring_cycles" int DEFAULT NULL,
  "expense_recurring_cycles_counter" int DEFAULT '0',
  "expense_recurring_last" TIMESTAMP DEFAULT NULL,
  "expense_recurring_next" TIMESTAMP DEFAULT NULL,
  "expense_recurring_child" varchar(5) DEFAULT 'no',
  "expense_recurring_parent_id" int DEFAULT NULL,
  "expense_cron_status" varchar(20) DEFAULT 'none',
  "expenseresource_type" text,
  "expenseresource_id" int DEFAULT NULL,
  "expense_mapping_type" text,
  "expense_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("expense_id")
);

--
-- Dumping data for table "expenses"
--


--
-- Table structure for table "failed_jobs"
--

DROP TABLE IF EXISTS "failed_jobs";
CREATE TABLE "failed_jobs" (
  "id" bigint  NOT NULL GENERATED ALWAYS AS IDENTITY,
  "connection" text NOT NULL,
  "queue" text NOT NULL,
  "payload" TEXT NOT NULL,
  "exception" TEXT NOT NULL,
  "failed_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table "failed_jobs"
--


--
-- Table structure for table "file_folders"
--

DROP TABLE IF EXISTS "file_folders";
CREATE TABLE "file_folders" (
  "filefolder_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "filefolder_created" TIMESTAMP NOT NULL,
  "filefolder_updated" TIMESTAMP NOT NULL,
  "filefolder_creatorid" int DEFAULT NULL,
  "filefolder_projectid" int DEFAULT NULL,
  "filefolder_name" varchar(250) DEFAULT NULL,
  "filefolder_default" varchar(100) DEFAULT 'no',
  "filefolder_system" varchar(100) DEFAULT 'no',
  PRIMARY KEY ("filefolder_id")
);

--
-- Dumping data for table "file_folders"
--


--
-- Table structure for table "files"
--

DROP TABLE IF EXISTS "files";
CREATE TABLE "files" (
  "file_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "file_uniqueid" varchar(100) DEFAULT NULL,
  "file_upload_unique_key" varchar(100) DEFAULT NULL,
  "file_created" TIMESTAMP DEFAULT NULL,
  "file_updated" TIMESTAMP DEFAULT NULL,
  "file_creatorid" int DEFAULT NULL,
  "file_clientid" int DEFAULT NULL,
  "file_folderid" int DEFAULT NULL,
  "file_filename" varchar(250) DEFAULT NULL,
  "file_directory" varchar(100) DEFAULT NULL,
  "file_extension" varchar(10) DEFAULT NULL,
  "file_size" varchar(40) DEFAULT NULL,
  "file_type" varchar(20) DEFAULT NULL,
  "file_thumbname" varchar(250) DEFAULT NULL,
  "file_visibility_client" varchar(5) DEFAULT 'yes',
  "file_mapping_type" text,
  "file_mapping_id" int DEFAULT NULL,
  "fileresource_type" varchar(50) DEFAULT NULL,
  "fileresource_id" int DEFAULT NULL,
  PRIMARY KEY ("file_id")
);

--
-- Dumping data for table "files"
--


--
-- Table structure for table "imaplog"
--

DROP TABLE IF EXISTS "imaplog";
CREATE TABLE "imaplog" (
  "imaplog_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "imaplog_created" TIMESTAMP NOT NULL,
  "imaplog_updated" TIMESTAMP NOT NULL,
  "imaplog_categoryid" int NOT NULL,
  "imaplog_to_email" text NOT NULL,
  "imaplog_from_email" text,
  "imaplog_from_name" text,
  "imaplog_subject" text,
  "imaplog_email_uid" text,
  "imaplog_mailbox_id" int DEFAULT NULL,
  "imaplog_body" text,
  "imaplog_attachments_count" int DEFAULT NULL,
  "imaplog_header_in_reply_to" text,
  "imaplog_payload_header" text,
  PRIMARY KEY ("imaplog_id")
);

--
-- Dumping data for table "imaplog"
--


--
-- Table structure for table "invoices"
--

DROP TABLE IF EXISTS "invoices";
CREATE TABLE "invoices" (
  "bill_invoiceid" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "bill_uniqueid" varchar(100) DEFAULT NULL,
  "bill_created" TIMESTAMP DEFAULT NULL,
  "bill_updated" TIMESTAMP DEFAULT NULL,
  "bill_date_sent_to_customer" date DEFAULT NULL,
  "bill_date_status_change" TIMESTAMP DEFAULT NULL,
  "bill_clientid" int NOT NULL,
  "bill_projectid" int DEFAULT NULL,
  "bill_subscriptionid" int DEFAULT NULL,
  "bill_creatorid" int NOT NULL,
  "bill_categoryid" int NOT NULL DEFAULT '4',
  "bill_date" date NOT NULL,
  "bill_due_date" date DEFAULT NULL,
  "bill_subtotal" decimal(15,2) NOT NULL DEFAULT '0.00',
  "bill_discount_type" varchar(30) DEFAULT 'none',
  "bill_discount_percentage" decimal(15,2) DEFAULT '0.00',
  "bill_discount_amount" decimal(15,2) DEFAULT '0.00',
  "bill_amount_before_tax" decimal(15,2) DEFAULT '0.00',
  "bill_tax_type" varchar(20) DEFAULT 'summary',
  "bill_tax_total_percentage" decimal(15,2) DEFAULT '0.00',
  "bill_tax_total_amount" decimal(15,2) DEFAULT '0.00',
  "bill_adjustment_description" varchar(250) DEFAULT NULL,
  "bill_adjustment_amount" decimal(15,2) DEFAULT '0.00',
  "bill_final_amount" decimal(15,2) DEFAULT '0.00',
  "bill_notes" text,
  "bill_terms" text,
  "bill_status" varchar(50) NOT NULL DEFAULT 'draft',
  "bill_recurring" varchar(50) DEFAULT 'no',
  "bill_recurring_duration" int DEFAULT NULL,
  "bill_recurring_period" varchar(30) DEFAULT NULL,
  "bill_recurring_cycles" int DEFAULT NULL,
  "bill_recurring_cycles_counter" int DEFAULT NULL,
  "bill_recurring_last" date DEFAULT NULL,
  "bill_recurring_next" date DEFAULT NULL,
  "bill_recurring_child" varchar(5) DEFAULT 'no',
  "bill_recurring_parent_id" int DEFAULT NULL,
  "bill_overdue_reminder_sent" varchar(5) DEFAULT 'no',
  "bill_overdue_reminder_last_sent" TIMESTAMP DEFAULT NULL,
  "bill_overdue_reminder_counter" int DEFAULT '0',
  "bill_invoice_type" varchar(30) DEFAULT 'onetime',
  "bill_type" varchar(20) DEFAULT 'invoice',
  "bill_visibility" varchar(20) DEFAULT 'visible',
  "bill_cron_status" varchar(20) DEFAULT 'none',
  "bill_cron_date" TIMESTAMP DEFAULT NULL,
  "bill_viewed_by_client" varchar(20) DEFAULT 'no',
  "bill_system" varchar(20) DEFAULT 'no',
  "bill_publishing_type" varchar(20) DEFAULT 'instant',
  "bill_publishing_scheduled_date" date DEFAULT NULL,
  "bill_publishing_scheduled_status" varchar(20) DEFAULT NULL,
  "bill_publishing_scheduled_log" text,
  "billresource_type" text,
  "billresource_id" int DEFAULT NULL,
  "invoice_mapping_type" text,
  "invoice_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("bill_invoiceid")
);

--
-- Dumping data for table "invoices"
--


--
-- Table structure for table "items"
--

DROP TABLE IF EXISTS "items";
CREATE TABLE "items" (
  "item_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "item_created" TIMESTAMP DEFAULT NULL,
  "item_updated" TIMESTAMP DEFAULT NULL,
  "item_categoryid" int NOT NULL DEFAULT '8',
  "item_creatorid" int NOT NULL,
  "item_type" varchar(100) NOT NULL DEFAULT 'standard',
  "item_description" text,
  "item_unit" varchar(50) DEFAULT NULL,
  "item_rate" decimal(15,2) NOT NULL,
  "item_tax_status" varchar(100) NOT NULL DEFAULT 'taxable',
  "item_dimensions_length" decimal(15,2) DEFAULT NULL,
  "item_dimensions_width" decimal(15,2) DEFAULT NULL,
  "item_notes_estimatation" text,
  "item_notes_production" text,
  "itemresource_type" text,
  "itemresource_id" int DEFAULT NULL,
  "item_mapping_type" text,
  "item_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("item_id")
);

--
-- Dumping data for table "items"
--


--
-- Table structure for table "jobs"
--

DROP TABLE IF EXISTS "jobs";
CREATE TABLE "jobs" (
  "id" bigint  NOT NULL GENERATED ALWAYS AS IDENTITY,
  "queue" varchar(255) NOT NULL,
  "payload" TEXT NOT NULL,
  "attempts" SMALLINT  NOT NULL,
  "reserved_at" int  DEFAULT NULL,
  "available_at" int  NOT NULL,
  "created_at" int  NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table "jobs"
--


--
-- Table structure for table "kb_categories"
--

DROP TABLE IF EXISTS "kb_categories";
CREATE TABLE "kb_categories" (
  "kbcategory_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "kbcategory_created" TIMESTAMP NOT NULL,
  "kbcategory_updated" TIMESTAMP NOT NULL,
  "kbcategory_creatorid" int NOT NULL,
  "kbcategory_title" varchar(250) NOT NULL,
  "kbcategory_description" text,
  "kbcategory_position" int DEFAULT NULL,
  "kbcategory_visibility" varchar(50) DEFAULT 'everyone',
  "kbcategory_slug" varchar(250) DEFAULT NULL,
  "kbcategory_icon" varchar(250) DEFAULT NULL,
  "kbcategory_type" varchar(50) DEFAULT 'text',
  "kbcategory_system_default" varchar(250) DEFAULT 'no',
  PRIMARY KEY ("kbcategory_id")
);

--
-- Dumping data for table "kb_categories"
--


--
-- Table structure for table "knowledgebase"
--

DROP TABLE IF EXISTS "knowledgebase";
CREATE TABLE "knowledgebase" (
  "knowledgebase_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "knowledgebase_created" TIMESTAMP NOT NULL,
  "knowledgebase_updated" TIMESTAMP NOT NULL,
  "knowledgebase_creatorid" int NOT NULL,
  "knowledgebase_categoryid" int NOT NULL,
  "knowledgebase_title" varchar(250) NOT NULL,
  "knowledgebase_slug" varchar(250) DEFAULT NULL,
  "knowledgebase_text" text,
  "knowledgebase_embed_video_id" varchar(50) DEFAULT NULL,
  "knowledgebase_embed_code" text,
  "knowledgebase_embed_thumb" varchar(150) DEFAULT NULL,
  PRIMARY KEY ("knowledgebase_id")
);

--
-- Dumping data for table "knowledgebase"
--


--
-- Table structure for table "leads"
--

DROP TABLE IF EXISTS "leads";
CREATE TABLE "leads" (
  "lead_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "lead_uniqueid" varchar(100) DEFAULT NULL,
  "lead_importid" varchar(100) DEFAULT NULL,
  "lead_position" DOUBLE PRECISION NOT NULL,
  "lead_created" TIMESTAMP DEFAULT NULL,
  "lead_updated" TIMESTAMP DEFAULT NULL,
  "lead_date_status_change" TIMESTAMP DEFAULT NULL,
  "lead_creatorid" int DEFAULT NULL,
  "lead_updatorid" int DEFAULT NULL,
  "lead_categoryid" int DEFAULT '3',
  "lead_firstname" varchar(100) DEFAULT NULL,
  "lead_lastname" varchar(100) DEFAULT NULL,
  "lead_email" varchar(150) DEFAULT NULL,
  "lead_phone" varchar(150) DEFAULT NULL,
  "lead_job_position" varchar(150) DEFAULT NULL,
  "lead_company_name" varchar(150) DEFAULT NULL,
  "lead_website" varchar(150) DEFAULT NULL,
  "lead_street" varchar(150) DEFAULT NULL,
  "lead_city" varchar(150) DEFAULT NULL,
  "lead_state" varchar(150) DEFAULT NULL,
  "lead_zip" varchar(150) DEFAULT NULL,
  "lead_country" varchar(150) DEFAULT NULL,
  "lead_source" varchar(150) DEFAULT NULL,
  "lead_input_source" varchar(20) DEFAULT 'app',
  "lead_input_ip_address" text,
  "lead_title" varchar(250) DEFAULT NULL,
  "lead_description" text,
  "lead_value" decimal(10,2) DEFAULT NULL,
  "lead_last_contacted" date DEFAULT NULL,
  "lead_converted" varchar(10) DEFAULT 'no',
  "lead_converted_by_userid" int DEFAULT NULL,
  "lead_converted_date" TIMESTAMP DEFAULT NULL,
  "lead_converted_clientid" int DEFAULT NULL,
  "lead_status" SMALLINT DEFAULT '1',
  "lead_active_state" varchar(10) DEFAULT 'active',
  "lead_visibility" varchar(40) DEFAULT 'visible',
  "lead_cover_image" varchar(10) DEFAULT 'no',
  "lead_cover_image_uniqueid" text,
  "lead_cover_image_filename" text,
  "lead_custom_field_1" TEXT,
  "lead_custom_field_2" TEXT,
  "lead_custom_field_3" TEXT,
  "lead_custom_field_4" TEXT,
  "lead_custom_field_5" TEXT,
  "lead_custom_field_6" TEXT,
  "lead_custom_field_7" TEXT,
  "lead_custom_field_8" TEXT,
  "lead_custom_field_9" TEXT,
  "lead_custom_field_10" TEXT,
  "lead_custom_field_11" TEXT,
  "lead_custom_field_12" TEXT,
  "lead_custom_field_13" TEXT,
  "lead_custom_field_14" TEXT,
  "lead_custom_field_15" TEXT,
  "lead_custom_field_16" TEXT,
  "lead_custom_field_17" TEXT,
  "lead_custom_field_18" TEXT,
  "lead_custom_field_19" TEXT,
  "lead_custom_field_20" TEXT,
  "lead_custom_field_21" TEXT,
  "lead_custom_field_22" TEXT,
  "lead_custom_field_23" TEXT,
  "lead_custom_field_24" TEXT,
  "lead_custom_field_25" TEXT,
  "lead_custom_field_26" TEXT,
  "lead_custom_field_27" TEXT,
  "lead_custom_field_28" TEXT,
  "lead_custom_field_29" TEXT,
  "lead_custom_field_30" TEXT,
  "lead_custom_field_31" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_32" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_33" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_34" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_35" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_36" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_37" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_38" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_39" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_40" TIMESTAMP DEFAULT NULL,
  "lead_custom_field_41" text,
  "lead_custom_field_42" text,
  "lead_custom_field_43" text,
  "lead_custom_field_44" text,
  "lead_custom_field_45" text,
  "lead_custom_field_46" text,
  "lead_custom_field_47" text,
  "lead_custom_field_48" text,
  "lead_custom_field_49" text,
  "lead_custom_field_50" text,
  "lead_custom_field_51" text,
  "lead_custom_field_52" text,
  "lead_custom_field_53" text,
  "lead_custom_field_54" text,
  "lead_custom_field_55" text,
  "lead_custom_field_56" text,
  "lead_custom_field_57" text,
  "lead_custom_field_58" text,
  "lead_custom_field_59" text,
  "lead_custom_field_60" text,
  "lead_custom_field_61" text,
  "lead_custom_field_62" text,
  "lead_custom_field_63" text,
  "lead_custom_field_64" text,
  "lead_custom_field_65" text,
  "lead_custom_field_66" text,
  "lead_custom_field_67" text,
  "lead_custom_field_68" text,
  "lead_custom_field_69" text,
  "lead_custom_field_70" text,
  "lead_custom_field_71" text,
  "lead_custom_field_72" text,
  "lead_custom_field_73" text,
  "lead_custom_field_74" text,
  "lead_custom_field_75" text,
  "lead_custom_field_76" text,
  "lead_custom_field_77" text,
  "lead_custom_field_78" text,
  "lead_custom_field_79" text,
  "lead_custom_field_80" text,
  "lead_custom_field_81" text,
  "lead_custom_field_82" text,
  "lead_custom_field_83" text,
  "lead_custom_field_84" text,
  "lead_custom_field_85" text,
  "lead_custom_field_86" text,
  "lead_custom_field_87" text,
  "lead_custom_field_88" text,
  "lead_custom_field_89" text,
  "lead_custom_field_90" text,
  "lead_custom_field_91" text,
  "lead_custom_field_92" text,
  "lead_custom_field_93" text,
  "lead_custom_field_94" text,
  "lead_custom_field_95" text,
  "lead_custom_field_96" text,
  "lead_custom_field_97" text,
  "lead_custom_field_98" text,
  "lead_custom_field_99" text,
  "lead_custom_field_100" text,
  "lead_custom_field_101" text,
  "lead_custom_field_102" text,
  "lead_custom_field_103" text,
  "lead_custom_field_104" text,
  "lead_custom_field_105" text,
  "lead_custom_field_106" text,
  "lead_custom_field_107" text,
  "lead_custom_field_108" text,
  "lead_custom_field_109" text,
  "lead_custom_field_110" text,
  "lead_custom_field_111" int DEFAULT NULL,
  "lead_custom_field_112" int DEFAULT NULL,
  "lead_custom_field_113" int DEFAULT NULL,
  "lead_custom_field_114" int DEFAULT NULL,
  "lead_custom_field_115" int DEFAULT NULL,
  "lead_custom_field_116" int DEFAULT NULL,
  "lead_custom_field_117" int DEFAULT NULL,
  "lead_custom_field_118" int DEFAULT NULL,
  "lead_custom_field_119" int DEFAULT NULL,
  "lead_custom_field_120" int DEFAULT NULL,
  "lead_custom_field_121" int DEFAULT NULL,
  "lead_custom_field_122" int DEFAULT NULL,
  "lead_custom_field_123" int DEFAULT NULL,
  "lead_custom_field_124" int DEFAULT NULL,
  "lead_custom_field_125" int DEFAULT NULL,
  "lead_custom_field_126" int DEFAULT NULL,
  "lead_custom_field_127" int DEFAULT NULL,
  "lead_custom_field_128" int DEFAULT NULL,
  "lead_custom_field_129" int DEFAULT NULL,
  "lead_custom_field_130" int DEFAULT NULL,
  "lead_custom_field_131" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_132" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_133" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_134" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_135" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_136" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_137" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_138" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_139" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_140" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_141" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_142" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_143" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_144" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_145" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_146" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_147" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_148" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_149" decimal(10,2) DEFAULT NULL,
  "lead_custom_field_150" decimal(10,2) DEFAULT NULL,
  "leadresource_type" text,
  "leadresource_id" int DEFAULT NULL,
  "lead_mapping_type" text,
  "lead_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("lead_id")
);

--
-- Dumping data for table "leads"
--


--
-- Table structure for table "leads_assigned"
--

DROP TABLE IF EXISTS "leads_assigned";
CREATE TABLE "leads_assigned" (
  "leadsassigned_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "leadsassigned_leadid" int DEFAULT NULL,
  "leadsassigned_userid" int DEFAULT NULL,
  "leadsassigned_created" TIMESTAMP NOT NULL,
  "leadsassigned_updated" TIMESTAMP NOT NULL,
  PRIMARY KEY ("leadsassigned_id")
);

--
-- Dumping data for table "leads_assigned"
--


--
-- Table structure for table "leads_sources"
--

DROP TABLE IF EXISTS "leads_sources";
CREATE TABLE "leads_sources" (
  "leadsources_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "leadsources_created" TIMESTAMP NOT NULL,
  "leadsources_updated" TIMESTAMP NOT NULL,
  "leadsources_creatorid" int NOT NULL,
  "leadsources_title" varchar(200) NOT NULL,
  PRIMARY KEY ("leadsources_id")
);

--
-- Dumping data for table "leads_sources"
--


--
-- Table structure for table "leads_status"
--

DROP TABLE IF EXISTS "leads_status";
CREATE TABLE "leads_status" (
  "leadstatus_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "leadstatus_created" TIMESTAMP DEFAULT NULL,
  "leadstatus_creatorid" int DEFAULT NULL,
  "leadstatus_updated" TIMESTAMP DEFAULT NULL,
  "leadstatus_title" varchar(200) NOT NULL,
  "leadstatus_position" int NOT NULL,
  "leadstatus_color" varchar(100) NOT NULL DEFAULT 'default',
  "leadstatus_system_default" varchar(10) NOT NULL DEFAULT 'no',
  PRIMARY KEY ("leadstatus_id")
);

--
-- Dumping data for table "leads_status"
--


--
-- Table structure for table "lineitems"
--

DROP TABLE IF EXISTS "lineitems";
CREATE TABLE "lineitems" (
  "lineitem_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "lineitem_position" int DEFAULT NULL,
  "lineitem_created" TIMESTAMP DEFAULT NULL,
  "lineitem_updated" TIMESTAMP DEFAULT NULL,
  "lineitem_description" text,
  "lineitem_rate" varchar(250) DEFAULT NULL,
  "lineitem_unit" varchar(100) DEFAULT NULL,
  "lineitem_quantity" float DEFAULT NULL,
  "lineitem_total" decimal(15,2) DEFAULT NULL,
  "lineitemresource_linked_type" varchar(30) DEFAULT NULL,
  "lineitemresource_linked_id" int DEFAULT NULL,
  "lineitemresource_type" varchar(50) DEFAULT NULL,
  "lineitemresource_id" int DEFAULT NULL,
  "lineitem_type" varchar(10) DEFAULT 'plain',
  "lineitem_time_hours" int DEFAULT NULL,
  "lineitem_time_minutes" int DEFAULT NULL,
  "lineitem_time_timers_list" text,
  "lineitem_dimensions_length" float DEFAULT NULL,
  "lineitem_dimensions_width" float DEFAULT NULL,
  "lineitem_tax_status" varchar(100) DEFAULT 'taxable',
  "lineitem_linked_product_id" int DEFAULT NULL,
  PRIMARY KEY ("lineitem_id")
);

--
-- Dumping data for table "lineitems"
--


--
-- Table structure for table "logs"
--

DROP TABLE IF EXISTS "logs";
CREATE TABLE "logs" (
  "log_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "log_uniqueid" varchar(100) DEFAULT NULL,
  "log_created" TIMESTAMP NOT NULL,
  "log_updated" TIMESTAMP NOT NULL,
  "log_creatorid" int DEFAULT NULL,
  "log_text" text,
  "log_text_type" varchar(20) DEFAULT 'text',
  "log_data_1" varchar(250) DEFAULT NULL,
  "log_data_2" varchar(250) DEFAULT NULL,
  "log_data_3" varchar(250) DEFAULT NULL,
  "log_payload" text,
  "logresource_type" varchar(60) DEFAULT NULL,
  "logresource_id" int DEFAULT NULL,
  PRIMARY KEY ("log_id")
);

--
-- Dumping data for table "logs"
--


--
-- Table structure for table "messages"
--

DROP TABLE IF EXISTS "messages";
CREATE TABLE "messages" (
  "message_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "message_unique_id" varchar(100) NOT NULL,
  "message_created" TIMESTAMP NOT NULL,
  "message_updated" TIMESTAMP NOT NULL,
  "message_timestamp" int NOT NULL,
  "message_creatorid" int NOT NULL,
  "message_source" varchar(150) NOT NULL,
  "message_target" varchar(150) NOT NULL,
  "message_creator_uniqueid" varchar(150) DEFAULT NULL,
  "message_target_uniqueid" varchar(150) DEFAULT NULL,
  "message_text" text,
  "message_file_name" varchar(250) DEFAULT NULL,
  "message_file_directory" varchar(150) DEFAULT NULL,
  "message_file_thumb_name" varchar(150) DEFAULT NULL,
  "message_file_type" varchar(50) DEFAULT NULL,
  "message_type" varchar(150) DEFAULT 'file',
  "message_status" varchar(150) DEFAULT 'unread',
  "message_mapping_type" text,
  "message_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("message_id")
);

--
-- Dumping data for table "messages"
--


--
-- Table structure for table "messages_tracking"
--

DROP TABLE IF EXISTS "messages_tracking";
CREATE TABLE "messages_tracking" (
  "messagestracking_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "messagestracking_created" TIMESTAMP NOT NULL,
  "messagestracking_update" TIMESTAMP NOT NULL,
  "messagestracking_massage_unique_id" varchar(120) NOT NULL,
  "messagestracking_target" varchar(120) DEFAULT NULL,
  "messagestracking_user_unique_id" varchar(120) DEFAULT NULL,
  "messagestracking_type" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("messagestracking_id")
);

--
-- Dumping data for table "messages_tracking"
--


--
-- Table structure for table "milestone_categories"
--

DROP TABLE IF EXISTS "milestone_categories";
CREATE TABLE "milestone_categories" (
  "milestonecategory_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "milestonecategory_created" TIMESTAMP NOT NULL,
  "milestonecategory_updated" TIMESTAMP NOT NULL,
  "milestonecategory_creatorid" int NOT NULL,
  "milestonecategory_title" varchar(250) NOT NULL,
  "milestonecategory_position" int NOT NULL,
  "milestonecategory_color" varchar(100) DEFAULT 'default',
  PRIMARY KEY ("milestonecategory_id")
);

--
-- Dumping data for table "milestone_categories"
--


--
-- Table structure for table "milestones"
--

DROP TABLE IF EXISTS "milestones";
CREATE TABLE "milestones" (
  "milestone_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "milestone_created" TIMESTAMP NOT NULL,
  "milestone_updated" TIMESTAMP NOT NULL,
  "milestone_creatorid" int NOT NULL,
  "milestone_title" varchar(250) NOT NULL DEFAULT 'uncategorised',
  "milestone_projectid" int DEFAULT NULL,
  "milestone_position" int NOT NULL DEFAULT '1',
  "milestone_type" varchar(50) NOT NULL DEFAULT 'categorised',
  "milestone_color" varchar(50) NOT NULL DEFAULT 'default',
  PRIMARY KEY ("milestone_id")
);

--
-- Dumping data for table "milestones"
--


--
-- Table structure for table "modules"
--

DROP TABLE IF EXISTS "modules";
CREATE TABLE "modules" (
  "module_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "module_created" TIMESTAMP NOT NULL,
  "module_updated" TIMESTAMP NOT NULL,
  "module_name" text,
  "module_alias" text,
  "module_uniqueid" text,
  "module_description" text,
  "module_author_name" text,
  "module_author_url" text,
  "module_version" text,
  "module_status" varchar(30) DEFAULT 'disabled',
  PRIMARY KEY ("module_id")
);

--
-- Dumping data for table "modules"
--


--
-- Table structure for table "notes"
--

DROP TABLE IF EXISTS "notes";
CREATE TABLE "notes" (
  "note_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "note_created" TIMESTAMP DEFAULT NULL,
  "note_updated" TIMESTAMP DEFAULT NULL,
  "note_creatorid" int DEFAULT NULL,
  "note_title" varchar(250) DEFAULT NULL,
  "note_description" text,
  "note_visibility" varchar(30) DEFAULT 'public',
  "noteresource_type" varchar(50) DEFAULT NULL,
  "noteresource_id" int DEFAULT NULL,
  "note_mapping_type" text,
  "note_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("note_id")
);

--
-- Dumping data for table "notes"
--


--
-- Table structure for table "payment_sessions"
--

DROP TABLE IF EXISTS "payment_sessions";
CREATE TABLE "payment_sessions" (
  "session_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "session_created" TIMESTAMP DEFAULT NULL,
  "session_updated" TIMESTAMP DEFAULT NULL,
  "session_creatorid" int DEFAULT NULL,
  "session_creator_fullname" varchar(150) DEFAULT NULL,
  "session_creator_email" varchar(150) DEFAULT NULL,
  "session_gateway_name" varchar(150) DEFAULT NULL,
  "session_gateway_ref" varchar(150) DEFAULT NULL,
  "session_amount" decimal(10,2) DEFAULT NULL,
  "session_invoices" varchar(250) DEFAULT NULL,
  "session_subscription" int DEFAULT NULL,
  "session_payload" text,
  PRIMARY KEY ("session_id")
);

--
-- Dumping data for table "payment_sessions"
--


--
-- Table structure for table "payments"
--

DROP TABLE IF EXISTS "payments";
CREATE TABLE "payments" (
  "payment_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "payment_created" TIMESTAMP DEFAULT NULL,
  "payment_updated" TIMESTAMP DEFAULT NULL,
  "payment_creatorid" int DEFAULT NULL,
  "payment_date" date DEFAULT NULL,
  "payment_invoiceid" int DEFAULT NULL,
  "payment_subscriptionid" int DEFAULT NULL,
  "payment_clientid" int DEFAULT NULL,
  "payment_projectid" int DEFAULT NULL,
  "payment_amount" decimal(10,2) NOT NULL,
  "payment_transaction_id" varchar(100) DEFAULT NULL,
  "payment_gateway" varchar(100) DEFAULT NULL,
  "payment_notes" text,
  "payment_type" varchar(50) DEFAULT 'invoice',
  "paymentresource_type" text,
  "paymentresource_id" int DEFAULT NULL,
  "payment_mapping_type" text,
  "payment_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("payment_id")
);

--
-- Dumping data for table "payments"
--


--
-- Table structure for table "pinned"
--

DROP TABLE IF EXISTS "pinned";
CREATE TABLE "pinned" (
  "pinned_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "pinned_created" int NOT NULL,
  "pinned_updated" int NOT NULL,
  "pinned_userid" int DEFAULT NULL,
  "pinned_status" varchar(50) DEFAULT 'pinned',
  "pinnedresource_type" varchar(50) DEFAULT NULL,
  "pinnedresource_id" int DEFAULT NULL,
  PRIMARY KEY ("pinned_id")
);

--
-- Dumping data for table "pinned"
--


--
-- Table structure for table "product_tasks"
--

DROP TABLE IF EXISTS "product_tasks";
CREATE TABLE "product_tasks" (
  "product_task_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "product_task_created" date NOT NULL,
  "product_task_updated" date NOT NULL,
  "product_task_creatorid" int DEFAULT NULL,
  "product_task_itemid" int DEFAULT NULL,
  "product_task_title" varchar(250) DEFAULT NULL,
  "product_task_description" text,
  PRIMARY KEY ("product_task_id")
);

--
-- Dumping data for table "product_tasks"
--


--
-- Table structure for table "product_tasks_dependencies"
--

DROP TABLE IF EXISTS "product_tasks_dependencies";
CREATE TABLE "product_tasks_dependencies" (
  "product_task_dependency_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "product_task_dependency_created" date NOT NULL,
  "product_task_dependency_updated" date NOT NULL,
  "product_task_dependency_taskid" int DEFAULT NULL,
  "product_task_dependency_blockerid" int DEFAULT NULL,
  "product_task_dependency_type" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("product_task_dependency_id")
);

--
-- Dumping data for table "product_tasks_dependencies"
--


--
-- Table structure for table "projects"
--

DROP TABLE IF EXISTS "projects";
CREATE TABLE "projects" (
  "project_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "project_uniqueid" varchar(100) DEFAULT NULL,
  "project_type" varchar(30) NOT NULL DEFAULT 'project',
  "project_reference" varchar(250) DEFAULT NULL,
  "project_importid" varchar(100) DEFAULT NULL,
  "project_created" TIMESTAMP DEFAULT NULL,
  "project_updated" TIMESTAMP DEFAULT NULL,
  "project_timestamp_created" int DEFAULT NULL,
  "project_timestamp_updated" int DEFAULT NULL,
  "project_clientid" int DEFAULT NULL,
  "project_creatorid" int NOT NULL,
  "project_categoryid" int DEFAULT '1',
  "project_cover_directory" varchar(100) DEFAULT NULL,
  "project_cover_filename" varchar(100) DEFAULT NULL,
  "project_cover_file_id" int DEFAULT NULL,
  "project_title" varchar(250) NOT NULL,
  "project_date_start" date DEFAULT NULL,
  "project_date_due" date DEFAULT NULL,
  "project_description" text,
  "project_date_status_changed" date DEFAULT NULL,
  "project_status" varchar(50) DEFAULT 'not_started',
  "project_active_state" varchar(10) DEFAULT 'active',
  "project_progress" SMALLINT DEFAULT '0',
  "project_billing_rate" decimal(10,2) DEFAULT '0.00',
  "project_billing_type" varchar(40) DEFAULT 'hourly',
  "project_billing_estimated_hours" int DEFAULT '0',
  "project_billing_costs_estimate" decimal(10,2) DEFAULT '0.00',
  "project_progress_manually" varchar(10) DEFAULT 'no',
  "clientperm_tasks_view" varchar(10) DEFAULT 'yes',
  "clientperm_tasks_collaborate" varchar(40) DEFAULT 'yes',
  "clientperm_tasks_create" varchar(40) DEFAULT 'yes',
  "clientperm_timesheets_view" varchar(40) DEFAULT 'yes',
  "clientperm_expenses_view" varchar(40) DEFAULT 'no',
  "assignedperm_milestone_manage" varchar(40) DEFAULT 'yes',
  "assignedperm_tasks_collaborate" varchar(40) DEFAULT NULL,
  "project_visibility" varchar(40) DEFAULT 'visible',
  "project_calendar_timezone" text,
  "project_calendar_location" text,
  "project_calendar_reminder" varchar(10) DEFAULT 'no',
  "project_calendar_reminder_duration" int DEFAULT NULL,
  "project_calendar_reminder_period" text,
  "project_calendar_reminder_sent" text,
  "project_calendar_reminder_date_sent" TIMESTAMP DEFAULT NULL,
  "projectresource_type" text,
  "projectresource_id" int DEFAULT NULL,
  "project_custom_field_1" TEXT,
  "project_custom_field_2" TEXT,
  "project_custom_field_3" TEXT,
  "project_custom_field_4" TEXT,
  "project_custom_field_5" TEXT,
  "project_custom_field_6" TEXT,
  "project_custom_field_7" TEXT,
  "project_custom_field_8" TEXT,
  "project_custom_field_9" TEXT,
  "project_custom_field_10" TEXT,
  "project_custom_field_11" TIMESTAMP DEFAULT NULL,
  "project_custom_field_12" TIMESTAMP DEFAULT NULL,
  "project_custom_field_13" TIMESTAMP DEFAULT NULL,
  "project_custom_field_14" TIMESTAMP DEFAULT NULL,
  "project_custom_field_15" TIMESTAMP DEFAULT NULL,
  "project_custom_field_16" TIMESTAMP DEFAULT NULL,
  "project_custom_field_17" TIMESTAMP DEFAULT NULL,
  "project_custom_field_18" TIMESTAMP DEFAULT NULL,
  "project_custom_field_19" TIMESTAMP DEFAULT NULL,
  "project_custom_field_20" TIMESTAMP DEFAULT NULL,
  "project_custom_field_21" text,
  "project_custom_field_22" text,
  "project_custom_field_23" text,
  "project_custom_field_24" text,
  "project_custom_field_25" text,
  "project_custom_field_26" text,
  "project_custom_field_27" text,
  "project_custom_field_28" text,
  "project_custom_field_29" text,
  "project_custom_field_30" text,
  "project_custom_field_31" varchar(20) DEFAULT NULL,
  "project_custom_field_32" varchar(20) DEFAULT NULL,
  "project_custom_field_33" varchar(20) DEFAULT NULL,
  "project_custom_field_34" varchar(20) DEFAULT NULL,
  "project_custom_field_35" varchar(20) DEFAULT NULL,
  "project_custom_field_36" varchar(20) DEFAULT NULL,
  "project_custom_field_37" varchar(20) DEFAULT NULL,
  "project_custom_field_38" varchar(20) DEFAULT NULL,
  "project_custom_field_39" varchar(20) DEFAULT NULL,
  "project_custom_field_40" varchar(20) DEFAULT NULL,
  "project_custom_field_41" varchar(150) DEFAULT NULL,
  "project_custom_field_42" varchar(150) DEFAULT NULL,
  "project_custom_field_43" varchar(150) DEFAULT NULL,
  "project_custom_field_44" varchar(150) DEFAULT NULL,
  "project_custom_field_45" varchar(150) DEFAULT NULL,
  "project_custom_field_46" varchar(150) DEFAULT NULL,
  "project_custom_field_47" varchar(150) DEFAULT NULL,
  "project_custom_field_48" varchar(150) DEFAULT NULL,
  "project_custom_field_49" varchar(150) DEFAULT NULL,
  "project_custom_field_50" varchar(150) DEFAULT NULL,
  "project_custom_field_51" int DEFAULT NULL,
  "project_custom_field_52" int DEFAULT NULL,
  "project_custom_field_53" int DEFAULT NULL,
  "project_custom_field_54" int DEFAULT NULL,
  "project_custom_field_55" int DEFAULT NULL,
  "project_custom_field_56" int DEFAULT NULL,
  "project_custom_field_57" int DEFAULT NULL,
  "project_custom_field_58" int DEFAULT NULL,
  "project_custom_field_59" int DEFAULT NULL,
  "project_custom_field_60" int DEFAULT NULL,
  "project_custom_field_61" decimal(10,2) DEFAULT NULL,
  "project_custom_field_62" decimal(10,2) DEFAULT NULL,
  "project_custom_field_63" decimal(10,2) DEFAULT NULL,
  "project_custom_field_64" decimal(10,2) DEFAULT NULL,
  "project_custom_field_65" decimal(10,2) DEFAULT NULL,
  "project_custom_field_66" decimal(10,2) DEFAULT NULL,
  "project_custom_field_67" decimal(10,2) DEFAULT NULL,
  "project_custom_field_68" decimal(10,2) DEFAULT NULL,
  "project_custom_field_69" decimal(10,2) DEFAULT NULL,
  "project_custom_field_70" decimal(10,2) DEFAULT NULL,
  "project_automation_status" varchar(30) DEFAULT 'disabled',
  "project_automation_create_invoices" varchar(30) DEFAULT 'no',
  "project_automation_convert_estimates_to_invoices" varchar(30) DEFAULT 'no',
  "project_automation_invoice_unbilled_hours" varchar(30) DEFAULT 'no',
  "project_automation_invoice_hourly_rate" decimal(10,2) DEFAULT NULL,
  "project_automation_invoice_hourly_tax_1" int DEFAULT NULL,
  "project_automation_invoice_email_client" varchar(30) DEFAULT 'no',
  "project_automation_invoice_due_date" int DEFAULT '0',
  PRIMARY KEY ("project_id")
);

--
-- Dumping data for table "projects"
--


--
-- Table structure for table "projects_assigned"
--

DROP TABLE IF EXISTS "projects_assigned";
CREATE TABLE "projects_assigned" (
  "projectsassigned_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "projectsassigned_projectid" int DEFAULT NULL,
  "projectsassigned_userid" int DEFAULT NULL,
  "projectsassigned_created" TIMESTAMP DEFAULT NULL,
  "projectsassigned_updated" TIMESTAMP DEFAULT NULL,
  PRIMARY KEY ("projectsassigned_id")
);

--
-- Dumping data for table "projects_assigned"
--


--
-- Table structure for table "projects_manager"
--

DROP TABLE IF EXISTS "projects_manager";
CREATE TABLE "projects_manager" (
  "projectsmanager_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "projectsmanager_created" TIMESTAMP NOT NULL,
  "projectsmanager_updated" TIMESTAMP NOT NULL,
  "projectsmanager_projectid" int DEFAULT NULL,
  "projectsmanager_userid" int NOT NULL,
  PRIMARY KEY ("projectsmanager_id")
);

--
-- Dumping data for table "projects_manager"
--


--
-- Table structure for table "proposal_templates"
--

DROP TABLE IF EXISTS "proposal_templates";
CREATE TABLE "proposal_templates" (
  "proposal_template_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "proposal_template_created" TIMESTAMP NOT NULL,
  "proposal_template_updated" TIMESTAMP NOT NULL,
  "proposal_template_creatorid" int DEFAULT NULL,
  "proposal_template_title" varchar(250) DEFAULT NULL,
  "proposal_template_heading_color" varchar(30) DEFAULT '#FFFFFF',
  "proposal_template_title_color" varchar(30) DEFAULT '#FFFFFF',
  "proposal_template_body" text,
  "proposal_template_estimate_id" int DEFAULT NULL,
  "proposal_template_system" varchar(20) DEFAULT 'no',
  PRIMARY KEY ("proposal_template_id")
);

--
-- Dumping data for table "proposal_templates"
--


--
-- Table structure for table "proposals"
--

DROP TABLE IF EXISTS "proposals";
CREATE TABLE "proposals" (
  "doc_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "doc_unique_id" varchar(150) DEFAULT NULL,
  "doc_template" varchar(150) DEFAULT NULL,
  "doc_created" TIMESTAMP NOT NULL,
  "doc_updated" TIMESTAMP NOT NULL,
  "doc_date_status_change" TIMESTAMP DEFAULT NULL,
  "doc_creatorid" int NOT NULL,
  "doc_categoryid" int DEFAULT '11',
  "doc_heading" text,
  "doc_heading_color" text,
  "doc_title" text,
  "doc_title_color" text,
  "doc_hero_direcory" text,
  "doc_hero_filename" text,
  "doc_hero_updated" varchar(250) DEFAULT 'no',
  "doc_body" text,
  "doc_date_start" date DEFAULT NULL,
  "doc_date_end" date DEFAULT NULL,
  "doc_date_published" date DEFAULT NULL,
  "doc_date_last_emailed" TIMESTAMP DEFAULT NULL,
  "doc_client_id" int DEFAULT NULL,
  "doc_project_id" int DEFAULT NULL,
  "doc_lead_id" int DEFAULT NULL,
  "doc_notes" text,
  "doc_viewed" varchar(20) DEFAULT 'no',
  "doc_type" varchar(150) DEFAULT NULL,
  "doc_system_type" varchar(150) DEFAULT 'document',
  "doc_signed_date" TIMESTAMP DEFAULT NULL,
  "doc_signed_first_name" text,
  "doc_signed_last_name" text,
  "doc_signed_signature_directory" text,
  "doc_signed_signature_filename" text,
  "doc_signed_ip_address" text,
  "doc_fallback_client_first_name" text,
  "doc_fallback_client_last_name" text,
  "doc_fallback_client_email" text,
  "doc_status" varchar(100) DEFAULT 'draft',
  "proposal_automation_status" varchar(20) DEFAULT 'disabled',
  "docresource_type" varchar(100) DEFAULT NULL,
  "docresource_id" int DEFAULT NULL,
  "proposal_automation_create_project" varchar(10) DEFAULT 'no',
  "proposal_automation_project_title" text,
  "proposal_automation_project_status" varchar(30) DEFAULT 'in_progress',
  "proposal_automation_create_tasks" varchar(10) DEFAULT 'no',
  "proposal_automation_project_email_client" varchar(10) DEFAULT 'no',
  "proposal_automation_create_invoice" varchar(10) DEFAULT 'no',
  "proposal_automation_invoice_due_date" int DEFAULT NULL,
  "proposal_automation_invoice_email_client" varchar(10) DEFAULT 'no',
  "proposal_automation_log_created_project_id" int DEFAULT NULL,
  "proposal_automation_log_created_invoice_id" int DEFAULT NULL,
  "doc_publishing_type" varchar(20) DEFAULT 'instant',
  "doc_publishing_scheduled_date" TIMESTAMP DEFAULT NULL,
  "doc_publishing_scheduled_status" text,
  "doc_publishing_scheduled_log" text,
  "proposal_mapping_type" text,
  "proposal_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("doc_id")
);

--
-- Dumping data for table "proposals"
--


--
-- Table structure for table "reminders"
--

DROP TABLE IF EXISTS "reminders";
CREATE TABLE "reminders" (
  "reminder_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "reminder_created" TIMESTAMP NOT NULL,
  "reminder_updated" TIMESTAMP NOT NULL,
  "reminder_userid" int DEFAULT NULL,
  "reminder_TIMESTAMP" TIMESTAMP DEFAULT NULL,
  "reminder_timestamp" timestamp NULL DEFAULT NULL,
  "reminder_title" varchar(250) DEFAULT NULL,
  "reminder_meta" varchar(250) DEFAULT NULL,
  "reminder_notes" text,
  "reminder_status" varchar(10) DEFAULT 'new',
  "reminder_sent" varchar(10) DEFAULT 'no',
  "reminderresource_type" varchar(50) DEFAULT NULL,
  "reminderresource_id" int DEFAULT NULL,
  "reminder_mapping_type" text,
  "reminder_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("reminder_id")
);

--
-- Dumping data for table "reminders"
--


--
-- Table structure for table "roles"
--

DROP TABLE IF EXISTS "roles";
CREATE TABLE "roles" (
  "role_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "role_created" TIMESTAMP DEFAULT NULL,
  "role_updated" TIMESTAMP DEFAULT NULL,
  "role_system" varchar(10) NOT NULL DEFAULT 'no',
  "role_type" varchar(10) NOT NULL,
  "role_name" varchar(100) NOT NULL,
  "role_clients" SMALLINT NOT NULL DEFAULT '0',
  "role_contacts" SMALLINT NOT NULL,
  "role_contracts" SMALLINT NOT NULL DEFAULT '0',
  "role_invoices" SMALLINT NOT NULL DEFAULT '0',
  "role_estimates" SMALLINT NOT NULL DEFAULT '0',
  "role_proposals" SMALLINT NOT NULL DEFAULT '0',
  "role_payments" SMALLINT NOT NULL DEFAULT '0',
  "role_items" SMALLINT NOT NULL DEFAULT '0',
  "role_tasks" SMALLINT NOT NULL DEFAULT '0',
  "role_tasks_scope" varchar(20) NOT NULL DEFAULT 'own',
  "role_projects" SMALLINT NOT NULL DEFAULT '0',
  "role_projects_scope" varchar(20) NOT NULL DEFAULT 'own',
  "role_projects_billing" varchar(20) NOT NULL DEFAULT '0',
  "role_leads" SMALLINT NOT NULL DEFAULT '0',
  "role_leads_scope" varchar(20) NOT NULL DEFAULT 'own',
  "role_expenses" SMALLINT NOT NULL DEFAULT '0',
  "role_expenses_scope" varchar(20) NOT NULL DEFAULT 'own',
  "role_timesheets" int NOT NULL DEFAULT '0',
  "role_timesheets_scope" varchar(20) NOT NULL DEFAULT 'own',
  "role_team" SMALLINT NOT NULL DEFAULT '0',
  "role_team_scope" varchar(20) NOT NULL DEFAULT 'global',
  "role_tickets" SMALLINT NOT NULL DEFAULT '0',
  "role_knowledgebase" SMALLINT NOT NULL DEFAULT '0',
  "role_manage_knowledgebase_categories" varchar(20) NOT NULL DEFAULT 'no',
  "role_assign_projects" varchar(20) NOT NULL DEFAULT 'no',
  "role_assign_leads" varchar(20) NOT NULL DEFAULT 'no',
  "role_assign_tasks" varchar(20) NOT NULL DEFAULT 'no',
  "role_set_project_permissions" varchar(20) NOT NULL DEFAULT 'no',
  "role_subscriptions" varchar(20) NOT NULL DEFAULT '0',
  "role_templates_projects" varchar(20) NOT NULL DEFAULT '1',
  "role_templates_contracts" varchar(20) NOT NULL DEFAULT '1',
  "role_templates_proposals" varchar(20) NOT NULL DEFAULT '1',
  "role_content_import" varchar(20) NOT NULL DEFAULT 'yes',
  "role_content_export" varchar(20) NOT NULL DEFAULT 'yes',
  "role_module_cs_affiliate" varchar(20) NOT NULL DEFAULT '3',
  "role_homepage" varchar(100) NOT NULL DEFAULT 'dashboard',
  "role_messages" varchar(20) NOT NULL DEFAULT 'yes',
  "role_reports" varchar(20) NOT NULL DEFAULT 'no',
  "role_canned" varchar(20) NOT NULL DEFAULT 'no',
  "role_canned_scope" varchar(20) NOT NULL DEFAULT 'own',
  "modules" TEXT,
  PRIMARY KEY ("role_id")
);

--
-- Dumping data for table "roles"
--


--
-- Table structure for table "sessions"
--

DROP TABLE IF EXISTS "sessions";
CREATE TABLE "sessions" (
  "id" varchar(250) NOT NULL,
  "user_id" int DEFAULT NULL,
  "ip_address" varchar(45) DEFAULT NULL,
  "user_agent" text,
  "payload" text NOT NULL,
  "created_at" TIMESTAMP DEFAULT NULL,
  "updated_at" TIMESTAMP DEFAULT NULL,
  "last_activity" int NOT NULL,
  "json_data" TEXT,
  CONSTRAINT "sessions_chk_1" CHECK (TRUE)
);

--
-- Dumping data for table "sessions"
--


--
-- Table structure for table "settings"
--

DROP TABLE IF EXISTS "settings";
CREATE TABLE "settings" (
  "settings_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "settings_created" TIMESTAMP NOT NULL,
  "settings_updated" TIMESTAMP NOT NULL,
  "settings_type" varchar(50) DEFAULT 'standalone',
  "settings_saas_tenant_id" int DEFAULT NULL,
  "settings_saas_status" varchar(100) DEFAULT NULL,
  "settings_saas_package_id" int DEFAULT NULL,
  "settings_saas_onetimelogin_key" varchar(100) DEFAULT NULL,
  "settings_saas_onetimelogin_destination" varchar(100) DEFAULT NULL,
  "settings_saas_package_limits_clients" int DEFAULT NULL,
  "settings_saas_package_limits_team" int DEFAULT NULL,
  "settings_saas_package_limits_projects" int DEFAULT NULL,
  "settings_saas_notification_uniqueid" text,
  "settings_saas_notification_body" text,
  "settings_saas_notification_read" text,
  "settings_saas_notification_action" text,
  "settings_saas_notification_action_url" text,
  "settings_saas_email_server_type" varchar(30) DEFAULT 'local',
  "settings_saas_email_forwarding_address" text,
  "settings_saas_email_local_address" text,
  "settings_installation_date" TIMESTAMP NOT NULL,
  "settings_version" text NOT NULL,
  "settings_purchase_code" text,
  "settings_company_name" text,
  "settings_company_address_line_1" text,
  "settings_company_state" text,
  "settings_company_city" text,
  "settings_company_zipcode" text,
  "settings_company_country" text,
  "settings_company_telephone" text,
  "settings_company_customfield_1" text,
  "settings_company_customfield_2" text,
  "settings_company_customfield_3" text,
  "settings_company_customfield_4" text,
  "settings_clients_registration" text,
  "settings_clients_shipping_address" text,
  "settings_clients_disable_email_delivery" varchar(12) DEFAULT 'disabled',
  "settings_clients_app_login" varchar(12) DEFAULT 'enabled',
  "settings_customfields_display_leads" varchar(12) DEFAULT 'toggled',
  "settings_customfields_display_clients" varchar(12) DEFAULT 'toggled',
  "settings_customfields_display_projects" varchar(12) DEFAULT 'toggled',
  "settings_customfields_display_tasks" varchar(12) DEFAULT 'toggled',
  "settings_customfields_display_tickets" varchar(12) DEFAULT 'toggled',
  "settings_email_general_variables" text,
  "settings_email_from_address" text,
  "settings_email_from_name" text,
  "settings_email_server_type" text,
  "settings_email_smtp_host" text,
  "settings_email_smtp_port" text,
  "settings_email_smtp_username" text,
  "settings_email_smtp_password" text,
  "settings_email_smtp_encryption" text,
  "settings_estimates_default_terms_conditions" text,
  "settings_estimates_prefix" text,
  "settings_estimates_show_view_status" varchar(10) DEFAULT 'yes',
  "settings_modules_projects" varchar(10) DEFAULT 'enabled',
  "settings_modules_tasks" varchar(10) DEFAULT 'enabled',
  "settings_modules_invoices" varchar(10) DEFAULT 'enabled',
  "settings_modules_payments" varchar(10) DEFAULT 'enabled',
  "settings_modules_leads" varchar(10) DEFAULT 'enabled',
  "settings_modules_knowledgebase" varchar(10) DEFAULT 'enabled',
  "settings_modules_estimates" varchar(10) DEFAULT 'enabled',
  "settings_modules_expenses" varchar(10) DEFAULT 'enabled',
  "settings_modules_notes" varchar(10) DEFAULT 'enabled',
  "settings_modules_subscriptions" varchar(10) DEFAULT 'enabled',
  "settings_modules_contracts" varchar(10) DEFAULT 'enabled',
  "settings_modules_proposals" varchar(10) DEFAULT 'enabled',
  "settings_modules_tickets" varchar(10) DEFAULT 'enabled',
  "settings_modules_timetracking" varchar(10) DEFAULT 'enabled',
  "settings_modules_reminders" varchar(10) DEFAULT 'enabled',
  "settings_modules_spaces" varchar(10) DEFAULT 'enabled',
  "settings_modules_messages" varchar(10) DEFAULT 'enabled',
  "settings_modules_reports" text,
  "settings_modules_calendar" text,
  "settings_files_max_size_mb" int DEFAULT '300',
  "settings_knowledgebase_article_ordering" varchar(40) DEFAULT 'name',
  "settings_knowledgebase_allow_guest_viewing" varchar(10) DEFAULT 'no',
  "settings_knowledgebase_external_pre_body" text,
  "settings_knowledgebase_external_post_body" text,
  "settings_knowledgebase_external_header" text,
  "settings_system_timezone" text,
  "settings_system_date_format" text,
  "settings_system_datepicker_format" text,
  "settings_system_default_leftmenu" text,
  "settings_system_default_statspanel" text,
  "settings_system_pagination_limits" SMALLINT DEFAULT NULL,
  "settings_system_kanban_pagination_limits" SMALLINT DEFAULT NULL,
  "settings_system_currency_code" text,
  "settings_system_currency_symbol" text,
  "settings_system_currency_position" text,
  "settings_system_currency_hide_decimal" text,
  "settings_system_decimal_separator" text,
  "settings_system_thousand_separator" text,
  "settings_system_close_modals_body_click" varchar(10) DEFAULT 'no',
  "settings_system_language_default" varchar(40) DEFAULT 'en',
  "settings_system_language_allow_users_to_change" varchar(10) DEFAULT 'yes',
  "settings_system_logo_large_name" varchar(40) DEFAULT 'logo.jpg',
  "settings_system_logo_small_name" varchar(40) DEFAULT 'logo-small.jpg',
  "settings_system_logo_versioning" varchar(40) DEFAULT '1',
  "settings_system_session_login_popup" varchar(10) DEFAULT 'disabled',
  "settings_system_javascript_versioning" date DEFAULT NULL,
  "settings_system_exporting_strip_html" varchar(10) DEFAULT 'yes',
  "settings_tags_allow_users_create" varchar(10) DEFAULT 'yes',
  "settings_leads_allow_private" varchar(10) DEFAULT 'yes',
  "settings_leads_allow_new_sources" varchar(10) DEFAULT 'yes',
  "settings_leads_kanban_value" text,
  "settings_leads_kanban_date_created" text,
  "settings_leads_kanban_category" text,
  "settings_leads_kanban_date_contacted" text,
  "settings_leads_kanban_telephone" text,
  "settings_leads_kanban_source" text,
  "settings_leads_kanban_email" text,
  "settings_leads_kanban_tags" text,
  "settings_leads_kanban_reminder" text,
  "settings_tasks_client_visibility" text,
  "settings_tasks_billable" text,
  "settings_tasks_kanban_date_created" text,
  "settings_tasks_kanban_date_due" text,
  "settings_tasks_kanban_date_start" text,
  "settings_tasks_kanban_priority" text,
  "settings_tasks_kanban_milestone" text,
  "settings_tasks_kanban_client_visibility" text,
  "settings_tasks_kanban_project_title" varchar(10) DEFAULT 'show',
  "settings_tasks_kanban_client_name" varchar(10) DEFAULT 'show',
  "settings_tasks_kanban_tags" text,
  "settings_tasks_kanban_reminder" text,
  "settings_tasks_send_overdue_reminder" varchar(10) DEFAULT 'yes',
  "settings_invoices_prefix" text,
  "settings_invoices_recurring_grace_period" smallint DEFAULT NULL,
  "settings_invoices_default_terms_conditions" text,
  "settings_invoices_show_view_status" text NOT NULL,
  "settings_invoices_show_project_on_invoice" text NOT NULL,
  "settings_projects_cover_images" varchar(10) DEFAULT 'disabled',
  "settings_projects_permissions_basis" varchar(40) DEFAULT 'user_roles',
  "settings_projects_categories_main_menu" varchar(10) DEFAULT 'no',
  "settings_projects_default_hourly_rate" decimal(10,2) DEFAULT '0.00',
  "settings_projects_allow_setting_permission_on_project_creation" text,
  "settings_projects_clientperm_files_view" text,
  "settings_projects_clientperm_files_upload" text,
  "settings_projects_clientperm_comments_view" text,
  "settings_projects_clientperm_comments_post" text,
  "settings_projects_clientperm_tasks_view" text,
  "settings_projects_clientperm_tasks_collaborate" text,
  "settings_projects_clientperm_tasks_create" text,
  "settings_projects_clientperm_timesheets_view" text,
  "settings_projects_clientperm_expenses_view" text,
  "settings_projects_clientperm_milestones_view" text,
  "settings_projects_clientperm_assigned_view" text,
  "settings_projects_assignedperm_milestone_manage" text,
  "settings_projects_assignedperm_tasks_collaborate" text,
  "settings_projects_events_show_task_status_change" text,
  "settings_stripe_secret_key" text,
  "settings_stripe_public_key" text,
  "settings_stripe_webhooks_key" text,
  "settings_stripe_default_subscription_plan_id" text,
  "settings_stripe_currency" text,
  "settings_stripe_display_name" text,
  "settings_stripe_status" text,
  "settings_subscriptions_prefix" varchar(40) DEFAULT 'SUB-',
  "settings_paypal_email" text,
  "settings_paypal_currency" text,
  "settings_paypal_display_name" text,
  "settings_paypal_mode" text,
  "settings_paypal_status" text,
  "settings_mollie_live_api_key" text,
  "settings_mollie_test_api_key" text,
  "settings_mollie_display_name" text,
  "settings_mollie_mode" varchar(40) DEFAULT 'live',
  "settings_mollie_currency" text,
  "settings_mollie_status" varchar(10) DEFAULT 'disabled',
  "settings_bank_details" text,
  "settings_bank_display_name" text,
  "settings_bank_status" text,
  "settings_razorpay_keyid" text,
  "settings_razorpay_secretkey" text,
  "settings_razorpay_currency" text,
  "settings_razorpay_display_name" text,
  "settings_razorpay_status" varchar(10) DEFAULT 'disabled',
  "settings_completed_check_email" varchar(10) DEFAULT 'no',
  "settings_expenses_billable_by_default" varchar(10) DEFAULT 'yes',
  "settings_tickets_edit_subject" text,
  "settings_tickets_edit_body" text,
  "settings_theme_name" varchar(60) DEFAULT 'default',
  "settings_theme_head" text,
  "settings_theme_body" text,
  "settings_track_thankyou_session_id" text,
  "settings_proposals_prefix" varchar(30) DEFAULT 'PROP-',
  "settings_proposals_show_view_status" varchar(10) DEFAULT 'yes',
  "settings_contracts_prefix" varchar(30) DEFAULT 'CONT-',
  "settings_contracts_show_view_status" varchar(10) DEFAULT 'yes',
  "settings_cronjob_has_run" varchar(10) DEFAULT 'no',
  "settings_cronjob_last_run" TIMESTAMP DEFAULT NULL,
  PRIMARY KEY ("settings_id")
);

--
-- Dumping data for table "settings"
--


--
-- Table structure for table "settings2"
--

DROP TABLE IF EXISTS "settings2";
CREATE TABLE "settings2" (
  "settings2_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "settings2_created" TIMESTAMP NOT NULL,
  "settings2_updated" TIMESTAMP NOT NULL,
  "settings2_bills_pdf_css" text,
  "settings2_calendar_projects_colour" text,
  "settings2_calendar_tasks_colour" text,
  "settings2_calendar_events_colour" text,
  "settings2_calendar_reminder_duration" int DEFAULT NULL,
  "settings2_calendar_reminder_period" text,
  "settings2_calendar_events_assigning" text,
  "settings2_calendar_first_day" int DEFAULT NULL,
  "settings2_calendar_default_event_duration" int DEFAULT NULL,
  "settings2_calendar_send_reminder_projects" text,
  "settings2_calendar_send_reminder_tasks" text,
  "settings2_calendar_send_reminder_events" text,
  "settings2_captcha_api_site_key" text,
  "settings2_captcha_api_secret_key" text,
  "settings2_captcha_status" varchar(10) DEFAULT 'disabled',
  "settings2_estimates_automation_default_status" varchar(10) DEFAULT 'disabled',
  "settings2_estimates_automation_create_project" varchar(10) DEFAULT 'no',
  "settings2_estimates_automation_project_status" varchar(50) DEFAULT 'in_progress',
  "settings2_estimates_automation_project_title" text,
  "settings2_estimates_automation_project_email_client" varchar(10) DEFAULT 'no',
  "settings2_estimates_automation_create_invoice" varchar(10) DEFAULT 'no',
  "settings2_estimates_automation_invoice_email_client" varchar(10) DEFAULT 'no',
  "settings2_estimates_automation_invoice_due_date" int DEFAULT '7',
  "settings2_estimates_automation_create_tasks" varchar(10) DEFAULT 'no',
  "settings2_estimates_automation_copy_attachments" varchar(10) DEFAULT 'yes',
  "settings2_extras_dimensions_billing" varchar(10) DEFAULT 'disabled',
  "settings2_extras_dimensions_default_unit" varchar(30) DEFAULT 'm2',
  "settings2_extras_dimensions_show_measurements" varchar(10) DEFAULT 'no',
  "settings2_importing_leads_duplicates_name" text,
  "settings2_importing_leads_duplicates_email" text,
  "settings2_importing_leads_duplicates_telephone" text,
  "settings2_importing_leads_duplicates_company" text,
  "settings2_importing_clients_duplicates_email" text,
  "settings2_importing_clients_duplicates_telephone" text,
  "settings2_importing_clients_duplicates_company" text,
  "settings2_projects_automation_default_status" varchar(10) DEFAULT 'disabled',
  "settings2_projects_automation_create_invoices" varchar(10) DEFAULT 'no',
  "settings2_projects_automation_convert_estimates_to_invoices" varchar(10) DEFAULT 'no',
  "settings2_projects_automation_skip_draft_estimates" varchar(10) DEFAULT 'yes',
  "settings2_projects_automation_skip_declined_estimates" varchar(10) DEFAULT 'yes',
  "settings2_projects_automation_invoice_unbilled_hours" varchar(10) DEFAULT 'no',
  "settings2_projects_automation_invoice_hourly_rate" decimal(10,2) DEFAULT NULL,
  "settings2_projects_automation_invoice_hourly_tax_1" int DEFAULT NULL,
  "settings2_projects_automation_invoice_email_client" varchar(10) DEFAULT 'no',
  "settings2_projects_automation_invoice_due_date" int DEFAULT '7',
  "settings2_tasks_manage_dependencies" varchar(60) DEFAULT 'super-users',
  "settings2_tap_secret_key" text,
  "settings2_tap_publishable_key" text,
  "settings2_tap_currency_code" text,
  "settings2_tap_language" varchar(10) DEFAULT 'en',
  "settings2_tap_display_name" text,
  "settings2_tap_status" varchar(10) DEFAULT 'disabled',
  "settings2_theme_css" text,
  "settings2_paystack_secret_key" text,
  "settings2_paystack_public_key" text,
  "settings2_paystack_currency_code" text,
  "settings2_paystack_display_name" text,
  "settings2_paystack_status" varchar(10) DEFAULT 'disabled',
  "settings2_proposals_automation_default_status" text,
  "settings2_proposals_automation_create_project" text,
  "settings2_proposals_automation_project_status" text,
  "settings2_proposals_automation_project_email_client" text,
  "settings2_proposals_automation_create_invoice" text,
  "settings2_proposals_automation_invoice_email_client" text,
  "settings2_proposals_automation_invoice_due_date" int DEFAULT NULL,
  "settings2_proposals_automation_create_tasks" text,
  "settings2_file_folders_status" varchar(10) DEFAULT 'enabled',
  "settings2_file_folders_manage_assigned" varchar(10) DEFAULT 'yes',
  "settings2_file_folders_manage_project_manager" varchar(10) DEFAULT 'yes',
  "settings2_file_folders_manage_client" varchar(10) DEFAULT 'yes',
  "settings2_file_bulk_download" varchar(10) DEFAULT 'enabled',
  "settings2_search_category_limit" int DEFAULT '5',
  "settings2_spaces_team_space_id" text,
  "settings2_spaces_team_space_status" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_user_space_status" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_team_space_title" varchar(150) DEFAULT 'Team Space',
  "settings2_spaces_user_space_title" varchar(150) DEFAULT 'My Space',
  "settings2_spaces_team_space_menu_name" varchar(150) DEFAULT 'Team Space',
  "settings2_spaces_user_space_menu_name" varchar(150) DEFAULT 'Space',
  "settings2_spaces_features_files" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_features_notes" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_features_comments" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_features_tasks" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_features_whiteboard" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_features_checklists" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_features_todos" varchar(10) DEFAULT 'enabled',
  "settings2_spaces_features_reminders" varchar(10) DEFAULT 'enabled',
  "settings2_tickets_replying_interface" varchar(10) DEFAULT 'popup',
  "settings2_tickets_archive_button" varchar(10) DEFAULT 'yes',
  "settings2_timesheets_show_recorded_by" text,
  "settings2_projects_cover_images_show_on_project" varchar(10) DEFAULT 'no',
  "settings2_onboarding_status" varchar(10) DEFAULT 'disabled',
  "settings2_onboarding_content" text,
  "settings2_onboarding_view_status" varchar(10) DEFAULT 'unseen',
  "settings2_tweak_reports_truncate_long_text" varchar(10) DEFAULT 'yes',
  "settings2_tweak_imap_tickets_import_limit" int DEFAULT '5',
  "settings2_tweak_imap_connection_timeout" int DEFAULT '30',
  "settings2_dompdf_fonts" text,
  PRIMARY KEY ("settings2_id")
);

--
-- Dumping data for table "settings2"
--


--
-- Table structure for table "subscriptions"
--

DROP TABLE IF EXISTS "subscriptions";
CREATE TABLE "subscriptions" (
  "subscription_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "subscription_gateway_id" varchar(250) DEFAULT NULL,
  "subscription_created" TIMESTAMP DEFAULT NULL,
  "subscription_updated" TIMESTAMP DEFAULT NULL,
  "subscription_creatorid" int NOT NULL,
  "subscription_clientid" int NOT NULL,
  "subscription_categoryid" int NOT NULL DEFAULT '4',
  "subscription_projectid" int DEFAULT NULL,
  "subscription_gateway_product" varchar(250) DEFAULT NULL,
  "subscription_gateway_price" varchar(250) DEFAULT NULL,
  "subscription_gateway_product_name" varchar(250) DEFAULT NULL,
  "subscription_gateway_interval" int DEFAULT NULL,
  "subscription_gateway_period" varchar(50) DEFAULT NULL,
  "subscription_date_started" TIMESTAMP DEFAULT NULL,
  "subscription_date_ended" TIMESTAMP DEFAULT NULL,
  "subscription_date_renewed" date DEFAULT NULL,
  "subscription_date_next_renewal" date DEFAULT NULL,
  "subscription_gateway_last_message" text,
  "subscription_gateway_last_message_date" TIMESTAMP DEFAULT NULL,
  "subscription_subtotal" decimal(10,2) NOT NULL DEFAULT '0.00',
  "subscription_amount_before_tax" decimal(10,2) DEFAULT '0.00',
  "subscription_tax_percentage" decimal(10,2) DEFAULT '0.00',
  "subscription_tax_amount" decimal(10,2) DEFAULT '0.00',
  "subscription_final_amount" decimal(10,2) DEFAULT '0.00',
  "subscription_notes" text,
  "subscription_status" varchar(50) DEFAULT 'pending',
  "subscription_visibility" varchar(50) DEFAULT 'visible',
  "subscription_cron_status" varchar(20) DEFAULT 'none',
  "subscription_cron_date" TIMESTAMP DEFAULT NULL,
  PRIMARY KEY ("subscription_id")
);

--
-- Dumping data for table "subscriptions"
--


--
-- Table structure for table "tableconfig"
--

DROP TABLE IF EXISTS "tableconfig";
CREATE TABLE "tableconfig" (
  "tableconfig_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "tableconfig_created" TIMESTAMP NOT NULL,
  "tableconfig_updated" TIMESTAMP NOT NULL,
  "tableconfig_userid" int NOT NULL,
  "tableconfig_table_name" varchar(150) NOT NULL,
  "tableconfig_column_1" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_2" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_3" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_4" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_5" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_6" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_7" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_8" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_9" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_10" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_11" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_12" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_13" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_14" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_15" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_16" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_17" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_18" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_19" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_20" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_21" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_22" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_23" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_24" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_25" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_26" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_27" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_28" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_29" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_30" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_31" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_32" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_33" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_34" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_35" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_36" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_37" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_38" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_39" varchar(20) DEFAULT 'hidden',
  "tableconfig_column_40" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_1" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_2" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_3" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_4" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_5" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_6" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_7" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_8" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_9" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_10" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_11" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_12" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_13" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_14" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_15" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_16" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_17" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_18" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_19" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_20" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_21" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_22" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_23" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_24" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_25" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_26" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_27" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_28" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_29" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_30" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_31" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_32" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_33" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_34" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_35" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_36" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_37" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_38" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_39" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_40" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_41" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_42" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_43" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_44" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_45" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_46" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_47" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_48" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_49" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_50" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_51" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_52" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_53" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_54" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_55" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_56" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_57" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_58" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_59" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_60" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_61" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_62" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_63" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_64" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_65" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_66" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_67" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_68" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_69" varchar(20) DEFAULT 'hidden',
  "tableconfig_custom_70" varchar(20) DEFAULT 'hidden',
  PRIMARY KEY ("tableconfig_id")
);

--
-- Dumping data for table "tableconfig"
--


--
-- Table structure for table "tags"
--

DROP TABLE IF EXISTS "tags";
CREATE TABLE "tags" (
  "tag_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "tag_created" TIMESTAMP DEFAULT NULL,
  "tag_updated" TIMESTAMP DEFAULT NULL,
  "tag_creatorid" int DEFAULT NULL,
  "tag_title" varchar(100) NOT NULL,
  "tag_visibility" varchar(50) NOT NULL DEFAULT 'user',
  "tagresource_type" varchar(50) NOT NULL,
  "tagresource_id" int NOT NULL,
  PRIMARY KEY ("tag_id")
);

--
-- Dumping data for table "tags"
--


--
-- Table structure for table "tasks"
--

DROP TABLE IF EXISTS "tasks";
CREATE TABLE "tasks" (
  "task_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "task_uniqueid" varchar(100) DEFAULT NULL,
  "task_importid" varchar(100) DEFAULT NULL,
  "task_position" DOUBLE PRECISION NOT NULL,
  "task_created" TIMESTAMP DEFAULT NULL,
  "task_updated" TIMESTAMP DEFAULT NULL,
  "task_creatorid" int DEFAULT NULL,
  "task_clientid" int DEFAULT NULL,
  "task_projectid" int DEFAULT NULL,
  "task_date_start" date DEFAULT NULL,
  "task_date_due" date DEFAULT NULL,
  "task_title" varchar(250) DEFAULT NULL,
  "task_description" text,
  "task_client_visibility" varchar(100) DEFAULT 'yes',
  "task_milestoneid" int DEFAULT NULL,
  "task_previous_status" varchar(100) DEFAULT 'new',
  "task_priority" int DEFAULT '1',
  "task_date_status_changed" TIMESTAMP DEFAULT NULL,
  "task_status" int DEFAULT '1',
  "task_completed_by_userid" int DEFAULT NULL,
  "task_active_state" varchar(100) DEFAULT 'active',
  "task_billable" varchar(5) DEFAULT 'yes',
  "task_billable_status" varchar(20) DEFAULT 'not_invoiced',
  "task_billable_invoiceid" int DEFAULT NULL,
  "task_billable_lineitemid" int DEFAULT NULL,
  "task_visibility" varchar(40) DEFAULT 'visible',
  "task_overdue_notification_sent" varchar(40) DEFAULT 'no',
  "task_recurring" varchar(40) DEFAULT 'no',
  "task_recurring_duration" int DEFAULT NULL,
  "task_recurring_period" varchar(30) DEFAULT NULL,
  "task_recurring_cycles" int DEFAULT NULL,
  "task_recurring_cycles_counter" int DEFAULT '0',
  "task_recurring_last" date DEFAULT NULL,
  "task_recurring_next" date DEFAULT NULL,
  "task_recurring_child" varchar(10) DEFAULT 'no',
  "task_recurring_parent_id" TIMESTAMP DEFAULT NULL,
  "task_recurring_copy_checklists" varchar(10) DEFAULT 'yes',
  "task_recurring_copy_files" varchar(10) DEFAULT 'yes',
  "task_recurring_automatically_assign" varchar(10) DEFAULT 'yes',
  "task_recurring_finished" varchar(10) DEFAULT 'no',
  "task_cloning_original_task_id" text,
  "task_cover_image" varchar(10) DEFAULT 'no',
  "task_cover_image_uniqueid" text,
  "task_cover_image_filename" text,
  "task_calendar_timezone" text,
  "task_calendar_location" text,
  "task_calendar_reminder" varchar(10) DEFAULT 'no',
  "task_calendar_reminder_duration" int DEFAULT NULL,
  "task_calendar_reminder_period" text,
  "task_calendar_reminder_sent" text,
  "task_calendar_reminder_date_sent" TIMESTAMP DEFAULT NULL,
  "task_custom_field_1" TEXT,
  "task_custom_field_2" TEXT,
  "task_custom_field_3" TEXT,
  "task_custom_field_4" TEXT,
  "task_custom_field_5" TEXT,
  "task_custom_field_6" TEXT,
  "task_custom_field_7" TEXT,
  "task_custom_field_8" TEXT,
  "task_custom_field_9" TEXT,
  "task_custom_field_10" TEXT,
  "task_custom_field_11" TIMESTAMP DEFAULT NULL,
  "task_custom_field_12" TIMESTAMP DEFAULT NULL,
  "task_custom_field_13" TIMESTAMP DEFAULT NULL,
  "task_custom_field_14" TIMESTAMP DEFAULT NULL,
  "task_custom_field_15" TIMESTAMP DEFAULT NULL,
  "task_custom_field_16" TIMESTAMP DEFAULT NULL,
  "task_custom_field_17" TIMESTAMP DEFAULT NULL,
  "task_custom_field_18" TIMESTAMP DEFAULT NULL,
  "task_custom_field_19" TIMESTAMP DEFAULT NULL,
  "task_custom_field_20" TIMESTAMP DEFAULT NULL,
  "task_custom_field_21" text,
  "task_custom_field_22" text,
  "task_custom_field_23" text,
  "task_custom_field_24" text,
  "task_custom_field_25" text,
  "task_custom_field_26" text,
  "task_custom_field_27" text,
  "task_custom_field_28" text,
  "task_custom_field_29" text,
  "task_custom_field_30" text,
  "task_custom_field_31" text,
  "task_custom_field_32" text,
  "task_custom_field_33" text,
  "task_custom_field_34" text,
  "task_custom_field_35" text,
  "task_custom_field_36" text,
  "task_custom_field_37" text,
  "task_custom_field_38" text,
  "task_custom_field_39" text,
  "task_custom_field_40" text,
  "task_custom_field_41" text,
  "task_custom_field_42" text,
  "task_custom_field_43" text,
  "task_custom_field_44" text,
  "task_custom_field_45" text,
  "task_custom_field_46" text,
  "task_custom_field_47" text,
  "task_custom_field_48" text,
  "task_custom_field_49" text,
  "task_custom_field_50" text,
  "task_custom_field_51" int DEFAULT NULL,
  "task_custom_field_52" int DEFAULT NULL,
  "task_custom_field_53" int DEFAULT NULL,
  "task_custom_field_54" int DEFAULT NULL,
  "task_custom_field_55" int DEFAULT NULL,
  "task_custom_field_56" int DEFAULT NULL,
  "task_custom_field_57" int DEFAULT NULL,
  "task_custom_field_58" int DEFAULT NULL,
  "task_custom_field_59" int DEFAULT NULL,
  "task_custom_field_60" int DEFAULT NULL,
  "task_custom_field_61" decimal(10,2) DEFAULT NULL,
  "task_custom_field_62" decimal(10,2) DEFAULT NULL,
  "task_custom_field_63" decimal(10,2) DEFAULT NULL,
  "task_custom_field_64" decimal(10,2) DEFAULT NULL,
  "task_custom_field_65" decimal(10,2) DEFAULT NULL,
  "task_custom_field_66" decimal(10,2) DEFAULT NULL,
  "task_custom_field_67" decimal(10,2) DEFAULT NULL,
  "task_custom_field_68" decimal(10,2) DEFAULT NULL,
  "task_custom_field_69" decimal(10,2) DEFAULT NULL,
  "task_custom_field_70" decimal(10,2) DEFAULT NULL,
  "taskresource_type" text,
  "taskresource_id" int DEFAULT NULL,
  "task_mapping_type" text,
  "task_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("task_id")
);

--
-- Dumping data for table "tasks"
--


--
-- Table structure for table "tasks_assigned"
--

DROP TABLE IF EXISTS "tasks_assigned";
CREATE TABLE "tasks_assigned" (
  "tasksassigned_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "tasksassigned_taskid" int NOT NULL,
  "tasksassigned_userid" int DEFAULT NULL,
  "tasksassigned_created" TIMESTAMP DEFAULT NULL,
  "tasksassigned_updated" TIMESTAMP DEFAULT NULL,
  PRIMARY KEY ("tasksassigned_id")
);

--
-- Dumping data for table "tasks_assigned"
--


--
-- Table structure for table "tasks_dependencies"
--

DROP TABLE IF EXISTS "tasks_dependencies";
CREATE TABLE "tasks_dependencies" (
  "tasksdependency_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "tasksdependency_created" int NOT NULL,
  "tasksdependency_updated" int NOT NULL,
  "tasksdependency_creatorid" int DEFAULT NULL,
  "tasksdependency_projectid" int DEFAULT NULL,
  "tasksdependency_clientid" int DEFAULT NULL,
  "tasksdependency_taskid" int DEFAULT NULL,
  "tasksdependency_blockerid" int DEFAULT NULL,
  "tasksdependency_type" varchar(100) DEFAULT NULL,
  "tasksdependency_status" varchar(100) DEFAULT 'active',
  PRIMARY KEY ("tasksdependency_id")
);

--
-- Dumping data for table "tasks_dependencies"
--


--
-- Table structure for table "tasks_priority"
--

DROP TABLE IF EXISTS "tasks_priority";
CREATE TABLE "tasks_priority" (
  "taskpriority_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "taskpriority_created" TIMESTAMP DEFAULT NULL,
  "taskpriority_creatorid" int DEFAULT NULL,
  "taskpriority_updated" TIMESTAMP DEFAULT NULL,
  "taskpriority_title" varchar(200) NOT NULL,
  "taskpriority_position" int NOT NULL,
  "taskpriority_color" varchar(100) NOT NULL DEFAULT 'default',
  "taskpriority_system_default" varchar(10) NOT NULL DEFAULT 'no',
  PRIMARY KEY ("taskpriority_id")
);

--
-- Dumping data for table "tasks_priority"
--


--
-- Table structure for table "tasks_status"
--

DROP TABLE IF EXISTS "tasks_status";
CREATE TABLE "tasks_status" (
  "taskstatus_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "taskstatus_created" TIMESTAMP DEFAULT NULL,
  "taskstatus_creatorid" int DEFAULT NULL,
  "taskstatus_updated" TIMESTAMP DEFAULT NULL,
  "taskstatus_title" varchar(200) NOT NULL,
  "taskstatus_position" int NOT NULL,
  "taskstatus_color" varchar(100) NOT NULL DEFAULT 'default',
  "taskstatus_system_default" varchar(10) NOT NULL DEFAULT 'no',
  PRIMARY KEY ("taskstatus_id")
);

--
-- Dumping data for table "tasks_status"
--


--
-- Table structure for table "tax"
--

DROP TABLE IF EXISTS "tax";
CREATE TABLE "tax" (
  "tax_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "tax_taxrateid" int NOT NULL,
  "tax_created" TIMESTAMP NOT NULL,
  "tax_updated" TIMESTAMP NOT NULL,
  "tax_name" varchar(100) DEFAULT NULL,
  "tax_rate" decimal(10,2) DEFAULT NULL,
  "tax_type" varchar(50) DEFAULT 'summary',
  "tax_lineitem_id" int DEFAULT NULL,
  "taxresource_type" varchar(50) DEFAULT NULL,
  "taxresource_id" int DEFAULT NULL,
  PRIMARY KEY ("tax_id")
);

--
-- Dumping data for table "tax"
--


--
-- Table structure for table "taxrates"
--

DROP TABLE IF EXISTS "taxrates";
CREATE TABLE "taxrates" (
  "taxrate_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "taxrate_uniqueid" varchar(200) NOT NULL,
  "taxrate_created" TIMESTAMP NOT NULL,
  "taxrate_updated" TIMESTAMP NOT NULL,
  "taxrate_creatorid" int NOT NULL,
  "taxrate_name" varchar(100) NOT NULL,
  "taxrate_value" decimal(10,2) NOT NULL,
  "taxrate_type" varchar(100) NOT NULL DEFAULT 'user',
  "taxrate_clientid" int DEFAULT NULL,
  "taxrate_estimateid" int DEFAULT NULL,
  "taxrate_invoiceid" int DEFAULT NULL,
  "taxrate_status" varchar(20) NOT NULL DEFAULT 'enabled',
  PRIMARY KEY ("taxrate_id")
);

--
-- Dumping data for table "taxrates"
--


--
-- Table structure for table "ticket_replies"
--

DROP TABLE IF EXISTS "ticket_replies";
CREATE TABLE "ticket_replies" (
  "ticketreply_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "ticketreply_created" TIMESTAMP NOT NULL,
  "ticketreply_updated" TIMESTAMP NOT NULL,
  "ticketreply_creatorid" int NOT NULL,
  "ticketreply_clientid" int DEFAULT NULL,
  "ticketreply_ticketid" int NOT NULL,
  "ticketreply_text" text NOT NULL,
  "ticketreply_source" varchar(10) NOT NULL DEFAULT 'web',
  "ticketreply_imap_sender_email_id" text NOT NULL,
  "ticketreply_type" varchar(10) NOT NULL DEFAULT 'reply',
  PRIMARY KEY ("ticketreply_id")
);

--
-- Dumping data for table "ticket_replies"
--


--
-- Table structure for table "tickets"
--

DROP TABLE IF EXISTS "tickets";
CREATE TABLE "tickets" (
  "ticket_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "ticket_created" TIMESTAMP DEFAULT NULL,
  "ticket_updated" TIMESTAMP DEFAULT NULL,
  "ticket_creatorid" int NOT NULL,
  "ticket_categoryid" int NOT NULL DEFAULT '9',
  "ticket_clientid" int DEFAULT NULL,
  "ticket_projectid" int DEFAULT NULL,
  "ticket_subject" varchar(250) DEFAULT NULL,
  "ticket_message" text,
  "ticket_priority" varchar(50) NOT NULL DEFAULT 'normal',
  "ticket_last_updated" TIMESTAMP DEFAULT NULL,
  "ticket_date_status_changed" TIMESTAMP DEFAULT NULL,
  "ticket_status" SMALLINT NOT NULL DEFAULT '1',
  "ticket_source" varchar(10) NOT NULL DEFAULT 'web',
  "ticket_active_state" varchar(20) DEFAULT 'active',
  "ticket_user_type" varchar(10) DEFAULT 'user',
  "ticket_imap_sender_email_address" text,
  "ticket_imap_sender_email_id" text,
  "ticket_imap_email_payload" text,
  "ticket_custom_field_1" TEXT,
  "ticket_custom_field_2" TEXT,
  "ticket_custom_field_3" TEXT,
  "ticket_custom_field_4" TEXT,
  "ticket_custom_field_5" TEXT,
  "ticket_custom_field_6" TEXT,
  "ticket_custom_field_7" TEXT,
  "ticket_custom_field_8" TEXT,
  "ticket_custom_field_9" TEXT,
  "ticket_custom_field_10" TEXT,
  "ticket_custom_field_11" TEXT,
  "ticket_custom_field_12" TEXT,
  "ticket_custom_field_13" TEXT,
  "ticket_custom_field_14" TEXT,
  "ticket_custom_field_15" TEXT,
  "ticket_custom_field_16" TEXT,
  "ticket_custom_field_17" TEXT,
  "ticket_custom_field_18" TEXT,
  "ticket_custom_field_19" TEXT,
  "ticket_custom_field_20" TEXT,
  "ticket_custom_field_21" TEXT,
  "ticket_custom_field_22" TEXT,
  "ticket_custom_field_23" TEXT,
  "ticket_custom_field_24" TEXT,
  "ticket_custom_field_25" TEXT,
  "ticket_custom_field_26" TEXT,
  "ticket_custom_field_27" TEXT,
  "ticket_custom_field_28" TEXT,
  "ticket_custom_field_29" TEXT,
  "ticket_custom_field_30" TEXT,
  "ticket_custom_field_31" TEXT,
  "ticket_custom_field_32" TEXT,
  "ticket_custom_field_33" TEXT,
  "ticket_custom_field_34" TEXT,
  "ticket_custom_field_35" TEXT,
  "ticket_custom_field_36" TEXT,
  "ticket_custom_field_37" TEXT,
  "ticket_custom_field_38" TEXT,
  "ticket_custom_field_39" TEXT,
  "ticket_custom_field_40" TEXT,
  "ticket_custom_field_41" TEXT,
  "ticket_custom_field_42" TEXT,
  "ticket_custom_field_43" TEXT,
  "ticket_custom_field_44" TEXT,
  "ticket_custom_field_45" TEXT,
  "ticket_custom_field_46" TEXT,
  "ticket_custom_field_47" TEXT,
  "ticket_custom_field_48" TEXT,
  "ticket_custom_field_49" TEXT,
  "ticket_custom_field_50" TEXT,
  "ticket_custom_field_51" TEXT,
  "ticket_custom_field_52" TEXT,
  "ticket_custom_field_53" TEXT,
  "ticket_custom_field_54" TEXT,
  "ticket_custom_field_55" TEXT,
  "ticket_custom_field_56" TEXT,
  "ticket_custom_field_57" TEXT,
  "ticket_custom_field_58" TEXT,
  "ticket_custom_field_59" TEXT,
  "ticket_custom_field_60" TEXT,
  "ticket_custom_field_61" TEXT,
  "ticket_custom_field_62" TEXT,
  "ticket_custom_field_63" TEXT,
  "ticket_custom_field_64" TEXT,
  "ticket_custom_field_65" TEXT,
  "ticket_custom_field_66" TEXT,
  "ticket_custom_field_67" TEXT,
  "ticket_custom_field_68" TEXT,
  "ticket_custom_field_69" TEXT,
  "ticket_custom_field_70" TEXT,
  "ticket_mapping_type" text,
  "ticket_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("ticket_id")
);

--
-- Dumping data for table "tickets"
--


--
-- Table structure for table "tickets_status"
--

DROP TABLE IF EXISTS "tickets_status";
CREATE TABLE "tickets_status" (
  "ticketstatus_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "ticketstatus_created" TIMESTAMP DEFAULT NULL,
  "ticketstatus_creatorid" int DEFAULT NULL,
  "ticketstatus_updated" TIMESTAMP DEFAULT NULL,
  "ticketstatus_title" varchar(200) NOT NULL,
  "ticketstatus_position" int NOT NULL,
  "ticketstatus_color" varchar(100) NOT NULL DEFAULT 'default',
  "ticketstatus_use_for_client_replied" varchar(10) NOT NULL DEFAULT 'no',
  "ticketstatus_use_for_team_replied" varchar(10) NOT NULL DEFAULT 'no',
  "ticketstatus_system_default" varchar(10) NOT NULL DEFAULT 'no',
  PRIMARY KEY ("ticketstatus_id")
);

--
-- Dumping data for table "tickets_status"
--


--
-- Table structure for table "timelines"
--

DROP TABLE IF EXISTS "timelines";
CREATE TABLE "timelines" (
  "timeline_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "timeline_eventid" int NOT NULL,
  "timeline_resourcetype" varchar(50) DEFAULT NULL,
  "timeline_resourceid" int DEFAULT NULL,
  "timeline_mapping_type" text,
  "timeline_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("timeline_id")
);

--
-- Dumping data for table "timelines"
--


--
-- Table structure for table "timers"
--

DROP TABLE IF EXISTS "timers";
CREATE TABLE "timers" (
  "timer_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "timer_created" TIMESTAMP DEFAULT NULL,
  "timer_updated" TIMESTAMP DEFAULT NULL,
  "timer_creatorid" int DEFAULT NULL,
  "timer_recorded_by" int DEFAULT NULL,
  "timer_started" int DEFAULT NULL,
  "timer_stopped" int DEFAULT '0',
  "timer_time" int DEFAULT '0',
  "timer_taskid" int DEFAULT NULL,
  "timer_projectid" int DEFAULT '0',
  "timer_clientid" int DEFAULT '0',
  "timer_status" varchar(20) DEFAULT 'running',
  "timer_billing_status" varchar(50) DEFAULT 'not_invoiced',
  "timer_billing_invoiceid" int DEFAULT NULL,
  "timer_mapping_type" text,
  "timer_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("timer_id")
);

--
-- Dumping data for table "timers"
--


--
-- Table structure for table "units"
--

DROP TABLE IF EXISTS "units";
CREATE TABLE "units" (
  "unit_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "unit_created" TIMESTAMP DEFAULT NULL,
  "unit_update" TIMESTAMP DEFAULT NULL,
  "unit_creatorid" int DEFAULT '1',
  "unit_name" varchar(50) NOT NULL,
  "unit_system_default" varchar(50) NOT NULL DEFAULT 'no',
  "unit_time_default" varchar(50) DEFAULT 'no',
  PRIMARY KEY ("unit_id")
);

--
-- Dumping data for table "units"
--


--
-- Table structure for table "updates"
--

DROP TABLE IF EXISTS "updates";
CREATE TABLE "updates" (
  "update_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "update_created" TIMESTAMP NOT NULL,
  "update_updated" TIMESTAMP NOT NULL,
  "update_version" decimal(10,2) DEFAULT NULL,
  "update_mysql_filename" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("update_id")
);

--
-- Dumping data for table "updates"
--


--
-- Table structure for table "updating"
--

DROP TABLE IF EXISTS "updating";
CREATE TABLE "updating" (
  "updating_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "updating_created" TIMESTAMP NOT NULL,
  "updating_updated" TIMESTAMP NOT NULL,
  "updating_type" varchar(100) NOT NULL,
  "updating_name" varchar(100) DEFAULT NULL,
  "updating_function_name" varchar(150) DEFAULT NULL,
  "updating_update_version" varchar(10) DEFAULT NULL,
  "updating_request_path" varchar(250) DEFAULT NULL,
  "updating_update_path" varchar(250) DEFAULT NULL,
  "updating_notes" TEXT,
  "updating_payload_1" text,
  "updating_payload_2" text,
  "updating_payload_3" text,
  "updating_started_date" TIMESTAMP DEFAULT NULL,
  "updating_completed_date" TIMESTAMP DEFAULT NULL,
  "updating_system_log" text,
  "updating_status" varchar(50) DEFAULT 'new',
  PRIMARY KEY ("updating_id")
);

--
-- Dumping data for table "updating"
--


--
-- Table structure for table "users"
--

DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "unique_id" text,
  "created" TIMESTAMP DEFAULT NULL,
  "updated" TIMESTAMP DEFAULT NULL,
  "deleted" TIMESTAMP DEFAULT NULL,
  "creatorid" int DEFAULT NULL,
  "email" text,
  "password" text NOT NULL,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "phone" text,
  "position" text,
  "clientid" int DEFAULT NULL,
  "account_owner" varchar(10) DEFAULT 'no',
  "primary_admin" varchar(10) DEFAULT 'no',
  "avatar_directory" text,
  "avatar_filename" text,
  "type" text NOT NULL,
  "status" varchar(20) DEFAULT 'active',
  "role_id" int NOT NULL DEFAULT '2',
  "last_seen" TIMESTAMP DEFAULT NULL,
  "theme" varchar(100) DEFAULT 'default',
  "last_ip_address" text,
  "social_facebook" text,
  "social_twitter" text,
  "social_linkedin" text,
  "social_github" text,
  "social_dribble" text,
  "pref_language" varchar(200) DEFAULT 'english',
  "pref_email_notifications" varchar(10) DEFAULT 'yes',
  "pref_leftmenu_position" varchar(50) DEFAULT 'collapsed',
  "pref_statspanel_position" varchar(50) DEFAULT 'collapsed',
  "pref_filter_own_tasks" varchar(50) DEFAULT 'no',
  "pref_hide_completed_tasks" varchar(50) DEFAULT 'no',
  "pref_filter_own_projects" varchar(50) DEFAULT 'no',
  "pref_filter_show_archived_projects" varchar(50) DEFAULT 'no',
  "pref_filter_show_archived_tasks" varchar(50) DEFAULT 'no',
  "pref_filter_show_archived_leads" varchar(50) DEFAULT 'no',
  "pref_filter_show_archived_tickets" varchar(50) DEFAULT 'no',
  "pref_filter_own_leads" varchar(50) DEFAULT 'no',
  "pref_view_tasks_layout" varchar(50) DEFAULT 'kanban',
  "pref_view_leads_layout" varchar(50) DEFAULT 'kanban',
  "pref_view_projects_layout" varchar(50) DEFAULT 'list',
  "pref_theme" varchar(100) DEFAULT 'default',
  "pref_calendar_dates_projects" varchar(30) DEFAULT 'due',
  "pref_calendar_dates_tasks" varchar(30) DEFAULT 'due',
  "pref_calendar_dates_events" varchar(30) DEFAULT 'due',
  "pref_calendar_view" varchar(30) DEFAULT 'own',
  "remember_token" text,
  "remember_filters_tickets_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_tickets_payload" text,
  "remember_filters_projects_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_projects_payload" text,
  "remember_filters_invoices_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_invoices_payload" text,
  "remember_filters_estimates_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_estimates_payload" text,
  "remember_filters_contracts_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_contracts_payload" text,
  "remember_filters_payments_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_payments_payload" text,
  "remember_filters_proposals_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_proposals_payload" text,
  "remember_filters_clients_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_clients_payload" text,
  "remember_filters_leads_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_leads_payload" text,
  "remember_filters_tasks_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_tasks_payload" text,
  "remember_filters_subscriptions_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_subscriptions_payload" text,
  "remember_filters_products_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_products_payload" text,
  "remember_filters_expenses_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_expenses_payload" text,
  "remember_filters_timesheets_status" varchar(20) DEFAULT 'disabled',
  "remember_filters_timesheets_payload" text,
  "forgot_password_token" text,
  "forgot_password_token_expiry" TIMESTAMP DEFAULT NULL,
  "force_password_change" varchar(10) DEFAULT 'no',
  "notifications_system" varchar(10) DEFAULT 'no''no'' actual values must be set in the settings config file',
  "notifications_new_project" varchar(10) DEFAULT 'no',
  "notifications_projects_activity" varchar(10) DEFAULT 'no',
  "notifications_billing_activity" varchar(10) DEFAULT 'no',
  "notifications_new_assignement" varchar(10) DEFAULT 'no',
  "notifications_leads_activity" varchar(10) DEFAULT 'no',
  "notifications_tasks_activity" varchar(10) DEFAULT 'no',
  "notifications_tickets_activity" varchar(10) DEFAULT 'no',
  "notifications_reminders" varchar(10) DEFAULT 'yes_email',
  "dashboard_access" varchar(150) DEFAULT 'yes',
  "welcome_email_sent" varchar(150) DEFAULT 'no',
  "space_uniqueid" text,
  "timezone" text,
  "gateways_stripe_customer_id" text,
  "gateways_paypal_customer_id" text,
  "gateways_square_customer_id" text,
  "gateways_braintree_customer_id" text,
  "gateways_authorize_net_customer_id" text,
  "gateways_adyen_customer_id" text,
  "gateways_worldpay_customer_id" text,
  "gateways_checkout_com_customer_id" text,
  "gateways_2checkout_customer_id" text,
  "gateways_lemonsqueezy_customer_id" text,
  "gateways_paddle_customer_id" text,
  "gateways_gumroad_customer_id" text,
  "gateways_fastspring_customer_id" text,
  "gateways_razorpay_customer_id" text,
  "gateways_paytm_customer_id" text,
  "gateways_phonepe_customer_id" text,
  "gateways_ccavenue_customer_id" text,
  "gateways_billdesk_customer_id" text,
  "gateways_cashfree_customer_id" text,
  "gateways_flutterwave_customer_id" text,
  "gateways_paystack_customer_id" text,
  "gateways_pesapal_customer_id" text,
  "gateways_dpo_customer_id" text,
  "gateways_payfast_customer_id" text,
  "gateways_mercadopago_customer_id" text,
  "gateways_pagseguro_customer_id" text,
  "gateways_stone_customer_id" text,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table "users"
--


--
-- Table structure for table "webforms"
--

DROP TABLE IF EXISTS "webforms";
CREATE TABLE "webforms" (
  "webform_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "webform_uniqueid" varchar(100) DEFAULT NULL,
  "webform_created" TIMESTAMP NOT NULL,
  "webform_updated" TIMESTAMP NOT NULL,
  "webform_creatorid" int NOT NULL,
  "webform_title" varchar(100) DEFAULT NULL,
  "webform_type" varchar(100) DEFAULT NULL,
  "webform_builder_payload" text,
  "webform_thankyou_message" text,
  "webform_notify_assigned" varchar(10) DEFAULT 'no',
  "webform_notify_admin" varchar(10) DEFAULT 'no',
  "webform_submissions" SMALLINT DEFAULT '0',
  "webform_user_captcha" varchar(10) DEFAULT 'no',
  "webform_submit_button_text" varchar(100) DEFAULT NULL,
  "webform_background_color" varchar(100) DEFAULT '#FFFFFF',
  "webform_lead_title" varchar(100) DEFAULT NULL,
  "webform_lead_status" int DEFAULT '1',
  "webform_style_css" text,
  "webform_recaptcha" varchar(15) DEFAULT 'disabled',
  "webform_status" varchar(100) DEFAULT 'enabled',
  "webform_mapping_type" text,
  "webform_mapping_id" int DEFAULT NULL,
  PRIMARY KEY ("webform_id")
);

--
-- Dumping data for table "webforms"
--


--
-- Table structure for table "webforms_assigned"
--

DROP TABLE IF EXISTS "webforms_assigned";
CREATE TABLE "webforms_assigned" (
  "webformassigned_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "webformassigned_created" TIMESTAMP NOT NULL,
  "webformassigned_updated" TIMESTAMP NOT NULL,
  "webformassigned_formid" int DEFAULT NULL,
  "webformassigned_userid" int DEFAULT NULL,
  PRIMARY KEY ("webformassigned_id")
);

--
-- Dumping data for table "webforms_assigned"
--


--
-- Table structure for table "webhooks"
--

DROP TABLE IF EXISTS "webhooks";
CREATE TABLE "webhooks" (
  "webhooks_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "webhooks_created" TIMESTAMP NOT NULL,
  "webhooks_updated" TIMESTAMP NOT NULL,
  "webhooks_creatorid" int DEFAULT '0',
  "webhooks_gateway_name" varchar(100) DEFAULT NULL,
  "webhooks_type" varchar(100) DEFAULT NULL,
  "webhooks_payment_type" varchar(30) DEFAULT NULL,
  "webhooks_payment_amount" decimal(10,2) DEFAULT NULL,
  "webhooks_payment_transactionid" varchar(150) DEFAULT NULL,
  "webhooks_matching_reference" varchar(100) DEFAULT NULL,
  "webhooks_matching_attribute" varchar(100) DEFAULT NULL,
  "webhooks_payload" text,
  "webhooks_comment" text,
  "webhooks_started_at" TIMESTAMP DEFAULT NULL,
  "webhooks_completed_at" TIMESTAMP DEFAULT NULL,
  "webhooks_attempts" SMALLINT DEFAULT '0',
  "webhooks_status" varchar(20) DEFAULT 'new',
  PRIMARY KEY ("webhooks_id")
);

--
-- Dumping data for table "webhooks"
--


--
-- Table structure for table "webmail_templates"
--

DROP TABLE IF EXISTS "webmail_templates";
CREATE TABLE "webmail_templates" (
  "webmail_template_id" int NOT NULL GENERATED ALWAYS AS IDENTITY,
  "webmail_template_created" TIMESTAMP NOT NULL,
  "webmail_template_updated" TIMESTAMP NOT NULL,
  "webmail_template_creatorid" int NOT NULL,
  "webmail_template_name" varchar(150) DEFAULT NULL,
  "webmail_template_body" text,
  "webmail_template_type" text,
  PRIMARY KEY ("webmail_template_id")
);

--
-- Dumping data for table "webmail_templates"
--



-- Dump completed on 2026-02-25  2:44:51

