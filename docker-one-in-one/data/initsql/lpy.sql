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

GRANT ALL ON *.* TO 'primihub'@'%';