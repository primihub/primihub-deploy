-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: resource
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `resource`
--

CREATE DATABASE IF NOT EXISTS `resource` Character SET utf8 COLLATE utf8_bin;

-- USE `resource`;

--
-- Current Database: `nacos_config`
--

CREATE DATABASE IF NOT EXISTS `nacos_config` Character SET utf8 COLLATE utf8_bin;

USE `nacos_config`;

--
-- Table structure for table `config_info`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (101, 'database.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      primary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=true;config.decrypt.key=MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJI/xqbyvpVttxfAKulKeSTIb7tZAGaFcPyTnE2r7AHTQ8kOnqKXDda4u59umt9XBFxi7db28KxeVooB138zuRUCAwEAAQ==\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      secondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=true;config.decrypt.key=MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJI/xqbyvpVttxfAKulKeSTIb7tZAGaFcPyTnE2r7AHTQ8kOnqKXDda4u59umt9XBFxi7db28KxeVooB138zuRUCAwEAAQ==\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourcePrimary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=true;config.decrypt.key=MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJI/xqbyvpVttxfAKulKeSTIb7tZAGaFcPyTnE2r7AHTQ8kOnqKXDda4u59umt9XBFxi7db28KxeVooB138zuRUCAwEAAQ==\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourceSecondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=true;config.decrypt.key=MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJI/xqbyvpVttxfAKulKeSTIb7tZAGaFcPyTnE2r7AHTQ8kOnqKXDda4u59umt9XBFxi7db28KxeVooB138zuRUCAwEAAQ==\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n', 'bc1fbb8795a977bcbe1f3ca854d8941d', '2022-06-16 09:01:01', '2022-06-17 09:05:06', 'nacos', '10.244.0.0', '', '46b6b568-e6ae-45ca-baa1-819932fc8947', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (102, 'base.json', 'DEFAULT_GROUP', '{\"tokenValidateUriBlackList\":[\"/user/login\",\"/user/register\",\"/user/sendVerificationCode\",\"/user/forgetPassword\",\"/captcha/get\",\"/captcha/check\",\"/common/getValidatePublicKey\",\"/shareData/syncProject\",\"/shareData/syncModel\",\"/oauth/getAuthList\"],\"authConfigs\":{\"github\":{\"redirectUrl\":\"\",\"authEnable\":1,\"clientId\":\"\",\"clientSecret\":\"\",\"redirectUri\":\"\"}},\"needSignUriList\":[],\"adminUserIds\":[1],\"defaultPassword\":\"123456\",\"defaultPasswordVector\":\"excalibur\",\"primihubOfficalService\":\"\",\"grpcClientAddress\":\"YOUR_HOST_IP\",\"grpcClientPort\":50050,\"grpcDataSetClientAddress\":\"YOUR_HOST_IP\",\"grpcDataSetClientPort\":50050,\"grpcServerPort\":9090,\"uploadUrlDirPrefix\":\"/data/upload/\",\"resultUrlDirPrefix\":\"/data/result/\",\"runModelFileUrlDirPrefix\":\"/data/result/runModel/\",\"usefulToken\":\"excalibur_forever_ABCDEFGHIJKLMN\",\"model_components\":[{\"component_code\":\"start\",\"component_name\":\"开始\",\"is_show\":0,\"is_mandatory\":0,\"component_types\":[{\"is_show\":0,\"is_required\":1,\"type_code\":\"taskName\",\"type_name\":\"任务名称\",\"input_type\":\"text\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"taskDesc\",\"type_name\":\"任务描述\",\"input_type\":\"textarea\",\"input_value\":\"\",\"input_values\":[]}]},{\"component_code\":\"dataSet\",\"component_name\":\"选择数据集\",\"is_show\":0,\"is_mandatory\":0,\"component_types\":[{\"is_show\":0,\"is_required\":1,\"type_code\":\"selectData\",\"type_name\":\"选择数据\",\"input_type\":\"none\",\"input_value\":\"\",\"input_values\":[]}]},{\"component_code\":\"dataAlign\",\"component_name\":\"数据对齐\",\"is_show\":0,\"is_mandatory\":1,\"component_types\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"dataAlign\",\"type_name\":\"数据对齐\",\"input_type\":\"select\",\"input_value\":\"\",\"input_values\":[{\"key\":\"1\",\"val\":\"样本对齐\"}]}]},{\"component_code\":\"model\",\"component_name\":\"模型选择\",\"is_show\":0,\"is_mandatory\":0,\"component_types\":[{\"is_show\":0,\"is_required\":1,\"type_code\":\"modelType\",\"type_name\":\"模型选择\",\"input_type\":\"select\",\"input_value\":\"\",\"input_values\":[{\"key\":\"2\",\"val\":\"纵向-XGBoost\"},{\"key\":\"3\",\"val\":\"横向-LR\"}]},{\"is_show\":0,\"is_required\":1,\"type_code\":\"modelName\",\"type_name\":\"模型名称\",\"input_type\":\"text\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"modelDesc\",\"type_name\":\"模型描述\",\"input_type\":\"textarea\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"arbiterOrgan\",\"type_name\":\"可信第三方选择\",\"input_type\":\"button\",\"input_value\":\"\",\"input_values\":[]}]}]}', '43790484ee6660c7d489a70ebc8e101b', '2022-06-16 09:26:31', '2022-11-03 08:28:05', 'nacos', '103.85.177.130', '', '46b6b568-e6ae-45ca-baa1-819932fc8947', '', '', '', 'json', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (103, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    redis:\n      primary:\n        hostName: redis\n        port: 6379\n        password: primihub\n        database: 0\n        minIdle: 0\n        maxIdle: 10\n        maxTotal: 100\n        lifo: false\n        maxWaitMillis: 1000\n        minEvictableIdleTimeMillis: 1800000\n        softMinEvictableIdleTimeMillis: 1800000', 'c7410257a901774ad260e6fa8740f87a', '2022-06-16 09:28:22', '2022-06-17 09:18:27', 'nacos', '10.244.0.0', '', '46b6b568-e6ae-45ca-baa1-819932fc8947', '', '', '', 'yaml', '');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `config_info_beta`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `config_info_tag`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `config_tags_relation`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `group_capacity`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `usage` int(10) unsigned NOT NULL DEFAULT '0',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Group';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `his_config_info`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `roles`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `usage` int(10) unsigned NOT NULL DEFAULT '0',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `tenant_info`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL,
  `gmt_modified` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
INSERT INTO `tenant_info` VALUES (3,'1','46b6b568-e6ae-45ca-baa1-819932fc8947','node1','node1','nacos',1655369938742,1655369938742);
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-30 11:47:30

GRANT ALL ON *.* TO 'primihub'@'%';