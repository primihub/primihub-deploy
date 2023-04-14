-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)

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



CREATE DATABASE IF NOT EXISTS `resource_demo1` Character SET utf8 COLLATE utf8_bin;

USE `resource_demo1`;

--
-- Current Database: `resource_demo2`
--

CREATE DATABASE IF NOT EXISTS `resource_demo2` Character SET utf8 COLLATE utf8_bin;

USE `resource_demo2`;

--
-- Current Database: `resource_demo3`
--

CREATE DATABASE IF NOT EXISTS `resource_demo3` Character SET utf8 COLLATE utf8_bin;

USE `resource_demo3`;

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
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (101, 'database.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      primary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo1?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      secondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo1?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourcePrimary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo1?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourceSecondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo1?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n', '31f468f1062a28964df7e3cd1513db19', '2022-06-16 09:01:01', '2023-01-05 03:32:40', 'nacos', '10.244.1.0', '', '46b6b568-e6ae-45ca-baa1-819932fc8947', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (102, 'base.json', 'DEFAULT_GROUP', '{\n    \"tokenValidateUriBlackList\":[\n      \"/user/login\",\n      \"/user/register\",\n      \"/user/sendVerificationCode\",\n      \"/user/forgetPassword\",\n      \"/captcha/get\",\n      \"/captcha/check\",\n      \"/oauth/getAuthList\",\n      \"/oauth/authLogin\",\n      \"/oauth/authRegister\",\n      \"/oauth/github/render\",\n      \"/oauth/github/callback\",\n      \"/common/getValidatePublicKey\",\n      \"/common/getTrackingID\",\n      \"/shareData/syncProject\",\n      \"/shareData/syncModel\",\n      \"/organ/getHomepage\"\n    ],\n    \"needSignUriList\":[\n\n    ],\n    \"displayDatabaseSourceType\": true,\n    \"authConfigs\":{\n        \"github\": {\n            \"redirectUrl\":\"\",\n            \"authEnable\": 1,\n            \"clientId\": \"\",\n            \"clientSecret\": \"\",\n            \"redirectUri\": \"\"\n        }\n    },\n    \"lokiConfig\": {\n        \"address\":\"172.28.1.30:3100\",\n        \"job\":\"false\",\n        \"container\":\"node0\"\n    },\n    \"adminUserIds\": [1],\n    \"defaultPassword\":\"123456\",\n    \"defaultPasswordVector\":\"excalibur\",\n    \"primihubOfficalService\": \"\",\n    \"grpcClient\":{\n        \"grpcClientAddress\":\"172.28.1.10\",\n        \"grpcClientPort\":50050,\n        \"grpcServerPorts\":[6666],\n        \"useTls\":false,\n        \"trustCertFilePath\":\"/data/javaclientcert/ca.crt\",\n        \"keyCertChainFile\":\"/data/javaclientcert/client.crt\",\n        \"keyFile\":\"/data/javaclientcert/client8.key\"\n    },\n    \"grpcServerPort\": 9090,\n    \"uploadUrlDirPrefix\": \"/data/upload/\",\n    \"resultUrlDirPrefix\": \"/data/result/\",\n    \"runModelFileUrlDirPrefix\": \"/data/result/runModel/\",\n    \"usefulToken\": \"excalibur_forever_ABCDEFGHIJKLMN\",\n    \"systemDomainName\":\"\",\n    \"mailProperties\":{},\n  \"model_components\": [\n        {\n            \"component_code\": \"start\",\n            \"component_name\": \"开始\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"taskName\",\n                    \"type_name\": \"任务名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"taskDesc\",\n                    \"type_name\": \"任务描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataSet\",\n            \"component_name\": \"选择数据集\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"selectData\",\n                    \"type_name\": \"选择数据\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataAlign\",\n            \"component_name\": \"数据对齐\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"dataAlign\",\n                    \"type_name\": \"数据对齐\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"样本对齐\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"特征对齐\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"MultipleSelected\",\n                    \"type_name\": \"可多选特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"encryption\",\n                    \"type_name\": \"加密方式\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"MD5\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"exception\",\n            \"component_name\": \"异常值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exception\",\n                    \"type_name\": \"异常值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"异常值处理\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"featureCoding\",\n            \"component_name\": \"特征编码\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"featureCoding\",\n                    \"type_name\": \"特征编码\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"标签编码\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"哈希编码\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"独热编码\"\n                        },\n                        {\n                            \"key\": \"4\",\n                            \"val\": \"计数编码\"\n                        },\n                        {\n                            \"key\": \"5\",\n                            \"val\": \"直方图编码\"\n                        },\n                        {\n                            \"key\": \"6\",\n                            \"val\": \"WOE编码\"\n                        },\n                        {\n                            \"key\": \"7\",\n                            \"val\": \"目标编码\"\n                        },\n                        {\n                            \"key\": \"8\",\n                            \"val\": \"平均编码\"\n                        },\n                        {\n                            \"key\": \"9\",\n                            \"val\": \"模型编码\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"model\",\n            \"component_name\": \"模型选择\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelType\",\n                    \"type_name\": \"模型选择\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"纵向-XGBoost\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"横向-LR\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelName\",\n                    \"type_name\": \"模型名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"modelDesc\",\n                    \"type_name\": \"模型描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"arbiterOrgan\",\n                    \"type_name\": \"可信第三方选择\",\n                    \"input_type\": \"button\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"assessment\",\n            \"component_name\":\"评估模型\",\n            \"is_show\":0,\n            \"is_mandatory\":1,\n            \"component_types\":[\n\n            ]\n        }\n    ]\n}', '45c9b8ff64b316cbe45e4bb5ebce7b47', '2022-06-16 09:26:31', '2023-01-16 23:58:41', 'nacos', '103.85.177.130', '', '46b6b568-e6ae-45ca-baa1-819932fc8947', '', '', '', 'json', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (103, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    redis:\n      primary:\n        hostName: redis\n        port: 6379\n        password: primihub\n        database: 0\n        minIdle: 0\n        maxIdle: 10\n        maxTotal: 100\n        lifo: false\n        maxWaitMillis: 1000\n        minEvictableIdleTimeMillis: 1800000\n        softMinEvictableIdleTimeMillis: 1800000', 'c7410257a901774ad260e6fa8740f87a', '2022-06-16 09:28:22', '2022-06-17 09:18:27', 'nacos', '10.244.0.0', '', '46b6b568-e6ae-45ca-baa1-819932fc8947', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (106, 'database.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      primary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo2?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      secondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo2?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourcePrimary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo2?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourceSecondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo2?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n', 'eb0848b350a3baa2586e08be7c7c29a7', '2022-06-16 09:29:29', '2023-01-05 03:33:03', 'nacos', '10.244.1.0', '', '71843998-b60a-42ed-81d7-c3c9940d11c0', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (107, 'base.json', 'DEFAULT_GROUP', '{\n    \"tokenValidateUriBlackList\":[\n      \"/user/login\",\n      \"/user/register\",\n      \"/user/sendVerificationCode\",\n      \"/user/forgetPassword\",\n      \"/captcha/get\",\n      \"/captcha/check\",\n      \"/oauth/getAuthList\",\n      \"/oauth/authLogin\",\n      \"/oauth/authRegister\",\n      \"/oauth/github/render\",\n      \"/oauth/github/callback\",\n      \"/common/getValidatePublicKey\",\n      \"/common/getTrackingID\",\n      \"/shareData/syncProject\",\n      \"/shareData/syncModel\",\n      \"/organ/getHomepage\"\n    ],\n    \"needSignUriList\":[\n\n    ],\n    \"displayDatabaseSourceType\": true,\n    \"authConfigs\":{\n        \"github\": {\n            \"redirectUrl\":\"\",\n            \"authEnable\": 1,\n            \"clientId\": \"\",\n            \"clientSecret\": \"\",\n            \"redirectUri\": \"\"\n        }\n    },\n    \"lokiConfig\": {\n        \"address\":\"172.28.1.30:3100\",\n        \"job\":\"false\",\n        \"container\":\"node1\"\n    },\n    \"adminUserIds\": [1],\n    \"defaultPassword\":\"123456\",\n    \"defaultPasswordVector\":\"excalibur\",\n    \"primihubOfficalService\": \"\",\n    \"grpcClient\":{\n        \"grpcClientAddress\":\"172.28.1.11\",\n        \"grpcClientPort\":50051,\n        \"grpcServerPorts\":[6667],\n        \"useTls\":false,\n        \"trustCertFilePath\":\"/data/javaclientcert/ca.crt\",\n        \"keyCertChainFile\":\"/data/javaclientcert/client.crt\",\n        \"keyFile\":\"/data/javaclientcert/client8.key\"\n    },\n    \"grpcServerPort\": 9090,\n    \"uploadUrlDirPrefix\": \"/data/upload/\",\n    \"resultUrlDirPrefix\": \"/data/result/\",\n    \"runModelFileUrlDirPrefix\": \"/data/result/runModel/\",\n    \"usefulToken\": \"excalibur_forever_ABCDEFGHIJKLMN\",\n    \"systemDomainName\":\"\",\n    \"mailProperties\":{},\n  \"model_components\": [\n        {\n            \"component_code\": \"start\",\n            \"component_name\": \"开始\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"taskName\",\n                    \"type_name\": \"任务名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"taskDesc\",\n                    \"type_name\": \"任务描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataSet\",\n            \"component_name\": \"选择数据集\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"selectData\",\n                    \"type_name\": \"选择数据\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataAlign\",\n            \"component_name\": \"数据对齐\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"dataAlign\",\n                    \"type_name\": \"数据对齐\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"样本对齐\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"特征对齐\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"MultipleSelected\",\n                    \"type_name\": \"可多选特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"encryption\",\n                    \"type_name\": \"加密方式\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"MD5\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"exception\",\n            \"component_name\": \"异常值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exception\",\n                    \"type_name\": \"异常值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"异常值处理\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"featureCoding\",\n            \"component_name\": \"特征编码\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"featureCoding\",\n                    \"type_name\": \"特征编码\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"标签编码\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"哈希编码\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"独热编码\"\n                        },\n                        {\n                            \"key\": \"4\",\n                            \"val\": \"计数编码\"\n                        },\n                        {\n                            \"key\": \"5\",\n                            \"val\": \"直方图编码\"\n                        },\n                        {\n                            \"key\": \"6\",\n                            \"val\": \"WOE编码\"\n                        },\n                        {\n                            \"key\": \"7\",\n                            \"val\": \"目标编码\"\n                        },\n                        {\n                            \"key\": \"8\",\n                            \"val\": \"平均编码\"\n                        },\n                        {\n                            \"key\": \"9\",\n                            \"val\": \"模型编码\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"model\",\n            \"component_name\": \"模型选择\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelType\",\n                    \"type_name\": \"模型选择\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"纵向-XGBoost\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"横向-LR\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelName\",\n                    \"type_name\": \"模型名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"modelDesc\",\n                    \"type_name\": \"模型描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"arbiterOrgan\",\n                    \"type_name\": \"可信第三方选择\",\n                    \"input_type\": \"button\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"assessment\",\n            \"component_name\": \"评估模型\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": []\n        }\n    ]\n}', '0bdf32547051c410ac8729744ad39cc1', '2022-06-16 09:29:29', '2023-01-05 09:02:54', 'nacos', '103.85.177.130', '', '71843998-b60a-42ed-81d7-c3c9940d11c0', '', '', '', 'json', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (108, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    redis:\n      primary:\n        hostName: redis\n        port: 6379\n        password: primihub\n        database: 1\n        minIdle: 0\n        maxIdle: 10\n        maxTotal: 100\n        lifo: false\n        maxWaitMillis: 1000\n        minEvictableIdleTimeMillis: 1800000\n        softMinEvictableIdleTimeMillis: 1800000', 'cac51f9a54a982b8210c36f1708fe486', '2022-06-16 09:29:29', '2022-06-17 09:21:22', 'nacos', '10.244.0.0', '', '71843998-b60a-42ed-81d7-c3c9940d11c0', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (127, 'database.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      primary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo3?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      secondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy_demo3?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourcePrimary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo3?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourceSecondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo3?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n', '18cdd4496fa026fa94e79034733a2400', '2022-06-29 09:36:09', '2023-01-05 03:33:21', 'nacos', '10.244.1.0', '', '35674f9d-3369-42f6-9f30-c8de2535adc6', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (128, 'base.json', 'DEFAULT_GROUP', '{\n    \"tokenValidateUriBlackList\":[\n      \"/user/login\",\n      \"/user/register\",\n      \"/user/sendVerificationCode\",\n      \"/user/forgetPassword\",\n      \"/captcha/get\",\n      \"/captcha/check\",\n      \"/oauth/getAuthList\",\n      \"/oauth/authLogin\",\n      \"/oauth/authRegister\",\n      \"/oauth/github/render\",\n      \"/oauth/github/callback\",\n      \"/common/getValidatePublicKey\",\n      \"/common/getTrackingID\",\n      \"/shareData/syncProject\",\n      \"/shareData/syncModel\",\n      \"/organ/getHomepage\"\n    ],\n    \"needSignUriList\":[\n\n    ],\n    \"displayDatabaseSourceType\": true,\n    \"authConfigs\":{\n        \"github\": {\n            \"redirectUrl\":\"\",\n            \"authEnable\": 1,\n            \"clientId\": \"\",\n            \"clientSecret\": \"\",\n            \"redirectUri\": \"\"\n        }\n    },\n    \"lokiConfig\": {\n        \"address\":\"172.28.1.30:3100\",\n        \"job\":\"false\",\n        \"container\":\"node2\"\n    },\n    \"adminUserIds\": [1],\n    \"defaultPassword\":\"123456\",\n    \"defaultPasswordVector\":\"excalibur\",\n    \"primihubOfficalService\": \"\",\n    \"grpcClient\":{\n        \"grpcClientAddress\":\"172.28.1.12\",\n        \"grpcClientPort\":50052,\n        \"grpcServerPorts\":[6668],\n        \"useTls\":false,\n        \"trustCertFilePath\":\"/data/javaclientcert/ca.crt\",\n        \"keyCertChainFile\":\"/data/javaclientcert/client.crt\",\n        \"keyFile\":\"/data/javaclientcert/client8.key\"\n    },\n    \"grpcServerPort\": 9090,\n    \"uploadUrlDirPrefix\": \"/data/upload/\",\n    \"resultUrlDirPrefix\": \"/data/result/\",\n    \"runModelFileUrlDirPrefix\": \"/data/result/runModel/\",\n    \"usefulToken\": \"excalibur_forever_ABCDEFGHIJKLMN\",\n    \"systemDomainName\":\"\",\n    \"mailProperties\":{},\n  \"model_components\": [\n        {\n            \"component_code\": \"start\",\n            \"component_name\": \"开始\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"taskName\",\n                    \"type_name\": \"任务名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"taskDesc\",\n                    \"type_name\": \"任务描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataSet\",\n            \"component_name\": \"选择数据集\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"selectData\",\n                    \"type_name\": \"选择数据\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"dataAlign\",\n            \"component_name\": \"数据对齐\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"dataAlign\",\n                    \"type_name\": \"数据对齐\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"样本对齐\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"特征对齐\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"MultipleSelected\",\n                    \"type_name\": \"可多选特征\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"encryption\",\n                    \"type_name\": \"加密方式\",\n                    \"input_type\": \"none\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"MD5\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"exception\",\n            \"component_name\": \"异常值处理\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"exception\",\n                    \"type_name\": \"异常值处理\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"1\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"异常值处理\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"featureCoding\",\n            \"component_name\": \"特征编码\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"featureCoding\",\n                    \"type_name\": \"特征编码\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"1\",\n                            \"val\": \"标签编码\"\n                        },\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"哈希编码\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"独热编码\"\n                        },\n                        {\n                            \"key\": \"4\",\n                            \"val\": \"计数编码\"\n                        },\n                        {\n                            \"key\": \"5\",\n                            \"val\": \"直方图编码\"\n                        },\n                        {\n                            \"key\": \"6\",\n                            \"val\": \"WOE编码\"\n                        },\n                        {\n                            \"key\": \"7\",\n                            \"val\": \"目标编码\"\n                        },\n                        {\n                            \"key\": \"8\",\n                            \"val\": \"平均编码\"\n                        },\n                        {\n                            \"key\": \"9\",\n                            \"val\": \"模型编码\"\n                        }\n                    ]\n                }\n            ]\n        },\n        {\n            \"component_code\": \"model\",\n            \"component_name\": \"模型选择\",\n            \"is_show\": 0,\n            \"is_mandatory\": 0,\n            \"component_types\": [\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelType\",\n                    \"type_name\": \"模型选择\",\n                    \"input_type\": \"select\",\n                    \"input_value\": \"\",\n                    \"input_values\": [\n                        {\n                            \"key\": \"2\",\n                            \"val\": \"纵向-XGBoost\"\n                        },\n                        {\n                            \"key\": \"3\",\n                            \"val\": \"横向-LR\"\n                        }\n                    ]\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 1,\n                    \"type_code\": \"modelName\",\n                    \"type_name\": \"模型名称\",\n                    \"input_type\": \"text\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"modelDesc\",\n                    \"type_name\": \"模型描述\",\n                    \"input_type\": \"textarea\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                },\n                {\n                    \"is_show\": 0,\n                    \"is_required\": 0,\n                    \"type_code\": \"arbiterOrgan\",\n                    \"type_name\": \"可信第三方选择\",\n                    \"input_type\": \"button\",\n                    \"input_value\": \"\",\n                    \"input_values\": []\n                }\n            ]\n        },\n        {\n            \"component_code\": \"assessment\",\n            \"component_name\": \"评估模型\",\n            \"is_show\": 0,\n            \"is_mandatory\": 1,\n            \"component_types\": []\n        }\n    ]\n}', '71993e7317fcbc9c055b938bd1aaac34', '2022-06-29 09:36:09', '2023-01-05 09:03:15', 'nacos', '103.85.177.130', '', '35674f9d-3369-42f6-9f30-c8de2535adc6', '', '', '', 'json', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (129, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    redis:\n      primary:\n        hostName: redis\n        port: 6379\n        password: primihub\n        database: 2\n        minIdle: 0\n        maxIdle: 10\n        maxTotal: 100\n        lifo: false\n        maxWaitMillis: 1000\n        minEvictableIdleTimeMillis: 1800000\n        softMinEvictableIdleTimeMillis: 1800000', '5a01168cd8d0120ed837fac415a0cf17', '2022-06-29 09:36:09', '2022-09-15 05:26:07', 'nacos', '103.85.177.130', '', '35674f9d-3369-42f6-9f30-c8de2535adc6', '', '', '', 'yaml', '');
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
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `tenant_info` VALUES (3,'1','46b6b568-e6ae-45ca-baa1-819932fc8947','demo1','demo1','nacos',1655369938742,1655369938742),(4,'1','71843998-b60a-42ed-81d7-c3c9940d11c0','demo2','demo2','nacos',1655369947525,1655369947525),(5,'1','35674f9d-3369-42f6-9f30-c8de2535adc6','demo3','demo3','nacos',1656495327434,1656495327434);
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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fusion_dc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fusion_dc`;

CREATE TABLE `data_fusion_copy_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_type` tinyint(4) NOT NULL COMMENT '任务类型 1 批量 2 单条',
  `current_offset` bigint(20) NOT NULL COMMENT '当前偏移量',
  `target_offset` bigint(20) NOT NULL COMMENT '目标便宜量',
  `task_table` varchar(64) NOT NULL COMMENT '复制任务表名',
  `fusion_server_address` varchar(64) NOT NULL COMMENT '连接中心地址',
  `latest_error_msg` varchar(1024) NOT NULL COMMENT '最近一次复制失败原因',
  `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
  `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `current_offset_ix` (`current_offset`) USING BTREE,
  KEY `target_offset_ix` (`target_offset`) USING BTREE,
  KEY `c_time_ix` (`c_time`) USING BTREE,
  KEY `u_time_ix` (`u_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `fusion_go` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(20) NOT NULL COMMENT '群组id',
  `organ_global_id` varchar(64) NOT NULL COMMENT '机构唯一id',
  `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
  `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `group_id_and global_id_ix` (`group_id`,`organ_global_id`) USING BTREE,
  KEY `group_id_ix` (`group_id`) USING BTREE,
  KEY `global_id_ix` (`organ_global_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `fusion_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(64) NOT NULL COMMENT '群组名称',
  `group_organ_id` varchar(64) NOT NULL COMMENT '群主id',
  `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
  `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `fusion_organ` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `global_id` varchar(64) NOT NULL COMMENT '唯一id',
  `global_name` varchar(64) NOT NULL COMMENT '机构名称',
  `public_key` varchar(1000) DEFAULT NULL COMMENT '机构公钥',
  `private_key` varchar(1000) DEFAULT NULL COMMENT '机构私钥',
  `pin_code_md` varchar(64) NOT NULL COMMENT 'pin码md5',
  `gateway_address` varchar(255) NOT NULL COMMENT '网关地址',
  `register_time` datetime(3) NOT NULL COMMENT '注册时间',
  `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
  `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `global_id_ix` (`global_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `fusion_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `resource_id` varchar(64) DEFAULT NULL COMMENT '资源ID',
  `resource_name` varchar(255) DEFAULT NULL COMMENT '资源名称',
  `resource_desc` varchar(255) DEFAULT NULL COMMENT '资源描述',
  `resource_type` tinyint(4) DEFAULT NULL COMMENT '资源类型 上传...',
  `resource_auth_type` tinyint(4) DEFAULT NULL COMMENT '授权类型（公开，私有，可见性）',
  `resource_rows_count` int(11) DEFAULT NULL COMMENT '资源行数',
  `resource_column_count` int(11) DEFAULT NULL COMMENT '资源列数',
  `resource_column_name_list` blob COMMENT '字段列表',
  `resource_contains_y` tinyint(4) DEFAULT NULL COMMENT '资源字段中是否包含y字段 0否 1是',
  `resource_y_rows_count` int(11) DEFAULT NULL COMMENT '文件字段y值内容不为空和0的行数',
  `resource_y_ratio` decimal(10,2) DEFAULT NULL COMMENT '文件字段y值内容不为空的行数在总行的占比',
  `resource_tag` varchar(255) DEFAULT NULL COMMENT '资源标签 格式tag,tag',
  `organ_id` varchar(64) DEFAULT NULL COMMENT '机构ID',
  `resource_hash_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源hash值',
  `resource_state` tinyint NOT NULL DEFAULT '0' COMMENT '资源状态 0上线 1下线',
  `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
  `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `resource_id_ix` (`resource_id`) USING BTREE,
  KEY `organ_id_ix` (`organ_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `fusion_resource_field` (
  `field_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字段id',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源id',
  `field_name` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `field_as` varchar(255) DEFAULT NULL COMMENT '字段别名',
  `field_type` int(11) DEFAULT '0' COMMENT '字段类型 默认0 string',
  `field_desc` varchar(255) DEFAULT NULL COMMENT '字段描述',
  `relevance` int(11) DEFAULT '0' COMMENT '关键字 0否 1是',
  `grouping` int(11) DEFAULT '0' COMMENT '分组 0否 1是',
  `protection_status` int(11) DEFAULT '0' COMMENT '保护开关 0关闭 1开启',
  `is_del` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `fusion_resource_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
  `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `fusion_resource_visibility_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_id` varchar(64) NOT NULL COMMENT '资源id',
  `organ_global_id` varchar(64) NOT NULL COMMENT '机构id',
  `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
  `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `resource_id_ix` (`resource_id`) USING BTREE,
  KEY `organ_global_id_ix` (`organ_global_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `fusion_organ_resource_auth`;
CREATE TABLE `fusion_organ_resource_auth`  (
                                               `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                               `resource_id` bigint(20) NOT NULL COMMENT '资源id',
                                               `organ_id` bigint(20) NOT NULL COMMENT '机构id',
                                               `project_id` varchar(255) DEFAULT NULL COMMENT '项目ID',
                                               `audit_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态',
                                               `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
                                               `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                               `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
                                               PRIMARY KEY (`id`) USING BTREE,
                                               INDEX `resource_id_ix`(`resource_id`) USING BTREE,
                                               INDEX `organ_id_ix`(`organ_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `fusion_organ_extends`;
CREATE TABLE `fusion_organ_extends` (
                                        `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                        `global_id` bigint NOT NULL COMMENT '机构id',
                                        `ip` varchar(255) NOT NULL COMMENT '机构ip地址',
                                        `lat` decimal(18,14) DEFAULT NULL COMMENT '纬度',
                                        `lon` decimal(18,14) DEFAULT NULL COMMENT '经度',
                                        `country` varchar(255) DEFAULT NULL COMMENT '区域',
                                        `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
                                        `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                        `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
                                        PRIMARY KEY (`id`),
                                        INDEX `global_id_ix`(`global_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

GRANT ALL ON *.* TO 'primihub'@'%';