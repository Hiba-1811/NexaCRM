-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: temp_crm
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `attachment_id` int NOT NULL AUTO_INCREMENT,
  `attachment_uniqiueid` varchar(100) NOT NULL,
  `attachment_created` datetime DEFAULT NULL,
  `attachment_updated` datetime DEFAULT NULL,
  `attachment_creatorid` int NOT NULL,
  `attachment_clientid` int DEFAULT NULL COMMENT 'optional',
  `attachment_directory` varchar(100) NOT NULL,
  `attachment_filename` varchar(250) NOT NULL,
  `attachment_extension` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(20) DEFAULT NULL COMMENT 'image | file',
  `attachment_size` varchar(30) DEFAULT NULL COMMENT 'Human readable file size',
  `attachment_thumbname` varchar(250) DEFAULT NULL COMMENT 'optional for images',
  `attachmentresource_type` varchar(50) NOT NULL COMMENT '[polymorph] task | expense | ticket | ticketreply',
  `attachmentresource_id` int NOT NULL COMMENT '[polymorph] e.g ticket_id',
  PRIMARY KEY (`attachment_id`),
  KEY `attachment_clientid` (`attachment_clientid`),
  KEY `attachment_creatorid` (`attachment_creatorid`),
  KEY `attachmentresource_id` (`attachmentresource_id`),
  KEY `attachmentresource_type` (`attachmentresource_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_assigned`
--

DROP TABLE IF EXISTS `automation_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automation_assigned` (
  `automationassigned_id` int NOT NULL AUTO_INCREMENT,
  `automationassigned_created` datetime DEFAULT NULL,
  `automationassigned_updated` int DEFAULT NULL,
  `automationassigned_userid` int DEFAULT NULL,
  `automationassigned_resource_type` varchar(150) DEFAULT NULL COMMENT 'estimate|product_task',
  `automationassigned_resource_id` int DEFAULT NULL COMMENT 'use ID 0, for system default users',
  PRIMARY KEY (`automationassigned_id`),
  KEY `automationassigned_resource_id` (`automationassigned_resource_id`),
  KEY `automationassigned_resource_type` (`automationassigned_resource_type`),
  KEY `automationassigned_userid` (`automationassigned_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_assigned`
--

LOCK TABLES `automation_assigned` WRITE;
/*!40000 ALTER TABLE `automation_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `automation_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events`
--

DROP TABLE IF EXISTS `calendar_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_events` (
  `calendar_event_id` int NOT NULL AUTO_INCREMENT,
  `calendar_event_uniqueid` varchar(100) DEFAULT NULL,
  `calendar_event_created` datetime NOT NULL,
  `calendar_event_updated` datetime NOT NULL,
  `calendar_event_creatorid` int DEFAULT NULL,
  `calendar_event_title` varchar(200) DEFAULT NULL,
  `calendar_event_description` text,
  `calendar_event_location` text,
  `calendar_event_all_day` varchar(50) DEFAULT 'yes' COMMENT 'yes|no',
  `calendar_event_start_date` date DEFAULT NULL,
  `calendar_event_start_time` time DEFAULT NULL,
  `calendar_event_end_date` date DEFAULT NULL,
  `calendar_event_end_time` time DEFAULT NULL,
  `calendar_event_sharing` varchar(100) DEFAULT 'self' COMMENT 'myself|whole-team|selected-users',
  `calendar_event_reminder` varchar(100) DEFAULT 'no' COMMENT 'yes|no',
  `calendar_event_reminder_sent` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  `calendar_event_timezoe` text COMMENT 'timezone used in the dates',
  `calendar_event_reminder_date_sent` datetime DEFAULT NULL,
  `calendar_event_reminder_duration` int DEFAULT NULL,
  `calendar_event_reminder_period` text COMMENT 'optional - e.g 1 for 1 day',
  `calendar_event_colour` varchar(50) DEFAULT NULL COMMENT 'optional - hour| day | week | month | year',
  PRIMARY KEY (`calendar_event_id`),
  KEY `calendar_event_all_day` (`calendar_event_all_day`),
  KEY `calendar_event_creatorid` (`calendar_event_creatorid`),
  KEY `calendar_event_reminder_sent` (`calendar_event_reminder_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events`
--

LOCK TABLES `calendar_events` WRITE;
/*!40000 ALTER TABLE `calendar_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_events_sharing`
--

DROP TABLE IF EXISTS `calendar_events_sharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_events_sharing` (
  `calendarsharing_id` int NOT NULL AUTO_INCREMENT COMMENT '[truncate]',
  `calendarsharing_created` datetime DEFAULT NULL,
  `calendarsharing_updated` datetime DEFAULT NULL,
  `calendarsharing_eventid` int NOT NULL,
  `calendarsharing_userid` int DEFAULT NULL,
  PRIMARY KEY (`calendarsharing_id`),
  KEY `calendarassigned_eventid` (`calendarsharing_eventid`),
  KEY `calendarassigned_userid` (`calendarsharing_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_events_sharing`
--

LOCK TABLES `calendar_events_sharing` WRITE;
/*!40000 ALTER TABLE `calendar_events_sharing` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_events_sharing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canned`
--

DROP TABLE IF EXISTS `canned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canned` (
  `canned_id` int NOT NULL AUTO_INCREMENT,
  `canned_created` datetime NOT NULL,
  `canned_updated` datetime NOT NULL,
  `canned_creatorid` int DEFAULT NULL,
  `canned_categoryid` int DEFAULT NULL,
  `canned_title` varchar(250) DEFAULT NULL,
  `canned_message` text,
  `canned_visibility` varchar(20) DEFAULT 'public' COMMENT 'public|private',
  PRIMARY KEY (`canned_id`),
  KEY `canned_categoryid` (`canned_categoryid`),
  KEY `canned_creatorid` (`canned_creatorid`),
  KEY `canned_visibility` (`canned_visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canned`
--

LOCK TABLES `canned` WRITE;
/*!40000 ALTER TABLE `canned` DISABLE KEYS */;
/*!40000 ALTER TABLE `canned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canned_recently_used`
--

DROP TABLE IF EXISTS `canned_recently_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canned_recently_used` (
  `cannedrecent_id` int NOT NULL AUTO_INCREMENT,
  `cannedrecent_created` datetime NOT NULL,
  `cannedrecent_updated` datetime NOT NULL,
  `cannedrecent_userid` int NOT NULL,
  `cannedrecent_cannedid` int NOT NULL,
  PRIMARY KEY (`cannedrecent_id`),
  KEY `cannedrecent_userid` (`cannedrecent_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canned_recently_used`
--

LOCK TABLES `canned_recently_used` WRITE;
/*!40000 ALTER TABLE `canned_recently_used` DISABLE KEYS */;
/*!40000 ALTER TABLE `canned_recently_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '[do not truncate] - only delete where category_system_default = no',
  `category_uniqueid` varchar(100) NOT NULL,
  `category_created` datetime DEFAULT NULL,
  `category_updated` datetime DEFAULT NULL,
  `category_creatorid` int DEFAULT NULL,
  `category_name` varchar(150) DEFAULT NULL,
  `category_description` varchar(150) DEFAULT NULL COMMENT 'optional (mainly used by knowledge base)',
  `category_system_default` varchar(20) DEFAULT 'no' COMMENT 'yes | no (system default cannot be deleted)',
  `category_visibility` varchar(20) DEFAULT 'everyone' COMMENT 'everyone | team | client (mainly used by knowledge base)',
  `category_icon` varchar(100) DEFAULT 'sl-icon-docs' COMMENT 'optional (mainly used by knowledge base)',
  `category_type` varchar(50) NOT NULL COMMENT 'project | client | contract | expense | invoice | lead | ticket | item| estimate | knowledgebase',
  `category_slug` varchar(250) NOT NULL,
  `category_meta_1` int DEFAULT NULL COMMENT 'optional custom data',
  `category_meta_2` datetime DEFAULT NULL COMMENT 'optional custom data',
  `category_meta_3` datetime DEFAULT NULL COMMENT 'optional custom data',
  `category_meta_4` text COMMENT 'optional custom data',
  `category_meta_5` text COMMENT 'optional custom data',
  `category_meta_6` text COMMENT 'optional custom data',
  `category_meta_7` text COMMENT 'optional custom data',
  `category_meta_8` text COMMENT 'optional custom data',
  `category_meta_9` text COMMENT 'optional custom data',
  `category_meta_10` text COMMENT 'optional custom data',
  `category_meta_11` text COMMENT 'optional custom data',
  `category_meta_12` text COMMENT 'optional custom data',
  `category_meta_13` text COMMENT 'optional custom data',
  `category_meta_14` text COMMENT 'optional custom data',
  `category_meta_15` text COMMENT 'optional custom data',
  `category_meta_16` text COMMENT 'optional custom data',
  `category_meta_17` text COMMENT 'optional custom data',
  `category_meta_18` text COMMENT 'optional custom data',
  `category_meta_19` text COMMENT 'optional custom data',
  `category_meta_20` text COMMENT 'optional custom data',
  `category_meta_22` timestamp NULL DEFAULT NULL COMMENT 'optional custom data',
  `category_meta_21` timestamp NULL DEFAULT NULL,
  `category_meta_23` int DEFAULT '0',
  `category_meta_24` int DEFAULT '0',
  `category_meta_25` int DEFAULT '0',
  `category_meta_26` int DEFAULT '0',
  PRIMARY KEY (`category_id`),
  KEY `category_type` (`category_type`),
  KEY `category_creatorid` (`category_creatorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[do not truncate][system defaults] - 1=project,2=client,3lead,4=invoice,5=estimate,6=contract,7=expense,8=item,9=ticket, 10=knowledgebase, 11=proposa, -1=cannedl';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_users`
--

DROP TABLE IF EXISTS `category_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_users` (
  `categoryuser_id` int NOT NULL AUTO_INCREMENT,
  `categoryuser_categoryid` int NOT NULL,
  `categoryuser_userid` int NOT NULL,
  `categoryuser_created` datetime NOT NULL,
  `categoryuser_updated` datetime NOT NULL,
  PRIMARY KEY (`categoryuser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_users`
--

LOCK TABLES `category_users` WRITE;
/*!40000 ALTER TABLE `category_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklists`
--

DROP TABLE IF EXISTS `checklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklists` (
  `checklist_id` int NOT NULL AUTO_INCREMENT,
  `checklist_position` int NOT NULL,
  `checklist_created` datetime NOT NULL,
  `checklist_updated` datetime NOT NULL,
  `checklist_creatorid` int NOT NULL,
  `checklist_clientid` int DEFAULT NULL,
  `checklist_text` text NOT NULL,
  `checklist_status` varchar(250) NOT NULL DEFAULT 'pending' COMMENT 'pending | completed',
  `checklistresource_type` varchar(50) NOT NULL,
  `checklistresource_id` int NOT NULL,
  `checklist_mapping_type` text,
  `checklist_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`checklist_id`),
  KEY `checklistresource_type` (`checklistresource_type`),
  KEY `checklistresource_id` (`checklistresource_id`),
  KEY `checklist_creatorid` (`checklist_creatorid`),
  KEY `checklist_clientid` (`checklist_clientid`),
  KEY `checklist_status` (`checklist_status`),
  KEY `checklist_position` (`checklist_position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklists`
--

LOCK TABLES `checklists` WRITE;
/*!40000 ALTER TABLE `checklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `client_importid` varchar(100) DEFAULT NULL,
  `client_created` datetime DEFAULT NULL,
  `client_updated` datetime DEFAULT NULL,
  `client_creatorid` int NOT NULL,
  `client_created_from_leadid` int NOT NULL COMMENT 'the lead that the customer was created from',
  `client_categoryid` int DEFAULT '2' COMMENT 'default category',
  `client_company_name` varchar(150) NOT NULL,
  `client_description` text,
  `client_phone` varchar(50) DEFAULT NULL,
  `client_logo_folder` varchar(50) DEFAULT NULL,
  `client_logo_filename` varchar(50) DEFAULT NULL,
  `client_website` varchar(250) DEFAULT NULL,
  `client_vat` varchar(50) DEFAULT NULL,
  `client_billing_street` varchar(200) DEFAULT NULL,
  `client_billing_city` varchar(100) DEFAULT NULL,
  `client_billing_state` varchar(100) DEFAULT NULL,
  `client_billing_zip` varchar(50) DEFAULT NULL,
  `client_billing_country` varchar(100) DEFAULT NULL,
  `client_shipping_street` varchar(250) DEFAULT NULL,
  `client_shipping_city` varchar(100) DEFAULT NULL,
  `client_shipping_state` varchar(100) DEFAULT NULL,
  `client_shipping_zip` varchar(50) DEFAULT NULL,
  `client_shipping_country` varchar(100) DEFAULT NULL,
  `client_status` varchar(50) NOT NULL DEFAULT 'active' COMMENT 'active|suspended',
  `client_app_modules` varchar(50) DEFAULT 'system' COMMENT 'system|custom',
  `client_settings_modules_projects` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `client_settings_modules_invoices` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `client_settings_modules_payments` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `client_settings_modules_knowledgebase` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `client_settings_modules_estimates` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `client_settings_modules_subscriptions` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `client_settings_modules_tickets` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `client_import_first_name` varchar(100) DEFAULT NULL COMMENT 'used during import',
  `client_import_last_name` varchar(100) DEFAULT NULL COMMENT 'used during import',
  `client_import_email` varchar(100) DEFAULT NULL COMMENT 'used during import',
  `client_import_job_title` varchar(100) DEFAULT NULL COMMENT 'used during import',
  `client_custom_field_1` tinytext,
  `client_custom_field_2` tinytext,
  `client_custom_field_3` tinytext,
  `client_custom_field_4` tinytext,
  `client_custom_field_5` tinytext,
  `client_custom_field_6` tinytext,
  `client_custom_field_7` tinytext,
  `client_custom_field_8` tinytext,
  `client_custom_field_9` tinytext,
  `client_custom_field_10` tinytext,
  `client_custom_field_11` datetime DEFAULT NULL,
  `client_custom_field_12` datetime DEFAULT NULL,
  `client_custom_field_13` datetime DEFAULT NULL,
  `client_custom_field_14` datetime DEFAULT NULL,
  `client_custom_field_15` datetime DEFAULT NULL,
  `client_custom_field_16` datetime DEFAULT NULL,
  `client_custom_field_17` datetime DEFAULT NULL,
  `client_custom_field_18` datetime DEFAULT NULL,
  `client_custom_field_19` datetime DEFAULT NULL,
  `client_custom_field_20` datetime DEFAULT NULL,
  `client_custom_field_21` text,
  `client_custom_field_22` text,
  `client_custom_field_23` text,
  `client_custom_field_24` text,
  `client_custom_field_25` text,
  `client_custom_field_26` text,
  `client_custom_field_27` text,
  `client_custom_field_28` text,
  `client_custom_field_29` text,
  `client_custom_field_30` text,
  `client_custom_field_31` varchar(20) DEFAULT NULL,
  `client_custom_field_32` varchar(20) DEFAULT NULL,
  `client_custom_field_33` varchar(20) DEFAULT NULL,
  `client_custom_field_34` varchar(20) DEFAULT NULL,
  `client_custom_field_35` varchar(20) DEFAULT NULL,
  `client_custom_field_36` varchar(20) DEFAULT NULL,
  `client_custom_field_37` varchar(20) DEFAULT NULL,
  `client_custom_field_38` varchar(20) DEFAULT NULL,
  `client_custom_field_39` varchar(20) DEFAULT NULL,
  `client_custom_field_40` varchar(20) DEFAULT NULL,
  `client_custom_field_41` varchar(150) DEFAULT NULL,
  `client_custom_field_42` varchar(150) DEFAULT NULL,
  `client_custom_field_43` varchar(150) DEFAULT NULL,
  `client_custom_field_44` varchar(150) DEFAULT NULL,
  `client_custom_field_45` varchar(150) DEFAULT NULL,
  `client_custom_field_46` varchar(150) DEFAULT NULL,
  `client_custom_field_47` varchar(150) DEFAULT NULL,
  `client_custom_field_48` varchar(150) DEFAULT NULL,
  `client_custom_field_49` varchar(150) DEFAULT NULL,
  `client_custom_field_50` varchar(150) DEFAULT NULL,
  `client_custom_field_51` int DEFAULT NULL,
  `client_custom_field_52` int DEFAULT NULL,
  `client_custom_field_53` int DEFAULT NULL,
  `client_custom_field_54` int DEFAULT NULL,
  `client_custom_field_55` int DEFAULT NULL,
  `client_custom_field_56` int DEFAULT NULL,
  `client_custom_field_57` int DEFAULT NULL,
  `client_custom_field_58` int DEFAULT NULL,
  `client_custom_field_59` int DEFAULT NULL,
  `client_custom_field_60` int DEFAULT NULL,
  `client_custom_field_61` decimal(10,2) DEFAULT NULL,
  `client_custom_field_62` decimal(10,2) DEFAULT NULL,
  `client_custom_field_63` decimal(10,2) DEFAULT NULL,
  `client_custom_field_64` decimal(10,2) DEFAULT NULL,
  `client_custom_field_65` decimal(10,2) DEFAULT NULL,
  `client_custom_field_66` decimal(10,2) DEFAULT NULL,
  `client_custom_field_67` decimal(10,2) DEFAULT NULL,
  `client_custom_field_68` decimal(10,2) DEFAULT NULL,
  `client_custom_field_69` decimal(10,2) DEFAULT NULL,
  `client_custom_field_70` decimal(10,2) DEFAULT NULL,
  `client_billing_invoice_terms` text,
  `client_billing_invoice_due_days` smallint DEFAULT NULL,
  `client_mapping_type` text,
  `client_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `client_creatorid` (`client_creatorid`),
  KEY `client_categoryid` (`client_categoryid`),
  KEY `client_status` (`client_status`),
  KEY `client_created_from_leadid` (`client_created_from_leadid`),
  KEY `client_app_modules` (`client_app_modules`),
  KEY `client_importid` (`client_importid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment_created` datetime DEFAULT NULL,
  `comment_updated` datetime DEFAULT NULL,
  `comment_creatorid` int NOT NULL,
  `comment_clientid` int DEFAULT NULL COMMENT 'required for client type resources',
  `comment_text` text NOT NULL,
  `comment_client_status` varchar(20) DEFAULT 'unread' COMMENT 'read|unread',
  `comment_team_status` varchar(20) DEFAULT 'unread' COMMENT 'read|unread',
  `commentresource_type` varchar(50) NOT NULL COMMENT '[polymorph] project | ticket | task | lead',
  `commentresource_id` int NOT NULL COMMENT '[polymorph] e.g project_id',
  `comment_mapping_type` text,
  `comment_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_creatorid` (`comment_creatorid`),
  KEY `comment_clientid` (`comment_clientid`),
  KEY `commentresource_type` (`commentresource_type`),
  KEY `commentresource_id` (`commentresource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_templates`
--

DROP TABLE IF EXISTS `contract_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_templates` (
  `contract_template_id` int NOT NULL AUTO_INCREMENT,
  `contract_template_created` datetime NOT NULL,
  `contract_template_updated` datetime NOT NULL,
  `contract_template_creatorid` int DEFAULT NULL,
  `contract_template_title` varchar(250) DEFAULT NULL,
  `contract_template_heading_color` varchar(30) DEFAULT '#7493a9',
  `contract_template_title_color` varchar(30) DEFAULT '#7493a9',
  `contract_template_body` text,
  `contract_template_system` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  PRIMARY KEY (`contract_template_id`),
  KEY `contract_template_creatorid` (`contract_template_creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_templates`
--

LOCK TABLES `contract_templates` WRITE;
/*!40000 ALTER TABLE `contract_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `doc_id` int NOT NULL AUTO_INCREMENT,
  `doc_unique_id` varchar(150) DEFAULT NULL,
  `doc_template` varchar(150) DEFAULT NULL COMMENT 'default',
  `doc_created` datetime NOT NULL,
  `doc_updated` datetime NOT NULL,
  `doc_date_status_change` datetime NOT NULL,
  `doc_creatorid` int NOT NULL COMMENT 'use ( -1 ) for logged out user.',
  `doc_categoryid` int DEFAULT '11' COMMENT '11 is the default category',
  `doc_heading` varchar(250) DEFAULT '#7493a9' COMMENT 'e.g. contract',
  `doc_heading_color` varchar(30) DEFAULT '#7493a9',
  `doc_title` varchar(250) DEFAULT NULL,
  `doc_title_color` varchar(30) DEFAULT NULL,
  `doc_hero_direcory` varchar(250) DEFAULT NULL,
  `doc_hero_filename` varchar(250) DEFAULT NULL,
  `doc_hero_updated` varchar(250) DEFAULT 'no' COMMENT 'ys|no (when no, we use default image path)',
  `doc_body` text,
  `doc_date_start` date DEFAULT NULL COMMENT 'Proposal Issue Date | Contract Start Date',
  `doc_date_end` date DEFAULT NULL COMMENT 'Proposal Expiry Date | Contract End Date',
  `doc_date_published` date DEFAULT NULL,
  `doc_date_last_emailed` datetime DEFAULT NULL,
  `doc_value` decimal(10,2) DEFAULT NULL,
  `doc_client_id` int DEFAULT NULL,
  `doc_project_id` int DEFAULT NULL,
  `doc_lead_id` int DEFAULT NULL,
  `doc_notes` text,
  `doc_viewed` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  `doc_type` varchar(150) DEFAULT 'contract',
  `doc_system_type` varchar(150) DEFAULT 'document' COMMENT 'document|template',
  `doc_provider_signed_userid` int DEFAULT NULL,
  `doc_provider_signed_date` datetime DEFAULT NULL,
  `doc_provider_signed_first_name` varchar(150) DEFAULT NULL,
  `doc_provider_signed_last_name` varchar(150) DEFAULT NULL,
  `doc_provider_signed_signature_directory` varchar(150) DEFAULT NULL,
  `doc_provider_signed_signature_filename` varchar(150) DEFAULT NULL,
  `doc_provider_signed_ip_address` varchar(150) DEFAULT NULL,
  `doc_provider_signed_status` varchar(50) DEFAULT 'unsigned' COMMENT 'signed|unsigned',
  `doc_signed_userid` int DEFAULT NULL,
  `doc_signed_date` datetime DEFAULT NULL,
  `doc_signed_first_name` varchar(150) DEFAULT NULL,
  `doc_signed_last_name` varchar(150) DEFAULT NULL,
  `doc_signed_signature_directory` varchar(150) DEFAULT NULL,
  `doc_signed_signature_filename` varchar(150) DEFAULT NULL,
  `doc_signed_status` varchar(50) DEFAULT 'unsigned' COMMENT 'signed|unsigned',
  `doc_signed_ip_address` varchar(150) DEFAULT NULL,
  `doc_fallback_client_first_name` varchar(150) DEFAULT NULL COMMENT 'used for creating events when users are not logged in',
  `doc_fallback_client_last_name` varchar(150) DEFAULT NULL COMMENT 'used for creating events when users are not logged in',
  `doc_fallback_client_email` varchar(150) DEFAULT NULL COMMENT 'used for creating events when users are not logged in',
  `doc_status` varchar(100) DEFAULT 'draft' COMMENT 'draft|awaiting_signatures|active|expired',
  `docresource_type` varchar(100) DEFAULT NULL COMMENT 'client|lead',
  `docresource_id` int DEFAULT NULL,
  `doc_publishing_type` varchar(20) DEFAULT 'instant' COMMENT 'instant|scheduled',
  `doc_publishing_scheduled_date` datetime DEFAULT NULL,
  `doc_publishing_scheduled_status` text COMMENT 'pending|published|failed',
  `doc_publishing_scheduled_log` text,
  `contract_mapping_type` text,
  `contract_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_affiliate_earnings`
--

DROP TABLE IF EXISTS `cs_affiliate_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_affiliate_earnings` (
  `cs_affiliate_earning_id` int NOT NULL AUTO_INCREMENT,
  `cs_affiliate_earning_created` datetime NOT NULL,
  `cs_affiliate_earning_updated` datetime NOT NULL,
  `cs_affiliate_earning_projectid` int NOT NULL COMMENT '[cs_affiliate_projects] table id',
  `cs_affiliate_earning_invoiceid` int NOT NULL,
  `cs_affiliate_earning_invoice_payment_date` datetime DEFAULT NULL,
  `cs_affiliate_earning_commission_approval_date` datetime DEFAULT NULL,
  `cs_affiliate_earning_affiliateid` int NOT NULL,
  `cs_affiliate_earning_amount` decimal(10,2) NOT NULL,
  `cs_affiliate_earning_commission_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'set at the time of invoice payment',
  `cs_affiliate_earning_status` varchar(30) NOT NULL DEFAULT 'pending' COMMENT 'paid|pending',
  PRIMARY KEY (`cs_affiliate_earning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_affiliate_earnings`
--

LOCK TABLES `cs_affiliate_earnings` WRITE;
/*!40000 ALTER TABLE `cs_affiliate_earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_affiliate_earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_affiliate_projects`
--

DROP TABLE IF EXISTS `cs_affiliate_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_affiliate_projects` (
  `cs_affiliate_project_id` int NOT NULL AUTO_INCREMENT,
  `cs_affiliate_project_created` int NOT NULL,
  `cs_affiliate_project_updated` int NOT NULL,
  `cs_affiliate_project_creatorid` int NOT NULL,
  `cs_affiliate_project_affiliateid` int NOT NULL,
  `cs_affiliate_project_projectid` int NOT NULL,
  `cs_affiliate_project_commission_rate` decimal(10,2) DEFAULT NULL,
  `cs_affiliate_project_status` varchar(100) DEFAULT 'active' COMMENT 'active|suspended',
  PRIMARY KEY (`cs_affiliate_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_affiliate_projects`
--

LOCK TABLES `cs_affiliate_projects` WRITE;
/*!40000 ALTER TABLE `cs_affiliate_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_affiliate_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_events`
--

DROP TABLE IF EXISTS `cs_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_events` (
  `cs_event_id` int NOT NULL AUTO_INCREMENT,
  `cs_event_created` date NOT NULL,
  `cs_event_updated` date NOT NULL,
  `cs_event_affliateid` int NOT NULL,
  `cs_event_invoiceid` int NOT NULL,
  `cs_event_project_title` varchar(250) DEFAULT NULL,
  `cs_event_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cs_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_events`
--

LOCK TABLES `cs_events` WRITE;
/*!40000 ALTER TABLE `cs_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cs_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `currency_id` int NOT NULL AUTO_INCREMENT,
  `currency_created` datetime NOT NULL,
  `currency_update` datetime NOT NULL,
  `currency_code` varchar(50) NOT NULL,
  `currency_decimal_separator` varchar(50) NOT NULL,
  `currency_thousands_separator` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `currency_symbol_position` varchar(50) NOT NULL COMMENT 'left|right',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfields`
--

DROP TABLE IF EXISTS `customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customfields` (
  `customfields_id` int NOT NULL AUTO_INCREMENT,
  `customfields_created` datetime NOT NULL,
  `customfields_updated` datetime NOT NULL,
  `customfields_position` int NOT NULL DEFAULT '1',
  `customfields_datatype` varchar(50) DEFAULT 'text' COMMENT 'text|paragraph|number|decima|date|checkbox|dropdown',
  `customfields_datapayload` text COMMENT 'use this to store dropdown lists etc',
  `customfields_type` varchar(50) DEFAULT NULL COMMENT 'clients|projects|leads|tasks|tickets',
  `customfields_name` varchar(250) DEFAULT NULL COMMENT 'e.g. project_custom_field_1',
  `customfields_title` varchar(250) DEFAULT NULL,
  `customfields_required` varchar(5) DEFAULT 'no' COMMENT 'yes|no - standard form',
  `customfields_show_client_page` varchar(100) DEFAULT NULL,
  `customfields_show_project_page` varchar(100) DEFAULT NULL,
  `customfields_show_task_summary` varchar(100) DEFAULT NULL,
  `customfields_show_lead_summary` varchar(100) DEFAULT NULL,
  `customfields_show_invoice` varchar(100) DEFAULT NULL,
  `customfields_show_ticket_page` varchar(100) DEFAULT 'no',
  `customfields_show_filter_panel` varchar(100) DEFAULT 'no' COMMENT 'yes|no',
  `customfields_standard_form_status` varchar(100) DEFAULT 'disabled' COMMENT 'disabled | enabled',
  `customfields_status` varchar(50) DEFAULT 'disabled' COMMENT 'disabled | enabled',
  `customfields_sorting_a_z` varchar(5) DEFAULT 'z' COMMENT 'hack to get sorting right, excluding null title items',
  PRIMARY KEY (`customfields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='checkbox fields are stored as ''on'' or null';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfields`
--

LOCK TABLES `customfields` WRITE;
/*!40000 ALTER TABLE `customfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `emaillog_id` int NOT NULL AUTO_INCREMENT,
  `emaillog_created` datetime DEFAULT NULL,
  `emaillog_updated` datetime DEFAULT NULL,
  `emaillog_email` varchar(100) DEFAULT NULL,
  `emaillog_subject` varchar(200) DEFAULT NULL,
  `emaillog_body` text,
  `emaillog_attachment` varchar(250) DEFAULT 'attached file name',
  PRIMARY KEY (`emaillog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_queue`
--

DROP TABLE IF EXISTS `email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_queue` (
  `emailqueue_id` int NOT NULL AUTO_INCREMENT,
  `emailqueue_created` datetime NOT NULL,
  `emailqueue_updated` datetime NOT NULL,
  `emailqueue_to` varchar(150) DEFAULT NULL,
  `emailqueue_from_email` varchar(150) DEFAULT NULL COMMENT 'optional (used in sending client direct email)',
  `emailqueue_from_name` varchar(150) DEFAULT NULL COMMENT 'optional (used in sending client direct email)',
  `emailqueue_subject` varchar(250) DEFAULT NULL,
  `emailqueue_message` text,
  `emailqueue_type` varchar(150) DEFAULT 'general' COMMENT 'general|pdf (used for emails that need to generate a pdf)',
  `emailqueue_attachments` text COMMENT 'json of request(''attachments'')',
  `emailqueue_resourcetype` varchar(50) DEFAULT NULL COMMENT 'e.g. invoice. Used mainly for deleting records, when resource has been deleted',
  `emailqueue_resourceid` int DEFAULT NULL,
  `emailqueue_pdf_resource_type` varchar(50) DEFAULT NULL COMMENT 'estimate|invoice',
  `emailqueue_pdf_resource_id` int DEFAULT NULL COMMENT 'resource id (e.g. estimate id)',
  `emailqueue_started_at` datetime DEFAULT NULL COMMENT 'timestamp of when processing started',
  `emailqueue_status` varchar(20) DEFAULT 'new' COMMENT 'new|processing (set to processing by the cronjob, to avoid duplicate processing)',
  `emailqueue_attempts` int DEFAULT '0',
  `emailqueue_notes` text,
  PRIMARY KEY (`emailqueue_id`),
  KEY `emailqueue_type` (`emailqueue_type`),
  KEY `emailqueue_resourcetype` (`emailqueue_resourcetype`),
  KEY `emailqueue_resourceid` (`emailqueue_resourceid`),
  KEY `emailqueue_pdf_resource_type` (`emailqueue_pdf_resource_type`),
  KEY `emailqueue_pdf_resource_id` (`emailqueue_pdf_resource_id`),
  KEY `emailqueue_status` (`emailqueue_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_queue`
--

LOCK TABLES `email_queue` WRITE;
/*!40000 ALTER TABLE `email_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `emailtemplate_module_unique_id` varchar(250) DEFAULT NULL,
  `emailtemplate_module_name` varchar(250) DEFAULT NULL,
  `emailtemplate_name` varchar(100) DEFAULT NULL,
  `emailtemplate_lang` varchar(250) DEFAULT NULL COMMENT 'to match to language',
  `emailtemplate_type` varchar(30) DEFAULT NULL COMMENT 'everyone|admin|client',
  `emailtemplate_category` varchar(30) DEFAULT NULL COMMENT 'modules|users|projects|tasks|leads|tickets|billing|estimates|other',
  `emailtemplate_subject` varchar(250) DEFAULT NULL,
  `emailtemplate_body` text,
  `emailtemplate_variables` text,
  `emailtemplate_created` datetime DEFAULT NULL,
  `emailtemplate_updated` datetime DEFAULT NULL,
  `emailtemplate_status` varchar(20) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `emailtemplate_language` varchar(50) DEFAULT NULL,
  `emailtemplate_real_template` varchar(50) DEFAULT 'yes' COMMENT 'yes|no',
  `emailtemplate_show_enabled` varchar(50) DEFAULT 'yes' COMMENT 'yes|no',
  `emailtemplate_id` int NOT NULL AUTO_INCREMENT COMMENT 'x',
  PRIMARY KEY (`emailtemplate_id`),
  KEY `emailtemplate_type` (`emailtemplate_type`),
  KEY `emailtemplate_category` (`emailtemplate_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[do not truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estimates` (
  `bill_estimateid` int NOT NULL AUTO_INCREMENT,
  `bill_uniqueid` varchar(100) DEFAULT NULL,
  `bill_created` datetime DEFAULT NULL,
  `bill_updated` datetime DEFAULT NULL,
  `bill_date_sent_to_customer` datetime DEFAULT NULL,
  `bill_date_status_change` datetime DEFAULT NULL,
  `bill_clientid` int DEFAULT NULL,
  `bill_projectid` int DEFAULT NULL,
  `bill_proposalid` int DEFAULT NULL,
  `bill_contractid` int DEFAULT NULL,
  `bill_creatorid` int NOT NULL,
  `bill_categoryid` int NOT NULL DEFAULT '4',
  `bill_date` date NOT NULL,
  `bill_expiry_date` date DEFAULT NULL,
  `bill_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bill_discount_type` varchar(30) DEFAULT 'none' COMMENT 'amount | percentage | none',
  `bill_discount_percentage` decimal(15,2) DEFAULT '0.00' COMMENT 'actual amount or percentage',
  `bill_discount_amount` decimal(15,2) DEFAULT '0.00',
  `bill_amount_before_tax` decimal(15,2) DEFAULT '0.00',
  `bill_tax_type` varchar(20) DEFAULT 'summary' COMMENT 'summary|inline|none',
  `bill_tax_total_percentage` decimal(15,2) DEFAULT '0.00' COMMENT 'percentage',
  `bill_tax_total_amount` decimal(15,2) DEFAULT '0.00' COMMENT 'amount',
  `bill_adjustment_description` varchar(250) DEFAULT NULL,
  `bill_adjustment_amount` decimal(15,2) DEFAULT '0.00',
  `bill_final_amount` decimal(15,2) DEFAULT '0.00',
  `bill_notes` text,
  `bill_terms` text,
  `bill_status` varchar(50) NOT NULL DEFAULT 'draft' COMMENT 'draft | new | accepted | revised | declined | expired',
  `bill_type` varchar(150) NOT NULL DEFAULT 'estimate' COMMENT 'estimate|invoice',
  `bill_estimate_type` varchar(150) NOT NULL DEFAULT 'estimate' COMMENT 'estimate|document',
  `bill_visibility` varchar(150) NOT NULL DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent estimates that are still being cloned from showing in estimates list)',
  `bill_viewed_by_client` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  `bill_system` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  `bill_converted_to_invoice` varchar(20) DEFAULT 'no' COMMENT 'Added as of V1.10',
  `bill_converted_to_invoice_invoiceid` int DEFAULT NULL COMMENT 'Added as of V1.10',
  `estimate_automation_status` varchar(100) DEFAULT 'disabled' COMMENT 'disabled|enabled',
  `estimate_automation_create_project` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `estimate_automation_project_title` varchar(250) DEFAULT NULL,
  `estimate_automation_project_status` varchar(100) DEFAULT 'in_progress' COMMENT 'not_started | in_progress | on_hold',
  `estimate_automation_create_tasks` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `estimate_automation_project_email_client` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `estimate_automation_create_invoice` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `estimate_automation_invoice_due_date` int DEFAULT '7',
  `estimate_automation_invoice_email_client` varchar(50) DEFAULT 'no',
  `estimate_automation_copy_attachments` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `estimate_automation_log_created_project_id` int DEFAULT NULL,
  `estimate_automation_log_created_invoice_id` int DEFAULT NULL,
  `bill_publishing_type` varchar(20) DEFAULT 'instant' COMMENT 'instant|scheduled',
  `bill_publishing_scheduled_date` date DEFAULT NULL,
  `bill_publishing_scheduled_status` varchar(20) DEFAULT NULL COMMENT 'pending|published|failed',
  `bill_publishing_scheduled_log` text,
  `billresource_type` text COMMENT 'optional references',
  `billresource_id` int DEFAULT NULL,
  `estimate_mapping_type` text,
  `estimate_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`bill_estimateid`),
  KEY `bill_clientid` (`bill_clientid`),
  KEY `bill_creatorid` (`bill_creatorid`),
  KEY `bill_categoryid` (`bill_categoryid`),
  KEY `bill_status` (`bill_status`),
  KEY `bill_type` (`bill_type`),
  KEY `bill_visibility` (`bill_visibility`),
  KEY `bill_viewed_by_client` (`bill_viewed_by_client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimates`
--

LOCK TABLES `estimates` WRITE;
/*!40000 ALTER TABLE `estimates` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_created` datetime DEFAULT NULL COMMENT '[notes] Events record the event, whilst timelines determine where the event is displayed',
  `event_updated` datetime DEFAULT NULL,
  `event_creatorid` int NOT NULL COMMENT 'use ( -1 ) for logged out user.',
  `event_clientid` int DEFAULT NULL COMMENT 'for client type resources',
  `event_creator_name` varchar(150) DEFAULT NULL COMMENT 'for events created by users who are not registered (e.g. accepting a proposal)',
  `event_item` varchar(150) DEFAULT NULL COMMENT 'status | project | task | lead | expense | estimate| comment | attachment | file | invoice | payment | assigned',
  `event_item_id` int DEFAULT NULL COMMENT 'e.g. invoice_id (used in the link shown in the even)',
  `event_item_content` text COMMENT 'e.g. #INV-029200 (used in the text if the event, also in the link text)',
  `event_item_content2` text COMMENT 'extra content',
  `event_item_content3` text COMMENT 'extra content',
  `event_item_content4` text COMMENT 'extra content',
  `event_item_lang` varchar(150) DEFAULT NULL COMMENT '(e.g. - event_created_invoice found in the lang file )',
  `event_item_lang_alt` varchar(150) DEFAULT NULL COMMENT 'Example: Fred posted a comment (as opposed to) You posed a comment',
  `event_parent_type` varchar(150) DEFAULT NULL COMMENT 'used to identify the parent up the tree (e.g. for a task, parent is project) (.e.g. for a task comment, parent is task)',
  `event_parent_id` varchar(150) DEFAULT NULL COMMENT 'id of the parent item (e.g project_id)',
  `event_parent_title` varchar(150) DEFAULT NULL COMMENT 'e.g. task title',
  `event_show_item` varchar(150) DEFAULT 'yes' COMMENT 'yes|no (if the item should be shown in the notifications dopdown)',
  `event_show_in_timeline` varchar(150) DEFAULT 'yes' COMMENT 'yes|no (if this should show the project timeline)',
  `event_notification_category` varchar(150) DEFAULT NULL COMMENT '(e.g. notifications_new_invoice) This determins if a user will get a web notification, an email, both, or none. As per the settings in the [user] table and the login in the [eventTrackingRepo)',
  `eventresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] project | ticket | lead (e.g. if you want the event to show in the project timeline, then eventresource_type  must be set to project)',
  `eventresource_id` int DEFAULT NULL COMMENT '[polymorph] e.g project_id',
  PRIMARY KEY (`event_id`),
  KEY `eventresource_type` (`eventresource_type`),
  KEY `eventresource_id` (`eventresource_id`),
  KEY `event_creatorid` (`event_creatorid`),
  KEY `event_type` (`event_item`),
  KEY `event_parent_type` (`event_parent_type`),
  KEY `event_parent_id` (`event_parent_id`),
  KEY `event_item_id` (`event_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_tracking`
--

DROP TABLE IF EXISTS `events_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_tracking` (
  `eventtracking_id` int NOT NULL AUTO_INCREMENT,
  `eventtracking_created` datetime NOT NULL,
  `eventtracking_updated` datetime NOT NULL,
  `eventtracking_eventid` int NOT NULL,
  `eventtracking_userid` int NOT NULL,
  `eventtracking_status` varchar(30) DEFAULT 'unread' COMMENT 'read|unread',
  `eventtracking_email` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `eventtracking_source` varchar(50) DEFAULT NULL COMMENT 'the actual item (e.g. file | comment | invoice)',
  `eventtracking_source_id` varchar(50) DEFAULT NULL COMMENT 'the id of the actual item',
  `parent_type` varchar(50) DEFAULT NULL COMMENT 'used to locate the main event in the events table. Also used for marking the event as read, once the parent has been viewed. (e.g. for invoice, parent is invoice. For comment task, parent is task)',
  `parent_id` int DEFAULT NULL,
  `resource_type` varchar(50) DEFAULT NULL COMMENT 'Also used for marking events as read, for ancillary items like (project comments, project file) where just viewing a project is enough',
  `resource_id` int DEFAULT NULL,
  PRIMARY KEY (`eventtracking_id`),
  KEY `eventtracking_userid` (`eventtracking_userid`),
  KEY `eventtracking_eventid` (`eventtracking_eventid`),
  KEY `eventtracking_status` (`eventtracking_status`),
  KEY `parent_type` (`parent_type`),
  KEY `parent_id` (`parent_id`),
  KEY `resource_type` (`resource_type`),
  KEY `resource_id` (`resource_id`),
  KEY `eventtracking_source` (`eventtracking_source`),
  KEY `eventtracking_source_id` (`eventtracking_source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_tracking`
--

LOCK TABLES `events_tracking` WRITE;
/*!40000 ALTER TABLE `events_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `expense_importid` varchar(100) DEFAULT NULL,
  `expense_created` date DEFAULT NULL,
  `expense_updated` date DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `expense_clientid` int DEFAULT NULL,
  `expense_projectid` int DEFAULT NULL,
  `expense_creatorid` int NOT NULL,
  `expense_categoryid` int NOT NULL DEFAULT '7',
  `expense_amount` decimal(10,2) NOT NULL,
  `expense_description` text,
  `expense_type` text COMMENT 'business|client',
  `expense_billable` varchar(30) DEFAULT 'not_billable' COMMENT 'billable | not_billable',
  `expense_billing_status` varchar(30) DEFAULT 'not_invoiced' COMMENT 'invoiced | not_invoiced',
  `expense_billable_invoiceid` int DEFAULT NULL COMMENT 'id of the invoice that it has been billed to',
  `expense_recurring` varchar(5) DEFAULT 'no' COMMENT 'yes|no',
  `expense_recurring_duration` int DEFAULT NULL COMMENT 'e.g. 20 (for 20 days)',
  `expense_recurring_period` varchar(30) DEFAULT NULL COMMENT 'day | week | month | year',
  `expense_recurring_cycles` int DEFAULT NULL COMMENT '0 for infinity',
  `expense_recurring_cycles_counter` int DEFAULT '0' COMMENT 'number of times it has been renewed',
  `expense_recurring_last` datetime DEFAULT NULL COMMENT 'date when it was last renewed',
  `expense_recurring_next` datetime DEFAULT NULL COMMENT 'date when it will next be renewed',
  `expense_recurring_child` varchar(5) DEFAULT 'no' COMMENT 'yes|no',
  `expense_recurring_parent_id` int DEFAULT NULL COMMENT 'if it was generated from a recurring invoice, the id of parent expense',
  `expense_cron_status` varchar(20) DEFAULT 'none' COMMENT 'none|processing|completed|error  (used to prevent collisions when recurring invoiced)',
  `expenseresource_type` text COMMENT 'optional references',
  `expenseresource_id` int DEFAULT NULL,
  `expense_mapping_type` text,
  `expense_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `expense_clientid` (`expense_clientid`),
  KEY `expense_projectid` (`expense_projectid`),
  KEY `expense_creatorid` (`expense_creatorid`),
  KEY `expense_billable` (`expense_billable`),
  KEY `expense_billing_status` (`expense_billing_status`),
  KEY `expense_billable_invoiceid` (`expense_billable_invoiceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_folders`
--

DROP TABLE IF EXISTS `file_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_folders` (
  `filefolder_id` int NOT NULL AUTO_INCREMENT,
  `filefolder_created` datetime NOT NULL,
  `filefolder_updated` datetime NOT NULL,
  `filefolder_creatorid` int DEFAULT NULL,
  `filefolder_projectid` int DEFAULT NULL,
  `filefolder_name` varchar(250) DEFAULT NULL,
  `filefolder_default` varchar(100) DEFAULT 'no' COMMENT 'yes|no',
  `filefolder_system` varchar(100) DEFAULT 'no' COMMENT 'yes|no',
  PRIMARY KEY (`filefolder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_folders`
--

LOCK TABLES `file_folders` WRITE;
/*!40000 ALTER TABLE `file_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_uniqueid` varchar(100) DEFAULT NULL,
  `file_upload_unique_key` varchar(100) DEFAULT NULL COMMENT 'used to idetify files that were uploaded in one go',
  `file_created` datetime DEFAULT NULL,
  `file_updated` datetime DEFAULT NULL,
  `file_creatorid` int DEFAULT NULL,
  `file_clientid` int DEFAULT NULL COMMENT 'optional',
  `file_folderid` int DEFAULT NULL,
  `file_filename` varchar(250) DEFAULT NULL,
  `file_directory` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_size` varchar(40) DEFAULT NULL COMMENT 'human readable file size',
  `file_type` varchar(20) DEFAULT NULL COMMENT 'image|file',
  `file_thumbname` varchar(250) DEFAULT NULL COMMENT 'optional',
  `file_visibility_client` varchar(5) DEFAULT 'yes' COMMENT 'yes | no',
  `file_mapping_type` text,
  `file_mapping_id` int DEFAULT NULL,
  `fileresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] project',
  `fileresource_id` int DEFAULT NULL COMMENT '[polymorph] e.g project_id',
  PRIMARY KEY (`file_id`),
  KEY `file_creatorid` (`file_creatorid`),
  KEY `file_clientid` (`file_clientid`),
  KEY `fileresource_type` (`fileresource_type`),
  KEY `fileresource_id` (`fileresource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imaplog`
--

DROP TABLE IF EXISTS `imaplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imaplog` (
  `imaplog_id` int NOT NULL AUTO_INCREMENT,
  `imaplog_created` datetime NOT NULL,
  `imaplog_updated` datetime NOT NULL,
  `imaplog_categoryid` int NOT NULL,
  `imaplog_to_email` text NOT NULL,
  `imaplog_from_email` text,
  `imaplog_from_name` text,
  `imaplog_subject` text,
  `imaplog_email_uid` text,
  `imaplog_mailbox_id` int DEFAULT NULL,
  `imaplog_body` text,
  `imaplog_attachments_count` int DEFAULT NULL,
  `imaplog_header_in_reply_to` text,
  `imaplog_payload_header` text,
  PRIMARY KEY (`imaplog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imaplog`
--

LOCK TABLES `imaplog` WRITE;
/*!40000 ALTER TABLE `imaplog` DISABLE KEYS */;
/*!40000 ALTER TABLE `imaplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `bill_invoiceid` int NOT NULL AUTO_INCREMENT,
  `bill_uniqueid` varchar(100) DEFAULT NULL,
  `bill_created` datetime DEFAULT NULL,
  `bill_updated` datetime DEFAULT NULL,
  `bill_date_sent_to_customer` date DEFAULT NULL COMMENT 'the date an invoice was published or lasts emailed to the customer',
  `bill_date_status_change` datetime DEFAULT NULL,
  `bill_clientid` int NOT NULL,
  `bill_projectid` int DEFAULT NULL COMMENT 'optional',
  `bill_subscriptionid` int DEFAULT NULL COMMENT 'optional',
  `bill_creatorid` int NOT NULL,
  `bill_categoryid` int NOT NULL DEFAULT '4',
  `bill_date` date NOT NULL,
  `bill_due_date` date DEFAULT NULL,
  `bill_subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bill_discount_type` varchar(30) DEFAULT 'none' COMMENT 'amount | percentage | none',
  `bill_discount_percentage` decimal(15,2) DEFAULT '0.00' COMMENT 'actual amount or percentage',
  `bill_discount_amount` decimal(15,2) DEFAULT '0.00',
  `bill_amount_before_tax` decimal(15,2) DEFAULT '0.00',
  `bill_tax_type` varchar(20) DEFAULT 'summary' COMMENT 'summary|inline|none',
  `bill_tax_total_percentage` decimal(15,2) DEFAULT '0.00' COMMENT 'percentage',
  `bill_tax_total_amount` decimal(15,2) DEFAULT '0.00' COMMENT 'amount',
  `bill_adjustment_description` varchar(250) DEFAULT NULL,
  `bill_adjustment_amount` decimal(15,2) DEFAULT '0.00',
  `bill_final_amount` decimal(15,2) DEFAULT '0.00',
  `bill_notes` text,
  `bill_terms` text,
  `bill_status` varchar(50) NOT NULL DEFAULT 'draft' COMMENT 'draft | due | overdue | paid | part_paid',
  `bill_recurring` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `bill_recurring_duration` int DEFAULT NULL COMMENT 'e.g. 20 (for 20 days)',
  `bill_recurring_period` varchar(30) DEFAULT NULL COMMENT 'day | week | month | year',
  `bill_recurring_cycles` int DEFAULT NULL COMMENT '0 for infinity',
  `bill_recurring_cycles_counter` int DEFAULT NULL COMMENT 'number of times it has been renewed',
  `bill_recurring_last` date DEFAULT NULL COMMENT 'date when it was last renewed',
  `bill_recurring_next` date DEFAULT NULL COMMENT 'date when it will next be renewed',
  `bill_recurring_child` varchar(5) DEFAULT 'no' COMMENT 'yes|no',
  `bill_recurring_parent_id` int DEFAULT NULL COMMENT 'if it was generated from a recurring invoice, the id of parent invoice',
  `bill_overdue_reminder_sent` varchar(5) DEFAULT 'no' COMMENT 'yes | no',
  `bill_overdue_reminder_last_sent` datetime DEFAULT NULL,
  `bill_overdue_reminder_counter` int DEFAULT '0',
  `bill_invoice_type` varchar(30) DEFAULT 'onetime' COMMENT 'onetime | subscription',
  `bill_type` varchar(20) DEFAULT 'invoice' COMMENT 'invoice|estimate',
  `bill_visibility` varchar(20) DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent invoices that are still being cloned from showing in invoices list)',
  `bill_cron_status` varchar(20) DEFAULT 'none' COMMENT 'none|processing|completed|error  (used to prevent collisions when recurring invoiced)',
  `bill_cron_date` datetime DEFAULT NULL COMMENT 'date when cron was run',
  `bill_viewed_by_client` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  `bill_system` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  `bill_publishing_type` varchar(20) DEFAULT 'instant' COMMENT 'instant|scheduled',
  `bill_publishing_scheduled_date` date DEFAULT NULL,
  `bill_publishing_scheduled_status` varchar(20) DEFAULT NULL COMMENT 'pending|published|failed',
  `bill_publishing_scheduled_log` text,
  `billresource_type` text COMMENT 'optional references',
  `billresource_id` int DEFAULT NULL,
  `invoice_mapping_type` text,
  `invoice_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`bill_invoiceid`),
  KEY `invoice_clientid` (`bill_clientid`),
  KEY `invoice_projectid` (`bill_projectid`),
  KEY `invoice_creatorid` (`bill_creatorid`),
  KEY `invoice_categoryid` (`bill_categoryid`),
  KEY `invoice_status` (`bill_status`),
  KEY `invoice_recurring` (`bill_recurring`),
  KEY `bill_type` (`bill_type`),
  KEY `bill_invoice_type` (`bill_invoice_type`),
  KEY `bill_subscriptionid` (`bill_subscriptionid`),
  KEY `bill_recurring_parent_id` (`bill_recurring_parent_id`),
  KEY `bill_visibility` (`bill_visibility`),
  KEY `bill_cron_status` (`bill_cron_status`),
  KEY `bill_viewed_by_client` (`bill_viewed_by_client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_created` datetime DEFAULT NULL,
  `item_updated` datetime DEFAULT NULL,
  `item_categoryid` int NOT NULL DEFAULT '8',
  `item_creatorid` int NOT NULL,
  `item_type` varchar(100) NOT NULL DEFAULT 'standard' COMMENT 'standard|dimensions',
  `item_description` text,
  `item_unit` varchar(50) DEFAULT NULL,
  `item_rate` decimal(15,2) NOT NULL,
  `item_tax_status` varchar(100) NOT NULL DEFAULT 'taxable' COMMENT 'taxable|exempt',
  `item_dimensions_length` decimal(15,2) DEFAULT NULL,
  `item_dimensions_width` decimal(15,2) DEFAULT NULL,
  `item_notes_estimatation` text,
  `item_notes_production` text,
  `itemresource_type` text COMMENT 'optional references',
  `itemresource_id` int DEFAULT NULL,
  `item_mapping_type` text,
  `item_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_categoryid` (`item_categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kb_categories`
--

DROP TABLE IF EXISTS `kb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kb_categories` (
  `kbcategory_id` int NOT NULL AUTO_INCREMENT,
  `kbcategory_created` datetime NOT NULL,
  `kbcategory_updated` datetime NOT NULL,
  `kbcategory_creatorid` int NOT NULL,
  `kbcategory_title` varchar(250) NOT NULL,
  `kbcategory_description` text,
  `kbcategory_position` int DEFAULT NULL,
  `kbcategory_visibility` varchar(50) DEFAULT 'everyone' COMMENT 'everyone | team | client',
  `kbcategory_slug` varchar(250) DEFAULT NULL,
  `kbcategory_icon` varchar(250) DEFAULT NULL,
  `kbcategory_type` varchar(50) DEFAULT 'text' COMMENT 'text|video',
  `kbcategory_system_default` varchar(250) DEFAULT 'no' COMMENT 'yes | no',
  PRIMARY KEY (`kbcategory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kb_categories`
--

LOCK TABLES `kb_categories` WRITE;
/*!40000 ALTER TABLE `kb_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `kb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledgebase`
--

DROP TABLE IF EXISTS `knowledgebase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledgebase` (
  `knowledgebase_id` int NOT NULL AUTO_INCREMENT,
  `knowledgebase_created` datetime NOT NULL,
  `knowledgebase_updated` datetime NOT NULL,
  `knowledgebase_creatorid` int NOT NULL,
  `knowledgebase_categoryid` int NOT NULL,
  `knowledgebase_title` varchar(250) NOT NULL,
  `knowledgebase_slug` varchar(250) DEFAULT NULL,
  `knowledgebase_text` text,
  `knowledgebase_embed_video_id` varchar(50) DEFAULT NULL,
  `knowledgebase_embed_code` text,
  `knowledgebase_embed_thumb` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`knowledgebase_id`),
  KEY `knowledgebase_categoryid` (`knowledgebase_categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledgebase`
--

LOCK TABLES `knowledgebase` WRITE;
/*!40000 ALTER TABLE `knowledgebase` DISABLE KEYS */;
/*!40000 ALTER TABLE `knowledgebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `lead_id` int NOT NULL AUTO_INCREMENT,
  `lead_uniqueid` varchar(100) DEFAULT NULL,
  `lead_importid` varchar(100) DEFAULT NULL,
  `lead_position` double NOT NULL,
  `lead_created` datetime DEFAULT NULL,
  `lead_updated` datetime DEFAULT NULL,
  `lead_date_status_change` datetime DEFAULT NULL,
  `lead_creatorid` int DEFAULT NULL,
  `lead_updatorid` int DEFAULT NULL,
  `lead_categoryid` int DEFAULT '3',
  `lead_firstname` varchar(100) DEFAULT NULL,
  `lead_lastname` varchar(100) DEFAULT NULL,
  `lead_email` varchar(150) DEFAULT NULL,
  `lead_phone` varchar(150) DEFAULT NULL,
  `lead_job_position` varchar(150) DEFAULT NULL,
  `lead_company_name` varchar(150) DEFAULT NULL,
  `lead_website` varchar(150) DEFAULT NULL,
  `lead_street` varchar(150) DEFAULT NULL,
  `lead_city` varchar(150) DEFAULT NULL,
  `lead_state` varchar(150) DEFAULT NULL,
  `lead_zip` varchar(150) DEFAULT NULL,
  `lead_country` varchar(150) DEFAULT NULL,
  `lead_source` varchar(150) DEFAULT NULL,
  `lead_input_source` varchar(20) DEFAULT 'app' COMMENT 'app|webform',
  `lead_input_ip_address` text,
  `lead_title` varchar(250) DEFAULT NULL,
  `lead_description` text,
  `lead_value` decimal(10,2) DEFAULT NULL,
  `lead_last_contacted` date DEFAULT NULL,
  `lead_converted` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `lead_converted_by_userid` int DEFAULT NULL COMMENT 'id of user who converted',
  `lead_converted_date` datetime DEFAULT NULL COMMENT 'date lead converted',
  `lead_converted_clientid` int DEFAULT NULL COMMENT 'if the lead has previously been converted to a client',
  `lead_status` tinyint DEFAULT '1' COMMENT 'Deafult is id: 1 (leads_status) table',
  `lead_active_state` varchar(10) DEFAULT 'active' COMMENT 'active|archived',
  `lead_visibility` varchar(40) DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent tasks that are still being cloned from showing in tasks list)',
  `lead_cover_image` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `lead_cover_image_uniqueid` text,
  `lead_cover_image_filename` text,
  `lead_custom_field_1` tinytext,
  `lead_custom_field_2` tinytext,
  `lead_custom_field_3` tinytext,
  `lead_custom_field_4` tinytext,
  `lead_custom_field_5` tinytext,
  `lead_custom_field_6` tinytext,
  `lead_custom_field_7` tinytext,
  `lead_custom_field_8` tinytext,
  `lead_custom_field_9` tinytext,
  `lead_custom_field_10` tinytext,
  `lead_custom_field_11` tinytext,
  `lead_custom_field_12` tinytext,
  `lead_custom_field_13` tinytext,
  `lead_custom_field_14` tinytext,
  `lead_custom_field_15` tinytext,
  `lead_custom_field_16` tinytext,
  `lead_custom_field_17` tinytext,
  `lead_custom_field_18` tinytext,
  `lead_custom_field_19` tinytext,
  `lead_custom_field_20` tinytext,
  `lead_custom_field_21` tinytext,
  `lead_custom_field_22` tinytext,
  `lead_custom_field_23` tinytext,
  `lead_custom_field_24` tinytext,
  `lead_custom_field_25` tinytext,
  `lead_custom_field_26` tinytext,
  `lead_custom_field_27` tinytext,
  `lead_custom_field_28` tinytext,
  `lead_custom_field_29` tinytext,
  `lead_custom_field_30` tinytext,
  `lead_custom_field_31` datetime DEFAULT NULL,
  `lead_custom_field_32` datetime DEFAULT NULL,
  `lead_custom_field_33` datetime DEFAULT NULL,
  `lead_custom_field_34` datetime DEFAULT NULL,
  `lead_custom_field_35` datetime DEFAULT NULL,
  `lead_custom_field_36` datetime DEFAULT NULL,
  `lead_custom_field_37` datetime DEFAULT NULL,
  `lead_custom_field_38` datetime DEFAULT NULL,
  `lead_custom_field_39` datetime DEFAULT NULL,
  `lead_custom_field_40` datetime DEFAULT NULL,
  `lead_custom_field_41` text,
  `lead_custom_field_42` text,
  `lead_custom_field_43` text,
  `lead_custom_field_44` text,
  `lead_custom_field_45` text,
  `lead_custom_field_46` text,
  `lead_custom_field_47` text,
  `lead_custom_field_48` text,
  `lead_custom_field_49` text,
  `lead_custom_field_50` text,
  `lead_custom_field_51` text,
  `lead_custom_field_52` text,
  `lead_custom_field_53` text,
  `lead_custom_field_54` text,
  `lead_custom_field_55` text,
  `lead_custom_field_56` text,
  `lead_custom_field_57` text,
  `lead_custom_field_58` text,
  `lead_custom_field_59` text,
  `lead_custom_field_60` text,
  `lead_custom_field_61` text,
  `lead_custom_field_62` text,
  `lead_custom_field_63` text,
  `lead_custom_field_64` text,
  `lead_custom_field_65` text,
  `lead_custom_field_66` text,
  `lead_custom_field_67` text,
  `lead_custom_field_68` text,
  `lead_custom_field_69` text,
  `lead_custom_field_70` text,
  `lead_custom_field_71` text,
  `lead_custom_field_72` text,
  `lead_custom_field_73` text,
  `lead_custom_field_74` text,
  `lead_custom_field_75` text,
  `lead_custom_field_76` text,
  `lead_custom_field_77` text,
  `lead_custom_field_78` text,
  `lead_custom_field_79` text,
  `lead_custom_field_80` text,
  `lead_custom_field_81` text,
  `lead_custom_field_82` text,
  `lead_custom_field_83` text,
  `lead_custom_field_84` text,
  `lead_custom_field_85` text,
  `lead_custom_field_86` text,
  `lead_custom_field_87` text,
  `lead_custom_field_88` text,
  `lead_custom_field_89` text,
  `lead_custom_field_90` text,
  `lead_custom_field_91` text,
  `lead_custom_field_92` text,
  `lead_custom_field_93` text,
  `lead_custom_field_94` text,
  `lead_custom_field_95` text,
  `lead_custom_field_96` text,
  `lead_custom_field_97` text,
  `lead_custom_field_98` text,
  `lead_custom_field_99` text,
  `lead_custom_field_100` text,
  `lead_custom_field_101` text,
  `lead_custom_field_102` text,
  `lead_custom_field_103` text,
  `lead_custom_field_104` text,
  `lead_custom_field_105` text,
  `lead_custom_field_106` text,
  `lead_custom_field_107` text,
  `lead_custom_field_108` text,
  `lead_custom_field_109` text,
  `lead_custom_field_110` text,
  `lead_custom_field_111` int DEFAULT NULL,
  `lead_custom_field_112` int DEFAULT NULL,
  `lead_custom_field_113` int DEFAULT NULL,
  `lead_custom_field_114` int DEFAULT NULL,
  `lead_custom_field_115` int DEFAULT NULL,
  `lead_custom_field_116` int DEFAULT NULL,
  `lead_custom_field_117` int DEFAULT NULL,
  `lead_custom_field_118` int DEFAULT NULL,
  `lead_custom_field_119` int DEFAULT NULL,
  `lead_custom_field_120` int DEFAULT NULL,
  `lead_custom_field_121` int DEFAULT NULL,
  `lead_custom_field_122` int DEFAULT NULL,
  `lead_custom_field_123` int DEFAULT NULL,
  `lead_custom_field_124` int DEFAULT NULL,
  `lead_custom_field_125` int DEFAULT NULL,
  `lead_custom_field_126` int DEFAULT NULL,
  `lead_custom_field_127` int DEFAULT NULL,
  `lead_custom_field_128` int DEFAULT NULL,
  `lead_custom_field_129` int DEFAULT NULL,
  `lead_custom_field_130` int DEFAULT NULL,
  `lead_custom_field_131` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_132` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_133` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_134` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_135` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_136` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_137` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_138` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_139` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_140` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_141` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_142` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_143` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_144` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_145` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_146` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_147` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_148` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_149` decimal(10,2) DEFAULT NULL,
  `lead_custom_field_150` decimal(10,2) DEFAULT NULL,
  `leadresource_type` text COMMENT 'optional references',
  `leadresource_id` int DEFAULT NULL,
  `lead_mapping_type` text,
  `lead_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`lead_id`),
  KEY `lead_creatorid` (`lead_creatorid`),
  KEY `lead_categoryid` (`lead_categoryid`),
  KEY `lead_email` (`lead_email`),
  KEY `lead_status` (`lead_status`),
  KEY `lead_converted_clientid` (`lead_converted_clientid`),
  KEY `lead_active_state` (`lead_active_state`),
  KEY `lead_visibility` (`lead_visibility`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_assigned`
--

DROP TABLE IF EXISTS `leads_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads_assigned` (
  `leadsassigned_id` int NOT NULL AUTO_INCREMENT,
  `leadsassigned_leadid` int DEFAULT NULL,
  `leadsassigned_userid` int DEFAULT NULL,
  `leadsassigned_created` datetime NOT NULL,
  `leadsassigned_updated` datetime NOT NULL,
  PRIMARY KEY (`leadsassigned_id`),
  KEY `leadsassigned_userid` (`leadsassigned_userid`),
  KEY `leadsassigned_leadid` (`leadsassigned_leadid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_assigned`
--

LOCK TABLES `leads_assigned` WRITE;
/*!40000 ALTER TABLE `leads_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_sources`
--

DROP TABLE IF EXISTS `leads_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads_sources` (
  `leadsources_id` int NOT NULL AUTO_INCREMENT,
  `leadsources_created` datetime NOT NULL,
  `leadsources_updated` datetime NOT NULL,
  `leadsources_creatorid` int NOT NULL,
  `leadsources_title` varchar(200) NOT NULL COMMENT '[do not truncate] - good to have example sources like google',
  PRIMARY KEY (`leadsources_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_sources`
--

LOCK TABLES `leads_sources` WRITE;
/*!40000 ALTER TABLE `leads_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_status`
--

DROP TABLE IF EXISTS `leads_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads_status` (
  `leadstatus_id` int NOT NULL AUTO_INCREMENT,
  `leadstatus_created` datetime DEFAULT NULL,
  `leadstatus_creatorid` int DEFAULT NULL,
  `leadstatus_updated` datetime DEFAULT NULL,
  `leadstatus_title` varchar(200) NOT NULL,
  `leadstatus_position` int NOT NULL,
  `leadstatus_color` varchar(100) NOT NULL DEFAULT 'default' COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  `leadstatus_system_default` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no',
  PRIMARY KEY (`leadstatus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[do not truncate]  expected to have 2 system default statuses (ID: 1 & 2) ''new'' & ''converted'' statuses ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_status`
--

LOCK TABLES `leads_status` WRITE;
/*!40000 ALTER TABLE `leads_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineitems`
--

DROP TABLE IF EXISTS `lineitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineitems` (
  `lineitem_id` int NOT NULL AUTO_INCREMENT,
  `lineitem_position` int DEFAULT NULL,
  `lineitem_created` datetime DEFAULT NULL,
  `lineitem_updated` datetime DEFAULT NULL,
  `lineitem_description` text,
  `lineitem_rate` varchar(250) DEFAULT NULL,
  `lineitem_unit` varchar(100) DEFAULT NULL,
  `lineitem_quantity` float DEFAULT NULL,
  `lineitem_total` decimal(15,2) DEFAULT NULL,
  `lineitemresource_linked_type` varchar(30) DEFAULT NULL COMMENT 'task | expense',
  `lineitemresource_linked_id` int DEFAULT NULL COMMENT 'e.g. task id',
  `lineitemresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] invoice | estimate',
  `lineitemresource_id` int DEFAULT NULL COMMENT '[polymorph] e.g invoice_id',
  `lineitem_type` varchar(10) DEFAULT 'plain' COMMENT 'plain|time|dimensions',
  `lineitem_time_hours` int DEFAULT NULL,
  `lineitem_time_minutes` int DEFAULT NULL,
  `lineitem_time_timers_list` text COMMENT 'comma separated list of timers',
  `lineitem_dimensions_length` float DEFAULT NULL,
  `lineitem_dimensions_width` float DEFAULT NULL,
  `lineitem_tax_status` varchar(100) DEFAULT 'taxable' COMMENT 'taxable|exempt  - this is inherited from the product/item setting',
  `lineitem_linked_product_id` int DEFAULT NULL COMMENT 'the original product that created this line item',
  PRIMARY KEY (`lineitem_id`),
  KEY `lineitemresource_linked_type` (`lineitemresource_linked_type`),
  KEY `lineitemresource_linked_id` (`lineitemresource_linked_id`),
  KEY `lineitemresource_type` (`lineitemresource_type`),
  KEY `lineitemresource_id` (`lineitemresource_id`),
  KEY `lineitem_type` (`lineitem_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineitems`
--

LOCK TABLES `lineitems` WRITE;
/*!40000 ALTER TABLE `lineitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_uniqueid` varchar(100) DEFAULT NULL COMMENT 'optional',
  `log_created` datetime NOT NULL,
  `log_updated` datetime NOT NULL,
  `log_creatorid` int DEFAULT NULL,
  `log_text` text COMMENT 'either free text or a (lang) string',
  `log_text_type` varchar(20) DEFAULT 'text' COMMENT 'text|lang',
  `log_data_1` varchar(250) DEFAULT NULL COMMENT 'optional data',
  `log_data_2` varchar(250) DEFAULT NULL COMMENT 'optional data',
  `log_data_3` varchar(250) DEFAULT NULL COMMENT 'optional data',
  `log_payload` text COMMENT 'optional',
  `logresource_type` varchar(60) DEFAULT NULL COMMENT 'debug|subscription|invoice|etc',
  `logresource_id` int DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_unique_id` varchar(100) NOT NULL,
  `message_created` datetime NOT NULL,
  `message_updated` datetime NOT NULL,
  `message_timestamp` int NOT NULL,
  `message_creatorid` int NOT NULL,
  `message_source` varchar(150) NOT NULL COMMENT 'sender unique id',
  `message_target` varchar(150) NOT NULL COMMENT 'receivers unique id',
  `message_creator_uniqueid` varchar(150) DEFAULT NULL,
  `message_target_uniqueid` varchar(150) DEFAULT NULL,
  `message_text` text,
  `message_file_name` varchar(250) DEFAULT NULL,
  `message_file_directory` varchar(150) DEFAULT NULL,
  `message_file_thumb_name` varchar(150) DEFAULT NULL,
  `message_file_type` varchar(50) DEFAULT NULL COMMENT 'file | image',
  `message_type` varchar(150) DEFAULT 'file' COMMENT 'text | file',
  `message_status` varchar(150) DEFAULT 'unread' COMMENT 'read | unread',
  `message_mapping_type` text,
  `message_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `message_status` (`message_status`),
  KEY `message_creatorid` (`message_creatorid`),
  KEY `message_creator_uniqueid` (`message_creator_uniqueid`),
  KEY `message_target_uniqueid` (`message_target_uniqueid`),
  KEY `message_type` (`message_type`),
  KEY `message_source` (`message_source`),
  KEY `message_target` (`message_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_tracking`
--

DROP TABLE IF EXISTS `messages_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages_tracking` (
  `messagestracking_id` int NOT NULL AUTO_INCREMENT,
  `messagestracking_created` datetime NOT NULL,
  `messagestracking_update` datetime NOT NULL,
  `messagestracking_massage_unique_id` varchar(120) NOT NULL,
  `messagestracking_target` varchar(120) DEFAULT NULL,
  `messagestracking_user_unique_id` varchar(120) DEFAULT NULL,
  `messagestracking_type` varchar(50) DEFAULT NULL COMMENT 'read|delete',
  PRIMARY KEY (`messagestracking_id`),
  KEY `messagetracking_target` (`messagestracking_target`),
  KEY `messagestracking_target` (`messagestracking_target`),
  KEY `messagestracking_user_unique_id` (`messagestracking_user_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_tracking`
--

LOCK TABLES `messages_tracking` WRITE;
/*!40000 ALTER TABLE `messages_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone_categories`
--

DROP TABLE IF EXISTS `milestone_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestone_categories` (
  `milestonecategory_id` int NOT NULL AUTO_INCREMENT,
  `milestonecategory_created` datetime NOT NULL,
  `milestonecategory_updated` datetime NOT NULL,
  `milestonecategory_creatorid` int NOT NULL,
  `milestonecategory_title` varchar(250) NOT NULL,
  `milestonecategory_position` int NOT NULL,
  `milestonecategory_color` varchar(100) DEFAULT 'default' COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  PRIMARY KEY (`milestonecategory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone_categories`
--

LOCK TABLES `milestone_categories` WRITE;
/*!40000 ALTER TABLE `milestone_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestone_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestones` (
  `milestone_id` int NOT NULL AUTO_INCREMENT,
  `milestone_created` datetime NOT NULL,
  `milestone_updated` datetime NOT NULL,
  `milestone_creatorid` int NOT NULL,
  `milestone_title` varchar(250) NOT NULL DEFAULT 'uncategorised',
  `milestone_projectid` int DEFAULT NULL,
  `milestone_position` int NOT NULL DEFAULT '1',
  `milestone_type` varchar(50) NOT NULL DEFAULT 'categorised' COMMENT 'categorised|uncategorised [1 uncategorised milestone if automatically created when a new project is created]',
  `milestone_color` varchar(50) NOT NULL DEFAULT 'default' COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  PRIMARY KEY (`milestone_id`),
  KEY `milestone_projectid` (`milestone_projectid`),
  KEY `milestone_creatorid` (`milestone_creatorid`),
  KEY `milestone_type` (`milestone_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `module_id` int NOT NULL AUTO_INCREMENT,
  `module_created` datetime NOT NULL,
  `module_updated` datetime NOT NULL,
  `module_name` text,
  `module_alias` text,
  `module_uniqueid` text,
  `module_description` text,
  `module_author_name` text,
  `module_author_url` text,
  `module_version` text,
  `module_status` varchar(30) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `note_created` datetime DEFAULT NULL COMMENT 'always now()',
  `note_updated` datetime DEFAULT NULL,
  `note_creatorid` int DEFAULT NULL,
  `note_title` varchar(250) DEFAULT NULL,
  `note_description` text,
  `note_visibility` varchar(30) DEFAULT 'public' COMMENT 'private|public',
  `noteresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] client | project | user | lead',
  `noteresource_id` int DEFAULT NULL COMMENT '[polymorph] e.g project_id',
  `note_mapping_type` text,
  `note_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `note_creatorid` (`note_creatorid`),
  KEY `noteresource_type` (`noteresource_type`),
  KEY `noteresource_id` (`noteresource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]. Notes are always private to the user who created them. They are never visible to anyone else';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sessions`
--

DROP TABLE IF EXISTS `payment_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `session_created` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `session_creatorid` int DEFAULT NULL COMMENT 'user making the payment',
  `session_creator_fullname` varchar(150) DEFAULT NULL,
  `session_creator_email` varchar(150) DEFAULT NULL,
  `session_gateway_name` varchar(150) DEFAULT NULL COMMENT 'stripe | paypal | etc',
  `session_gateway_ref` varchar(150) DEFAULT NULL COMMENT 'Stripe - The checkout_session_id | Paypal -',
  `session_amount` decimal(10,2) DEFAULT NULL COMMENT 'amount of the payment',
  `session_invoices` varchar(250) DEFAULT NULL COMMENT '[currently] - single invoice id | [future] - comma seperated list of invoice id''s that are for this payment',
  `session_subscription` int DEFAULT NULL COMMENT 'subscription id',
  `session_payload` text,
  PRIMARY KEY (`session_id`),
  KEY `session_gateway_name` (`session_gateway_name`),
  KEY `session_gateway_ref` (`session_gateway_ref`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Track payment sessions so that IPN/Webhook calls can be linked to the correct invoice. Cronjob can be used to cleanup this table for any records older than 72hrs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sessions`
--

LOCK TABLES `payment_sessions` WRITE;
/*!40000 ALTER TABLE `payment_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT COMMENT '[truncate]',
  `payment_created` datetime DEFAULT NULL,
  `payment_updated` datetime DEFAULT NULL,
  `payment_creatorid` int DEFAULT NULL COMMENT '''0'' for system',
  `payment_date` date DEFAULT NULL,
  `payment_invoiceid` int DEFAULT NULL COMMENT 'invoice id',
  `payment_subscriptionid` int DEFAULT NULL COMMENT 'subscription id',
  `payment_clientid` int DEFAULT NULL,
  `payment_projectid` int DEFAULT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_transaction_id` varchar(100) DEFAULT NULL,
  `payment_gateway` varchar(100) DEFAULT NULL COMMENT 'paypal | stripe | cash | bank',
  `payment_notes` text,
  `payment_type` varchar(50) DEFAULT 'invoice' COMMENT 'invoice|subscription',
  `paymentresource_type` text COMMENT 'optional references',
  `paymentresource_id` int DEFAULT NULL,
  `payment_mapping_type` text,
  `payment_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_creatorid` (`payment_creatorid`),
  KEY `payment_invoiceid` (`payment_invoiceid`),
  KEY `payment_clientid` (`payment_clientid`),
  KEY `payment_projectid` (`payment_projectid`),
  KEY `payment_gateway` (`payment_gateway`),
  KEY `payment_subscriptionid` (`payment_subscriptionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pinned`
--

DROP TABLE IF EXISTS `pinned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pinned` (
  `pinned_id` int NOT NULL AUTO_INCREMENT,
  `pinned_created` int NOT NULL,
  `pinned_updated` int NOT NULL,
  `pinned_userid` int DEFAULT NULL,
  `pinned_status` varchar(50) DEFAULT 'pinned' COMMENT 'just pinned, does not have other value',
  `pinnedresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] project | ticket | task | lead',
  `pinnedresource_id` int DEFAULT NULL COMMENT '[polymorph] e.g project_id',
  PRIMARY KEY (`pinned_id`),
  KEY `pinned_status` (`pinned_status`),
  KEY `pinned_userid` (`pinned_userid`),
  KEY `pinnedresource_id` (`pinnedresource_id`),
  KEY `pinnedresource_type` (`pinnedresource_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pinned`
--

LOCK TABLES `pinned` WRITE;
/*!40000 ALTER TABLE `pinned` DISABLE KEYS */;
/*!40000 ALTER TABLE `pinned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tasks`
--

DROP TABLE IF EXISTS `product_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tasks` (
  `product_task_id` int NOT NULL AUTO_INCREMENT,
  `product_task_created` date NOT NULL,
  `product_task_updated` date NOT NULL,
  `product_task_creatorid` int DEFAULT NULL,
  `product_task_itemid` int DEFAULT NULL,
  `product_task_title` varchar(250) DEFAULT NULL,
  `product_task_description` text,
  PRIMARY KEY (`product_task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tasks`
--

LOCK TABLES `product_tasks` WRITE;
/*!40000 ALTER TABLE `product_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tasks_dependencies`
--

DROP TABLE IF EXISTS `product_tasks_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tasks_dependencies` (
  `product_task_dependency_id` int NOT NULL AUTO_INCREMENT,
  `product_task_dependency_created` date NOT NULL,
  `product_task_dependency_updated` date NOT NULL,
  `product_task_dependency_taskid` int DEFAULT NULL,
  `product_task_dependency_blockerid` int DEFAULT NULL,
  `product_task_dependency_type` varchar(100) DEFAULT NULL COMMENT 'cannot_complete|cannot_start',
  PRIMARY KEY (`product_task_dependency_id`),
  KEY `product_task_dependency_taskid` (`product_task_dependency_taskid`),
  KEY `product_task_dependency_blockerid` (`product_task_dependency_blockerid`),
  KEY `product_task_dependency_type` (`product_task_dependency_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tasks_dependencies`
--

LOCK TABLES `product_tasks_dependencies` WRITE;
/*!40000 ALTER TABLE `product_tasks_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tasks_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_uniqueid` varchar(100) DEFAULT NULL COMMENT 'optional',
  `project_type` varchar(30) NOT NULL DEFAULT 'project' COMMENT 'project|template|space',
  `project_reference` varchar(250) DEFAULT NULL COMMENT '[optiona] additional data for identifying a project',
  `project_importid` varchar(100) DEFAULT NULL,
  `project_created` datetime DEFAULT NULL,
  `project_updated` datetime DEFAULT NULL,
  `project_timestamp_created` int DEFAULT NULL,
  `project_timestamp_updated` int DEFAULT NULL,
  `project_clientid` int DEFAULT NULL,
  `project_creatorid` int NOT NULL COMMENT 'creator of the project',
  `project_categoryid` int DEFAULT '1' COMMENT 'default category',
  `project_cover_directory` varchar(100) DEFAULT NULL,
  `project_cover_filename` varchar(100) DEFAULT NULL,
  `project_cover_file_id` int DEFAULT NULL COMMENT 'if this cover was made from an existing file',
  `project_title` varchar(250) NOT NULL,
  `project_date_start` date DEFAULT NULL,
  `project_date_due` date DEFAULT NULL,
  `project_description` text,
  `project_date_status_changed` date DEFAULT NULL,
  `project_status` varchar(50) DEFAULT 'not_started' COMMENT 'not_started | in_progress | on_hold | cancelled | completed',
  `project_active_state` varchar(10) DEFAULT 'active' COMMENT 'active|archive',
  `project_progress` tinyint DEFAULT '0',
  `project_billing_rate` decimal(10,2) DEFAULT '0.00',
  `project_billing_type` varchar(40) DEFAULT 'hourly' COMMENT 'hourly | fixed',
  `project_billing_estimated_hours` int DEFAULT '0' COMMENT 'estimated hours',
  `project_billing_costs_estimate` decimal(10,2) DEFAULT '0.00',
  `project_progress_manually` varchar(10) DEFAULT 'no' COMMENT 'yes | no',
  `clientperm_tasks_view` varchar(10) DEFAULT 'yes' COMMENT 'yes | no',
  `clientperm_tasks_collaborate` varchar(40) DEFAULT 'yes' COMMENT 'yes | no',
  `clientperm_tasks_create` varchar(40) DEFAULT 'yes' COMMENT 'yes | no',
  `clientperm_timesheets_view` varchar(40) DEFAULT 'yes' COMMENT 'yes | no',
  `clientperm_expenses_view` varchar(40) DEFAULT 'no' COMMENT 'yes | no',
  `assignedperm_milestone_manage` varchar(40) DEFAULT 'yes' COMMENT 'yes | no',
  `assignedperm_tasks_collaborate` varchar(40) DEFAULT NULL COMMENT 'yes | no',
  `project_visibility` varchar(40) DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent projects that are still being cloned from showing in projects list)',
  `project_calendar_timezone` text,
  `project_calendar_location` text COMMENT 'optional - used by the calendar',
  `project_calendar_reminder` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `project_calendar_reminder_duration` int DEFAULT NULL COMMENT 'optional - e.g 1 for 1 day',
  `project_calendar_reminder_period` text COMMENT 'optional - hours | days | weeks | months | years',
  `project_calendar_reminder_sent` text COMMENT 'yes|no',
  `project_calendar_reminder_date_sent` datetime DEFAULT NULL,
  `projectresource_type` text COMMENT 'optional references',
  `projectresource_id` int DEFAULT NULL COMMENT 'optional references',
  `project_custom_field_1` tinytext,
  `project_custom_field_2` tinytext,
  `project_custom_field_3` tinytext,
  `project_custom_field_4` tinytext,
  `project_custom_field_5` tinytext,
  `project_custom_field_6` tinytext,
  `project_custom_field_7` tinytext,
  `project_custom_field_8` tinytext,
  `project_custom_field_9` tinytext,
  `project_custom_field_10` tinytext,
  `project_custom_field_11` datetime DEFAULT NULL,
  `project_custom_field_12` datetime DEFAULT NULL,
  `project_custom_field_13` datetime DEFAULT NULL,
  `project_custom_field_14` datetime DEFAULT NULL,
  `project_custom_field_15` datetime DEFAULT NULL,
  `project_custom_field_16` datetime DEFAULT NULL,
  `project_custom_field_17` datetime DEFAULT NULL,
  `project_custom_field_18` datetime DEFAULT NULL,
  `project_custom_field_19` datetime DEFAULT NULL,
  `project_custom_field_20` datetime DEFAULT NULL,
  `project_custom_field_21` text,
  `project_custom_field_22` text,
  `project_custom_field_23` text,
  `project_custom_field_24` text,
  `project_custom_field_25` text,
  `project_custom_field_26` text,
  `project_custom_field_27` text,
  `project_custom_field_28` text,
  `project_custom_field_29` text,
  `project_custom_field_30` text,
  `project_custom_field_31` varchar(20) DEFAULT NULL,
  `project_custom_field_32` varchar(20) DEFAULT NULL,
  `project_custom_field_33` varchar(20) DEFAULT NULL,
  `project_custom_field_34` varchar(20) DEFAULT NULL,
  `project_custom_field_35` varchar(20) DEFAULT NULL,
  `project_custom_field_36` varchar(20) DEFAULT NULL,
  `project_custom_field_37` varchar(20) DEFAULT NULL,
  `project_custom_field_38` varchar(20) DEFAULT NULL,
  `project_custom_field_39` varchar(20) DEFAULT NULL,
  `project_custom_field_40` varchar(20) DEFAULT NULL,
  `project_custom_field_41` varchar(150) DEFAULT NULL,
  `project_custom_field_42` varchar(150) DEFAULT NULL,
  `project_custom_field_43` varchar(150) DEFAULT NULL,
  `project_custom_field_44` varchar(150) DEFAULT NULL,
  `project_custom_field_45` varchar(150) DEFAULT NULL,
  `project_custom_field_46` varchar(150) DEFAULT NULL,
  `project_custom_field_47` varchar(150) DEFAULT NULL,
  `project_custom_field_48` varchar(150) DEFAULT NULL,
  `project_custom_field_49` varchar(150) DEFAULT NULL,
  `project_custom_field_50` varchar(150) DEFAULT NULL,
  `project_custom_field_51` int DEFAULT NULL,
  `project_custom_field_52` int DEFAULT NULL,
  `project_custom_field_53` int DEFAULT NULL,
  `project_custom_field_54` int DEFAULT NULL,
  `project_custom_field_55` int DEFAULT NULL,
  `project_custom_field_56` int DEFAULT NULL,
  `project_custom_field_57` int DEFAULT NULL,
  `project_custom_field_58` int DEFAULT NULL,
  `project_custom_field_59` int DEFAULT NULL,
  `project_custom_field_60` int DEFAULT NULL,
  `project_custom_field_61` decimal(10,2) DEFAULT NULL,
  `project_custom_field_62` decimal(10,2) DEFAULT NULL,
  `project_custom_field_63` decimal(10,2) DEFAULT NULL,
  `project_custom_field_64` decimal(10,2) DEFAULT NULL,
  `project_custom_field_65` decimal(10,2) DEFAULT NULL,
  `project_custom_field_66` decimal(10,2) DEFAULT NULL,
  `project_custom_field_67` decimal(10,2) DEFAULT NULL,
  `project_custom_field_68` decimal(10,2) DEFAULT NULL,
  `project_custom_field_69` decimal(10,2) DEFAULT NULL,
  `project_custom_field_70` decimal(10,2) DEFAULT NULL,
  `project_automation_status` varchar(30) DEFAULT 'disabled' COMMENT 'disabled|enabled',
  `project_automation_create_invoices` varchar(30) DEFAULT 'no' COMMENT 'yes|no',
  `project_automation_convert_estimates_to_invoices` varchar(30) DEFAULT 'no' COMMENT 'yes|no',
  `project_automation_invoice_unbilled_hours` varchar(30) DEFAULT 'no' COMMENT 'yes|no',
  `project_automation_invoice_hourly_rate` decimal(10,2) DEFAULT NULL,
  `project_automation_invoice_hourly_tax_1` int DEFAULT NULL,
  `project_automation_invoice_email_client` varchar(30) DEFAULT 'no' COMMENT 'yes|no',
  `project_automation_invoice_due_date` int DEFAULT '0',
  PRIMARY KEY (`project_id`),
  KEY `FK_projects` (`project_clientid`),
  KEY `project_creatorid` (`project_creatorid`),
  KEY `project_categoryid` (`project_categoryid`),
  KEY `project_status` (`project_status`),
  KEY `project_visibility` (`project_visibility`),
  KEY `project_type` (`project_type`),
  KEY `project_active_state` (`project_active_state`),
  KEY `project_billing_type` (`project_billing_type`),
  KEY `clientperm_tasks_view` (`clientperm_tasks_view`),
  KEY `project_progress_manually` (`project_progress_manually`),
  KEY `clientperm_tasks_collaborate` (`clientperm_tasks_collaborate`),
  KEY `clientperm_tasks_create` (`clientperm_tasks_create`),
  KEY `clientperm_timesheets_view` (`clientperm_timesheets_view`),
  KEY `clientperm_expenses_view` (`clientperm_expenses_view`),
  KEY `assignedperm_milestone_manage` (`assignedperm_milestone_manage`),
  KEY `assignedperm_tasks_collaborate` (`assignedperm_tasks_collaborate`),
  KEY `project_calendar_reminder` (`project_calendar_reminder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_assigned`
--

DROP TABLE IF EXISTS `projects_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_assigned` (
  `projectsassigned_id` int NOT NULL AUTO_INCREMENT COMMENT '[truncate]',
  `projectsassigned_projectid` int DEFAULT NULL,
  `projectsassigned_userid` int DEFAULT NULL,
  `projectsassigned_created` datetime DEFAULT NULL,
  `projectsassigned_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`projectsassigned_id`),
  KEY `projectsassigned_projectid` (`projectsassigned_projectid`),
  KEY `projectsassigned_userid` (`projectsassigned_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_assigned`
--

LOCK TABLES `projects_assigned` WRITE;
/*!40000 ALTER TABLE `projects_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_manager`
--

DROP TABLE IF EXISTS `projects_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_manager` (
  `projectsmanager_id` int NOT NULL AUTO_INCREMENT,
  `projectsmanager_created` datetime NOT NULL,
  `projectsmanager_updated` datetime NOT NULL,
  `projectsmanager_projectid` int DEFAULT NULL,
  `projectsmanager_userid` int NOT NULL,
  PRIMARY KEY (`projectsmanager_id`),
  KEY `projectsmanager_userid` (`projectsmanager_userid`),
  KEY `projectsmanager_projectid` (`projectsmanager_projectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_manager`
--

LOCK TABLES `projects_manager` WRITE;
/*!40000 ALTER TABLE `projects_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_templates`
--

DROP TABLE IF EXISTS `proposal_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_templates` (
  `proposal_template_id` int NOT NULL AUTO_INCREMENT,
  `proposal_template_created` datetime NOT NULL,
  `proposal_template_updated` datetime NOT NULL,
  `proposal_template_creatorid` int DEFAULT NULL,
  `proposal_template_title` varchar(250) DEFAULT NULL,
  `proposal_template_heading_color` varchar(30) DEFAULT '#FFFFFF',
  `proposal_template_title_color` varchar(30) DEFAULT '#FFFFFF',
  `proposal_template_body` text,
  `proposal_template_estimate_id` int DEFAULT NULL,
  `proposal_template_system` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  PRIMARY KEY (`proposal_template_id`),
  KEY `proposal_template_creatorid` (`proposal_template_creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_templates`
--

LOCK TABLES `proposal_templates` WRITE;
/*!40000 ALTER TABLE `proposal_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposal_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals`
--

DROP TABLE IF EXISTS `proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposals` (
  `doc_id` int NOT NULL AUTO_INCREMENT,
  `doc_unique_id` varchar(150) DEFAULT NULL,
  `doc_template` varchar(150) DEFAULT NULL COMMENT 'default',
  `doc_created` datetime NOT NULL,
  `doc_updated` datetime NOT NULL,
  `doc_date_status_change` datetime DEFAULT NULL,
  `doc_creatorid` int NOT NULL COMMENT 'use ( -1 ) for logged out user.',
  `doc_categoryid` int DEFAULT '11' COMMENT '11 is the default category',
  `doc_heading` text COMMENT 'e.g. proposal',
  `doc_heading_color` text,
  `doc_title` text,
  `doc_title_color` text,
  `doc_hero_direcory` text,
  `doc_hero_filename` text,
  `doc_hero_updated` varchar(250) DEFAULT 'no' COMMENT 'ys|no (when no, we use default image path)',
  `doc_body` text,
  `doc_date_start` date DEFAULT NULL COMMENT 'Proposal Issue Date | Contract Start Date',
  `doc_date_end` date DEFAULT NULL COMMENT 'Proposal Expiry Date | Contract End Date',
  `doc_date_published` date DEFAULT NULL,
  `doc_date_last_emailed` datetime DEFAULT NULL,
  `doc_client_id` int DEFAULT NULL,
  `doc_project_id` int DEFAULT NULL,
  `doc_lead_id` int DEFAULT NULL,
  `doc_notes` text,
  `doc_viewed` varchar(20) DEFAULT 'no' COMMENT 'yes|no',
  `doc_type` varchar(150) DEFAULT NULL COMMENT 'proposal|contract',
  `doc_system_type` varchar(150) DEFAULT 'document' COMMENT 'document|template',
  `doc_signed_date` datetime DEFAULT NULL,
  `doc_signed_first_name` text,
  `doc_signed_last_name` text,
  `doc_signed_signature_directory` text,
  `doc_signed_signature_filename` text,
  `doc_signed_ip_address` text,
  `doc_fallback_client_first_name` text COMMENT 'used for creating events when users are not logged in',
  `doc_fallback_client_last_name` text COMMENT 'used for creating events when users are not logged in',
  `doc_fallback_client_email` text COMMENT 'used for creating events when users are not logged in',
  `doc_status` varchar(100) DEFAULT 'draft' COMMENT 'draft|new|accepted|declined|revised|expired',
  `proposal_automation_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `docresource_type` varchar(100) DEFAULT NULL COMMENT 'client|lead',
  `docresource_id` int DEFAULT NULL,
  `proposal_automation_create_project` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `proposal_automation_project_title` text,
  `proposal_automation_project_status` varchar(30) DEFAULT 'in_progress' COMMENT 'not_started | in_progress | on_hold',
  `proposal_automation_create_tasks` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `proposal_automation_project_email_client` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `proposal_automation_create_invoice` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `proposal_automation_invoice_due_date` int DEFAULT NULL,
  `proposal_automation_invoice_email_client` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `proposal_automation_log_created_project_id` int DEFAULT NULL,
  `proposal_automation_log_created_invoice_id` int DEFAULT NULL,
  `doc_publishing_type` varchar(20) DEFAULT 'instant' COMMENT 'instant|scheduled',
  `doc_publishing_scheduled_date` datetime DEFAULT NULL,
  `doc_publishing_scheduled_status` text COMMENT 'pending|published|failed',
  `doc_publishing_scheduled_log` text,
  `proposal_mapping_type` text,
  `proposal_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminders` (
  `reminder_id` int NOT NULL AUTO_INCREMENT,
  `reminder_created` datetime NOT NULL,
  `reminder_updated` datetime NOT NULL,
  `reminder_userid` int DEFAULT NULL,
  `reminder_datetime` datetime DEFAULT NULL,
  `reminder_timestamp` timestamp NULL DEFAULT NULL,
  `reminder_title` varchar(250) DEFAULT NULL,
  `reminder_meta` varchar(250) DEFAULT NULL,
  `reminder_notes` text,
  `reminder_status` varchar(10) DEFAULT 'new' COMMENT 'active|due',
  `reminder_sent` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `reminderresource_type` varchar(50) DEFAULT NULL COMMENT 'project|client|estimate|lead|task|invoice|ticket',
  `reminderresource_id` int DEFAULT NULL COMMENT 'linked resoucre id',
  `reminder_mapping_type` text,
  `reminder_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`reminder_id`),
  KEY `reminderresource_type` (`reminderresource_type`),
  KEY `reminderresource_id` (`reminderresource_id`),
  KEY `reminder_status` (`reminder_status`),
  KEY `reminder_sent` (`reminder_sent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_created` datetime DEFAULT NULL,
  `role_updated` datetime DEFAULT NULL,
  `role_system` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no (system roles cannot be deleted)',
  `role_type` varchar(10) NOT NULL COMMENT 'client|team',
  `role_name` varchar(100) NOT NULL,
  `role_clients` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_contacts` tinyint NOT NULL COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_contracts` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_invoices` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_estimates` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_proposals` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_payments` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_items` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_tasks` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_tasks_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_projects` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_projects_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_projects_billing` varchar(20) NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2)',
  `role_leads` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_leads_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_expenses` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_expenses_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_timesheets` int NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-delete (2)',
  `role_timesheets_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_team` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_team_scope` varchar(20) NOT NULL DEFAULT 'global' COMMENT 'own | global',
  `role_tickets` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_knowledgebase` tinyint NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_manage_knowledgebase_categories` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_assign_projects` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_assign_leads` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_assign_tasks` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_set_project_permissions` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_subscriptions` varchar(20) NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_templates_projects` varchar(20) NOT NULL DEFAULT '1' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_templates_contracts` varchar(20) NOT NULL DEFAULT '1' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_templates_proposals` varchar(20) NOT NULL DEFAULT '1' COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_content_import` varchar(20) NOT NULL DEFAULT 'yes' COMMENT 'yes|no',
  `role_content_export` varchar(20) NOT NULL DEFAULT 'yes' COMMENT 'yes|no',
  `role_module_cs_affiliate` varchar(20) NOT NULL DEFAULT '3' COMMENT 'global',
  `role_homepage` varchar(100) NOT NULL DEFAULT 'dashboard',
  `role_messages` varchar(20) NOT NULL DEFAULT 'yes' COMMENT 'yes|no',
  `role_reports` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_canned` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_canned_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own|global',
  `modules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'json - permissions for all modules',
  PRIMARY KEY (`role_id`),
  KEY `role_type` (`role_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[do not truncate] [roles 1,2,3 required] [role 1 = admin] [role 2 = client] [role 3 = staff]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(250) NOT NULL,
  `user_id` int DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_activity` int NOT NULL,
  `json_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'data that can be used by other modules',
  CONSTRAINT `sessions_chk_1` CHECK (json_valid(`json_data`))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `settings_id` int NOT NULL AUTO_INCREMENT,
  `settings_created` datetime NOT NULL,
  `settings_updated` datetime NOT NULL,
  `settings_type` varchar(50) DEFAULT 'standalone' COMMENT 'standalone|saas',
  `settings_saas_tenant_id` int DEFAULT NULL,
  `settings_saas_status` varchar(100) DEFAULT NULL COMMENT 'unsubscribed|free-trial|awaiting-payment|failed|active|cancelled',
  `settings_saas_package_id` int DEFAULT NULL,
  `settings_saas_onetimelogin_key` varchar(100) DEFAULT NULL,
  `settings_saas_onetimelogin_destination` varchar(100) DEFAULT NULL COMMENT 'home|payment',
  `settings_saas_package_limits_clients` int DEFAULT NULL,
  `settings_saas_package_limits_team` int DEFAULT NULL,
  `settings_saas_package_limits_projects` int DEFAULT NULL,
  `settings_saas_notification_uniqueid` text COMMENT '(optional) unique identifier',
  `settings_saas_notification_body` text COMMENT 'html body of promotion etc',
  `settings_saas_notification_read` text COMMENT 'yes|no',
  `settings_saas_notification_action` text COMMENT 'none|external-link|internal-link',
  `settings_saas_notification_action_url` text,
  `settings_saas_email_server_type` varchar(30) DEFAULT 'local' COMMENT 'local |smtp',
  `settings_saas_email_forwarding_address` text,
  `settings_saas_email_local_address` text,
  `settings_installation_date` datetime NOT NULL COMMENT 'date the system was setup',
  `settings_version` text NOT NULL,
  `settings_purchase_code` text COMMENT 'codecanyon code',
  `settings_company_name` text,
  `settings_company_address_line_1` text,
  `settings_company_state` text,
  `settings_company_city` text,
  `settings_company_zipcode` text,
  `settings_company_country` text,
  `settings_company_telephone` text,
  `settings_company_customfield_1` text,
  `settings_company_customfield_2` text,
  `settings_company_customfield_3` text,
  `settings_company_customfield_4` text,
  `settings_clients_registration` text COMMENT 'enabled | disabled',
  `settings_clients_shipping_address` text COMMENT 'enabled | disabled',
  `settings_clients_disable_email_delivery` varchar(12) DEFAULT 'disabled' COMMENT 'enabled | disabled',
  `settings_clients_app_login` varchar(12) DEFAULT 'enabled' COMMENT 'enabled | disabled',
  `settings_customfields_display_leads` varchar(12) DEFAULT 'toggled' COMMENT 'toggled|expanded',
  `settings_customfields_display_clients` varchar(12) DEFAULT 'toggled' COMMENT 'toggled|expanded',
  `settings_customfields_display_projects` varchar(12) DEFAULT 'toggled' COMMENT 'toggled|expanded',
  `settings_customfields_display_tasks` varchar(12) DEFAULT 'toggled' COMMENT 'toggled|expanded',
  `settings_customfields_display_tickets` varchar(12) DEFAULT 'toggled' COMMENT 'toggled|expanded',
  `settings_email_general_variables` text COMMENT 'common variable displayed available in templates',
  `settings_email_from_address` text,
  `settings_email_from_name` text,
  `settings_email_server_type` text COMMENT 'smtp|sendmail',
  `settings_email_smtp_host` text,
  `settings_email_smtp_port` text,
  `settings_email_smtp_username` text,
  `settings_email_smtp_password` text,
  `settings_email_smtp_encryption` text COMMENT 'tls|ssl|starttls',
  `settings_estimates_default_terms_conditions` text,
  `settings_estimates_prefix` text,
  `settings_estimates_show_view_status` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_modules_projects` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_tasks` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_invoices` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_payments` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_leads` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_knowledgebase` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_estimates` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_expenses` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_notes` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_subscriptions` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_contracts` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_proposals` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_tickets` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_timetracking` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_reminders` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_spaces` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_messages` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_modules_reports` text COMMENT 'enabled|disabled',
  `settings_modules_calendar` text COMMENT 'enabled|disabled',
  `settings_files_max_size_mb` int DEFAULT '300' COMMENT 'maximum size in MB',
  `settings_knowledgebase_article_ordering` varchar(40) DEFAULT 'name' COMMENT 'name-asc|name-desc|date-asc|date-desc',
  `settings_knowledgebase_allow_guest_viewing` varchar(10) DEFAULT 'no' COMMENT 'yes | no',
  `settings_knowledgebase_external_pre_body` text COMMENT 'for use when viewing externally, as guest',
  `settings_knowledgebase_external_post_body` text COMMENT 'for use when viewing externally, as guest',
  `settings_knowledgebase_external_header` text COMMENT 'for use when viewing externally, as guest',
  `settings_system_timezone` text,
  `settings_system_date_format` text COMMENT 'd-m-Y | d/m/Y | m-d-Y | m/d/Y | Y-m-d | Y/m/d | Y-d-m | Y/d/m',
  `settings_system_datepicker_format` text COMMENT 'dd-mm-yyyy | mm-dd-yyyy',
  `settings_system_default_leftmenu` text COMMENT 'collapsed | open',
  `settings_system_default_statspanel` text COMMENT 'collapsed | open',
  `settings_system_pagination_limits` tinyint DEFAULT NULL,
  `settings_system_kanban_pagination_limits` tinyint DEFAULT NULL,
  `settings_system_currency_code` text,
  `settings_system_currency_symbol` text,
  `settings_system_currency_position` text COMMENT 'left|right',
  `settings_system_currency_hide_decimal` text COMMENT 'yes|no',
  `settings_system_decimal_separator` text,
  `settings_system_thousand_separator` text,
  `settings_system_close_modals_body_click` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings_system_language_default` varchar(40) DEFAULT 'en' COMMENT 'english|french|etc',
  `settings_system_language_allow_users_to_change` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_system_logo_large_name` varchar(40) DEFAULT 'logo.jpg',
  `settings_system_logo_small_name` varchar(40) DEFAULT 'logo-small.jpg',
  `settings_system_logo_versioning` varchar(40) DEFAULT '1' COMMENT 'used to refresh logo when updated',
  `settings_system_session_login_popup` varchar(10) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `settings_system_javascript_versioning` date DEFAULT NULL,
  `settings_system_exporting_strip_html` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_tags_allow_users_create` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_leads_allow_private` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_leads_allow_new_sources` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_leads_kanban_value` text COMMENT 'show|hide',
  `settings_leads_kanban_date_created` text COMMENT 'show|hide',
  `settings_leads_kanban_category` text COMMENT 'show|hide',
  `settings_leads_kanban_date_contacted` text COMMENT 'show|hide',
  `settings_leads_kanban_telephone` text COMMENT 'show|hide',
  `settings_leads_kanban_source` text COMMENT 'show|hide',
  `settings_leads_kanban_email` text COMMENT 'show|hide',
  `settings_leads_kanban_tags` text,
  `settings_leads_kanban_reminder` text,
  `settings_tasks_client_visibility` text COMMENT 'visible|invisible - used in create new task form on the checkbox ',
  `settings_tasks_billable` text COMMENT 'billable|not-billable - used in create new task form on the checkbox ',
  `settings_tasks_kanban_date_created` text COMMENT 'show|hide',
  `settings_tasks_kanban_date_due` text COMMENT 'show|hide',
  `settings_tasks_kanban_date_start` text COMMENT 'show|hide',
  `settings_tasks_kanban_priority` text COMMENT 'show|hide',
  `settings_tasks_kanban_milestone` text,
  `settings_tasks_kanban_client_visibility` text COMMENT 'show|hide',
  `settings_tasks_kanban_project_title` varchar(10) DEFAULT 'show' COMMENT 'show|hide',
  `settings_tasks_kanban_client_name` varchar(10) DEFAULT 'show' COMMENT 'show|hide',
  `settings_tasks_kanban_tags` text,
  `settings_tasks_kanban_reminder` text,
  `settings_tasks_send_overdue_reminder` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_invoices_prefix` text,
  `settings_invoices_recurring_grace_period` smallint DEFAULT NULL COMMENT 'Number of days for due date on recurring invoices. If set to zero, invoices will be given due date same as invoice date',
  `settings_invoices_default_terms_conditions` text,
  `settings_invoices_show_view_status` text NOT NULL,
  `settings_invoices_show_project_on_invoice` text NOT NULL COMMENT 'yes|no',
  `settings_projects_cover_images` varchar(10) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `settings_projects_permissions_basis` varchar(40) DEFAULT 'user_roles' COMMENT 'user_roles|category_based',
  `settings_projects_categories_main_menu` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings_projects_default_hourly_rate` decimal(10,2) DEFAULT '0.00' COMMENT 'default hourly rate for new projects',
  `settings_projects_allow_setting_permission_on_project_creation` text COMMENT 'yes|no',
  `settings_projects_clientperm_files_view` text COMMENT 'yes|no',
  `settings_projects_clientperm_files_upload` text COMMENT 'yes|no',
  `settings_projects_clientperm_comments_view` text COMMENT 'yes|no',
  `settings_projects_clientperm_comments_post` text COMMENT 'yes|no',
  `settings_projects_clientperm_tasks_view` text COMMENT 'yes|no',
  `settings_projects_clientperm_tasks_collaborate` text COMMENT 'yes|no',
  `settings_projects_clientperm_tasks_create` text COMMENT 'yes|no',
  `settings_projects_clientperm_timesheets_view` text COMMENT 'yes|no',
  `settings_projects_clientperm_expenses_view` text COMMENT 'yes|no',
  `settings_projects_clientperm_milestones_view` text COMMENT 'yes|no',
  `settings_projects_clientperm_assigned_view` text COMMENT 'yes|no',
  `settings_projects_assignedperm_milestone_manage` text COMMENT 'yes|no',
  `settings_projects_assignedperm_tasks_collaborate` text COMMENT 'yes|no',
  `settings_projects_events_show_task_status_change` text COMMENT 'yes|no',
  `settings_stripe_secret_key` text,
  `settings_stripe_public_key` text,
  `settings_stripe_webhooks_key` text COMMENT 'from strip dashboard',
  `settings_stripe_default_subscription_plan_id` text,
  `settings_stripe_currency` text,
  `settings_stripe_display_name` text COMMENT 'what customer will see on payment screen',
  `settings_stripe_status` text COMMENT 'enabled|disabled',
  `settings_subscriptions_prefix` varchar(40) DEFAULT 'SUB-',
  `settings_paypal_email` text,
  `settings_paypal_currency` text,
  `settings_paypal_display_name` text COMMENT 'what customer will see on payment screen',
  `settings_paypal_mode` text COMMENT 'sandbox | live',
  `settings_paypal_status` text COMMENT 'enabled|disabled',
  `settings_mollie_live_api_key` text,
  `settings_mollie_test_api_key` text,
  `settings_mollie_display_name` text,
  `settings_mollie_mode` varchar(40) DEFAULT 'live',
  `settings_mollie_currency` text,
  `settings_mollie_status` varchar(10) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `settings_bank_details` text,
  `settings_bank_display_name` text COMMENT 'what customer will see on payment screen',
  `settings_bank_status` text COMMENT 'enabled|disabled',
  `settings_razorpay_keyid` text,
  `settings_razorpay_secretkey` text,
  `settings_razorpay_currency` text,
  `settings_razorpay_display_name` text,
  `settings_razorpay_status` varchar(10) DEFAULT 'disabled',
  `settings_completed_check_email` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings_expenses_billable_by_default` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_tickets_edit_subject` text COMMENT 'yes|no',
  `settings_tickets_edit_body` text COMMENT 'yes|no',
  `settings_theme_name` varchar(60) DEFAULT 'default' COMMENT 'default|darktheme',
  `settings_theme_head` text,
  `settings_theme_body` text,
  `settings_track_thankyou_session_id` text COMMENT 'used to ensure we show thank you page just once',
  `settings_proposals_prefix` varchar(30) DEFAULT 'PROP-',
  `settings_proposals_show_view_status` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_contracts_prefix` varchar(30) DEFAULT 'CONT-',
  `settings_contracts_show_view_status` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_cronjob_has_run` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings_cronjob_last_run` datetime DEFAULT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings2`
--

DROP TABLE IF EXISTS `settings2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings2` (
  `settings2_id` int NOT NULL AUTO_INCREMENT,
  `settings2_created` datetime NOT NULL,
  `settings2_updated` datetime NOT NULL,
  `settings2_bills_pdf_css` text,
  `settings2_calendar_projects_colour` text COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  `settings2_calendar_tasks_colour` text COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  `settings2_calendar_events_colour` text COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  `settings2_calendar_reminder_duration` int DEFAULT NULL,
  `settings2_calendar_reminder_period` text COMMENT 'hours|days|weeks|months|years',
  `settings2_calendar_events_assigning` text COMMENT 'admin|everyone',
  `settings2_calendar_first_day` int DEFAULT NULL COMMENT 'Sunday =0, Monday =1, etc. Default 0',
  `settings2_calendar_default_event_duration` int DEFAULT NULL COMMENT 'default 30 minutes',
  `settings2_calendar_send_reminder_projects` text COMMENT 'start-date|due-date',
  `settings2_calendar_send_reminder_tasks` text COMMENT 'start-date|due-date',
  `settings2_calendar_send_reminder_events` text COMMENT 'start-date|due-date',
  `settings2_captcha_api_site_key` text,
  `settings2_captcha_api_secret_key` text,
  `settings2_captcha_status` varchar(10) DEFAULT 'disabled' COMMENT 'disabled|enabled',
  `settings2_estimates_automation_default_status` varchar(10) DEFAULT 'disabled' COMMENT 'disabled|enabled',
  `settings2_estimates_automation_create_project` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_estimates_automation_project_status` varchar(50) DEFAULT 'in_progress' COMMENT 'not_started | in_progress | on_hold',
  `settings2_estimates_automation_project_title` text COMMENT 'default project title',
  `settings2_estimates_automation_project_email_client` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_estimates_automation_create_invoice` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_estimates_automation_invoice_email_client` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_estimates_automation_invoice_due_date` int DEFAULT '7',
  `settings2_estimates_automation_create_tasks` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_estimates_automation_copy_attachments` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings2_extras_dimensions_billing` varchar(10) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `settings2_extras_dimensions_default_unit` varchar(30) DEFAULT 'm2',
  `settings2_extras_dimensions_show_measurements` varchar(10) DEFAULT 'no' COMMENT 'show on the pd,web etc',
  `settings2_importing_leads_duplicates_name` text COMMENT 'yes|no',
  `settings2_importing_leads_duplicates_email` text COMMENT 'yes|no',
  `settings2_importing_leads_duplicates_telephone` text COMMENT 'yes|no',
  `settings2_importing_leads_duplicates_company` text COMMENT 'yes|no',
  `settings2_importing_clients_duplicates_email` text COMMENT 'yes|no',
  `settings2_importing_clients_duplicates_telephone` text COMMENT 'yes|no',
  `settings2_importing_clients_duplicates_company` text COMMENT 'yes|no',
  `settings2_projects_automation_default_status` varchar(10) DEFAULT 'disabled' COMMENT 'disabled|enabled',
  `settings2_projects_automation_create_invoices` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_projects_automation_convert_estimates_to_invoices` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_projects_automation_skip_draft_estimates` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings2_projects_automation_skip_declined_estimates` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings2_projects_automation_invoice_unbilled_hours` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_projects_automation_invoice_hourly_rate` decimal(10,2) DEFAULT NULL,
  `settings2_projects_automation_invoice_hourly_tax_1` int DEFAULT NULL,
  `settings2_projects_automation_invoice_email_client` varchar(10) DEFAULT 'no',
  `settings2_projects_automation_invoice_due_date` int DEFAULT '7',
  `settings2_tasks_manage_dependencies` varchar(60) DEFAULT 'super-users' COMMENT 'admin-users | super-users | all-task-users',
  `settings2_tap_secret_key` text,
  `settings2_tap_publishable_key` text,
  `settings2_tap_currency_code` text,
  `settings2_tap_language` varchar(10) DEFAULT 'en' COMMENT 'arabic (ar) | english (en)',
  `settings2_tap_display_name` text,
  `settings2_tap_status` varchar(10) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `settings2_theme_css` text,
  `settings2_paystack_secret_key` text,
  `settings2_paystack_public_key` text,
  `settings2_paystack_currency_code` text,
  `settings2_paystack_display_name` text,
  `settings2_paystack_status` varchar(10) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `settings2_proposals_automation_default_status` text COMMENT 'disabled|enabled',
  `settings2_proposals_automation_create_project` text COMMENT 'yes|no',
  `settings2_proposals_automation_project_status` text COMMENT 'not_started | in_progress | on_hold',
  `settings2_proposals_automation_project_email_client` text COMMENT 'yes|no',
  `settings2_proposals_automation_create_invoice` text COMMENT 'yes|no',
  `settings2_proposals_automation_invoice_email_client` text COMMENT 'yes|no',
  `settings2_proposals_automation_invoice_due_date` int DEFAULT NULL COMMENT 'default 7',
  `settings2_proposals_automation_create_tasks` text COMMENT 'yes|no',
  `settings2_file_folders_status` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_file_folders_manage_assigned` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings2_file_folders_manage_project_manager` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings2_file_folders_manage_client` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings2_file_bulk_download` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_search_category_limit` int DEFAULT '5',
  `settings2_spaces_team_space_id` text,
  `settings2_spaces_team_space_status` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_user_space_status` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_team_space_title` varchar(150) DEFAULT 'Team Space',
  `settings2_spaces_user_space_title` varchar(150) DEFAULT 'My Space',
  `settings2_spaces_team_space_menu_name` varchar(150) DEFAULT 'Team Space',
  `settings2_spaces_user_space_menu_name` varchar(150) DEFAULT 'Space',
  `settings2_spaces_features_files` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_features_notes` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_features_comments` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_features_tasks` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_features_whiteboard` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_features_checklists` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_features_todos` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_spaces_features_reminders` varchar(10) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings2_tickets_replying_interface` varchar(10) DEFAULT 'popup' COMMENT 'popup|inline',
  `settings2_tickets_archive_button` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings2_timesheets_show_recorded_by` text COMMENT 'yes|no',
  `settings2_projects_cover_images_show_on_project` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings2_onboarding_status` varchar(10) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `settings2_onboarding_content` text,
  `settings2_onboarding_view_status` varchar(10) DEFAULT 'unseen' COMMENT 'seen|unseen',
  `settings2_tweak_reports_truncate_long_text` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings2_tweak_imap_tickets_import_limit` int DEFAULT '5',
  `settings2_tweak_imap_connection_timeout` int DEFAULT '30',
  `settings2_dompdf_fonts` text,
  PRIMARY KEY (`settings2_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings2`
--

LOCK TABLES `settings2` WRITE;
/*!40000 ALTER TABLE `settings2` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `subscription_id` int NOT NULL AUTO_INCREMENT,
  `subscription_gateway_id` varchar(250) DEFAULT NULL,
  `subscription_created` datetime DEFAULT NULL,
  `subscription_updated` datetime DEFAULT NULL,
  `subscription_creatorid` int NOT NULL,
  `subscription_clientid` int NOT NULL,
  `subscription_categoryid` int NOT NULL DEFAULT '4',
  `subscription_projectid` int DEFAULT NULL COMMENT 'optional',
  `subscription_gateway_product` varchar(250) DEFAULT NULL COMMENT 'stripe product id',
  `subscription_gateway_price` varchar(250) DEFAULT NULL COMMENT 'stripe price id',
  `subscription_gateway_product_name` varchar(250) DEFAULT NULL COMMENT 'e.g. Glod Plan',
  `subscription_gateway_interval` int DEFAULT NULL COMMENT 'e.g. 2',
  `subscription_gateway_period` varchar(50) DEFAULT NULL COMMENT 'e.g. months',
  `subscription_date_started` datetime DEFAULT NULL,
  `subscription_date_ended` datetime DEFAULT NULL,
  `subscription_date_renewed` date DEFAULT NULL COMMENT 'from stripe',
  `subscription_date_next_renewal` date DEFAULT NULL COMMENT 'from stripe',
  `subscription_gateway_last_message` text COMMENT 'from stripe',
  `subscription_gateway_last_message_date` datetime DEFAULT NULL,
  `subscription_subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `subscription_amount_before_tax` decimal(10,2) DEFAULT '0.00',
  `subscription_tax_percentage` decimal(10,2) DEFAULT '0.00' COMMENT 'percentage',
  `subscription_tax_amount` decimal(10,2) DEFAULT '0.00' COMMENT 'amount',
  `subscription_final_amount` decimal(10,2) DEFAULT '0.00',
  `subscription_notes` text,
  `subscription_status` varchar(50) DEFAULT 'pending' COMMENT 'pending | active | failed | paused | cancelled',
  `subscription_visibility` varchar(50) DEFAULT 'visible' COMMENT 'visible | invisible',
  `subscription_cron_status` varchar(20) DEFAULT 'none' COMMENT 'none|processing|completed|error  (used to prevent collisions when recurring invoiced)',
  `subscription_cron_date` datetime DEFAULT NULL COMMENT 'date when cron was run',
  PRIMARY KEY (`subscription_id`),
  KEY `subscription_gateway_id` (`subscription_gateway_id`),
  KEY `subscription_gateway_product` (`subscription_gateway_product`),
  KEY `subscription_gateway_price` (`subscription_gateway_price`),
  KEY `subscription_creatorid` (`subscription_creatorid`),
  KEY `subscription_clientid` (`subscription_clientid`),
  KEY `subscription_projectid` (`subscription_projectid`),
  KEY `subscription_categoryid` (`subscription_categoryid`),
  KEY `subscription_status` (`subscription_status`),
  KEY `subscription_visibility` (`subscription_visibility`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tableconfig`
--

DROP TABLE IF EXISTS `tableconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tableconfig` (
  `tableconfig_id` int NOT NULL AUTO_INCREMENT,
  `tableconfig_created` datetime NOT NULL,
  `tableconfig_updated` datetime NOT NULL,
  `tableconfig_userid` int NOT NULL,
  `tableconfig_table_name` varchar(150) NOT NULL,
  `tableconfig_column_1` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_2` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_3` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_4` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_5` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_6` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_7` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_8` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_9` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_10` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_11` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_12` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_13` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_14` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_15` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_16` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_17` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_18` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_19` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_20` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_21` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_22` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_23` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_24` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_25` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_26` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_27` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_28` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_29` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_30` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_31` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_32` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_33` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_34` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_35` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_36` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_37` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_38` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_39` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_column_40` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_1` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_2` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_3` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_4` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_5` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_6` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_7` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_8` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_9` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_10` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_11` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_12` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_13` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_14` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_15` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_16` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_17` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_18` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_19` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_20` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_21` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_22` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_23` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_24` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_25` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_26` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_27` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_28` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_29` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_30` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_31` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_32` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_33` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_34` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_35` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_36` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_37` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_38` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_39` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_40` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_41` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_42` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_43` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_44` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_45` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_46` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_47` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_48` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_49` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_50` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_51` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_52` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_53` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_54` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_55` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_56` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_57` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_58` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_59` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_60` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_61` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_62` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_63` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_64` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_65` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_66` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_67` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_68` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_69` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  `tableconfig_custom_70` varchar(20) DEFAULT 'hidden' COMMENT 'hidden|displayed',
  PRIMARY KEY (`tableconfig_id`),
  KEY `tableconfig_userid` (`tableconfig_userid`),
  KEY `tableconfig_table_name` (`tableconfig_table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tableconfig`
--

LOCK TABLES `tableconfig` WRITE;
/*!40000 ALTER TABLE `tableconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `tableconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_created` datetime DEFAULT NULL,
  `tag_updated` datetime DEFAULT NULL,
  `tag_creatorid` int DEFAULT NULL,
  `tag_title` varchar(100) NOT NULL,
  `tag_visibility` varchar(50) NOT NULL DEFAULT 'user' COMMENT 'public | user  (public tags are only created via admin settings)',
  `tagresource_type` varchar(50) NOT NULL COMMENT '[polymorph] invoice | project | client | lead | task | estimate | ticket | contract | note | subscription | contract | proposal',
  `tagresource_id` int NOT NULL COMMENT '[polymorph] e.g project_id',
  PRIMARY KEY (`tag_id`),
  KEY `tag_creatorid` (`tag_creatorid`),
  KEY `tagresource_type` (`tagresource_type`),
  KEY `tag_visibility` (`tag_visibility`),
  KEY `tagresource_id` (`tagresource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `task_uniqueid` varchar(100) DEFAULT NULL,
  `task_importid` varchar(100) DEFAULT NULL,
  `task_position` double NOT NULL COMMENT 'increment by 16384',
  `task_created` datetime DEFAULT NULL COMMENT 'always now()',
  `task_updated` datetime DEFAULT NULL,
  `task_creatorid` int DEFAULT NULL,
  `task_clientid` int DEFAULT NULL COMMENT 'optional',
  `task_projectid` int DEFAULT NULL COMMENT 'project_id',
  `task_date_start` date DEFAULT NULL,
  `task_date_due` date DEFAULT NULL,
  `task_title` varchar(250) DEFAULT NULL,
  `task_description` text,
  `task_client_visibility` varchar(100) DEFAULT 'yes',
  `task_milestoneid` int DEFAULT NULL COMMENT 'new tasks must be set to the [uncategorised] milestone',
  `task_previous_status` varchar(100) DEFAULT 'new',
  `task_priority` int DEFAULT '1',
  `task_date_status_changed` datetime DEFAULT NULL,
  `task_status` int DEFAULT '1',
  `task_completed_by_userid` int DEFAULT NULL COMMENT 'the user that set the task to completed status',
  `task_active_state` varchar(100) DEFAULT 'active' COMMENT 'active|archived',
  `task_billable` varchar(5) DEFAULT 'yes' COMMENT 'yes | no',
  `task_billable_status` varchar(20) DEFAULT 'not_invoiced' COMMENT 'invoiced | not_invoiced',
  `task_billable_invoiceid` int DEFAULT NULL COMMENT 'id of the invoice that it has been billed to',
  `task_billable_lineitemid` int DEFAULT NULL COMMENT 'id of line item that was billed',
  `task_visibility` varchar(40) DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent tasks that are still being cloned from showing in tasks list)',
  `task_overdue_notification_sent` varchar(40) DEFAULT 'no' COMMENT 'yes|no',
  `task_recurring` varchar(40) DEFAULT 'no' COMMENT 'yes|no',
  `task_recurring_duration` int DEFAULT NULL COMMENT 'e.g. 20 (for 20 days)',
  `task_recurring_period` varchar(30) DEFAULT NULL COMMENT 'day | week | month | year',
  `task_recurring_cycles` int DEFAULT NULL COMMENT '0 for infinity',
  `task_recurring_cycles_counter` int DEFAULT '0' COMMENT 'number of times it has been renewed',
  `task_recurring_last` date DEFAULT NULL COMMENT 'date when it was last renewed',
  `task_recurring_next` date DEFAULT NULL COMMENT 'date when it will next be renewed',
  `task_recurring_child` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `task_recurring_parent_id` datetime DEFAULT NULL COMMENT 'if it was generated from a recurring invoice, the id of parent invoice',
  `task_recurring_copy_checklists` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `task_recurring_copy_files` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `task_recurring_automatically_assign` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `task_recurring_finished` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `task_cloning_original_task_id` text,
  `task_cover_image` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `task_cover_image_uniqueid` text,
  `task_cover_image_filename` text,
  `task_calendar_timezone` text,
  `task_calendar_location` text COMMENT 'optional - used by the calendar',
  `task_calendar_reminder` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `task_calendar_reminder_duration` int DEFAULT NULL COMMENT 'optional - e.g 1 for 1 day',
  `task_calendar_reminder_period` text COMMENT 'optional - hours | days | weeks | months | years',
  `task_calendar_reminder_sent` text COMMENT 'yes|no',
  `task_calendar_reminder_date_sent` datetime DEFAULT NULL,
  `task_custom_field_1` tinytext,
  `task_custom_field_2` tinytext,
  `task_custom_field_3` tinytext,
  `task_custom_field_4` tinytext,
  `task_custom_field_5` tinytext,
  `task_custom_field_6` tinytext,
  `task_custom_field_7` tinytext,
  `task_custom_field_8` tinytext,
  `task_custom_field_9` tinytext,
  `task_custom_field_10` tinytext,
  `task_custom_field_11` datetime DEFAULT NULL,
  `task_custom_field_12` datetime DEFAULT NULL,
  `task_custom_field_13` datetime DEFAULT NULL,
  `task_custom_field_14` datetime DEFAULT NULL,
  `task_custom_field_15` datetime DEFAULT NULL,
  `task_custom_field_16` datetime DEFAULT NULL,
  `task_custom_field_17` datetime DEFAULT NULL,
  `task_custom_field_18` datetime DEFAULT NULL,
  `task_custom_field_19` datetime DEFAULT NULL,
  `task_custom_field_20` datetime DEFAULT NULL,
  `task_custom_field_21` text,
  `task_custom_field_22` text,
  `task_custom_field_23` text,
  `task_custom_field_24` text,
  `task_custom_field_25` text,
  `task_custom_field_26` text,
  `task_custom_field_27` text,
  `task_custom_field_28` text,
  `task_custom_field_29` text,
  `task_custom_field_30` text,
  `task_custom_field_31` text,
  `task_custom_field_32` text,
  `task_custom_field_33` text,
  `task_custom_field_34` text,
  `task_custom_field_35` text,
  `task_custom_field_36` text,
  `task_custom_field_37` text,
  `task_custom_field_38` text,
  `task_custom_field_39` text,
  `task_custom_field_40` text,
  `task_custom_field_41` text,
  `task_custom_field_42` text,
  `task_custom_field_43` text,
  `task_custom_field_44` text,
  `task_custom_field_45` text,
  `task_custom_field_46` text,
  `task_custom_field_47` text,
  `task_custom_field_48` text,
  `task_custom_field_49` text,
  `task_custom_field_50` text,
  `task_custom_field_51` int DEFAULT NULL,
  `task_custom_field_52` int DEFAULT NULL,
  `task_custom_field_53` int DEFAULT NULL,
  `task_custom_field_54` int DEFAULT NULL,
  `task_custom_field_55` int DEFAULT NULL,
  `task_custom_field_56` int DEFAULT NULL,
  `task_custom_field_57` int DEFAULT NULL,
  `task_custom_field_58` int DEFAULT NULL,
  `task_custom_field_59` int DEFAULT NULL,
  `task_custom_field_60` int DEFAULT NULL,
  `task_custom_field_61` decimal(10,2) DEFAULT NULL,
  `task_custom_field_62` decimal(10,2) DEFAULT NULL,
  `task_custom_field_63` decimal(10,2) DEFAULT NULL,
  `task_custom_field_64` decimal(10,2) DEFAULT NULL,
  `task_custom_field_65` decimal(10,2) DEFAULT NULL,
  `task_custom_field_66` decimal(10,2) DEFAULT NULL,
  `task_custom_field_67` decimal(10,2) DEFAULT NULL,
  `task_custom_field_68` decimal(10,2) DEFAULT NULL,
  `task_custom_field_69` decimal(10,2) DEFAULT NULL,
  `task_custom_field_70` decimal(10,2) DEFAULT NULL,
  `taskresource_type` text COMMENT 'optional references',
  `taskresource_id` int DEFAULT NULL,
  `task_mapping_type` text,
  `task_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `task_creatorid` (`task_creatorid`),
  KEY `task_clientid` (`task_clientid`),
  KEY `task_billable` (`task_billable`),
  KEY `task_milestoneid` (`task_milestoneid`),
  KEY `taskresource_id` (`task_projectid`),
  KEY `task_visibility` (`task_visibility`),
  KEY `task_client_visibility` (`task_client_visibility`),
  KEY `task_importid` (`task_importid`),
  KEY `task_active_state` (`task_active_state`),
  KEY `task_billable_status` (`task_billable_status`),
  KEY `task_billable_invoiceid` (`task_billable_invoiceid`),
  KEY `task_billable_lineitemid` (`task_billable_lineitemid`),
  KEY `task_recurring` (`task_recurring`),
  KEY `task_recurring_parent_id` (`task_recurring_parent_id`),
  KEY `task_recurring_finished` (`task_recurring_finished`),
  KEY `task_calendar_reminder` (`task_calendar_reminder`),
  KEY `task_cover_image` (`task_cover_image`),
  KEY `task_date_due` (`task_date_due`),
  KEY `task_date_start` (`task_date_start`),
  KEY `task_position` (`task_position`),
  KEY `task_previous_status` (`task_previous_status`),
  KEY `task_priority` (`task_priority`),
  KEY `task_status` (`task_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_assigned`
--

DROP TABLE IF EXISTS `tasks_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_assigned` (
  `tasksassigned_id` int NOT NULL AUTO_INCREMENT COMMENT '[truncate]',
  `tasksassigned_taskid` int NOT NULL,
  `tasksassigned_userid` int DEFAULT NULL,
  `tasksassigned_created` datetime DEFAULT NULL,
  `tasksassigned_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`tasksassigned_id`),
  KEY `tasksassigned_taskid` (`tasksassigned_taskid`),
  KEY `tasksassigned_userid` (`tasksassigned_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_assigned`
--

LOCK TABLES `tasks_assigned` WRITE;
/*!40000 ALTER TABLE `tasks_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_dependencies`
--

DROP TABLE IF EXISTS `tasks_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_dependencies` (
  `tasksdependency_id` int NOT NULL AUTO_INCREMENT,
  `tasksdependency_created` int NOT NULL,
  `tasksdependency_updated` int NOT NULL,
  `tasksdependency_creatorid` int DEFAULT NULL,
  `tasksdependency_projectid` int DEFAULT NULL,
  `tasksdependency_clientid` int DEFAULT NULL,
  `tasksdependency_taskid` int DEFAULT NULL,
  `tasksdependency_blockerid` int DEFAULT NULL,
  `tasksdependency_type` varchar(100) DEFAULT NULL COMMENT 'cannot_complete|cannot_start',
  `tasksdependency_status` varchar(100) DEFAULT 'active' COMMENT 'active|fulfilled',
  PRIMARY KEY (`tasksdependency_id`),
  KEY `tasksdependency_projectid` (`tasksdependency_projectid`),
  KEY `tasksdependency_clientid` (`tasksdependency_clientid`),
  KEY `tasksdependency_taskid` (`tasksdependency_taskid`),
  KEY `tasksdependency_blockerid` (`tasksdependency_blockerid`),
  KEY `tasksdependency_type` (`tasksdependency_type`),
  KEY `tasksdependency_creatorid` (`tasksdependency_creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_dependencies`
--

LOCK TABLES `tasks_dependencies` WRITE;
/*!40000 ALTER TABLE `tasks_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_priority`
--

DROP TABLE IF EXISTS `tasks_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_priority` (
  `taskpriority_id` int NOT NULL AUTO_INCREMENT,
  `taskpriority_created` datetime DEFAULT NULL,
  `taskpriority_creatorid` int DEFAULT NULL,
  `taskpriority_updated` datetime DEFAULT NULL,
  `taskpriority_title` varchar(200) NOT NULL,
  `taskpriority_position` int NOT NULL,
  `taskpriority_color` varchar(100) NOT NULL DEFAULT 'default' COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  `taskpriority_system_default` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no',
  PRIMARY KEY (`taskpriority_id`),
  KEY `taskpriority_creatorid` (`taskpriority_creatorid`),
  KEY `taskpriority_position` (`taskpriority_position`),
  KEY `taskpriority_system_default` (`taskpriority_system_default`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[do not truncate]  expected to have 2 system default statuses (ID: 1 & 2) ''new'' & ''converted'' statuses ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_priority`
--

LOCK TABLES `tasks_priority` WRITE;
/*!40000 ALTER TABLE `tasks_priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_status`
--

DROP TABLE IF EXISTS `tasks_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_status` (
  `taskstatus_id` int NOT NULL AUTO_INCREMENT,
  `taskstatus_created` datetime DEFAULT NULL,
  `taskstatus_creatorid` int DEFAULT NULL,
  `taskstatus_updated` datetime DEFAULT NULL,
  `taskstatus_title` varchar(200) NOT NULL,
  `taskstatus_position` int NOT NULL,
  `taskstatus_color` varchar(100) NOT NULL DEFAULT 'default' COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  `taskstatus_system_default` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no',
  PRIMARY KEY (`taskstatus_id`),
  KEY `taskstatus_creatorid` (`taskstatus_creatorid`),
  KEY `taskstatus_position` (`taskstatus_position`),
  KEY `taskstatus_system_default` (`taskstatus_system_default`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[do not truncate]  expected to have 2 system default statuses (ID: 1 & 2) ''new'' & ''converted'' statuses ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_status`
--

LOCK TABLES `tasks_status` WRITE;
/*!40000 ALTER TABLE `tasks_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax` (
  `tax_id` int NOT NULL AUTO_INCREMENT,
  `tax_taxrateid` int NOT NULL COMMENT 'Reference to tax rates table',
  `tax_created` datetime NOT NULL,
  `tax_updated` datetime NOT NULL,
  `tax_name` varchar(100) DEFAULT NULL,
  `tax_rate` decimal(10,2) DEFAULT NULL,
  `tax_type` varchar(50) DEFAULT 'summary' COMMENT 'summary|inline',
  `tax_lineitem_id` int DEFAULT NULL COMMENT 'for inline taxes',
  `taxresource_type` varchar(50) DEFAULT NULL COMMENT 'invoice|estimate|lineitem',
  `taxresource_id` int DEFAULT NULL,
  PRIMARY KEY (`tax_id`),
  KEY `taxresource_type` (`taxresource_type`),
  KEY `taxresource_id` (`taxresource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxrates`
--

DROP TABLE IF EXISTS `taxrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxrates` (
  `taxrate_id` int NOT NULL AUTO_INCREMENT,
  `taxrate_uniqueid` varchar(200) NOT NULL COMMENT 'Used in <js> for identification',
  `taxrate_created` datetime NOT NULL,
  `taxrate_updated` datetime NOT NULL,
  `taxrate_creatorid` int NOT NULL,
  `taxrate_name` varchar(100) NOT NULL,
  `taxrate_value` decimal(10,2) NOT NULL,
  `taxrate_type` varchar(100) NOT NULL DEFAULT 'user' COMMENT 'system|user|temp|client',
  `taxrate_clientid` int DEFAULT NULL,
  `taxrate_estimateid` int DEFAULT NULL,
  `taxrate_invoiceid` int DEFAULT NULL,
  `taxrate_status` varchar(20) NOT NULL DEFAULT 'enabled' COMMENT 'enabled|disabled',
  PRIMARY KEY (`taxrate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxrates`
--

LOCK TABLES `taxrates` WRITE;
/*!40000 ALTER TABLE `taxrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_replies` (
  `ticketreply_id` int NOT NULL AUTO_INCREMENT,
  `ticketreply_created` datetime NOT NULL,
  `ticketreply_updated` datetime NOT NULL,
  `ticketreply_creatorid` int NOT NULL,
  `ticketreply_clientid` int DEFAULT NULL,
  `ticketreply_ticketid` int NOT NULL,
  `ticketreply_text` text NOT NULL,
  `ticketreply_source` varchar(10) NOT NULL DEFAULT 'web' COMMENT 'web|email',
  `ticketreply_imap_sender_email_id` text NOT NULL COMMENT 'for ticket replies created via email',
  `ticketreply_type` varchar(10) NOT NULL DEFAULT 'reply' COMMENT 'reply|not',
  PRIMARY KEY (`ticketreply_id`),
  KEY `ticketreply_creatorid` (`ticketreply_creatorid`),
  KEY `ticketreply_ticketid` (`ticketreply_ticketid`),
  KEY `ticketreply_clientid` (`ticketreply_clientid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `ticket_created` datetime DEFAULT NULL,
  `ticket_updated` datetime DEFAULT NULL,
  `ticket_creatorid` int NOT NULL,
  `ticket_categoryid` int NOT NULL DEFAULT '9',
  `ticket_clientid` int DEFAULT NULL,
  `ticket_projectid` int DEFAULT NULL,
  `ticket_subject` varchar(250) DEFAULT NULL,
  `ticket_message` text,
  `ticket_priority` varchar(50) NOT NULL DEFAULT 'normal' COMMENT 'normal | high | urgent',
  `ticket_last_updated` datetime DEFAULT NULL,
  `ticket_date_status_changed` datetime DEFAULT NULL,
  `ticket_status` tinyint NOT NULL DEFAULT '1' COMMENT 'numeric status id',
  `ticket_source` varchar(10) NOT NULL DEFAULT 'web' COMMENT 'web|email',
  `ticket_active_state` varchar(20) DEFAULT 'active' COMMENT 'active|archived',
  `ticket_user_type` varchar(10) DEFAULT 'user' COMMENT 'user|contact',
  `ticket_imap_sender_email_address` text,
  `ticket_imap_sender_email_id` text,
  `ticket_imap_email_payload` text,
  `ticket_custom_field_1` tinytext,
  `ticket_custom_field_2` tinytext,
  `ticket_custom_field_3` tinytext,
  `ticket_custom_field_4` tinytext,
  `ticket_custom_field_5` tinytext,
  `ticket_custom_field_6` tinytext,
  `ticket_custom_field_7` tinytext,
  `ticket_custom_field_8` tinytext,
  `ticket_custom_field_9` tinytext,
  `ticket_custom_field_10` tinytext,
  `ticket_custom_field_11` tinytext,
  `ticket_custom_field_12` tinytext,
  `ticket_custom_field_13` tinytext,
  `ticket_custom_field_14` tinytext,
  `ticket_custom_field_15` tinytext,
  `ticket_custom_field_16` tinytext,
  `ticket_custom_field_17` tinytext,
  `ticket_custom_field_18` tinytext,
  `ticket_custom_field_19` tinytext,
  `ticket_custom_field_20` tinytext,
  `ticket_custom_field_21` tinytext,
  `ticket_custom_field_22` tinytext,
  `ticket_custom_field_23` tinytext,
  `ticket_custom_field_24` tinytext,
  `ticket_custom_field_25` tinytext,
  `ticket_custom_field_26` tinytext,
  `ticket_custom_field_27` tinytext,
  `ticket_custom_field_28` tinytext,
  `ticket_custom_field_29` tinytext,
  `ticket_custom_field_30` tinytext,
  `ticket_custom_field_31` tinytext,
  `ticket_custom_field_32` tinytext,
  `ticket_custom_field_33` tinytext,
  `ticket_custom_field_34` tinytext,
  `ticket_custom_field_35` tinytext,
  `ticket_custom_field_36` tinytext,
  `ticket_custom_field_37` tinytext,
  `ticket_custom_field_38` tinytext,
  `ticket_custom_field_39` tinytext,
  `ticket_custom_field_40` tinytext,
  `ticket_custom_field_41` tinytext,
  `ticket_custom_field_42` tinytext,
  `ticket_custom_field_43` tinytext,
  `ticket_custom_field_44` tinytext,
  `ticket_custom_field_45` tinytext,
  `ticket_custom_field_46` tinytext,
  `ticket_custom_field_47` tinytext,
  `ticket_custom_field_48` tinytext,
  `ticket_custom_field_49` tinytext,
  `ticket_custom_field_50` tinytext,
  `ticket_custom_field_51` tinytext,
  `ticket_custom_field_52` tinytext,
  `ticket_custom_field_53` tinytext,
  `ticket_custom_field_54` tinytext,
  `ticket_custom_field_55` tinytext,
  `ticket_custom_field_56` tinytext,
  `ticket_custom_field_57` tinytext,
  `ticket_custom_field_58` tinytext,
  `ticket_custom_field_59` tinytext,
  `ticket_custom_field_60` tinytext,
  `ticket_custom_field_61` tinytext,
  `ticket_custom_field_62` tinytext,
  `ticket_custom_field_63` tinytext,
  `ticket_custom_field_64` tinytext,
  `ticket_custom_field_65` tinytext,
  `ticket_custom_field_66` tinytext,
  `ticket_custom_field_67` tinytext,
  `ticket_custom_field_68` tinytext,
  `ticket_custom_field_69` tinytext,
  `ticket_custom_field_70` tinytext,
  `ticket_mapping_type` text,
  `ticket_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `ticket_creatorid` (`ticket_creatorid`),
  KEY `ticket_categoryid` (`ticket_categoryid`),
  KEY `ticket_clientid` (`ticket_clientid`),
  KEY `ticket_projectid` (`ticket_projectid`),
  KEY `ticket_priority` (`ticket_priority`),
  KEY `ticket_status` (`ticket_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_status`
--

DROP TABLE IF EXISTS `tickets_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_status` (
  `ticketstatus_id` int NOT NULL AUTO_INCREMENT,
  `ticketstatus_created` datetime DEFAULT NULL,
  `ticketstatus_creatorid` int DEFAULT NULL,
  `ticketstatus_updated` datetime DEFAULT NULL,
  `ticketstatus_title` varchar(200) NOT NULL,
  `ticketstatus_position` int NOT NULL,
  `ticketstatus_color` varchar(100) NOT NULL DEFAULT 'default' COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  `ticketstatus_use_for_client_replied` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no',
  `ticketstatus_use_for_team_replied` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no',
  `ticketstatus_system_default` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no',
  PRIMARY KEY (`ticketstatus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[do not truncate]  expected to have 2 system default statuses (ID: 1 & 2) ''new'' & ''converted'' statuses ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_status`
--

LOCK TABLES `tickets_status` WRITE;
/*!40000 ALTER TABLE `tickets_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timelines`
--

DROP TABLE IF EXISTS `timelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timelines` (
  `timeline_id` int NOT NULL AUTO_INCREMENT,
  `timeline_eventid` int NOT NULL,
  `timeline_resourcetype` varchar(50) DEFAULT NULL COMMENT 'invoices | projects | estimates | etc',
  `timeline_resourceid` int DEFAULT NULL COMMENT 'the id of the item affected',
  `timeline_mapping_type` text,
  `timeline_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`timeline_id`),
  KEY `timeline_eventid` (`timeline_eventid`),
  KEY `timeline_resourcetype` (`timeline_resourcetype`),
  KEY `timeline_resourceid` (`timeline_resourceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timelines`
--

LOCK TABLES `timelines` WRITE;
/*!40000 ALTER TABLE `timelines` DISABLE KEYS */;
/*!40000 ALTER TABLE `timelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timers`
--

DROP TABLE IF EXISTS `timers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timers` (
  `timer_id` int NOT NULL AUTO_INCREMENT,
  `timer_created` datetime DEFAULT NULL,
  `timer_updated` datetime DEFAULT NULL,
  `timer_creatorid` int DEFAULT NULL,
  `timer_recorded_by` int DEFAULT NULL,
  `timer_started` int DEFAULT NULL COMMENT 'unix time stam for when the timer was started',
  `timer_stopped` int DEFAULT '0' COMMENT 'unix timestamp for when the timer was stopped',
  `timer_time` int DEFAULT '0' COMMENT 'seconds',
  `timer_taskid` int DEFAULT NULL,
  `timer_projectid` int DEFAULT '0' COMMENT 'needed for repository filtering',
  `timer_clientid` int DEFAULT '0' COMMENT 'needed for repository filtering',
  `timer_status` varchar(20) DEFAULT 'running' COMMENT 'running | stopped',
  `timer_billing_status` varchar(50) DEFAULT 'not_invoiced' COMMENT 'invoiced | not_invoiced',
  `timer_billing_invoiceid` int DEFAULT NULL COMMENT 'invoice id, if billed',
  `timer_mapping_type` text,
  `timer_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`timer_id`),
  KEY `timer_creatorid` (`timer_creatorid`),
  KEY `timer_taskid` (`timer_taskid`),
  KEY `timer_projectid` (`timer_projectid`),
  KEY `timer_clientid` (`timer_clientid`),
  KEY `timer_status` (`timer_status`),
  KEY `timer_billing_status` (`timer_billing_status`),
  KEY `timer_billing_invoiceid` (`timer_billing_invoiceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timers`
--

LOCK TABLES `timers` WRITE;
/*!40000 ALTER TABLE `timers` DISABLE KEYS */;
/*!40000 ALTER TABLE `timers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_created` datetime DEFAULT NULL,
  `unit_update` datetime DEFAULT NULL,
  `unit_creatorid` int DEFAULT '1',
  `unit_name` varchar(50) NOT NULL,
  `unit_system_default` varchar(50) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `unit_time_default` varchar(50) DEFAULT 'no' COMMENT 'yes|no (used to identify time unit)',
  PRIMARY KEY (`unit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_created` datetime NOT NULL,
  `update_updated` datetime NOT NULL,
  `update_version` decimal(10,2) DEFAULT NULL,
  `update_mysql_filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='tracks updates sql file execution';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updating`
--

DROP TABLE IF EXISTS `updating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updating` (
  `updating_id` int NOT NULL AUTO_INCREMENT,
  `updating_created` datetime NOT NULL,
  `updating_updated` datetime NOT NULL,
  `updating_type` varchar(100) NOT NULL COMMENT 'modal|cronjob|url',
  `updating_name` varchar(100) DEFAULT NULL COMMENT 'used for updating the record',
  `updating_function_name` varchar(150) DEFAULT NULL COMMENT '[required]  for cronjob updating. This is the name of the function',
  `updating_update_version` varchar(10) DEFAULT NULL COMMENT 'which version this update is for',
  `updating_request_path` varchar(250) DEFAULT NULL COMMENT 'e.g. /updating/action/update-currency-settings',
  `updating_update_path` varchar(250) DEFAULT NULL COMMENT 'e.g. /updating/action/update-currency-settings',
  `updating_notes` tinytext,
  `updating_payload_1` text,
  `updating_payload_2` text,
  `updating_payload_3` text,
  `updating_started_date` datetime DEFAULT NULL,
  `updating_completed_date` datetime DEFAULT NULL,
  `updating_system_log` text COMMENT 'any comments generated by the system when running this update',
  `updating_status` varchar(50) DEFAULT 'new' COMMENT 'new|processing|failed|completed',
  PRIMARY KEY (`updating_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updating`
--

LOCK TABLES `updating` WRITE;
/*!40000 ALTER TABLE `updating` DISABLE KEYS */;
/*!40000 ALTER TABLE `updating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unique_id` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL COMMENT 'date when acccount was deleted',
  `creatorid` int DEFAULT NULL,
  `email` text,
  `password` text NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `phone` text,
  `position` text,
  `clientid` int DEFAULT NULL COMMENT 'for client users',
  `account_owner` varchar(10) DEFAULT 'no' COMMENT 'yes | no',
  `primary_admin` varchar(10) DEFAULT 'no' COMMENT 'yes | no (only 1 primary admin - created during setup)',
  `avatar_directory` text,
  `avatar_filename` text,
  `type` text NOT NULL COMMENT 'client | team |contact',
  `status` varchar(20) DEFAULT 'active' COMMENT 'active|suspended|deleted',
  `role_id` int NOT NULL DEFAULT '2' COMMENT 'for team users',
  `last_seen` datetime DEFAULT NULL,
  `theme` varchar(100) DEFAULT 'default',
  `last_ip_address` text,
  `social_facebook` text,
  `social_twitter` text,
  `social_linkedin` text,
  `social_github` text,
  `social_dribble` text,
  `pref_language` varchar(200) DEFAULT 'english' COMMENT 'english|french|etc',
  `pref_email_notifications` varchar(10) DEFAULT 'yes' COMMENT 'yes | no',
  `pref_leftmenu_position` varchar(50) DEFAULT 'collapsed' COMMENT 'collapsed | open',
  `pref_statspanel_position` varchar(50) DEFAULT 'collapsed' COMMENT 'collapsed | open',
  `pref_filter_own_tasks` varchar(50) DEFAULT 'no' COMMENT 'Show only a users tasks in the tasks list',
  `pref_hide_completed_tasks` varchar(50) DEFAULT 'no' COMMENT 'yes | no',
  `pref_filter_own_projects` varchar(50) DEFAULT 'no' COMMENT 'Show only a users projects in the projects list',
  `pref_filter_show_archived_projects` varchar(50) DEFAULT 'no' COMMENT 'Show archived projects',
  `pref_filter_show_archived_tasks` varchar(50) DEFAULT 'no' COMMENT 'Show archived projects',
  `pref_filter_show_archived_leads` varchar(50) DEFAULT 'no' COMMENT 'Show archived projects',
  `pref_filter_show_archived_tickets` varchar(50) DEFAULT 'no' COMMENT 'Show archived tickets',
  `pref_filter_own_leads` varchar(50) DEFAULT 'no' COMMENT 'Show only a users projects in the leads list',
  `pref_view_tasks_layout` varchar(50) DEFAULT 'kanban' COMMENT 'list|kanban',
  `pref_view_leads_layout` varchar(50) DEFAULT 'kanban' COMMENT 'list|kanban',
  `pref_view_projects_layout` varchar(50) DEFAULT 'list' COMMENT 'list|card|milestone|pipeline|category|gnatt',
  `pref_theme` varchar(100) DEFAULT 'default',
  `pref_calendar_dates_projects` varchar(30) DEFAULT 'due' COMMENT 'start|due|start_due',
  `pref_calendar_dates_tasks` varchar(30) DEFAULT 'due' COMMENT 'start|due|start_due',
  `pref_calendar_dates_events` varchar(30) DEFAULT 'due' COMMENT 'start|due|start_due',
  `pref_calendar_view` varchar(30) DEFAULT 'own' COMMENT 'own|all',
  `remember_token` text,
  `remember_filters_tickets_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_tickets_payload` text,
  `remember_filters_projects_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_projects_payload` text,
  `remember_filters_invoices_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_invoices_payload` text,
  `remember_filters_estimates_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_estimates_payload` text,
  `remember_filters_contracts_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_contracts_payload` text,
  `remember_filters_payments_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_payments_payload` text,
  `remember_filters_proposals_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_proposals_payload` text,
  `remember_filters_clients_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_clients_payload` text,
  `remember_filters_leads_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_leads_payload` text,
  `remember_filters_tasks_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_tasks_payload` text,
  `remember_filters_subscriptions_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_subscriptions_payload` text,
  `remember_filters_products_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_products_payload` text,
  `remember_filters_expenses_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_expenses_payload` text,
  `remember_filters_timesheets_status` varchar(20) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `remember_filters_timesheets_payload` text,
  `forgot_password_token` text COMMENT 'random token',
  `forgot_password_token_expiry` datetime DEFAULT NULL,
  `force_password_change` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `notifications_system` varchar(10) DEFAULT 'no' COMMENT 'no| yes | yes_email [everyone] NB: database defaults for all notifications are ''no'' actual values must be set in the settings config file',
  `notifications_new_project` varchar(10) DEFAULT 'no' COMMENT 'no| yes_email [client]',
  `notifications_projects_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email [everyone]',
  `notifications_billing_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email |[team]',
  `notifications_new_assignement` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email [team]',
  `notifications_leads_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email [team]',
  `notifications_tasks_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email  [everyone]',
  `notifications_tickets_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email  [everyone]',
  `notifications_reminders` varchar(10) DEFAULT 'yes_email' COMMENT 'yes_email | no',
  `dashboard_access` varchar(150) DEFAULT 'yes' COMMENT 'yes|no',
  `welcome_email_sent` varchar(150) DEFAULT 'no' COMMENT 'yes|no',
  `space_uniqueid` text,
  `timezone` text COMMENT 'experimental',
  `gateways_stripe_customer_id` text COMMENT 'optional - when customer pays via ',
  `gateways_paypal_customer_id` text COMMENT 'global gateway',
  `gateways_square_customer_id` text COMMENT 'global gateway',
  `gateways_braintree_customer_id` text COMMENT 'global gateway',
  `gateways_authorize_net_customer_id` text COMMENT 'global gateway',
  `gateways_adyen_customer_id` text COMMENT 'global gateway',
  `gateways_worldpay_customer_id` text COMMENT 'global gateway',
  `gateways_checkout_com_customer_id` text COMMENT 'global gateway',
  `gateways_2checkout_customer_id` text COMMENT 'global gateway',
  `gateways_lemonsqueezy_customer_id` text COMMENT 'global gateway',
  `gateways_paddle_customer_id` text COMMENT 'global gateway',
  `gateways_gumroad_customer_id` text COMMENT 'global gateway',
  `gateways_fastspring_customer_id` text COMMENT 'global gateway',
  `gateways_razorpay_customer_id` text COMMENT 'indian gateway',
  `gateways_paytm_customer_id` text COMMENT 'indian gateway',
  `gateways_phonepe_customer_id` text COMMENT 'indian gateway',
  `gateways_ccavenue_customer_id` text COMMENT 'indian gateway',
  `gateways_billdesk_customer_id` text COMMENT 'indian gateway',
  `gateways_cashfree_customer_id` text COMMENT 'indian gateway',
  `gateways_flutterwave_customer_id` text COMMENT 'african gateway',
  `gateways_paystack_customer_id` text COMMENT 'african gateway',
  `gateways_pesapal_customer_id` text COMMENT 'african gateway',
  `gateways_dpo_customer_id` text COMMENT 'african gateway',
  `gateways_payfast_customer_id` text COMMENT 'african gateway',
  `gateways_mercadopago_customer_id` text COMMENT 'brazil gateway',
  `gateways_pagseguro_customer_id` text COMMENT 'brazil gateway',
  `gateways_stone_customer_id` text COMMENT 'brazil gateway',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `primary_contact` (`account_owner`),
  KEY `type` (`type`(333)),
  KEY `role_id` (`role_id`),
  KEY `email` (`email`(333)),
  KEY `dashboard_access` (`dashboard_access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='[truncate] except user id 0 & 1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webforms`
--

DROP TABLE IF EXISTS `webforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webforms` (
  `webform_id` int NOT NULL AUTO_INCREMENT,
  `webform_uniqueid` varchar(100) DEFAULT NULL,
  `webform_created` datetime NOT NULL,
  `webform_updated` datetime NOT NULL,
  `webform_creatorid` int NOT NULL,
  `webform_title` varchar(100) DEFAULT NULL,
  `webform_type` varchar(100) DEFAULT NULL COMMENT 'lead|etc',
  `webform_builder_payload` text COMMENT 'json object from form builder',
  `webform_thankyou_message` text,
  `webform_notify_assigned` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `webform_notify_admin` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `webform_submissions` tinyint DEFAULT '0',
  `webform_user_captcha` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `webform_submit_button_text` varchar(100) DEFAULT NULL,
  `webform_background_color` varchar(100) DEFAULT '#FFFFFF' COMMENT 'white default',
  `webform_lead_title` varchar(100) DEFAULT NULL,
  `webform_lead_status` int DEFAULT '1' COMMENT 'default stage for the new lead',
  `webform_style_css` text,
  `webform_recaptcha` varchar(15) DEFAULT 'disabled' COMMENT 'enabled|disabled',
  `webform_status` varchar(100) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `webform_mapping_type` text,
  `webform_mapping_id` int DEFAULT NULL,
  PRIMARY KEY (`webform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webforms`
--

LOCK TABLES `webforms` WRITE;
/*!40000 ALTER TABLE `webforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `webforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webforms_assigned`
--

DROP TABLE IF EXISTS `webforms_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webforms_assigned` (
  `webformassigned_id` int NOT NULL AUTO_INCREMENT,
  `webformassigned_created` datetime NOT NULL,
  `webformassigned_updated` datetime NOT NULL,
  `webformassigned_formid` int DEFAULT NULL,
  `webformassigned_userid` int DEFAULT NULL,
  PRIMARY KEY (`webformassigned_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webforms_assigned`
--

LOCK TABLES `webforms_assigned` WRITE;
/*!40000 ALTER TABLE `webforms_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `webforms_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `webhooks_id` int NOT NULL AUTO_INCREMENT,
  `webhooks_created` datetime NOT NULL,
  `webhooks_updated` datetime NOT NULL,
  `webhooks_creatorid` int DEFAULT '0',
  `webhooks_gateway_name` varchar(100) DEFAULT NULL COMMENT 'stripe|paypal|etc',
  `webhooks_type` varchar(100) DEFAULT NULL COMMENT 'type of call, as sent by gateway',
  `webhooks_payment_type` varchar(30) DEFAULT NULL COMMENT 'onetime|subscription',
  `webhooks_payment_amount` decimal(10,2) DEFAULT NULL COMMENT '(optional)',
  `webhooks_payment_transactionid` varchar(150) DEFAULT NULL COMMENT 'payment transaction id',
  `webhooks_matching_reference` varchar(100) DEFAULT NULL COMMENT 'e.g. Stripe (checkout session id) | Paypal ( random string) that is used to match the webhook/ipn to the initial payment_session',
  `webhooks_matching_attribute` varchar(100) DEFAULT NULL COMMENT 'mainly used to record what is happening with a subscription (e.g cancelled|renewed)',
  `webhooks_payload` text COMMENT '(optional) json payload',
  `webhooks_comment` text COMMENT '(optional)',
  `webhooks_started_at` datetime DEFAULT NULL COMMENT 'when the cronjob started this webhook',
  `webhooks_completed_at` datetime DEFAULT NULL COMMENT 'when the cronjob completed this webhook',
  `webhooks_attempts` tinyint DEFAULT '0' COMMENT 'the number of times this webhook has been attempted',
  `webhooks_status` varchar(20) DEFAULT 'new' COMMENT 'new | processing | failed | completed   (set to processing by the cronjob, to avoid duplicate processing)',
  PRIMARY KEY (`webhooks_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Record all actionable webhooks, for later execution by a cronjob';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webmail_templates`
--

DROP TABLE IF EXISTS `webmail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webmail_templates` (
  `webmail_template_id` int NOT NULL AUTO_INCREMENT,
  `webmail_template_created` datetime NOT NULL,
  `webmail_template_updated` datetime NOT NULL,
  `webmail_template_creatorid` int NOT NULL,
  `webmail_template_name` varchar(150) DEFAULT NULL,
  `webmail_template_body` text,
  `webmail_template_type` text COMMENT 'clients|leads',
  PRIMARY KEY (`webmail_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webmail_templates`
--

LOCK TABLES `webmail_templates` WRITE;
/*!40000 ALTER TABLE `webmail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `webmail_templates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-25  2:44:51
