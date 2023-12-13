
CREATE DATABASE IF NOT EXISTS `pedestal` Character SET utf8mb4 COLLATE utf8mb4_general_ci;

use `pedestal`;
-- ----------------------------
-- Table structure for data_source
-- ----------------------------
DROP TABLE IF EXISTS `data_source`;
CREATE TABLE `data_source`  (
                                `id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                `ds_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
                                `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `driver_class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库驱动',
                                `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库连接地址',
                                `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名称',
                                `ds_acct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库用户',
                                `ds_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库密码',
                                `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `state` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
                                `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据集 数据库类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dataset
-- ----------------------------
DROP TABLE IF EXISTS `dataset`;
CREATE TABLE `dataset`  (
                            `dataset_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据集id',
                            `party_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属机构id',
                            `party_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构中文名',
                            `dataset_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文名称',
                            `dataset_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中文名称',
                            `dataset_descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
                            `dataset_schema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'schema',
                            `dataset_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题',
                            `dataset_topic_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题中文名',
                            `refresh_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新周期',
                            `start_batch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起始批次',
                            `last_batch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最新批次',
                            `priv_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '隐私等级',
                            `src_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源Id',
                            `sample_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '样本数据',
                            `is_recon_model` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '融合模型 0 否 1 是',
                            `dataset_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集状态 0 未授权 、1  已授权、-1 失效、2 授权中',
                            `data_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据地址 ',
                            `use_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据使用类型',
                            `real_src_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据读取方式',
                            `real_sq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实数据源sql',
                            `datasource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源类型',
                            `dataset_sharded` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集分片',
                            `sample_sharded` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样本集分片',
                            `row_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据条数',
                            `dataset_tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
                            `dataset_catalog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据目录',
                            `approve_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方数据集使用',
                            `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                            `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                            `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                            `dataset_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源id',
                            PRIMARY KEY (`dataset_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据集' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dataset_auth_apply
-- ----------------------------
DROP TABLE IF EXISTS `dataset_auth_apply`;
CREATE TABLE `dataset_auth_apply`  (
                                       `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                       `dataset_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集id',
                                       `dataset_party_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集所属机构id',
                                       `dataset_party_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集所属机构名称',
                                       `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0 待审批; 1 通过；2 不通过',
                                       `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                       `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                       `approval_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据集授权申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dataset_auth_approval
-- ----------------------------
DROP TABLE IF EXISTS `dataset_auth_approval`;
CREATE TABLE `dataset_auth_approval`  (
                                          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                          `dataset_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集id',
                                          `dataset_party_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集归属机构id',
                                          `party_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作机构id',
                                          `party_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作机构名称',
                                          `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0 待审批; 1 通过；2 不通过',
                                          `user_id` int(11) NULL DEFAULT NULL COMMENT '审批用户',
                                          `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批备注',
                                          `notice_flag` tinyint(1) NULL DEFAULT NULL COMMENT '是否通知成功 0 否 1 是',
                                          `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据集授权审批' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dataset_field
-- ----------------------------
DROP TABLE IF EXISTS `dataset_field`;
CREATE TABLE `dataset_field`  (
                                  `field_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段编号',
                                  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段英文名',
                                  `field_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段中文名',
                                  `field_descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段描述',
                                  `dataset_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据集编号',
                                  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段类型',
                                  `field_length` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长度',
                                  `precision_val` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '精度',
                                  `is_primary_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键',
                                  `sens_lvl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '敏感级别',
                                  `protocol_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算类型',
                                  `distribution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分布类型',
                                  `field_index` int(3) NULL DEFAULT NULL COMMENT '字段下标',
                                  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0 否 1 是',
                                  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据集字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dataset_party_visible
-- ----------------------------
DROP TABLE IF EXISTS `dataset_party_visible`;
CREATE TABLE `dataset_party_visible`  (
                                          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                          `dataset_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集id',
                                          `party_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作机构id',
                                          `party_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作机构名称',
                                          `status` tinyint(1) NULL DEFAULT NULL COMMENT '是否可见 0 不可见 1 可见',
                                          `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                          `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据集可见机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fl_api
-- ----------------------------
DROP TABLE IF EXISTS `fl_api`;
CREATE TABLE `fl_api`  (
                           `fl_api_id` bigint(20) NOT NULL,
                           `project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                           `learning_model_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                           `fl_field_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                           PRIMARY KEY (`fl_api_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
                        `job_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务编号',
                        `prog_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序编号',
                        `project_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编号',
                        `sponsor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构编码',
                        `sponsor_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
                        `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务状态',
                        `start_dt` datetime(0) NULL DEFAULT NULL COMMENT '任务开始时间',
                        `end_dt` datetime(0) NULL DEFAULT NULL COMMENT '任务结束时间',
                        `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                        `update_time` datetime(0) NULL DEFAULT NULL COMMENT '状态时间',
                        `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
                        `grpc_task_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'grpc项目参数',
                        `task_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务标识',
                        PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_log
-- ----------------------------
DROP TABLE IF EXISTS `job_log`;
CREATE TABLE `job_log`  (
                            `job_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务编号',
                            `prog_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序编号',
                            `project_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编号',
                            `sponsor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构编码',
                            `sponsor_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
                            `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务状态',
                            `start_dt` datetime(0) NULL DEFAULT NULL COMMENT '任务开始时间',
                            `end_dt` datetime(0) NULL DEFAULT NULL COMMENT '任务结束时间',
                            `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` datetime(0) NULL DEFAULT NULL COMMENT '状态时间',
                            `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
                            `grpc_task_param` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'grpc项目参数',
                            PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for learning_model
-- ----------------------------
DROP TABLE IF EXISTS `learning_model`;
CREATE TABLE `learning_model`  (
                                   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                   `job_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务编号',
                                   `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
                                   `prog_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序编号',
                                   `algorithms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法',
                                   `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
                                   `api_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型api编号',
                                   `export_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '能否导出',
                                   `dataset_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集编号',
                                   `is_virtual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否融合数据集',
                                   `project_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编号',
                                   `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '推理模型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mpc_api
-- ----------------------------
DROP TABLE IF EXISTS `mpc_api`;
CREATE TABLE `mpc_api`  (
                            `mpc_api_id` bigint(20) NOT NULL,
                            `formula` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `out_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `datasource_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `file_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `where_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `mpc_psi_field_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                            `mpc_field_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                            `mpc_api_out_field_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                            PRIMARY KEY (`mpc_api_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for node_server
-- ----------------------------
DROP TABLE IF EXISTS `node_server`;
CREATE TABLE `node_server`  (
                                `node_id` int(11) NOT NULL COMMENT '节点编号',
                                `node_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点地址',
                                `core_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点类型',
                                `core_type_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点类型中文名',
                                `node_party` int(11) NULL DEFAULT NULL COMMENT '节点归属机构编号',
                                `party_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点归属机构中文名',
                                `party_create_time` datetime(0) NULL DEFAULT NULL COMMENT '机构创建时间',
                                `sign_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签约状态',
                                `sign_time` datetime(0) NULL DEFAULT NULL COMMENT '签约时间',
                                `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
                                `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
                                PRIMARY KEY (`node_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构节点信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for party
-- ----------------------------
DROP TABLE IF EXISTS `party`;
CREATE TABLE `party`  (
                          `party_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构编号',
                          `party_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构编码',
                          `party_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构中文名',
                          `party_descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构描述',
                          `party_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构类型',
                          `party_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构logo',
                          `party_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构编码',
                          `party_master` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构主账号',
                          `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构手机号',
                          `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构email',
                          `contact_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构联系人',
                          `party_status` tinyint(1) NULL DEFAULT NULL COMMENT '机构状态  1 启用 -1 禁用',
                          `service_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务地址',
                          `sign_time` datetime(0) NULL DEFAULT NULL COMMENT '签约时间',
                          `termination_time` datetime(0) NULL DEFAULT NULL COMMENT '终止时间',
                          `is_self` tinyint(1) NULL DEFAULT NULL COMMENT '是否本机构 0 否 1 是',
                          `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
                          `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                          `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                          `app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '东西向 登录账户',
                          `app_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '东西向 机构登录密钥',
                          `ns_app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '南北向 登录账户',
                          `ns_app_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '南北向 机构登录密钥',
                          `task_status` tinyint(1) NULL DEFAULT NULL COMMENT '是否东西向同步 0 否 1 是',
                          `ns_task_status` tinyint(1) NULL DEFAULT NULL COMMENT '是否南北向同步 0 否 1 是',
                          `node_catalog_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点类型ID',
                          PRIMARY KEY (`party_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for party_minio
-- ----------------------------
DROP TABLE IF EXISTS `party_minio`;
CREATE TABLE `party_minio`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
                                `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
                                `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
                                `bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '桶',
                                `party_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pir_api
-- ----------------------------
DROP TABLE IF EXISTS `pir_api`;
CREATE TABLE `pir_api`  (
                            `pir_api_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
                            `api_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '匿踪查询api编号',
                            `out_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集编号',
                            `segment_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分片、索引字段',
                            `segment_length` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分片长度',
                            `encrypt_length` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密算法',
                            `ext_conf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `pir_api_out_field_list_json` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '匿踪查询输出字段列表的json字段',
                            PRIMARY KEY (`pir_api_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '匿踪查询服务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for program
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program`  (
                            `prog_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '程序编号',
                            `prog_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序英文名',
                            `prog_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序中文名',
                            `prog_descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序描述',
                            `prog_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
                            `eff_dt` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '生效日期',
                            `exp_dt` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '失效日期',
                            `sponsor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起合作方id',
                            `sponsor_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起合作方中文名',
                            `project_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编号',
                            `protocol_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景',
                            `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
                            `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                            `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                            `node_catalog_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`prog_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '程序' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for program_model
-- ----------------------------
DROP TABLE IF EXISTS `program_model`;
CREATE TABLE `program_model`  (
                                  `model_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模型id',
                                  `model_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型uuid',
                                  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型名称',
                                  `model_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型描述',
                                  `model_type` int(2) NULL DEFAULT NULL COMMENT '模型模板',
                                  `project_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目id',
                                  `resource_num` int(8) NULL DEFAULT NULL COMMENT '资源个数',
                                  `y_value_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'y值字段',
                                  `component_speed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件执行进度id',
                                  `train_type` tinyint(4) NULL DEFAULT 0 COMMENT '训练类型 0纵向 1横向 默认纵向',
                                  `is_draft` tinyint(4) NULL DEFAULT 0 COMMENT '是否草稿 0是 1不是 默认是',
                                  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
                                  `organ_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构id',
                                  `component_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '组件json',
                                  `is_del` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
                                  `create_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                  `update_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
                                  `prog_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序id',
                                  PRIMARY KEY (`model_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 425 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for program_model_step
-- ----------------------------
DROP TABLE IF EXISTS `program_model_step`;
CREATE TABLE `program_model_step`  (
                                       `mc_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系id',
                                       `model_id` bigint(20) NULL DEFAULT NULL COMMENT '模型id',
                                       `task_id` bigint(20) NULL DEFAULT NULL COMMENT '任务id',
                                       `input_component_id` bigint(20) NULL DEFAULT NULL COMMENT '输入组件id',
                                       `output_component_id` bigint(20) NULL DEFAULT NULL COMMENT '输出组件id',
                                       `point_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向类型(直线、曲线图等等)',
                                       `point_json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向json数据',
                                       `is_del` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
                                       `create_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                       `update_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
                                       PRIMARY KEY (`mc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组件模型关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for program_psi_step
-- ----------------------------
DROP TABLE IF EXISTS `program_psi_step`;
CREATE TABLE `program_psi_step`  (
                                     `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'psi 主键',
                                     `own_organ_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本机构id',
                                     `own_resource_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本机构资源id',
                                     `own_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本机构资源关键字',
                                     `other_organ_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他机构id',
                                     `other_resource_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他机构资源id',
                                     `other_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他机构资源关键字',
                                     `output_file_path_type` tinyint(4) NULL DEFAULT 0 COMMENT '文件路径输出类型 0默认 自动生成',
                                     `output_no_repeat` tinyint(4) NULL DEFAULT 0 COMMENT '输出内容是否不去重 默认0 不去重 1去重',
                                     `tag` tinyint(4) NULL DEFAULT 0 COMMENT '0表示openmined psi，1表示libPsi的KKRT psi',
                                     `result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果名称',
                                     `output_content` int(11) NULL DEFAULT 0 COMMENT '输出内容 默认0 0交集 1差集',
                                     `output_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输出格式',
                                     `result_organ_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果获取方 多机构\",\"号间隔',
                                     `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                     `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
                                     `is_del` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
                                     `create_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                     `update_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
                                     `prog_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序id',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'psi流程编排' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
                            `project_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目编号',
                            `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目英文名',
                            `project_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目中文名',
                            `project_descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目描述',
                            `eff_time` datetime(0) NULL DEFAULT NULL COMMENT '生效时间',
                            `exp_time` datetime(0) NULL DEFAULT NULL COMMENT '失效时间',
                            `sponsor` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起方(机构编号)',
                            `sponsor_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起方(机构名称)',
                            `protocol_Type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景PSI PSI;PIR PIR;MPC MPC;HFL 横向联邦;VFL 纵向联邦',
                            `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                            `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                            `node_catalog_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点类型ID',
                            `agreement_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合约描述',
                            `project_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
                            `state_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态描述',
                            `num` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参与机构个数',
                            `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户',
                            PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project_dataset
-- ----------------------------
DROP TABLE IF EXISTS `project_dataset`;
CREATE TABLE `project_dataset`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `project_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编号',
                                    `dataset_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集id',
                                    `party_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构id',
                                    `dataset_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集描述',
                                    `dataset_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据集名称',
                                    `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                    `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                    `is_self` tinyint(1) NULL DEFAULT NULL COMMENT '是否自己 0 否 1 是',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 296 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目使用数据集' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project_party
-- ----------------------------
DROP TABLE IF EXISTS `project_party`;
CREATE TABLE `project_party`  (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                  `project_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编号',
                                  `party_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构id',
                                  `party_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
                                  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人',
                                  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
                                  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
                                  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0 否 1 是',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目参与机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for psi_api
-- ----------------------------
DROP TABLE IF EXISTS `psi_api`;
CREATE TABLE `psi_api`  (
                            `psi_api_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                            `out_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `datasource_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `file_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `where_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            `psi_field_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                            `psi_api_out_field_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
                            `api_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`psi_api_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sec_key
-- ----------------------------
DROP TABLE IF EXISTS `sec_key`;
CREATE TABLE `sec_key`  (
                            `key_id` int(11) NOT NULL AUTO_INCREMENT,
                            `party_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构id',
                            `private_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '私钥',
                            `public_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公钥',
                            `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密钥类型: RSA SM4',
                            `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                            `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`key_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '密钥' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serve_api
-- ----------------------------
DROP TABLE IF EXISTS `serve_api`;
CREATE TABLE `serve_api`  (
                              `api_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                              `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `create_time` datetime(0) NULL DEFAULT NULL,
                              `update_time` datetime(0) NULL DEFAULT NULL,
                              `sponsor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `protocol_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                              `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建api的用户',
                              `sponsor_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构标签',
                              PRIMARY KEY (`api_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serve_api_auth
-- ----------------------------
DROP TABLE IF EXISTS `serve_api_auth`;
CREATE TABLE `serve_api_auth`  (
                                   `id` int(11) NOT NULL COMMENT 'id',
                                   `api_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api 编号',
                                   `api_party_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务归属方id',
                                   `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api 中文名',
                                   `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api 英文名',
                                   `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
                                   `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式 get/post',
                                   `protocol_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PSI 安全求交;PIR 隐匿查询;MPC 多方计算;HFL 横向联邦;VFL 纵向联邦',
                                   `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
                                   `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
                                   `party_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参与方编号',
                                   `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 0 待审批; 1 通过；2 不通过',
                                   `user_id` int(11) NULL DEFAULT NULL COMMENT '审批用户',
                                   `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_time` datetime(0) NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serve_api_body
-- ----------------------------
DROP TABLE IF EXISTS `serve_api_body`;
CREATE TABLE `serve_api_body`  (
                                   `colName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回字段英文',
                                   `colLabel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回字段中文',
                                   `apiId` int(11) NULL DEFAULT NULL COMMENT 'api编号',
                                   `parentName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级字段',
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务响应参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serve_api_log
-- ----------------------------
DROP TABLE IF EXISTS `serve_api_log`;
CREATE TABLE `serve_api_log`  (
                                  `id` bigint(20) NOT NULL,
                                  `api_id` bigint(20) NULL DEFAULT NULL,
                                  `ip_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `reg_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `req_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `resp_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `resp_header_len` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `resp_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `resp_body_len` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `resp_time` datetime(0) NULL DEFAULT NULL,
                                  `err_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `err_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `create_dt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  `serv_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务调用日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serve_api_param
-- ----------------------------
DROP TABLE IF EXISTS `serve_api_param`;
CREATE TABLE `serve_api_param`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `colName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回字段英文',
                                    `colLabel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回字段中文',
                                    `apiId` int(11) NULL DEFAULT NULL COMMENT 'api编号',
                                    `parentName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级字段',
                                    `is_required` int(255) NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服务请求参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sync_task_log
-- ----------------------------
DROP TABLE IF EXISTS `sync_task_log`;
CREATE TABLE `sync_task_log`  (
                                  `id` bigint(18) NOT NULL AUTO_INCREMENT,
                                  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0 正常 -1 不正常',
                                  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
                                  `start_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始时间',
                                  `end_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '结束时间',
                                  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问地址',
                                  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问参数',
                                  `attempts` tinyint(1) NULL DEFAULT NULL COMMENT '重试次数',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 303246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
                             `file_id` int(11) NOT NULL AUTO_INCREMENT,
                             `file_source` tinyint(2) NULL DEFAULT NULL COMMENT '文件来源',
                             `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
                             `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
                             `file_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
                             `file_size` bigint(20) NULL DEFAULT NULL COMMENT '文件实际大小',
                             `file_current_size` bigint(20) NULL DEFAULT NULL COMMENT '文件当前大小',
                             `file_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件区域',
                             `is_del` tinyint(2) NULL DEFAULT NULL COMMENT '是否删除',
                             `minio_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'minio地址',
                             `create_time` datetime(0) NULL DEFAULT NULL,
                             `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
                             `party_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属机构',
                             PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2838 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据集 文件类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                         `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
                         `user_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户',
                         `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
                         `user_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户密码',
                         `is_del` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '是否删除 0 否 1 是',
                         `party_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应机构id',
                         `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
                         `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
                         PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for virtual_dataset
-- ----------------------------
DROP TABLE IF EXISTS `virtual_dataset`;
CREATE TABLE `virtual_dataset`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `job_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务id',
                                    `project_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目id',
                                    `party_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构id',
                                    `program_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序id',
                                    `program_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '程序名称',
                                    `download_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载地址',
                                    `sync_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否同步',
                                    `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
                                    `resource_id` int(11) NULL DEFAULT NULL COMMENT '资源编号',
                                    `resource_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源名称',
                                    `no_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是无数据发起方',
                                    `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                    `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '结果集' ROW_FORMAT = Dynamic;


CREATE DATABASE IF NOT EXISTS `fusion` Character SET utf8 COLLATE utf8_bin;

use fusion;

DROP TABLE IF EXISTS `fusion_resource`;
CREATE TABLE `fusion_resource`  (
                                    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                    `resource_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源ID',
                                    `resource_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
                                    `resource_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源描述',
                                    `resource_type` tinyint(4) NULL DEFAULT NULL COMMENT '资源类型 上传...',
                                    `resource_auth_type` tinyint(4) NULL DEFAULT NULL COMMENT '授权类型（公开，私有，可见性）',
                                    `resource_rows_count` int(11) NULL DEFAULT NULL COMMENT '资源行数',
                                    `resource_column_count` int(11) NULL DEFAULT NULL COMMENT '资源列数',
                                    `resource_column_name_list` text NULL COMMENT '字段列表',
                                    `resource_contains_y` tinyint(4) NULL DEFAULT NULL COMMENT '资源字段中是否包含y字段 0否 1是',
                                    `resource_y_rows_count` int(11) NULL DEFAULT NULL COMMENT '文件字段y值内容不为空和0的行数',
                                    `resource_y_ratio` decimal(10, 2) NULL DEFAULT NULL COMMENT '文件字段y值内容不为空的行数在总行的占比',
                                    `resource_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源标签 格式tag,tag',
                                    `organ_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构ID',
                                    `resource_hash_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源hash值',
                                    `resource_state` tinyint NOT NULL DEFAULT '0' COMMENT '资源状态 0上线 1下线',
                                    `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
                                    `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
                                    `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                    `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    UNIQUE INDEX `resource_id_ix`(`resource_id`) USING BTREE,
                                    INDEX `organ_id_ix`(`organ_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `fusion_resource_tag`;
CREATE TABLE `fusion_resource_tag`  (
                                        `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                        `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
                                        `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
                                        `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                        `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `fusion_resource_visibility_auth`;
CREATE TABLE `fusion_resource_visibility_auth`  (
                                                    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                                    `resource_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源id',
                                                    `organ_global_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构id',
                                                    `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
                                                    `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                                    `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
                                                    PRIMARY KEY (`id`) USING BTREE,
                                                    INDEX `resource_id_ix`(`resource_id`) USING BTREE,
                                                    INDEX `organ_global_id_ix`(`organ_global_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `fusion_resource_field`;
CREATE TABLE `fusion_resource_field` (
                                         `field_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字段id',
                                         `resource_id` bigint(20) DEFAULT NULL COMMENT '资源id',
                                         `field_name` varchar(255) DEFAULT NULL COMMENT '字段名称',
                                         `field_as` varchar(255) DEFAULT NULL COMMENT '字段别名',
                                         `field_type` int(11) DEFAULT '0' COMMENT '字段类型 默认0 string',
                                         `field_desc` varchar(255) DEFAULT NULL COMMENT '字段描述',
                                         `is_del` tinyint(4) DEFAULT '0' COMMENT '是否删除',
                                         `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                         `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
                                         PRIMARY KEY (`field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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

DROP TABLE IF EXISTS `data_set`;
CREATE TABLE `data_set` (
                                        `id` varchar(255) NOT NULL COMMENT '主键',
                                        `access_info` text COMMENT '访问信息',
                                        `driver` varchar(255) NOT NULL COMMENT '资源类型',
                                        `address` varchar(255) COMMENT '资源地址',
                                        `visibility` varchar(255) NOT NULL COMMENT '可见性',
                                        `available` varchar(255) NOT NULL COMMENT '可获得',
                                        `holder` tinyint(4) DEFAULT '0' COMMENT '是否持有 0持有 1不持有',
                                        `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '字段列表',
                                        `is_del` tinyint(4) DEFAULT '0' COMMENT '是否删除',
                                        `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                        `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
                                        PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `fusion_organ`;
CREATE TABLE `fusion_organ`  (
                                 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
                                 `global_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
                                 `global_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构名称',
                                 `register_time` datetime(3) NOT NULL COMMENT '注册时间',
                                 `is_del` tinyint(4) NOT NULL COMMENT '是否删除',
                                 `c_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
                                 `u_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
                                 PRIMARY KEY (`id`) USING BTREE,
                                 INDEX `global_id_ix`(`global_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

GRANT ALL ON *.* TO 'primihub'@'%';