-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: resource_demo1
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
-- Current Database: `nacos_config`
--

CREATE DATABASE IF NOT EXISTS `nacos_config` Character SET utf8 COLLATE utf8_bin;

USE `nacos_config`;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
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
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (101, 'database.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      primary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo1?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      secondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo1?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourcePrimary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo1?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourceSecondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo1?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n', 'b7818dfc398d86d9cbe3bfb1f06634d4', '2022-06-16 09:01:01', '2023-01-04 09:32:33', 'nacos', '103.85.177.130', '', 'demo1', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (102, 'base.json', 'DEFAULT_GROUP', '{\n    \"tokenValidateUriBlackList\":[\n      \"/user/login\",\n      \"/user/register\",\n      \"/user/sendVerificationCode\",\n      \"/user/forgetPassword\",\n      \"/captcha/get\",\n      \"/captcha/check\",\n      \"/oauth/getAuthList\",\n      \"/oauth/authLogin\",\n      \"/oauth/authRegister\",\n      \"/oauth/github/render\",\n      \"/oauth/github/callback\",\n      \"/common/getValidatePublicKey\",\n      \"/common/getTrackingID\",\n      \"/shareData/syncProject\",\n      \"/shareData/syncModel\",\n      \"/organ/getHomepage\"\n    ],\n    \"needSignUriList\":[\n\n    ],\n    \"displayDatabaseSourceType\": true,\n    \"authConfigs\":{\n        \"github\": {\n            \"redirectUrl\":\"\",\n            \"authEnable\": 1,\n            \"clientId\": \"\",\n            \"clientSecret\": \"\",\n            \"redirectUri\": \"\"\n        }\n    },\n    \"lokiConfig\": {\n        \"address\":\"LOKI_IP:3100\",\n        \"job\":\"YOUR_NAMESPACE/primihubnode\",\n        \"container\":\"node0\"\n    },\n    \"adminUserIds\": [1],\n    \"defaultPassword\":\"123456\",\n    \"defaultPasswordVector\":\"excalibur\",\n    \"primihubOfficalService\": \"\",\n    \"grpcClient\":{\n        \"grpcClientAddress\":\"primihubnode\",\n        \"grpcClientPort\":50050,\n        \"grpcServerPorts\":[30872,30191,30047],\n        \"useTls\":false,\n        \"trustCertFilePath\":\"/data/javaclientcert/ca.crt\",\n        \"keyCertChainFile\":\"/data/javaclientcert/client.crt\",\n        \"keyFile\":\"/data/javaclientcert/client8.key\"\n    },\n    \"grpcServerPort\": 9090,\n    \"uploadUrlDirPrefix\": \"/data/upload/\",\n    \"resultUrlDirPrefix\": \"/data/result/\",\n    \"runModelFileUrlDirPrefix\": \"/data/result/runModel/\",\n    \"usefulToken\": \"excalibur_forever_ABCDEFGHIJKLMN\",\n    \"systemDomainName\":\"\",\n    \"mailProperties\":{},\n  \"model_components\": [\n        {\n            \"component_code\": \"start\",\n            \"component_name\": \"开始\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"taskName\",\n                    \"type_name\": \"任务名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"taskDesc\",\n                    \"type_name\": \"任务描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataSet\",\n            \"component_name\": \"选择数据集\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"selectData\",\n                    \"type_name\": \"选择数据\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataAlign\",\n            \"component_name\": \"数据对齐\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"dataAlign\",\n                    \"type_name\": \"数据对齐\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"样本对齐\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"特征对齐\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"MultipleSelected\",\n                    \"type_name\": \"可多选特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"encryption\",\n                    \"type_name\": \"加密方式\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"MD5\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"exception\",\n            \"component_name\": \"异常值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exception\",\n                    \"type_name\": \"异常值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"异常值处理\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"missing\",\n            \"component_name\": \"缺失值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"missingValue\",\n                    \"type_name\": \"缺失值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"缺失值处理\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"selectFeatures\",\n                    \"type_name\": \"选择特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exceptionType\",\n                    \"type_name\": \"缺失值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"平均值\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"featureCoding\",\n            \"component_name\": \"特征编码\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"featureCoding\",\n                    \"type_name\": \"特征编码\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"标签编码\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"哈希编码\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"独热编码\"\n                        },\n                        {\n                            \"key\": \"4\",\n                            \"val\": \"计数编码\"\n                        },\n                        {\n                            \"key\": \"5\",\n                            \"val\": \"直方图编码\"\n                        },\n                        {\n                            \"key\": \"6\",\n                            \"val\": \"WOE编码\"\n                        },\n                        {\n                            \"key\": \"7\",\n                            \"val\": \"目标编码\"\n                        },\n                        {\n                            \"key\": \"8\",\n                            \"val\": \"平均编码\"\n                        },\n                        {\n                            \"key\": \"9\",\n                            \"val\": \"模型编码\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"model\",\n            \"component_name\": \"模型选择\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelType\",\n                    \"type_name\": \"模型选择\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"纵向-XGBoost\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"横向-LR\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelName\",\n                    \"type_name\": \"模型名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"modelDesc\",\n                    \"type_name\": \"模型描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"arbiterOrgan\",\n                    \"type_name\": \"可信第三方选择\",\n                    \"input_type\": \"button\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"assessment\",\n            \"component_name\": \"评估模型\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": []\n        }\n    ]\n}', 'edc9de4a161860de6a51b8b1994cc34d', '2022-06-16 09:26:31', '2022-11-30 10:09:34', 'nacos', '10.244.1.1', '', 'demo1', '', '', '', 'json', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (103, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    redis:\n      primary:\n        hostName: redis\n        port: 6379\n        password: primihub\n        database: 0\n        minIdle: 0\n        maxIdle: 10\n        maxTotal: 100\n        lifo: false\n        maxWaitMillis: 1000\n        minEvictableIdleTimeMillis: 1800000\n        softMinEvictableIdleTimeMillis: 1800000', 'c7410257a901774ad260e6fa8740f87a', '2022-06-16 09:28:22', '2022-06-17 09:18:27', 'nacos', '10.244.0.0', '', 'demo1', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (106, 'database.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      primary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo2?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      secondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo2?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourcePrimary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo2?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourceSecondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo2?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n', '09ad37d57f66f42135b3ea2eb6204ce8', '2022-06-16 09:29:29', '2023-01-04 09:31:49', 'nacos', '103.85.177.130', '', 'demo2', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (107, 'base.json', 'DEFAULT_GROUP', '{\n    \"tokenValidateUriBlackList\":[\n      \"/user/login\",\n      \"/user/register\",\n      \"/user/sendVerificationCode\",\n      \"/user/forgetPassword\",\n      \"/captcha/get\",\n      \"/captcha/check\",\n      \"/oauth/getAuthList\",\n      \"/oauth/authLogin\",\n      \"/oauth/authRegister\",\n      \"/oauth/github/render\",\n      \"/oauth/github/callback\",\n      \"/common/getValidatePublicKey\",\n      \"/common/getTrackingID\",\n      \"/shareData/syncProject\",\n      \"/shareData/syncModel\",\n      \"/organ/getHomepage\"\n    ],\n    \"needSignUriList\":[\n\n    ],\n    \"displayDatabaseSourceType\": true,\n    \"authConfigs\":{\n        \"github\": {\n            \"redirectUrl\":\"\",\n            \"authEnable\": 1,\n            \"clientId\": \"\",\n            \"clientSecret\": \"\",\n            \"redirectUri\": \"\"\n        }\n    },\n    \"lokiConfig\": {\n        \"address\":\"LOKI_IP:3100\",\n        \"job\":\"YOUR_NAMESPACE/primihubnode\",\n        \"container\":\"node1\"\n    },\n    \"adminUserIds\": [1],\n    \"defaultPassword\":\"123456\",\n    \"defaultPasswordVector\":\"excalibur\",\n    \"primihubOfficalService\": \"\",\n    \"grpcClient\":{\n        \"grpcClientAddress\":\"primihubnode\",\n        \"grpcClientPort\":50051,\n        \"grpcServerPorts\":[30872,30191,30047],\n        \"useTls\":false,\n        \"trustCertFilePath\":\"/data/javaclientcert/ca.crt\",\n        \"keyCertChainFile\":\"/data/javaclientcert/client.crt\",\n        \"keyFile\":\"/data/javaclientcert/client8.key\"\n    },\n    \"grpcServerPort\": 9090,\n    \"uploadUrlDirPrefix\": \"/data/upload/\",\n    \"resultUrlDirPrefix\": \"/data/result/\",\n    \"runModelFileUrlDirPrefix\": \"/data/result/runModel/\",\n    \"usefulToken\": \"excalibur_forever_ABCDEFGHIJKLMN\",\n    \"systemDomainName\":\"\",\n    \"mailProperties\":{},\n  \"model_components\": [\n        {\n            \"component_code\": \"start\",\n            \"component_name\": \"开始\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"taskName\",\n                    \"type_name\": \"任务名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"taskDesc\",\n                    \"type_name\": \"任务描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataSet\",\n            \"component_name\": \"选择数据集\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"selectData\",\n                    \"type_name\": \"选择数据\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataAlign\",\n            \"component_name\": \"数据对齐\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"dataAlign\",\n                    \"type_name\": \"数据对齐\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"样本对齐\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"特征对齐\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"MultipleSelected\",\n                    \"type_name\": \"可多选特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"encryption\",\n                    \"type_name\": \"加密方式\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"MD5\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"exception\",\n            \"component_name\": \"异常值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exception\",\n                    \"type_name\": \"异常值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"异常值处理\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"missing\",\n            \"component_name\": \"缺失值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"missingValue\",\n                    \"type_name\": \"缺失值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"缺失值处理\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"selectFeatures\",\n                    \"type_name\": \"选择特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exceptionType\",\n                    \"type_name\": \"缺失值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"平均值\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"featureCoding\",\n            \"component_name\": \"特征编码\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"featureCoding\",\n                    \"type_name\": \"特征编码\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"标签编码\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"哈希编码\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"独热编码\"\n                        },\n                        {\n                            \"key\": \"4\",\n                            \"val\": \"计数编码\"\n                        },\n                        {\n                            \"key\": \"5\",\n                            \"val\": \"直方图编码\"\n                        },\n                        {\n                            \"key\": \"6\",\n                            \"val\": \"WOE编码\"\n                        },\n                        {\n                            \"key\": \"7\",\n                            \"val\": \"目标编码\"\n                        },\n                        {\n                            \"key\": \"8\",\n                            \"val\": \"平均编码\"\n                        },\n                        {\n                            \"key\": \"9\",\n                            \"val\": \"模型编码\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"model\",\n            \"component_name\": \"模型选择\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelType\",\n                    \"type_name\": \"模型选择\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"纵向-XGBoost\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"横向-LR\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelName\",\n                    \"type_name\": \"模型名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"modelDesc\",\n                    \"type_name\": \"模型描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"arbiterOrgan\",\n                    \"type_name\": \"可信第三方选择\",\n                    \"input_type\": \"button\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"assessment\",\n            \"component_name\": \"评估模型\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": []\n        }\n    ]\n}', 'efc60683a32661e4504847c09362ed1a', '2022-06-16 09:29:29', '2022-11-30 10:09:18', 'nacos', '10.244.1.1', '', 'demo2', '', '', '', 'json', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (108, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    redis:\n      primary:\n        hostName: redis\n        port: 6379\n        password: primihub\n        database: 1\n        minIdle: 0\n        maxIdle: 10\n        maxTotal: 100\n        lifo: false\n        maxWaitMillis: 1000\n        minEvictableIdleTimeMillis: 1800000\n        softMinEvictableIdleTimeMillis: 1800000', 'cac51f9a54a982b8210c36f1708fe486', '2022-06-16 09:29:29', '2022-06-17 09:21:22', 'nacos', '10.244.0.0', '', 'demo2', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (127, 'database.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      primary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo3?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      secondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo3?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourcePrimary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo3?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourceSecondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo3?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n', '7d2c468600ff85d3ea27c7d769c250a3', '2022-06-29 09:36:09', '2023-01-04 09:31:24', 'nacos', '103.85.177.130', '', 'demo3', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (128, 'base.json', 'DEFAULT_GROUP', '{\n    \"tokenValidateUriBlackList\":[\n      \"/user/login\",\n      \"/user/register\",\n      \"/user/sendVerificationCode\",\n      \"/user/forgetPassword\",\n      \"/captcha/get\",\n      \"/captcha/check\",\n      \"/oauth/getAuthList\",\n      \"/oauth/authLogin\",\n      \"/oauth/authRegister\",\n      \"/oauth/github/render\",\n      \"/oauth/github/callback\",\n      \"/common/getValidatePublicKey\",\n      \"/common/getTrackingID\",\n      \"/shareData/syncProject\",\n      \"/shareData/syncModel\",\n      \"/organ/getHomepage\"\n    ],\n    \"needSignUriList\":[\n\n    ],\n    \"displayDatabaseSourceType\": true,\n    \"authConfigs\":{\n        \"github\": {\n            \"redirectUrl\":\"\",\n            \"authEnable\": 1,\n            \"clientId\": \"\",\n            \"clientSecret\": \"\",\n            \"redirectUri\": \"\"\n        }\n    },\n    \"lokiConfig\": {\n        \"address\":\"LOKI_IP:3100\",\n        \"job\":\"YOUR_NAMESPACE/primihubnode\",\n        \"container\":\"node2\"\n    },\n    \"adminUserIds\": [1],\n    \"defaultPassword\":\"123456\",\n    \"defaultPasswordVector\":\"excalibur\",\n    \"primihubOfficalService\": \"\",\n    \"grpcClient\":{\n        \"grpcClientAddress\":\"primihubnode\",\n        \"grpcClientPort\":50052,\n        \"grpcServerPorts\":[30872,30191,30047],\n        \"useTls\":false,\n        \"trustCertFilePath\":\"/data/javaclientcert/ca.crt\",\n        \"keyCertChainFile\":\"/data/javaclientcert/client.crt\",\n        \"keyFile\":\"/data/javaclientcert/client8.key\"\n    },\n    \"grpcServerPort\": 9090,\n    \"uploadUrlDirPrefix\": \"/data/upload/\",\n    \"resultUrlDirPrefix\": \"/data/result/\",\n    \"runModelFileUrlDirPrefix\": \"/data/result/runModel/\",\n    \"usefulToken\": \"excalibur_forever_ABCDEFGHIJKLMN\",\n    \"systemDomainName\":\"\",\n    \"mailProperties\":{},\n  \"model_components\": [\n        {\n            \"component_code\": \"start\",\n            \"component_name\": \"开始\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"taskName\",\n                    \"type_name\": \"任务名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"taskDesc\",\n                    \"type_name\": \"任务描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataSet\",\n            \"component_name\": \"选择数据集\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"selectData\",\n                    \"type_name\": \"选择数据\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataAlign\",\n            \"component_name\": \"数据对齐\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"dataAlign\",\n                    \"type_name\": \"数据对齐\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"样本对齐\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"特征对齐\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"MultipleSelected\",\n                    \"type_name\": \"可多选特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"encryption\",\n                    \"type_name\": \"加密方式\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"MD5\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"exception\",\n            \"component_name\": \"异常值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exception\",\n                    \"type_name\": \"异常值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"异常值处理\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"missing\",\n            \"component_name\": \"缺失值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"missingValue\",\n                    \"type_name\": \"缺失值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"缺失值处理\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"selectFeatures\",\n                    \"type_name\": \"选择特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exceptionType\",\n                    \"type_name\": \"缺失值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"平均值\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"featureCoding\",\n            \"component_name\": \"特征编码\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"featureCoding\",\n                    \"type_name\": \"特征编码\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"标签编码\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"哈希编码\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"独热编码\"\n                        },\n                        {\n                            \"key\": \"4\",\n                            \"val\": \"计数编码\"\n                        },\n                        {\n                            \"key\": \"5\",\n                            \"val\": \"直方图编码\"\n                        },\n                        {\n                            \"key\": \"6\",\n                            \"val\": \"WOE编码\"\n                        },\n                        {\n                            \"key\": \"7\",\n                            \"val\": \"目标编码\"\n                        },\n                        {\n                            \"key\": \"8\",\n                            \"val\": \"平均编码\"\n                        },\n                        {\n                            \"key\": \"9\",\n                            \"val\": \"模型编码\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"model\",\n            \"component_name\": \"模型选择\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelType\",\n                    \"type_name\": \"模型选择\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"纵向-XGBoost\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"横向-LR\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelName\",\n                    \"type_name\": \"模型名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"modelDesc\",\n                    \"type_name\": \"模型描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"arbiterOrgan\",\n                    \"type_name\": \"可信第三方选择\",\n                    \"input_type\": \"button\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"assessment\",\n            \"component_name\": \"评估模型\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": []\n        }\n    ]\n}', '63539eeba8f137725587f47762104073', '2022-06-29 09:36:09', '2022-11-30 10:09:00', 'nacos', '10.244.1.1', '', 'demo3', '', '', '', 'json', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (129, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    redis:\n      primary:\n        hostName: redis\n        port: 6379\n        password: primihub\n        database: 2\n        minIdle: 0\n        maxIdle: 10\n        maxTotal: 100\n        lifo: false\n        maxWaitMillis: 1000\n        minEvictableIdleTimeMillis: 1800000\n        softMinEvictableIdleTimeMillis: 1800000', '5a01168cd8d0120ed837fac415a0cf17', '2022-06-29 09:36:09', '2022-09-15 05:26:07', 'nacos', '103.85.177.130', '', 'demo3', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (104, 'fusion.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: primihub\n      url: jdbc:mysql://mysql:3306/fusion1?characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&allowMultiQueries=true&serverTimezone=Asia/Shanghai&useSSL=false\n      password: primihub@123\n      filter:\n        config:\n          enabled: true\n      initial-size: 3\n      min-idle: 3\n      max-active: 20\n      max-wait: 60000\n      test-while-idle: true\n      time-between-connect-error-millis: 60000\n      min-evictable-idle-time-millis: 30000\n      validationQuery: select \'x\'\n      test-on-borrow: false\n      test-on-return: false\n      pool-prepared-statements: true\n      max-pool-prepared-statement-per-connection-size: 20\n      use-global-data-source-stat: false\n      filters: stat,wall,slf4j\n      connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n      time-between-log-stats-millis: 300000', 'd19cece8dba5d3b2d4e71b98b378d154', '2023-05-29 03:56:50', '2023-05-29 04:12:03', 'nacos', '10.244.3.0', '', 'demo0', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (109, 'fusion.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: primihub\n      url: jdbc:mysql://mysql:3306/fusion2?characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&allowMultiQueries=true&serverTimezone=Asia/Shanghai&useSSL=false\n      password: primihub@123\n      filter:\n        config:\n          enabled: true\n      initial-size: 3\n      min-idle: 3\n      max-active: 20\n      max-wait: 60000\n      test-while-idle: true\n      time-between-connect-error-millis: 60000\n      min-evictable-idle-time-millis: 30000\n      validationQuery: select \'x\'\n      test-on-borrow: false\n      test-on-return: false\n      pool-prepared-statements: true\n      max-pool-prepared-statement-per-connection-size: 20\n      use-global-data-source-stat: false\n      filters: stat,wall,slf4j\n      connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n      time-between-log-stats-millis: 300000', '20c6f38a55599c4664277ad2049389ee', '2023-05-29 03:56:50', '2023-05-29 04:12:03', 'nacos', '10.244.3.0', '', 'demo1', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (126, 'fusion.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: primihub\n      url: jdbc:mysql://mysql:3306/fusion3?characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&allowMultiQueries=true&serverTimezone=Asia/Shanghai&useSSL=false\n      password: primihub@123\n      filter:\n        config:\n          enabled: true\n      initial-size: 3\n      min-idle: 3\n      max-active: 20\n      max-wait: 60000\n      test-while-idle: true\n      time-between-connect-error-millis: 60000\n      min-evictable-idle-time-millis: 30000\n      validationQuery: select \'x\'\n      test-on-borrow: false\n      test-on-return: false\n      pool-prepared-statements: true\n      max-pool-prepared-statement-per-connection-size: 20\n      use-global-data-source-stat: false\n      filters: stat,wall,slf4j\n      connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n      time-between-log-stats-millis: 300000', '68595244cdeec6b4c34039c350f2b610', '2023-05-29 03:56:50', '2023-05-29 04:12:03', 'nacos', '10.244.3.0', '', 'demo2', '', '', '', 'yaml', '');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
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
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
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
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
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
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
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
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
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
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
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

DROP TABLE IF EXISTS `permissions`;
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
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
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

DROP TABLE IF EXISTS `tenant_capacity`;
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
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
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
INSERT INTO `tenant_info` VALUES (3,'1','demo1','demo1','demo1','nacos',1655369938742,1655369938742),(4,'1','demo2','demo2','demo2','nacos',1655369947525,1655369947525),(5,'1','demo3','demo3','demo3','nacos',1656495327434,1656495327434);
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
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

GRANT ALL ON *.* TO 'primihub'@'%';