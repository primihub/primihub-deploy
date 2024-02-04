CREATE DATABASE IF NOT EXISTS `resource` Character SET utf8 COLLATE utf8_bin;

CREATE DATABASE IF NOT EXISTS `nacos_config` Character SET utf8 COLLATE utf8_bin;

USE `nacos_config`;

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

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (101, 'database.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      primary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      secondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/privacy?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourcePrimary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n      resourceSecondary:\n        driver-class-name: com.mysql.cj.jdbc.Driver\n        username: primihub\n        url: jdbc:mysql://mysql:3306/resource_demo?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=GMT&useSSL=false\n        password: primihub@123\n        connection-properties: config.decrypt=false;config.decrypt.key=\n        filter:\n          config:\n            enabled: true\n        initial-size: 3\n        min-idle: 3\n        max-active: 20\n        max-wait: 60000\n        test-while-idle: true\n        time-between-connect-error-millis: 60000\n        min-evictable-idle-time-millis: 30000\n        validationQuery: select \'x\'\n        test-on-borrow: false\n        test-on-return: false\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        use-global-data-source-stat: false\n        filters: stat,wall,slf4j\n        connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n        time-between-log-stats-millis: 300000\n        web-stat-filter:\n          enabled: true\n          url-pattern: \'/*\'\n          exclusions: \'*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*\'\n        stat-view-servlet:\n          enabled: true\n          url-pattern: \'/druid/*\'\n          reset-enable: false\n          login-username: admin\n          login-password: admin\n', '31f468f1062a28964df7e3cd1513db19', '2022-06-16 09:01:01', '2023-01-05 03:32:40', 'nacos', '10.244.1.0', '', 'node', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (102, 'base.json', 'DEFAULT_GROUP', '{\n  \"tokenValidateUriBlackList\": [\n    \"/user/login\",\n    \"/user/register\",\n    \"/user/sendVerificationCode\",\n    \"/user/forgetPassword\",\n    \"/captcha/get\",\n    \"/captcha/check\",\n    \"/oauth/getAuthList\",\n    \"/oauth/authLogin\",\n    \"/oauth/authRegister\",\n    \"/oauth/github/render\",\n    \"/oauth/github/callback\",\n    \"/common/getValidatePublicKey\",\n    \"/common/getTrackingID\",\n    \"/shareData/syncProject\",\n    \"/shareData/syncModel\",\n    \"/organ/getHomepage\"\n  ],\n  \"needSignUriList\": [],\n  \"displayDatabaseSourceType\": true,\n  \"authConfigs\": {\n    \"github\": {\n      \"redirectUrl\": \"\",\n      \"authEnable\": 1,\n      \"clientId\": \"\",\n      \"clientSecret\": \"\",\n      \"redirectUri\": \"\"\n    }\n  },\n  \"lokiConfig\": {\n    \"address\": \"YOUR_HOST_IP:3100\",\n    \"job\": \"false\",\n    \"container\": \"node\"\n  },\n  \"adminUserIds\": [\n    1\n  ],\n  \"defaultPassword\": \"123456\",\n  \"defaultPasswordVector\": \"excalibur\",\n  \"primihubOfficalService\": \"\",\n  \"grpcClient\": {\n    \"address\": \"YOUR_HOST_IP\",\n    \"port\": 50050,\n    \"useTls\": false,\n    \"trustCertFilePath\": \"/data/javaclientcert/ca.crt\",\n    \"keyCertChainFile\": \"/data/javaclientcert/client.crt\",\n    \"keyFile\": \"/data/javaclientcert/client8.key\"\n  },\n  \"grpcServerPort\": 9090,\n  \"uploadUrlDirPrefix\": \"/data/upload/\",\n  \"resultUrlDirPrefix\": \"/data/result/\",\n  \"runModelFileUrlDirPrefix\": \"/data/result/runModel/\",\n  \"usefulToken\": \"excalibur_forever_ABCDEFGHIJKLMN\",\n  \"systemDomainName\": \"\",\n  \"mailProperties\": {}\n   }', '857f93e9e998cdc3d1ff7035ef01df3f', '2022-06-16 09:26:31', '2023-04-14 11:31:22', 'nacos', '10.244.3.0', '', 'node', '', '', '', 'json', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (103, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    redis:\n      primary:\n        hostName: redis\n        port: 6379\n        password: primihub\n        database: 0\n        minIdle: 0\n        maxIdle: 10\n        maxTotal: 100\n        lifo: false\n        maxWaitMillis: 1000\n        minEvictableIdleTimeMillis: 1800000\n        softMinEvictableIdleTimeMillis: 1800000', 'c7410257a901774ad260e6fa8740f87a', '2022-06-16 09:28:22', '2022-06-17 09:18:27', 'nacos', '10.244.0.0', '', 'node', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (104, 'fusion.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    sql-script-encoding: utf-8\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: primihub\n      url: jdbc:mysql://mysql:3306/fusion?characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&allowMultiQueries=true&serverTimezone=Asia/Shanghai&useSSL=false\n      password: primihub@123\n      filter:\n        config:\n          enabled: true\n      initial-size: 3\n      min-idle: 3\n      max-active: 20\n      max-wait: 60000\n      test-while-idle: true\n      time-between-connect-error-millis: 60000\n      min-evictable-idle-time-millis: 30000\n      validationQuery: select \'x\'\n      test-on-borrow: false\n      test-on-return: false\n      pool-prepared-statements: true\n      max-pool-prepared-statement-per-connection-size: 20\n      use-global-data-source-stat: false\n      filters: stat,wall,slf4j\n      connect-properties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\n      time-between-log-stats-millis: 300000', 'd19cece8dba5d3b2d4e71b98b378d154', '2023-05-29 03:56:50', '2023-05-29 04:12:03', 'nacos', '10.244.3.0', '', 'node', '', '', '', 'yaml', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (105, 'components.json', 'DEFAULT_GROUP', '{\"model_components\":[{\"component_code\":\"start\",\"component_name\":\"开始\",\"is_show\":0,\"is_mandatory\":0,\"component_types\":[{\"is_show\":0,\"is_required\":1,\"type_code\":\"taskName\",\"type_name\":\"任务名称\",\"input_type\":\"text\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"taskDesc\",\"type_name\":\"任务描述\",\"input_type\":\"textarea\",\"input_value\":\"\",\"input_values\":[]}]},{\"component_code\":\"dataSet\",\"component_name\":\"选择数据集\",\"is_show\":0,\"is_mandatory\":0,\"component_types\":[{\"is_show\":0,\"is_required\":1,\"type_code\":\"selectData\",\"type_name\":\"选择数据\",\"input_type\":\"none\",\"input_value\":\"\",\"input_values\":[]}]},{\"component_code\":\"dataAlign\",\"component_name\":\"数据对齐\",\"is_show\":0,\"is_mandatory\":1,\"component_types\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"dataAlign\",\"type_name\":\"数据对齐\",\"input_type\":\"select\",\"input_value\":\"\",\"input_values\":[{\"key\":\"1\",\"val\":\"样本对齐\"}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"MultipleSelected\",\"type_name\":\"可多选特征\",\"input_type\":\"none\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"encryption\",\"type_name\":\"加密方式\",\"input_type\":\"none\",\"input_value\":\"1\",\"input_values\":[{\"key\":\"1\",\"val\":\"MD5\"}]}]},{\"component_code\":\"exception\",\"component_name\":\"异常值处理\",\"is_show\":0,\"is_mandatory\":1,\"component_types\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"exception\",\"type_name\":\"异常值处理\",\"input_type\":\"select\",\"input_value\":\"1\",\"input_values\":[{\"key\":\"1\",\"val\":\"异常值处理\"}]}]},{\"component_code\":\"fitTransform\",\"component_name\":\"缺失值填充\",\"is_show\":0,\"is_mandatory\":1,\"component_types\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"simpleImputerString\",\"type_name\":\"String数据类型\",\"input_type\":\"select\",\"input_value\":\"most_frequent\",\"input_values\":[{\"key\":\"most_frequent\",\"val\":\"most_frequent 众数\"}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"simpleImputerNumeric\",\"type_name\":\"其他数据类型\",\"input_type\":\"select\",\"input_value\":\"mean\",\"input_values\":[{\"key\":\"mean\",\"val\":\"mean 平均值\"},{\"key\":\"median\",\"val\":\"median 中位数\"},{\"key\":\"most_frequent\",\"val\":\"most_frequent 众数\"}]}]},{\"component_code\":\"jointStatistical\",\"component_name\":\"联合统计\",\"is_show\":0,\"is_mandatory\":1,\"component_types\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"jointStatistical\",\"type_name\":\"联合统计\",\"input_type\":\"none\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"processingType\",\"type_name\":\"运算类型\",\"input_type\":\"select\",\"input_value\":\"\",\"input_values\":[{\"key\":1,\"val\":\"平均值\"},{\"key\":2,\"val\":\"求和\"},{\"key\":3,\"val\":\"最大值\"},{\"key\":4,\"val\":\"最小值\"}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"selectFeature\",\"type_name\":\"选择特征\",\"input_type\":\"select\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"addFilling\",\"type_name\":\"添加填充策略\",\"input_type\":\"button\",\"input_value\":\"\",\"input_values\":[]}]},{\"component_code\":\"model\",\"component_name\":\"模型选择\",\"is_show\":0,\"is_mandatory\":0,\"component_types\":[{\"is_show\":0,\"is_required\":1,\"type_code\":\"modelType\",\"type_name\":\"模型选择\",\"input_type\":\"select\",\"input_value\":\"\",\"input_values\":[{\"key\":\"2\",\"val\":\"纵向-XGBoost\",\"param\":[{\"is_show\":1,\"is_required\":0,\"type_code\":\"numTree\",\"type_name\":\"Params.NumTree\",\"input_type\":\"number\",\"input_value\":5,\"input_values\":[{\"key\":\"min\",\"val\":3},{\"key\":\"max\",\"val\":10}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"maxDepth\",\"type_name\":\"Params.MaxDepth\",\"input_type\":\"number\",\"input_value\":5,\"input_values\":[{\"key\":\"min\",\"val\":3},{\"key\":\"max\",\"val\":10}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"regLambda\",\"type_name\":\"Params.RegLambda\",\"input_type\":\"text\",\"input_value\":1,\"input_values\":[{\"key\":\"min\",\"val\":1}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"minChildWeight\",\"type_name\":\"Params.MinChildWeight\",\"input_type\":\"number\",\"input_value\":3,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":100}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"isEncrypted\",\"type_name\":\"Params.IsEncrypted\",\"input_type\":\"radio\",\"input_value\":\"true\",\"input_values\":[{\"key\":\"true\",\"val\":\"true\"},{\"key\":\"false\",\"val\":\"false\"}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"mergeGh\",\"type_name\":\"Params.MergeGh\",\"input_type\":\"radio\",\"input_value\":\"true\",\"input_values\":[{\"key\":\"true\",\"val\":\"true\"},{\"key\":\"false\",\"val\":\"false\"}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"featureSample\",\"type_name\":\"Params.FeatureSample\",\"input_type\":\"radio\",\"input_value\":\"true\",\"input_values\":[{\"key\":\"true\",\"val\":\"true\"},{\"key\":\"false\",\"val\":\"false\"}]}]},{\"key\":\"3\",\"val\":\"横向-逻辑回归\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"arbiterOrgan\",\"type_name\":\"可信第三方选择\",\"input_type\":\"button\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"encryption\",\"type_name\":\"加密方式\",\"input_type\":\"select\",\"input_value\":\"Plaintext\",\"input_values\":[{\"key\":\"Plaintext\",\"val\":\"明文\"},{\"key\":\"DPSGD\",\"val\":\"DPSGD\",\"param\":[{\"is_show\":1,\"is_required\":0,\"type_code\":\"delta\",\"type_name\":\"Params.Delta\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"noiseMultiplier\",\"type_name\":\"Params.NoiseMultiplier\",\"input_type\":\"text\",\"input_value\":\"2.0\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"l2NormClip\",\"type_name\":\"Params.L2NormClip\",\"input_type\":\"text\",\"input_value\":\"1.0\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"secureMode\",\"type_name\":\"Params.SecureMode\",\"input_type\":\"radio\",\"input_value\":\"true\",\"input_values\":[{\"key\":\"true\",\"val\":\"true\"},{\"key\":\"false\",\"val\":\"false\"}]}]},{\"key\":\"Paillier\",\"val\":\"Paillier\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"nLength\",\"type_name\":\"Params.NLength\",\"input_type\":\"select\",\"input_value\":\"1024\",\"input_values\":[{\"key\":\"512\",\"val\":\"512\"},{\"key\":\"1024\",\"val\":\"1024\"},{\"key\":\"2048\",\"val\":\"2048\"},{\"key\":\"3072\",\"val\":\"3072\"},{\"key\":\"4096\",\"val\":\"4096\"}]}]}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"learningRate\",\"type_name\":\"Params.LearningRate\",\"input_type\":\"text\",\"input_value\":\"1.0\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"alpha\",\"type_name\":\"Params.Alpha\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"batchSize\",\"type_name\":\"Params.BatchSize\",\"input_type\":\"number\",\"input_value\":\"100\",\"input_values\":[{\"key\":\"min\",\"val\":1}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"globalEpoch\",\"type_name\":\"Params.GlobalEpoch\",\"input_type\":\"number\",\"input_value\":5,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":1000}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"localEpoch\",\"type_name\":\"Params.LocalEpoch\",\"input_type\":\"number\",\"input_value\":1,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":10}]}]},{\"key\":\"4\",\"val\":\"MPC-逻辑回归\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"batchSize\",\"type_name\":\"Params.BatchSize\",\"input_type\":\"number\",\"input_value\":128,\"input_values\":[{\"key\":\"min\",\"val\":128},{\"key\":\"max\",\"val\":1024}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"maxIter\",\"type_name\":\"Params.MaxIter\",\"input_type\":\"number\",\"input_value\":\"5\",\"input_values\":[{\"key\":\"min\",\"val\":5},{\"key\":\"max\",\"val\":5000}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"ColumnsExclude\",\"type_name\":\"Params.ColumnsExclude\",\"input_type\":\"text\",\"input_value\":\"\"},{\"key\":\"5\",\"val\":\"纵向-逻辑回归\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"encryption\",\"type_name\":\"加密方式\",\"input_type\":\"select\",\"input_value\":\"Plaintext\",\"input_values\":[{\"key\":\"Plaintext\",\"val\":\"明文\"},{\"key\":\"CKKS\",\"val\":\"CKKS\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"arbiterOrgan\",\"type_name\":\"可信第三方选择\",\"input_type\":\"button\",\"input_value\":\"\",\"input_values\":[]}]}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"learningRate\",\"type_name\":\"Params.LearningRate\",\"input_type\":\"text\",\"input_value\":0.1,\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"alpha\",\"type_name\":\"Params.Alpha\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"epoch\",\"type_name\":\"Params.Epoch\",\"input_type\":\"number\",\"input_value\":5,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":1000}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"batchSize\",\"type_name\":\"Params.BatchSize\",\"input_type\":\"number\",\"input_value\":1,\"input_values\":[{\"key\":\"min\",\"val\":1}]}]},{\"key\":\"6\",\"val\":\"横向-NN(分类)\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"arbiterOrgan\",\"type_name\":\"可信第三方选择\",\"input_type\":\"button\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"encryption\",\"type_name\":\"加密方式\",\"input_type\":\"select\",\"input_value\":\"Plaintext\",\"input_values\":[{\"key\":\"Plaintext\",\"val\":\"明文\"},{\"key\":\"DPSGD\",\"val\":\"DPSGD\",\"param\":[{\"is_show\":1,\"is_required\":0,\"type_code\":\"delta\",\"type_name\":\"Params.Delta\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"maxGradNorm\",\"type_name\":\"Params.MaxGradNorm\",\"input_type\":\"text\",\"input_value\":\"1.0\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"noiseMultiplier\",\"type_name\":\"Params.NoiseMultiplier\",\"input_type\":\"text\",\"input_value\":\"2.0\",\"input_values\":[]}]}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"learningRate\",\"type_name\":\"Params.LearningRate\",\"input_type\":\"text\",\"input_value\":\"0.01\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"alpha\",\"type_name\":\"Params.Alpha\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"batchSize\",\"type_name\":\"Params.BatchSize\",\"input_type\":\"number\",\"input_value\":100,\"input_values\":[{\"key\":\"min\",\"val\":1}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"globalEpoch\",\"type_name\":\"Params.GlobalEpoch\",\"input_type\":\"number\",\"input_value\":5,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":1000}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"localEpoch\",\"type_name\":\"Params.LocalEpoch\",\"input_type\":\"number\",\"input_value\":1,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":10}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"optimizer\",\"type_name\":\"Params.Optimizer\",\"input_type\":\"select\",\"input_value\":\"adam\",\"input_values\":[{\"key\":\"adadelta\",\"val\":\"adadelta\"},{\"key\":\"adagrad\",\"val\":\"adagrad\"},{\"key\":\"adam\",\"val\":\"adam\"},{\"key\":\"adamw\",\"val\":\"adamw\"},{\"key\":\"adamax\",\"val\":\"adamax\"},{\"key\":\"asgd\",\"val\":\"asgd\"},{\"key\":\"nadam\",\"val\":\"nadam\"},{\"key\":\"radam\",\"val\":\"radam\"},{\"key\":\"rmsprop\",\"val\":\"rmsprop\"},{\"key\":\"sgd\",\"val\":\"sgd\"}]}]},{\"key\":\"7\",\"val\":\"横向-NN(回归)\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"arbiterOrgan\",\"type_name\":\"可信第三方选择\",\"input_type\":\"button\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"encryption\",\"type_name\":\"加密方式\",\"input_type\":\"select\",\"input_value\":\"Plaintext\",\"input_values\":[{\"key\":\"Plaintext\",\"val\":\"明文\"},{\"key\":\"DPSGD\",\"val\":\"DPSGD\",\"param\":[{\"is_show\":1,\"is_required\":0,\"type_code\":\"delta\",\"type_name\":\"Params.Delta\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"maxGradNorm\",\"type_name\":\"Params.MaxGradNorm\",\"input_type\":\"text\",\"input_value\":\"1.0\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"noiseMultiplier\",\"type_name\":\"Params.NoiseMultiplier\",\"input_type\":\"text\",\"input_value\":\"2.0\",\"input_values\":[]}]}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"learningRate\",\"type_name\":\"Params.LearningRate\",\"input_type\":\"text\",\"input_value\":\"0.01\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"alpha\",\"type_name\":\"Params.Alpha\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"batchSize\",\"type_name\":\"Params.BatchSize\",\"input_type\":\"number\",\"input_value\":100,\"input_values\":[{\"key\":\"min\",\"val\":1}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"globalEpoch\",\"type_name\":\"Params.GlobalEpoch\",\"input_type\":\"number\",\"input_value\":5,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":1000}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"localEpoch\",\"type_name\":\"Params.LocalEpoch\",\"input_type\":\"number\",\"input_value\":1,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":10}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"optimizer\",\"type_name\":\"Params.Optimizer\",\"input_type\":\"select\",\"input_value\":\"adam\",\"input_values\":[{\"key\":\"adadelta\",\"val\":\"adadelta\"},{\"key\":\"adagrad\",\"val\":\"adagrad\"},{\"key\":\"adam\",\"val\":\"adam\"},{\"key\":\"adamw\",\"val\":\"adamw\"},{\"key\":\"adamax\",\"val\":\"adamax\"},{\"key\":\"asgd\",\"val\":\"asgd\"},{\"key\":\"nadam\",\"val\":\"nadam\"},{\"key\":\"radam\",\"val\":\"radam\"},{\"key\":\"rmsprop\",\"val\":\"rmsprop\"},{\"key\":\"sgd\",\"val\":\"sgd\"}]}]},{\"key\":\"8\",\"val\":\"横向-线性回归\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"arbiterOrgan\",\"type_name\":\"可信第三方选择\",\"input_type\":\"button\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"encryption\",\"type_name\":\"加密方式\",\"input_type\":\"select\",\"input_value\":\"Plaintext\",\"input_values\":[{\"key\":\"Plaintext\",\"val\":\"明文\"},{\"key\":\"DPSGD\",\"val\":\"DPSGD\",\"param\":[{\"is_show\":1,\"is_required\":0,\"type_code\":\"delta\",\"type_name\":\"Params.Delta\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"noiseMultiplier\",\"type_name\":\"Params.NoiseMultiplier\",\"input_type\":\"text\",\"input_value\":\"2.0\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"l2NormClip\",\"type_name\":\"Params.L2NormClip\",\"input_type\":\"text\",\"input_value\":\"1.0\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"secureMode\",\"type_name\":\"Params.SecureMode\",\"input_type\":\"radio\",\"input_value\":\"true\",\"input_values\":[{\"key\":\"true\",\"val\":\"true\"},{\"key\":\"false\",\"val\":\"false\"}]}]},{\"key\":\"Paillier\",\"val\":\"Paillier\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"nLength\",\"type_name\":\"Params.NLength\",\"input_type\":\"select\",\"input_value\":\"1024\",\"input_values\":[{\"key\":\"512\",\"val\":\"512\"},{\"key\":\"1024\",\"val\":\"1024\"},{\"key\":\"2048\",\"val\":\"2048\"},{\"key\":\"3072\",\"val\":\"3072\"},{\"key\":\"4096\",\"val\":\"4096\"}]}]}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"learningRate\",\"type_name\":\"Params.LearningRate\",\"input_type\":\"text\",\"input_value\":\"1.0\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"alpha\",\"type_name\":\"Params.Alpha\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"batchSize\",\"type_name\":\"Params.BatchSize\",\"input_type\":\"number\",\"input_value\":\"100\",\"input_values\":[{\"key\":\"min\",\"val\":1}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"globalEpoch\",\"type_name\":\"Params.GlobalEpoch\",\"input_type\":\"number\",\"input_value\":5,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":1000}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"localEpoch\",\"type_name\":\"Params.LocalEpoch\",\"input_type\":\"number\",\"input_value\":1,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":10}]}]},{\"key\":\"9\",\"val\":\"纵向-线性回归\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"encryption\",\"type_name\":\"加密方式\",\"input_type\":\"select\",\"input_value\":\"Plaintext\",\"input_values\":[{\"key\":\"Plaintext\",\"val\":\"明文\"},{\"key\":\"CKKS\",\"val\":\"CKKS\",\"param\":[{\"is_show\":0,\"is_required\":0,\"type_code\":\"arbiterOrgan\",\"type_name\":\"可信第三方选择\",\"input_type\":\"button\",\"input_value\":\"\",\"input_values\":[]}]}]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"learningRate\",\"type_name\":\"Params.LearningRate\",\"input_type\":\"text\",\"input_value\":0.1,\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"alpha\",\"type_name\":\"Params.Alpha\",\"input_type\":\"text\",\"input_value\":\"0.0001\",\"input_values\":[]},{\"is_show\":1,\"is_required\":0,\"type_code\":\"epoch\",\"type_name\":\"Params.Epoch\",\"input_type\":\"number\",\"input_value\":5,\"input_values\":[{\"key\":\"min\",\"val\":1},{\"key\":\"max\",\"val\":1000}]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"batchSize\",\"type_name\":\"Params.BatchSize\",\"input_type\":\"number\",\"input_value\":1,\"input_values\":[{\"key\":\"min\",\"val\":1}]}]}]},{\"is_show\":0,\"is_required\":1,\"type_code\":\"modelName\",\"type_name\":\"模型名称\",\"input_type\":\"text\",\"input_value\":\"\",\"input_values\":[]},{\"is_show\":0,\"is_required\":0,\"type_code\":\"modelDesc\",\"type_name\":\"模型描述\",\"input_type\":\"textarea\",\"input_value\":\"\",\"input_values\":[]}]}]}', '8313983a1d789048f5b1c00c13fc5b88', '2023-05-29 03:56:50', '2023-05-29 04:12:03', 'nacos', '10.244.3.0', '', 'node', '', '', '', 'yaml', '');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

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

CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;

INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');

UNLOCK TABLES;

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

LOCK TABLES `tenant_info` WRITE;

INSERT INTO `tenant_info` VALUES (3,'1','node','node','node','nacos',1655369938742,1655369938742);

UNLOCK TABLES;

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;

INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);

UNLOCK TABLES;

GRANT ALL ON *.* TO 'primihub'@'%';