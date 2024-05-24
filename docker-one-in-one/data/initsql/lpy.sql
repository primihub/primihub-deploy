CREATE
DATABASE IF NOT EXISTS `privacy` Character SET utf8 COLLATE utf8_general_ci;

use privacy;

DROP TABLE IF EXISTS `data_exam_task`;
CREATE TABLE `data_exam_task`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `task_id`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预处理任务id',
    `task_name`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
    `task_state`         tinyint(4) NULL DEFAULT NULL COMMENT '任务状态(0未开始 1成功 2运行中 3失败 4取消)',
    `origin_organ_id`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源组织id',
    `origin_resource_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源资源id',
    `target_organ_id`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标组织id',
    `target_resource_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标资源id',
    `contains_y`         tinyint(4) NULL DEFAULT NULL COMMENT '资源字段中是否包含y字段 0否 1是',
    `is_del`             tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
    `create_date`        datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
    `update_date`        datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预处理任务表' ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `pir_record`;
CREATE TABLE `pir_record`  (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                               `record_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
                               `pir_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
                               `pir_task_id` bigint(20) NULL DEFAULT NULL,
                               `task_state` int(11) NULL DEFAULT NULL,
                               `origin_organ_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
                               `target_organ_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
                               `start_time` datetime NULL DEFAULT NULL,
                               `commit_rows_num` int(11) NULL DEFAULT NULL,
                               `end_time` datetime NULL DEFAULT NULL,
                               `result_rows_num` int(11) NULL DEFAULT NULL,
                               `is_del` tinyint(4) NULL DEFAULT 0,
                               `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
                               `update_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'PIR记录表' ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `psi_record`;
CREATE TABLE `psi_record`  (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                               `record_id` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                               `psi_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `psi_id` bigint(11) NULL DEFAULT NULL,
                               `psi_task_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `task_state` int(255) NULL DEFAULT NULL,
                               `origin_organ_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `target_organ_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                               `start_time` datetime NULL DEFAULT NULL,
                               `commit_rows_num` int(11) NULL DEFAULT NULL,
                               `end_time` datetime NULL DEFAULT NULL,
                               `result_rows_num` int(255) NULL DEFAULT NULL,
                               `is_del` tinyint(255) NULL DEFAULT 0,
                               `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
                               `update_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'PSI记录表' ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `score_model`;
CREATE TABLE `score_model`  (
                                `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                `score_model_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url code',
                                `score_model_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文',
                                `score_model_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
                                `score_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键',
                                `is_del` tinyint(4) NULL DEFAULT 0,
                                `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
                                `update_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '营销分模型种类表' ROW_FORMAT = DYNAMIC;

INSERT INTO `score_model` VALUES (1, 'AME000678', '用户真实性评分', 'truth_score', 'truth_score', 0, '2024-05-14 14:44:03', '2024-05-14 14:44:03');
INSERT INTO `score_model` VALUES (2, 'AME000815', '用户购买力评分', 'yhgm_score', 'yhgm_score', 0, '2024-05-14 14:44:03', '2024-05-16 17:41:59');
INSERT INTO `score_model` VALUES (3, 'AME000816', '用户消费意愿评分', 'yhxf_score', 'yhxf_score', 0, '2024-05-14 14:44:03', '2024-05-16 17:42:06');
INSERT INTO `score_model` VALUES (4, 'AME000818', '用户号码稳定性评分', 'yhhhwd_score', 'yhhhwd_score', 0, '2024-05-14 14:44:03', '2024-05-16 17:42:13');

DROP TABLE IF EXISTS `data_core`;
CREATE TABLE `data_core`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `y` double NULL DEFAULT NULL,
  `score` double NULL DEFAULT NULL,
  `score_model_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_del` tinyint(4) NULL DEFAULT 0,
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '核心数据表' ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `pir_result`;
CREATE TABLE `pir_result`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scoreModelType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` double NULL DEFAULT NULL,
  `pir_task_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `psi_result`;
CREATE TABLE `psi_result`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `psi_task_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

GRANT ALL ON *.* TO 'primihub'@'%';