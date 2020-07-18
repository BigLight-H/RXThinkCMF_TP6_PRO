/*
 Navicat Premium Data Transfer

 Source Server         : 个人120服务器
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : 127.0.0.1:3306
 Source Schema         : rxthink.pro6

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : 65001

 Date: 18/07/2020 10:47:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for think_action
-- ----------------------------
DROP TABLE IF EXISTS `think_action`;
CREATE TABLE `think_action`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行为唯一标识（组合控制器名+操作名）',
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行为说明',
  `module` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属模块名',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型：1模块 2插件 3主题',
  `execution` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '执行类型：1自定义操作 2记录操作',
  `rule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行为规则',
  `log` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志规则',
  `description` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行为描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1启用 2禁用',
  `create_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识：1正常 0删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统行为表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_action
-- ----------------------------
INSERT INTO `think_action` VALUES (1, 'login_index', '登录后台', '228', 3, 2, '111', '[user|get_nickname]在[time|time_format]登录了后台', '用户登录后台', 1, 1, 1528251784, 1, 1593740067, 1);
INSERT INTO `think_action` VALUES (2, 'update_config', '更新配置', 'admin', 1, 2, '', '', '新增或修改或删除配置', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (3, 'update_channel', '更新导航', 'admin', 1, 2, '', '', '新增或修改或删除导航', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (4, 'update_category', '更新分类', 'admin', 1, 2, '', '', '新增或修改或删除分类', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (5, 'database_export', '数据库备份', 'admin', 1, 1, '', '', '后台进行数据库备份操作', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (6, 'database_optimize', '数据表优化', 'admin', 1, 1, '', '', '数据库管理-》数据表优化', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (7, 'database_repair', '数据表修复', 'admin', 1, 1, '', '', '数据库管理-》数据表修复', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (8, 'database_delbackup', '备份文件删除', 'admin', 1, 1, '', '', '数据库管理-》备份文件删除', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (9, 'database_import', '数据库完成', 'admin', 1, 1, '', '', '数据库管理-》数据还原', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (10, 'delete_actionlog', '删除行为日志', 'admin', 1, 1, '', '', '后台删除用户行为日志', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (11, 'user_register', '注册', 'admin', 1, 1, '', '', '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (12, 'action_add', '添加行为', 'admin', 1, 1, '', '', '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (13, 'action_edit', '编辑用户行为', 'admin', 1, 1, '', '', '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (14, 'action_dellog', '清空日志', 'admin', 1, 1, '', '', '清空所有行为日志', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (15, 'setstatus', '改变数据状态', 'admin', 1, 1, '', '', '通过列表改变了数据的status状态值', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_action` VALUES (16, 'modules_delapp', '删除模块', 'admin', 1, 2, '23', '1212', '删除整个模块的时候记录', 1, 0, 0, 1, 1557843987, 1);

-- ----------------------------
-- Table structure for think_action_log_2020_07
-- ----------------------------
DROP TABLE IF EXISTS `think_action_log_2020_07`;
CREATE TABLE `think_action_log_2020_07`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '行为ID',
  `is_admin` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否后台操作：1是 2否',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人用户名',
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求类型',
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作方法',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作页面',
  `param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求参数(JSON格式)',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志标题',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `ip` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'IP地址',
  `user_agent` varchar(360) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'User-Agent',
  `create_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识：1正常 0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统行为日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_ad
-- ----------------------------
DROP TABLE IF EXISTS `think_ad`;
CREATE TABLE `think_ad`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告标题',
  `sort_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告位ID',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告图片',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '广告格式：1图片 2文字 3视频 4推荐',
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告描述',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '广告内容',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '广告链接',
  `width` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告宽度',
  `height` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告高度',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `endt_ime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `view_num` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '广告点击次数',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 125 COMMENT '排序',
  `create_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识：1正常 0删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ad_sort_id`(`sort_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_ad
-- ----------------------------
INSERT INTO `think_ad` VALUES (1, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (2, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (3, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (4, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (5, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (6, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (7, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (8, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (9, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (10, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (11, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (12, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (13, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (14, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (15, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (16, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (17, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (18, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (19, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (20, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (21, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (22, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (23, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (24, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (25, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (26, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (27, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_ad` VALUES (28, '网站平台双十一狂欢节', 1, '/images/ad/20200717/774297eef0920584930.png', 1, '网站平台双十一狂欢节', '网站平台双十一狂欢节', 'http://www.rxthink.cn/', 0, 0, 0, 0, 0, 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_ad_sort
-- ----------------------------
DROP TABLE IF EXISTS `think_ad_sort`;
CREATE TABLE `think_ad_sort`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告位名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告位描述',
  `item_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '站点ID',
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目ID',
  `loc_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告页面位置',
  `platform` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '站点类型：1PC站 2wap站 3其他',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '广告位排序',
  `create_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告位管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_ad_sort
-- ----------------------------
INSERT INTO `think_ad_sort` VALUES (1, '网站上部系统广告推荐', '网站上部系统广告推荐', 1, 2, 1, 1, 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_admin
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '盐加密',
  `dept_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属部门ID',
  `role_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户角色ID',
  `level_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '职级ID',
  `position_id` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '岗位ID',
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `identity` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 3 COMMENT '性别:1男 2女 3未知',
  `company_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公司ID',
  `entry_date` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '入职时间',
  `province_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '省份ID',
  `city_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '市区ID',
  `district_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '区县ID',
  `city_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属城市',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `is_admin` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否管理员：1管理员 2普通员工',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '个性标签',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1正常 2禁用',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '显示顺序',
  `login_num` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近登录IP',
  `login_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最近登录时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标记',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台用户管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_admin
-- ----------------------------
INSERT INTO `think_admin` VALUES (1, '管理员', '相约在冬季', 'admin', '99526fac85ce02f5ba23d3688ef15c63', '', 15, '1', 1, 11, '/images/admin/20200717/9d42dc4f4f33a7a3857.jpg', '15295504264', '1175401194@qq.com', '320821198902452789', 3, 0, 1594915200, 0, 0, 0, '', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', NULL, '暂无22', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1594972949, 1);
INSERT INTO `think_admin` VALUES (2, '管理员', '', 'admin1', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504000', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (3, '管理员', '', 'admin2', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504001', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (4, '管理员', '', 'admin3', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504002', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (5, '管理员', '', 'admin4', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504003', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (6, '管理员', '', 'admin5', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504004', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (7, '管理员', '', 'admin6', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504005', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (8, '管理员', '', 'admin7', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504006', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (9, '管理员', '', 'admin8', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504007', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (10, '管理员', '', 'admin9', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504008', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (11, '管理员', '', 'admin10', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504009', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (12, '管理员', '', 'admin11', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504010', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (13, '管理员', '', 'admin12', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504011', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (14, '管理员', '', 'admin13', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504012', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (15, '管理员', '', 'admin14', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504013', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (16, '管理员', '', 'admin15', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504014', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (17, '管理员', '', 'admin16', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504015', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (18, '管理员', '', 'admin17', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504016', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (19, '管理员', '', 'admin18', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504017', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (20, '管理员', '', 'admin19', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504018', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (21, '管理员', '', 'admin20', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504019', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (22, '管理员', '', 'admin21', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504020', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (23, '管理员', '', 'admin22', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504021', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (24, '管理员', '', 'admin23', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504022', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (25, '管理员', '', 'admin24', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504023', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (26, '管理员', '', 'admin25', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504024', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (27, '管理员', '', 'admin26', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504025', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (28, '管理员', '', 'admin27', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504026', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (29, '管理员', '', 'admin28', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504027', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (30, '管理员', '', 'admin29', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504028', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (31, '管理员', '', 'admin30', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504029', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (32, '管理员', '', 'admin31', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504030', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (33, '管理员', '', 'admin32', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504031', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (34, '管理员', '', 'admin33', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504032', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (35, '管理员', '', 'admin34', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504033', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (36, '管理员', '', 'admin35', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504034', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (37, '管理员', '', 'admin36', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504035', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (38, '管理员', '', 'admin37', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504036', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (39, '管理员', '', 'admin38', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504037', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (40, '管理员', '', 'admin39', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504038', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (41, '管理员', '', 'admin40', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504039', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (42, '管理员', '', 'admin41', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504040', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (43, '管理员', '', 'admin42', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504041', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (44, '管理员', '', 'admin43', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504042', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (45, '管理员', '', 'admin44', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504043', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (46, '管理员', '', 'admin45', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504044', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (47, '管理员', '', 'admin46', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504045', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (48, '管理员', '', 'admin47', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504046', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (49, '管理员', '', 'admin48', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504047', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (50, '管理员', '', 'admin49', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504048', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (51, '管理员', '', 'admin50', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504049', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (52, '管理员', '', 'admin51', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504050', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (53, '管理员', '', 'admin52', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504051', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (54, '管理员', '', 'admin53', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504052', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (55, '管理员', '', 'admin54', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504053', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (56, '管理员', '', 'admin55', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504054', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (57, '管理员', '', 'admin56', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504055', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (58, '管理员', '', 'admin57', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504056', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (59, '管理员', '', 'admin58', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504057', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (60, '管理员', '', 'admin59', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504058', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (61, '管理员', '', 'admin60', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504059', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (62, '管理员', '', 'admin61', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504060', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (63, '管理员', '', 'admin62', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504061', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (64, '管理员', '', 'admin63', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504062', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (65, '管理员', '', 'admin64', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504063', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (66, '管理员', '', 'admin65', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504064', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (67, '管理员', '', 'admin66', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504065', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (68, '管理员', '', 'admin67', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504066', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (69, '管理员', '', 'admin68', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504067', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (70, '管理员', '', 'admin69', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504068', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (71, '管理员', '', 'admin70', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504069', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (72, '管理员', '', 'admin71', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504070', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (73, '管理员', '', 'admin72', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504071', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (74, '管理员', '', 'admin73', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504072', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (75, '管理员', '', 'admin74', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504073', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (76, '管理员', '', 'admin75', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504074', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (77, '管理员', '', 'admin76', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504075', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (78, '管理员', '', 'admin77', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504076', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (79, '管理员', '', 'admin78', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504077', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (80, '管理员', '', 'admin79', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504078', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (81, '管理员', '', 'admin80', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504079', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (82, '管理员', '', 'admin81', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504080', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (83, '管理员', '', 'admin82', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504081', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (84, '管理员', '', 'admin83', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504082', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (85, '管理员', '', 'admin84', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504083', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (86, '管理员', '', 'admin85', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504084', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (87, '管理员', '', 'admin86', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504085', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (88, '管理员', '', 'admin87', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504086', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (89, '管理员', '', 'admin88', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504087', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (90, '管理员', '', 'admin89', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504088', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (91, '管理员', '', 'admin90', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504089', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (92, '管理员', '', 'admin91', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504090', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1592666366, 1);
INSERT INTO `think_admin` VALUES (93, '管理员', '', 'admin92', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504091', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (94, '管理员', '', 'admin93', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504092', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (95, '管理员', '', 'admin94', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504093', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (96, '管理员', '', 'admin95', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504094', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (97, '管理员', '', 'admin96', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504095', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (98, '管理员', '', 'admin97', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504096', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1590265227, 1);
INSERT INTO `think_admin` VALUES (99, '管理员', '', 'admin98', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504097', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1593353190, 1);
INSERT INTO `think_admin` VALUES (100, '管理员', '', 'admin99', '99526fac85ce02f5ba23d3688ef15c63', '', 2, '1', 1, 11, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504098', '1175401194@qq.com', '320821198902452789', 1, 0, 1557331200, 1387, 1388, 1391, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1591608487, 1);
INSERT INTO `think_admin` VALUES (101, '管理员', '相约在冬季', 'admin100', '9b6893cac1587222921391be0012311b', '', 2, '2', 1, 12, '/images/admin/20200717/a7f257309f9eb336848.jpg', '15295504099', '1175401194@qq.com', '320821198902452789', 1, 0, 1594915200, 0, 0, 0, '江苏省 南京市 建邺区', '江苏省南京市江宁区东吉大道1号江苏软件园', 1, '', '', '暂无', 1, 125, 3185, '116.7.248.2', 1555933830, 1531969440, 1594973436, 1);

-- ----------------------------
-- Table structure for think_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `think_admin_log`;
CREATE TABLE `think_admin_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作URL',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志标题',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志详情',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `city_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属地',
  `add_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '创建人ID',
  `add_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `mark` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '有效标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_admin_org
-- ----------------------------
DROP TABLE IF EXISTS `think_admin_org`;
CREATE TABLE `think_admin_org`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织机构全称',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构简称',
  `logo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构LOGO',
  `contact` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传真',
  `tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构电话',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `province_id` smallint(6) UNSIGNED NULL DEFAULT 0 COMMENT '省份ID',
  `city_id` smallint(6) UNSIGNED NULL DEFAULT 0 COMMENT '市区ID',
  `district_id` smallint(6) UNSIGNED NULL DEFAULT 0 COMMENT '区县ID',
  `zip_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `auth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '角色权限的序列化信息',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '排序',
  `create_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_admin_org
-- ----------------------------
INSERT INTO `think_admin_org` VALUES (1, 0, '阿里巴巴网络技术有限公司', '阿里巴巴', '/admin_org/20190507//bdb32f449640b673466.jpg', '相约在冬季', '025-85985715', '15295504151', 'yunduopu@126.com', 1368, 1369, 1375, '223304', '江苏省南京市建邺区奥体大街168号嘉业国际城03幢1101室', NULL, 125, 1, 1532395067, 1, 1557239340, 0);
INSERT INTO `think_admin_org` VALUES (2, 0, '第一大队', '243', '', '432432', '432432', '13888888888', '4342@qq.com', 3167, 3168, 3169, '3213', '321321', '', 21321, 1, 1582390434, 0, 0, 0);
INSERT INTO `think_admin_org` VALUES (3, 0, '经销商', '经销商', '', '经销商1', '经销商1', '13017393355', '779248613@qq.com', 0, 0, 0, '111', '111', '', 1, 1, 1582547262, 1, 1590496422, 0);
INSERT INTO `think_admin_org` VALUES (4, 0, '1112222', '11', '', '1111', '11111', '17621297654', '137@qq.com', 0, 0, 0, '123456', '111111111111', '', 1, 1, 1590569328, 1, 1590743184, 1);

-- ----------------------------
-- Table structure for think_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `think_admin_role`;
CREATE TABLE `think_admin_role`  (
  `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `admin_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '人员ID',
  `role_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
  `create_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人员角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_admin_role
-- ----------------------------
INSERT INTO `think_admin_role` VALUES (1, 1, 1, 1, 1531996231, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (2, 2, 2, 1, 1532754726, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (3, 1, 1, 1, 1540969873, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (4, 1, 1, 1, 1540969879, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (5, 1, 1, 1, 1540969883, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (6, 1, 2, 1, 1540969883, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (7, 1, 1, 1, 1540969887, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (8, 1, 1, 1, 1546996029, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (9, 1, 2, 1, 1546996029, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (10, 1, 1, 1, 1547090684, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (11, 1, 2, 1, 1547090684, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (12, 1, 1, 1, 1547305383, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (13, 1, 2, 1, 1547305383, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (14, 1, 1, 1, 1547619802, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (15, 1, 2, 1, 1547619802, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (16, 1, 1, 1, 1547652500, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (17, 1, 2, 1, 1547652500, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (18, 1, 1, 1, 1550022667, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (19, 1, 2, 1, 1550022667, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (20, 1, 1, 1, 1550817105, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (21, 1, 2, 1, 1550817105, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (22, 1, 1, 1, 1551168018, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (23, 1, 2, 1, 1551168018, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (24, 1, 1, 1, 1552302250, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (25, 1, 2, 1, 1552302250, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (26, 1, 1, 1, 1553236334, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (27, 1, 1, 0, 0, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (28, 1, 1, 0, 0, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (29, 1, 2, 0, 0, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (30, 1, 1, 0, 0, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (31, 1, 1, 1, 1561384853, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (32, 1, 23, 1, 1561384853, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (33, 1, 1, 1, 1561442270, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (34, 1, 23, 1, 1561442270, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (35, 1, 1, 1, 1561454033, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (36, 1, 1, 1, 1562050969, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (37, 3, 1, 1, 1563346856, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (38, 3, 24, 1, 1563346856, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (39, 3, 26, 1, 1563346856, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (40, 3, 1, 1, 1563347667, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (41, 3, 24, 1, 1563347667, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (42, 3, 26, 1, 1563347667, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (43, 2, 1, 1, 1563688747, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (44, 2, 24, 1, 1563688747, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (45, 2, 1, 1, 1563787171, 0, 0, 1);
INSERT INTO `think_admin_role` VALUES (46, 2, 24, 1, 1563787171, 0, 0, 1);
INSERT INTO `think_admin_role` VALUES (47, 2, 26, 1, 1563787171, 0, 0, 1);
INSERT INTO `think_admin_role` VALUES (48, 2, 27, 1, 1563787171, 0, 0, 1);
INSERT INTO `think_admin_role` VALUES (49, 3, 1, 1, 1567065186, 0, 0, 1);
INSERT INTO `think_admin_role` VALUES (50, 3, 24, 1, 1567065186, 0, 0, 1);
INSERT INTO `think_admin_role` VALUES (51, 3, 26, 1, 1567065186, 0, 0, 1);
INSERT INTO `think_admin_role` VALUES (52, 3, 28, 1, 1567065186, 0, 0, 1);
INSERT INTO `think_admin_role` VALUES (53, 1, 1, 1, 1568260375, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (54, 1, 24, 1, 1568260375, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (55, 1, 26, 1, 1568260375, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (56, 1, 27, 1, 1568260375, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (57, 1, 28, 1, 1568260375, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (58, 1, 1, 1, 1569567623, 0, 0, 0);
INSERT INTO `think_admin_role` VALUES (59, 1, 1, 1, 1574911159, 0, 0, 1);

-- ----------------------------
-- Table structure for think_admin_rom
-- ----------------------------
DROP TABLE IF EXISTS `think_admin_rom`;
CREATE TABLE `think_admin_rom`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '类型：1角色 2用户',
  `type_id` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT 'type对应的值',
  `menu_id` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '菜单ID',
  `create_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单人员关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_admin_rom
-- ----------------------------
INSERT INTO `think_admin_rom` VALUES (1, 1, 1, 1, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (2, 1, 1, 5, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (3, 1, 1, 6, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (4, 1, 1, 7, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (5, 1, 1, 8, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (6, 1, 1, 9, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (7, 1, 1, 10, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (8, 1, 1, 11, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (9, 1, 1, 12, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (10, 1, 1, 13, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (11, 1, 1, 14, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (12, 1, 1, 15, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (13, 1, 1, 16, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (14, 1, 1, 17, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (15, 1, 1, 18, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (16, 1, 1, 19, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (17, 1, 1, 20, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (18, 1, 1, 21, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (19, 1, 1, 22, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (20, 1, 1, 23, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (21, 1, 1, 24, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (22, 1, 1, 25, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (23, 1, 1, 26, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (24, 1, 1, 27, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (25, 1, 1, 28, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (26, 1, 1, 29, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (27, 1, 1, 30, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (28, 1, 1, 31, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (29, 1, 1, 32, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (30, 1, 1, 33, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (31, 1, 1, 34, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (32, 1, 1, 35, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (33, 1, 1, 36, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (34, 1, 1, 37, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (35, 1, 1, 38, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (36, 1, 1, 39, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (37, 1, 1, 40, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (38, 1, 1, 41, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (39, 1, 1, 55, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (40, 1, 1, 56, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (41, 1, 1, 57, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (42, 1, 1, 58, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (43, 1, 1, 59, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (44, 1, 1, 60, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (45, 1, 1, 61, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (46, 1, 1, 62, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (47, 1, 1, 63, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (48, 1, 1, 64, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (49, 1, 1, 65, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (50, 1, 1, 66, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (51, 1, 1, 67, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (52, 1, 1, 68, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (53, 1, 1, 69, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (54, 1, 1, 70, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (55, 1, 1, 71, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (56, 1, 1, 72, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (57, 1, 1, 73, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (58, 1, 1, 74, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (59, 1, 1, 75, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (60, 1, 1, 76, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (61, 1, 1, 77, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (62, 1, 1, 78, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (63, 1, 1, 79, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (64, 1, 1, 80, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (65, 1, 1, 81, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (66, 1, 1, 82, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (67, 1, 1, 83, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (68, 1, 1, 84, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (69, 1, 1, 85, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (70, 1, 1, 86, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (71, 1, 1, 87, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (72, 1, 1, 88, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (73, 1, 1, 89, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (74, 1, 1, 90, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (75, 1, 1, 91, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (76, 1, 1, 92, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (77, 1, 1, 93, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (78, 1, 1, 94, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (79, 1, 1, 95, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (80, 1, 1, 96, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (81, 1, 1, 97, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (82, 1, 1, 98, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (83, 1, 1, 99, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (84, 1, 1, 100, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (85, 1, 1, 101, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (86, 1, 1, 102, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (87, 1, 1, 103, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (88, 1, 1, 104, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (89, 1, 1, 105, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (90, 1, 1, 106, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (91, 1, 1, 107, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (92, 1, 1, 108, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (93, 1, 1, 109, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (94, 1, 1, 110, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (95, 1, 1, 111, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (96, 1, 1, 112, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (97, 1, 1, 113, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (98, 1, 1, 114, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (99, 1, 1, 115, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (100, 1, 1, 116, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (101, 1, 1, 117, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (102, 1, 1, 118, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (103, 1, 1, 119, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (104, 1, 1, 120, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (105, 1, 1, 121, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (106, 1, 1, 122, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (107, 1, 1, 123, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (108, 1, 1, 124, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (109, 1, 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (110, 1, 1, 126, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (111, 1, 1, 127, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (112, 1, 1, 128, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (113, 1, 1, 129, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (114, 1, 1, 130, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (115, 1, 1, 131, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (116, 1, 1, 132, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (117, 1, 1, 133, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (118, 1, 1, 134, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (119, 1, 1, 135, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (120, 1, 1, 136, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (121, 1, 1, 157, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (122, 1, 1, 163, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (123, 1, 1, 164, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (124, 1, 1, 165, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (125, 1, 1, 166, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (126, 1, 1, 167, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (127, 1, 1, 168, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (128, 1, 1, 158, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (129, 1, 1, 159, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (130, 1, 1, 160, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (131, 1, 1, 161, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (132, 1, 1, 162, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (133, 1, 1, 2, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (134, 1, 1, 42, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (135, 1, 1, 43, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (136, 1, 1, 44, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (137, 1, 1, 45, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (138, 1, 1, 46, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (139, 1, 1, 47, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (140, 1, 1, 48, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (141, 1, 1, 49, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (142, 1, 1, 50, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (143, 1, 1, 51, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (144, 1, 1, 52, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (145, 1, 1, 53, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (146, 1, 1, 54, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (147, 1, 1, 150, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (148, 1, 1, 151, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (149, 1, 1, 152, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (150, 1, 1, 153, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (151, 1, 1, 154, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (152, 1, 1, 155, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (153, 1, 1, 156, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (154, 1, 1, 4, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (155, 1, 1, 137, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (156, 1, 1, 138, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (157, 1, 1, 139, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (158, 1, 1, 140, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (159, 1, 1, 141, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (160, 1, 1, 142, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (161, 1, 1, 143, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (162, 1, 1, 144, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (163, 1, 1, 145, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (164, 1, 1, 146, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (165, 1, 1, 147, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (166, 1, 1, 148, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (167, 1, 1, 149, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (168, 1, 2, 1, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (169, 1, 2, 5, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (170, 1, 2, 6, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (171, 1, 2, 7, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (172, 1, 2, 8, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (173, 1, 2, 9, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (174, 1, 2, 10, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (175, 1, 2, 11, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (176, 1, 2, 12, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (177, 1, 2, 13, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (178, 1, 2, 14, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (179, 1, 2, 15, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (180, 1, 2, 16, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (181, 1, 2, 17, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (182, 1, 2, 18, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (183, 1, 2, 19, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (184, 1, 2, 20, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (185, 1, 2, 21, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (186, 1, 2, 22, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (187, 1, 2, 23, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (188, 1, 2, 24, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (189, 1, 2, 25, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (190, 1, 2, 26, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (191, 1, 2, 27, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (192, 1, 2, 28, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (193, 1, 2, 29, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (194, 1, 2, 30, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (195, 1, 2, 31, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (196, 1, 2, 32, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (197, 1, 2, 33, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (198, 1, 2, 34, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (199, 1, 2, 35, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (200, 1, 2, 36, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (201, 1, 2, 37, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (202, 1, 2, 38, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (203, 1, 2, 39, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (204, 1, 2, 40, 1, 0, 0, 0, 1);
INSERT INTO `think_admin_rom` VALUES (205, 1, 2, 41, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_article
-- ----------------------------
DROP TABLE IF EXISTS `think_article`;
CREATE TABLE `think_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `cover` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '首张图片编号',
  `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标签',
  `item_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '站点ID',
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目ID',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示：1显示 2定时发布 3关闭',
  `post_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '定时发布时间',
  `is_top` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否置顶：1已置顶 2未置顶',
  `top_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '置顶时间',
  `view_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '状态：1已审核 2待审核 3审核失败',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE,
  INDEX `mark`(`mark`, `is_show`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_article
-- ----------------------------
INSERT INTO `think_article` VALUES (1, '北京女孩家里蹲11年，与社会完全脱节，却红到国外', '/images/article/20200717/9f28b19144a9f61e958.jpg', '', 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1594975632, 1);

-- ----------------------------
-- Table structure for think_article_0
-- ----------------------------
DROP TABLE IF EXISTS `think_article_0`;
CREATE TABLE `think_article_0`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_article_1
-- ----------------------------
DROP TABLE IF EXISTS `think_article_1`;
CREATE TABLE `think_article_1`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_article_1
-- ----------------------------
INSERT INTO `think_article_1` VALUES (1, NULL, NULL, NULL, '近来，台海局势紧绷。台湾《中国时报》评论指出，520之后，大陆军机到台海上空如同逛自家厨房，很明显，大陆应对民进党当局的策略又进到新阶段，在军事上，意图让两岸的“台海边界”模糊化，在政治上，则是一中清楚化，逐渐没有模糊空间。', 'a:5:{i:0;s:48:\"/images/article/20200717/8f4d0971fc2e0644566.jpg\";i:1;s:48:\"/images/article/20200717/0e91054a093765d9308.jpg\";i:2;s:48:\"/images/article/20200717/ba5a89f0785a34f0742.jpg\";i:3;s:48:\"/images/article/20200717/ffee1ca16f80537e748.jpg\";i:4;s:48:\"/images/article/20200717/969d7595f0d4eff1494.jpg\";}', '<p>\n	85后女孩殷越，\n</p>\n<p>\n	是一名纤维手作作者，\n</p>\n<p>\n	工作生活在北京。\n</p>\n<p>\n	大学毕业后，她没去读研、也没上班，\n</p>\n<p>\n	就宅在家里，每天戳戳戳，\n</p>\n<p>\n	至今已经11年了，\n</p>\n<p>\n	而前三年几乎零收入。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/7dd2222222fd9ca2923.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/e157c4b3de526f32819.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/cb939d98795ddb97202.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/4be8b4d9774e07e0669.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	殷越用纤维毛毡创作各种玩偶，\n</p>\n<p>\n	蘑菇小人、小猴子、乌鸦、星星月亮，\n</p>\n<p>\n	一个个都像童话世界里走出来的人物，\n</p>\n<p>\n	每一寸肌肤纹理清晰可见。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/d0cf98402cf63572581.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	这些作品受到了大人小孩，男女老少的追捧，\n</p>\n<p>\n	2016年在东京，\n</p>\n<p>\n	是第一个在日本举办个展的中国羊毛纤维手作作者；\n</p>\n<p>\n	2019年在国内展出时，甚至引发了抢购热潮，\n</p>\n<p>\n	很多人提前两天连夜排队。\n</p>\n<p>\n	对于害羞、腼腆的殷越来说，\n</p>\n<p>\n	“通过作品能让大家读懂，\n</p>\n<p>\n	比面对面交流还要开心一万倍。”\n</p>\n<p>\n	<strong>自述 殷越 编辑 陈稻稻</strong>\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/4559a442ab8d57be845.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/218a4fd5a47c3fcd691.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	1989年出生在江苏的殷越，是国内最早开始羊毛毡创作的作者之一。从早期的生动可爱的蘑菇小人，到这几年的大型毛毡雕塑作品，她的作品辨识度极高。毛毡创作的过程非常慢，用殷越的话说，都是“一针一针，用生命和热情戳出来的”。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/0741ea870f38a1b3379.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/4bbc45e9ce2ed2aa701.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/e071744a48a583a7211.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	三月中旬，一条在殷越北京的家里见到了她。她把其中一间房拿来做工作室，大面积的玻璃窗看得见风景，阳光充足。房间里堆满了制作毛毡的工具，还有大大小小的作品。疫情期间，一往如常地宅在家中，外界对她影响似乎不大。\n</p>\n<p>\n	<strong>以下是殷越的自述。</strong>\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/e2f8ae80e59ce3e7252.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	我在一个比较温暖的家庭环境里长大，小时候看各种动画片、漫画书，大学进入北京电影学院，也选了动画专业。\n</p>\n<p>\n	但开始学了后才发现，我对电脑三维技术完全不擅长。尤其跟当时的男朋友、现在的先生相比，感觉到巨大的差距，直接导致了信心崩溃，甚至决定放弃画画。当时很迷茫，不知道未来要干些什么。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/9be6e0910e2b2914160.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/d4c994c1f0d9f7cd380.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		日本手作作者铃木千晶的作品\n	</p>\n</div>\n<p>\n	毕业那年2009年，我第一次接触到毛毡，在网上看到日本职人铃木千晶的作品，对这种绒绒的材质十分喜欢，就开始查找资料、研究它的制作原理。\n</p>\n<p>\n	当时毛毡的材质在国内并不普及，花了好些功夫才在网上找了一家店，买一些比较粗糙的毛纱和工具，开始尝试着做。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/aff8ef80103b73e8498.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		殷越的第一个作品\n	</p>\n</div>\n<p>\n	先画了一个形象的草图，然后配置羊毛的颜色，花了大概一个下午的时间，做了一只小兔子。做完之后，特别有成就感，觉得自己太厉害了。迫不及待地给它做了小房子、拍了定妆照，放到人人网上去，收到很好的反馈。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/77f1c826a7dd2bfd878.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/757205a6c55c7d51794.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/faff1f59e28ee998643.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		早期动物作品\n	</p>\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/c740f881675664fe493.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		作品《等待爸爸和蜂蜜》\n	</p>\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/6775b9f88f84a865345.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		作品《去旅行》\n	</p>\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/170614e03e519d5a265.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		作品《纪念日》\n	</p>\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/bc002e9d7ebf5b9c777.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		作品《新的一天》\n	</p>\n</div>\n<p>\n	毛毡这种材质源于生命，用它做出来的作品带着温度，亲和可爱。之后我开始尝试各种风格的毛毡作品，很多小动物，充满童话感。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/16eb70c6963b3b38694.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/b2f452695135aea2615.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	<strong> 第一个系列作品：1:1的仿真蘑菇 </strong>\n</p>\n<p>\n	做《指尖造物》系列的想法是在2015年。当时去莫斯科旅行，住的周围就是一大片树林，秋末冬初会看到很多小蘑菇，特别兴奋。\n</p>\n<p>\n	我本身很爱吃蘑菇，觉得蘑菇是一种特别神奇的生物，它们总是默默地在角落里努力生长。看上去很脆弱、其实很坚强，这跟我的性格也很相似。于是就决定做一个蘑菇系列。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/bcf56d7f8fac4c27169.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/48fe0c6bcee74860549.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/640ede5e239da238287.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/79d0b1c617dc58b1769.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/aa62eba5ee0aeadd775.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	起初的想法很简单，就想制作一些看起来非常真实的蘑菇摆放在家里。用羊毛和其它纤维材质尽量去表现蘑菇的生命感，按1:1的比例，还原出真实的蘑菇，也算是对技术的一种挑战。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/d738ea242a0ed22f146.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/ac2e224a183b383b722.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		《蘑菇的逃离》\n	</p>\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/3a3e87fed6272252513.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		《蘑菇的诗》\n	</p>\n</div>\n<p>\n	仿真的蘑菇做多了之后，发现少了一些趣味。就开始把自己性格里比较调皮、害羞的部分加入作品里。就有了《蘑菇的逃离》和《蘑菇的诗》这两个小的系列，蘑菇开始长出身体和小腿。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/e9d1199a276ac547946.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	<strong> 办暂住证的经历成为灵感 </strong>\n</p>\n<p>\n	《想心事》这个作品正好记录了2018年办暂住证的一段经历。那段时间特别奔波、很没有归属感。在办证的路上，听了一段比较忧伤的旋律，所有情绪汇集成一个作品画面浮现在脑海，回家后马上用纸笔画出来。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/6d6ab386f4aeccd8731.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/bd5373c585968596576.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	做这个小象用的羊毛很软，花了很长的时间去雕刻细节，堆砌出这种褶皱的感觉。当时我就想挑战一下自己，打破既定印象里的可爱。\n</p>\n<p>\n	当时做完之后并不满意，把它仍在了一个角落。大约一周后，跳出负面情绪之后再去看它，才发现它跟自己之前做的作品很不一样。它的形象可能不会被喜欢，但我当时有种强烈的感受：想把它完成。比起去在意别人的想法，作品表达的感受回归自己内心是更重要的。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/d719567522105b54252.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/1c8d1a18090c89e9972.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/75de7286cec36163327.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	<strong>《白》系列 </strong>\n</p>\n<p>\n	<strong> 悲伤、敏感、脆弱都放到作品里 </strong>\n</p>\n<p>\n	2018年底，开始制作《白》系列的三件作品。当时家人生病了，经历了这些事之后，自己对整个生活有了新的感受，就想通过作品把当时的心情、状态，抒发出来。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/c42275cc32fdf0cd195.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	《象的怯懦》表现了当时的一种脆弱和无助。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/ebe38e02bc025987534.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	《猫的蜕变》是一种针扎、锋利的状态，也是想让自己更坚强一点。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/b59443a4536b8590585.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	《鹿的和平》算是自己经历了一些事情以后，蜕变成熟，也算是对自己未来的期待。\n</p>\n<p>\n	《指尖造物》和更早前的一些作品，可能更符合大家对手作的预期，比较有亲和力、可爱、萌萌的。随着自己的成长、整个人的状态的变化，作品也会跟着产生变化。可爱之外，把伴随自己的难过、悲伤、敏感、脆弱的情绪，都开始融入作品里。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/ec86062e7061bd02940.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	<strong> 日本展览，买家都是40岁以上的中老年男性 </strong>\n</p>\n<p>\n	我的第一次个展，其实是在日本。\n</p>\n<p>\n	2016年，通过朋友介绍，认识了一位日本的策展人，他看过我的作品之后，就问我：“愿不愿一起做一个展览。”\n</p>\n<p>\n	其实当时自己挺不自信的，非常忐忑，有很多疑惑，这些作品大家会喜欢吗，真的能卖出去吗？毕竟是在另一个国家。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/9d90df07ea42e6f9493.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	12月，展览就在东京代关山开幕了。因为可能地点在代关山，附近的观众年龄层偏大一些，在25岁到60岁之间。但有意思的是，最后买作品的买家，都是40岁上下的中老年男性。这跟我的预期很不一样，因为在国内喜欢我作品的都是女生偏多。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/e21647b81d941943658.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	记得买第一件作品的是一位爷爷，他是隔壁画廊的老板。在展览看了一圈后，他很喜欢一只猫的作品，就买下了。然后跟我说：“我觉得你很年轻，作品也做得很好，要支持一下。”听了之后，有一种被认可的感觉。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/a474963d1b4749f4900.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/9ce3d4328c2a4228624.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		2019年展览现场\n	</p>\n</div>\n<p>\n	2018年和2019年，在国内举办个展的时候，从来没想过，竟然出现了夜排的现象。2019年更夸张，有的人前提两天两夜就去会场的门口守着不走，开展的时候已很多人在排队。一百多件作品，几小时就全部售罄了。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/70ba6a1d7225b4bf640.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/acabeeb32904263d919.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	当时去看展的，大人小孩、男女老少都有。印象最深的是有一个90多岁的老奶奶，在孙女的推荐下，全家一起来了。奶奶的性格特别好，身体也很健康，走的时候还跟我开玩笑说，自己也是一个90后。\n</p>\n<p>\n	有一个女孩，她进展厅后也没看作品，直接走到我面前，她说：“我可以拥抱你一下吗？”都快哭了。我后来才知道原来她是看了我的作品后，也开始全职做手作。我的作品竟然影响到了别人的选择，心里非常感动，要更认真才行。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/64fa083ceaf872a9901.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	<strong> 每天工作12小时，前三年几乎零收入 </strong> \n</p>\n<p>\n	大学毕业的时候，可能很多年轻人跟我一样，并没有准备好进入社会。有些人选择考研，多读几年书；而我从兴趣出发，想着做手工，坚持一段时间试试。\n</p>\n<p>\n	前三年收入很微薄，惨呵呵的。因为大家不认识你的作品，自己很多时候也只是当兴趣，不觉得作品可以卖掉、可以谋生。后来认可度慢慢提高，有杂志的供稿、线下课程，收入才开始慢慢地增加。\n</p>\n<p>\n	我不是一个物欲特别强的人，开销也很少，有一定微薄的收入，就很开心。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/9708b2f70ed701e1674.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	手作不是大家以为的那个样子——每天轻轻松松在家，不用去上班，做一些自己想做的事情。如果真正把它当成职业，甚至比上班更辛苦。因为是给自己在干活，你会无情无尽地压榨自己。\n</p>\n<p>\n	备展期间，我每天工作12-16小时，趴在那里戳戳戳，很容易崩溃。制作羊毛毡需要耗费大量的时间、精力，作品都是一阵一阵的戳出来、用时间堆砌上去的。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/52869b05b7a333dd512.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/72a56b2d10226288989.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/1767044ef53354d9157.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<p>\n	步骤的话，我会先画一个稿子，然后按照稿子来塑形，有了基础形态后再做调整、细化。\n</p>\n<p>\n	整个过程很慢，如果今天偷懒了，之后一定要找时间把这一天的工作量补上去，不然作品就完不成了。所以在家上班其实更需要高度的自律。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/b2e5673d8a1630e0105.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n	<p class=\"pgc-img-caption\">\n		殷越和先生\n	</p>\n</div>\n<p>\n	中途有一段时间我特别想去上班。有一个朋友曾经找我，让我去她的美甲店当店长。我跟先生说了这件事后，他非常生气，让我跟朋友绝交。\n</p>\n<p>\n	在这漫长的过程里，我的先生其实是最支持我的人。最初当我自己都没有看到自己的才华时，他说我有，而且非常坚定；当我想放弃的时候，是他拿着小鞭子在旁边，“你可以的、你要前进”，一直这样鼓励我。\n</p>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/193bc448740bcb75332.gif\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<div class=\"pgc-img\">\n	<img src=\"[IMG_URL]/images/images/article/20200704/969f3f1ea56e1946656.jpg\" alt=\"北京女孩家里蹲11年，与社会完全脱节，却红到国外\" />\n</div>\n<br />', NULL);

-- ----------------------------
-- Table structure for think_article_2
-- ----------------------------
DROP TABLE IF EXISTS `think_article_2`;
CREATE TABLE `think_article_2`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_article_3
-- ----------------------------
DROP TABLE IF EXISTS `think_article_3`;
CREATE TABLE `think_article_3`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_article_4
-- ----------------------------
DROP TABLE IF EXISTS `think_article_4`;
CREATE TABLE `think_article_4`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_article_5
-- ----------------------------
DROP TABLE IF EXISTS `think_article_5`;
CREATE TABLE `think_article_5`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_article_6
-- ----------------------------
DROP TABLE IF EXISTS `think_article_6`;
CREATE TABLE `think_article_6`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_article_7
-- ----------------------------
DROP TABLE IF EXISTS `think_article_7`;
CREATE TABLE `think_article_7`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_article_8
-- ----------------------------
DROP TABLE IF EXISTS `think_article_8`;
CREATE TABLE `think_article_8`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_article_9
-- ----------------------------
DROP TABLE IF EXISTS `think_article_9`;
CREATE TABLE `think_article_9`  (
  `id` int(11) UNSIGNED NOT NULL COMMENT '唯一性标识',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `source_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源名称',
  `source_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `guide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章导读',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '关键词序列化',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章管理附表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for think_city
-- ----------------------------
DROP TABLE IF EXISTS `think_city`;
CREATE TABLE `think_city`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级编号',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '城市级别（1省；2市；3区；）',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市名称',
  `citycode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市编号（区号）',
  `p_adcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '父级地理编号',
  `adcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地理编号',
  `lng` int(11) UNSIGNED NOT NULL COMMENT '城市坐标中心点经度（* 1e6）：如果是中国，此值是 1e7',
  `lat` int(11) UNSIGNED NOT NULL COMMENT '城市坐标中心点纬度（* 1e6）',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 125 COMMENT '排序号',
  `create_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识（1正常 0删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3884 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '高德城市表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_city
-- ----------------------------
INSERT INTO `think_city` VALUES (1, 0, 0, '中华人民共和国', '', '', '100000', 1163683244, 39915085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (575, 1, 1, '北京市', '010', '100000', '110000', 116405285, 39904989, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (576, 575, 2, '北京市市辖区', '010', '110000', '110100', 116405285, 39904989, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (577, 576, 3, '东城区', '010', '110100', '110101', 116418757, 39917544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (578, 576, 3, '西城区', '010', '110100', '110102', 116366794, 39915309, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (579, 576, 3, '朝阳区', '010', '110100', '110105', 116486409, 39921489, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (580, 576, 3, '丰台区', '010', '110100', '110106', 116286968, 39863642, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (581, 576, 3, '石景山区', '010', '110100', '110107', 116195445, 39914601, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (582, 576, 3, '海淀区', '010', '110100', '110108', 116310316, 39956074, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (583, 576, 3, '门头沟区', '010', '110100', '110109', 116105381, 39937183, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (584, 576, 3, '房山区', '010', '110100', '110111', 116139157, 39735535, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (585, 576, 3, '通州区', '010', '110100', '110112', 116658603, 39902486, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (586, 576, 3, '顺义区', '010', '110100', '110113', 116653525, 40128936, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (587, 576, 3, '昌平区', '010', '110100', '110114', 116235906, 40218085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (588, 576, 3, '大兴区', '010', '110100', '110115', 116338033, 39728908, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (589, 576, 3, '怀柔区', '010', '110100', '110116', 116637122, 40324272, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (590, 576, 3, '平谷区', '010', '110100', '110117', 117112335, 40144783, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (591, 576, 3, '密云区', '010', '110100', '110118', 116843352, 40377362, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (592, 576, 3, '延庆区', '010', '110100', '110119', 115985006, 40465325, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (593, 1, 1, '天津市', '022', '100000', '120000', 117190182, 39125596, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (594, 593, 2, '天津市市辖区', '022', '120000', '120100', 117190182, 39125596, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (595, 594, 3, '和平区', '022', '120100', '120101', 117195907, 39118327, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (596, 594, 3, '河东区', '022', '120100', '120102', 117226568, 39122125, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (597, 594, 3, '河西区', '022', '120100', '120103', 117217536, 39101897, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (598, 594, 3, '南开区', '022', '120100', '120104', 117164143, 39120474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (599, 594, 3, '河北区', '022', '120100', '120105', 117201569, 39156632, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (600, 594, 3, '红桥区', '022', '120100', '120106', 117163301, 39175066, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (601, 594, 3, '东丽区', '022', '120100', '120110', 117313967, 39087764, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (602, 594, 3, '西青区', '022', '120100', '120111', 117012247, 39139446, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (603, 594, 3, '津南区', '022', '120100', '120112', 117382549, 38989577, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (604, 594, 3, '北辰区', '022', '120100', '120113', 117134820, 39225555, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (605, 594, 3, '武清区', '022', '120100', '120114', 117057959, 39376925, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (606, 594, 3, '宝坻区', '022', '120100', '120115', 117308094, 39716965, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (607, 594, 3, '滨海新区', '022', '120100', '120116', 117654173, 39032846, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (608, 594, 3, '宁河区', '022', '120100', '120117', 117828280, 39328886, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (609, 594, 3, '静海区', '022', '120100', '120118', 116925304, 38935671, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (610, 594, 3, '蓟县', '022', '120100', '120225', 117407449, 40045342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (611, 593, 2, '天津市郊县', '022', '120000', '120200', 117824898, 39330613, 125, 0, 0, 0, 0, 0);
INSERT INTO `think_city` VALUES (612, 1, 1, '河北省', '', '100000', '130000', 114502461, 38045474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (613, 612, 2, '石家庄市', '0311', '130000', '130100', 114502461, 38045474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (614, 613, 3, '长安区', '0311', '130100', '130102', 114548151, 38047501, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (615, 613, 3, '桥西区', '0311', '130100', '130104', 114462931, 38028383, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (616, 613, 3, '新华区', '0311', '130100', '130105', 114465974, 38067142, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (617, 613, 3, '井陉矿区', '0311', '130100', '130107', 114058178, 38069748, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (618, 613, 3, '裕华区', '0311', '130100', '130108', 114533257, 38027696, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (619, 613, 3, '藁城区', '0311', '130100', '130109', 114849647, 38033767, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (620, 613, 3, '鹿泉区', '0311', '130100', '130110', 114321023, 38093994, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (621, 613, 3, '栾城区', '0311', '130100', '130111', 114654281, 37886911, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (622, 613, 3, '井陉县', '0311', '130100', '130121', 114144488, 38033614, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (623, 613, 3, '正定县', '0311', '130100', '130123', 114569887, 38147835, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (624, 613, 3, '行唐县', '0311', '130100', '130125', 114552734, 38437422, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (625, 613, 3, '灵寿县', '0311', '130100', '130126', 114379460, 38306546, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (626, 613, 3, '高邑县', '0311', '130100', '130127', 114610699, 37605714, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (627, 613, 3, '深泽县', '0311', '130100', '130128', 115200207, 38184540, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (628, 613, 3, '赞皇县', '0311', '130100', '130129', 114387756, 37660199, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (629, 613, 3, '无极县', '0311', '130100', '130130', 114977845, 38176376, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (630, 613, 3, '平山县', '0311', '130100', '130131', 114184144, 38259311, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (631, 613, 3, '元氏县', '0311', '130100', '130132', 114526180, 37762514, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (632, 613, 3, '赵县', '0311', '130100', '130133', 114775362, 37754341, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (633, 613, 3, '辛集市', '0311', '130100', '130181', 115217451, 37929040, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (634, 613, 3, '晋州市', '0311', '130100', '130183', 115044886, 38027478, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (635, 613, 3, '新乐市', '0311', '130100', '130184', 114685780, 38344768, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (636, 612, 2, '唐山市', '0315', '130000', '130200', 118175393, 39635113, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (637, 636, 3, '路南区', '0315', '130200', '130202', 118210821, 39615162, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (638, 636, 3, '路北区', '0315', '130200', '130203', 118174736, 39628538, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (639, 636, 3, '古冶区', '0315', '130200', '130204', 118454290, 39715736, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (640, 636, 3, '开平区', '0315', '130200', '130205', 118264425, 39676171, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (641, 636, 3, '丰南区', '0315', '130200', '130207', 118110793, 39563030, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (642, 636, 3, '丰润区', '0315', '130200', '130208', 118155779, 39831363, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (643, 636, 3, '曹妃甸区', '0315', '130200', '130209', 118446585, 39278277, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (644, 636, 3, '滦县', '0315', '130200', '130223', 118699547, 39744851, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (645, 636, 3, '滦南县', '0315', '130200', '130224', 118681552, 39506201, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (646, 636, 3, '乐亭县', '0315', '130200', '130225', 118905341, 39428130, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (647, 636, 3, '迁西县', '0315', '130200', '130227', 118305139, 40146238, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (648, 636, 3, '玉田县', '0315', '130200', '130229', 117753665, 39887323, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (649, 636, 3, '遵化市', '0315', '130200', '130281', 117965875, 40188616, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (650, 636, 3, '迁安市', '0315', '130200', '130283', 118701933, 40012108, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (651, 612, 2, '秦皇岛市', '0335', '130000', '130300', 119586579, 39942531, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (652, 651, 3, '海港区', '0335', '130300', '130302', 119596224, 39943458, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (653, 651, 3, '山海关区', '0335', '130300', '130303', 119753591, 39998023, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (654, 651, 3, '北戴河区', '0335', '130300', '130304', 119486286, 39825121, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (655, 651, 3, '青龙满族自治县', '0335', '130300', '130321', 118954555, 40406023, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (656, 651, 3, '昌黎县', '0335', '130300', '130322', 119164541, 39709729, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (657, 651, 3, '抚宁区', '0335', '130300', '130306', 119240651, 39887053, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (658, 651, 3, '卢龙县', '0335', '130300', '130324', 118881809, 39891639, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (659, 612, 2, '邯郸市', '0310', '130000', '130400', 114490686, 36612273, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (660, 659, 3, '邯山区', '0310', '130400', '130402', 114484989, 36603196, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (661, 659, 3, '丛台区', '0310', '130400', '130403', 114494703, 36611082, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (662, 659, 3, '复兴区', '0310', '130400', '130404', 114458242, 36615484, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (663, 659, 3, '峰峰矿区', '0310', '130400', '130406', 114209936, 36420487, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (664, 659, 3, '邯郸县', '0310', '130400', '130421', 114531083, 36593905, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (665, 659, 3, '临漳县', '0310', '130400', '130423', 114610703, 36337604, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (666, 659, 3, '成安县', '0310', '130400', '130424', 114680356, 36443832, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (667, 659, 3, '大名县', '0310', '130400', '130425', 115152586, 36283316, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (668, 659, 3, '涉县', '0310', '130400', '130426', 113673297, 36563143, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (669, 659, 3, '磁县', '0310', '130400', '130427', 114382080, 36367673, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (670, 659, 3, '肥乡县', '0310', '130400', '130428', 114805154, 36555778, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (671, 659, 3, '永年县', '0310', '130400', '130429', 114496162, 36776413, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (672, 659, 3, '邱县', '0310', '130400', '130430', 115168584, 36813250, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (673, 659, 3, '鸡泽县', '0310', '130400', '130431', 114878517, 36914908, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (674, 659, 3, '广平县', '0310', '130400', '130432', 114950859, 36483603, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (675, 659, 3, '馆陶县', '0310', '130400', '130433', 115289057, 36539461, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (676, 659, 3, '魏县', '0310', '130400', '130434', 114934110, 36354248, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (677, 659, 3, '曲周县', '0310', '130400', '130435', 114957588, 36773398, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (678, 659, 3, '武安市', '0310', '130400', '130481', 114194581, 36696115, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (679, 612, 2, '邢台市', '0319', '130000', '130500', 114508851, 37068200, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (680, 679, 3, '桥东区', '0319', '130500', '130502', 114507131, 37064125, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (681, 679, 3, '桥西区', '0319', '130500', '130503', 114473687, 37068009, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (682, 679, 3, '邢台县', '0319', '130500', '130521', 114561132, 37050730, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (683, 679, 3, '临城县', '0319', '130500', '130522', 114506873, 37444009, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (684, 679, 3, '内丘县', '0319', '130500', '130523', 114511523, 37287663, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (685, 679, 3, '柏乡县', '0319', '130500', '130524', 114693382, 37483596, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (686, 679, 3, '隆尧县', '0319', '130500', '130525', 114776348, 37350925, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (687, 679, 3, '任县', '0319', '130500', '130526', 114684469, 37129952, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (688, 679, 3, '南和县', '0319', '130500', '130527', 114691377, 37003812, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (689, 679, 3, '宁晋县', '0319', '130500', '130528', 114921027, 37618956, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (690, 679, 3, '巨鹿县', '0319', '130500', '130529', 115038782, 37217680, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (691, 679, 3, '新河县', '0319', '130500', '130530', 115247537, 37526216, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (692, 679, 3, '广宗县', '0319', '130500', '130531', 115142797, 37075548, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (693, 679, 3, '平乡县', '0319', '130500', '130532', 115029218, 37069404, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (694, 679, 3, '威县', '0319', '130500', '130533', 115272749, 36983272, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (695, 679, 3, '清河县', '0319', '130500', '130534', 115668999, 37059991, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (696, 679, 3, '临西县', '0319', '130500', '130535', 115498684, 36864200, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (697, 679, 3, '南宫市', '0319', '130500', '130581', 115398102, 37359668, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (698, 679, 3, '沙河市', '0319', '130500', '130582', 114504902, 36861903, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (699, 612, 2, '保定市', '0312', '130000', '130600', 115482331, 38867657, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (700, 699, 3, '竞秀区', '0312', '130600', '130602', 115470659, 38886620, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (701, 699, 3, '莲池区', '0312', '130600', '130606', 115500934, 38865005, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (702, 699, 3, '满城区', '0312', '130600', '130607', 115324420, 38951380, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (703, 699, 3, '清苑区', '0312', '130600', '130608', 115492221, 38771012, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (704, 699, 3, '涞水县', '0312', '130600', '130623', 115711985, 39393148, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (705, 699, 3, '阜平县', '0312', '130600', '130624', 114198801, 38847276, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (706, 699, 3, '徐水区', '0312', '130600', '130609', 115649410, 39020395, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (707, 699, 3, '定兴县', '0312', '130600', '130626', 115796895, 39266195, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (708, 699, 3, '唐县', '0312', '130600', '130627', 114981241, 38748542, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (709, 699, 3, '高阳县', '0312', '130600', '130628', 115778878, 38690092, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (710, 699, 3, '容城县', '0312', '130600', '130629', 115866247, 39052820, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (711, 699, 3, '涞源县', '0312', '130600', '130630', 114692567, 39357550, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (712, 699, 3, '望都县', '0312', '130600', '130631', 115154009, 38707448, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (713, 699, 3, '安新县', '0312', '130600', '130632', 115931979, 38929912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (714, 699, 3, '易县', '0312', '130600', '130633', 115501146, 39352970, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (715, 699, 3, '曲阳县', '0312', '130600', '130634', 114704055, 38619992, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (716, 699, 3, '蠡县', '0312', '130600', '130635', 115583631, 38496429, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (717, 699, 3, '顺平县', '0312', '130600', '130636', 115132749, 38845127, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (718, 699, 3, '博野县', '0312', '130600', '130637', 115461798, 38458271, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (719, 699, 3, '雄县', '0312', '130600', '130638', 116107474, 38990819, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (720, 699, 3, '涿州市', '0312', '130600', '130681', 115973409, 39485765, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (721, 699, 3, '定州市', '0312', '130600', '130682', 114991389, 38517602, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (722, 699, 3, '安国市', '0312', '130600', '130683', 115331410, 38421367, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (723, 699, 3, '高碑店市', '0312', '130600', '130684', 115882704, 39327689, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (724, 612, 2, '张家口市', '0313', '130000', '130700', 114884091, 40811901, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (725, 724, 3, '桥东区', '0313', '130700', '130702', 114885658, 40813875, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (726, 724, 3, '桥西区', '0313', '130700', '130703', 114882127, 40824385, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (727, 724, 3, '宣化区', '0313', '130700', '130705', 115063200, 40609368, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (728, 724, 3, '下花园区', '0313', '130700', '130706', 115281002, 40488645, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (729, 724, 3, '张北县', '0313', '130700', '130722', 114715951, 41151713, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (730, 724, 3, '康保县', '0313', '130700', '130723', 114615809, 41850046, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (731, 724, 3, '沽源县', '0313', '130700', '130724', 115684836, 41667419, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (732, 724, 3, '尚义县', '0313', '130700', '130725', 113977713, 41080091, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (733, 724, 3, '蔚县', '0313', '130700', '130726', 114582695, 39837181, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (734, 724, 3, '阳原县', '0313', '130700', '130727', 114167343, 40113419, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (735, 724, 3, '怀安县', '0313', '130700', '130728', 114422364, 40671274, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (736, 724, 3, '万全区', '0313', '130700', '130729', 114736131, 40765136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (737, 724, 3, '怀来县', '0313', '130700', '130730', 115520846, 40405405, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (738, 724, 3, '涿鹿县', '0313', '130700', '130731', 115219246, 40378701, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (739, 724, 3, '赤城县', '0313', '130700', '130732', 115832708, 40912081, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (740, 724, 3, '崇礼区', '0313', '130700', '130733', 115281652, 40971302, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (741, 612, 2, '承德市', '0314', '130000', '130800', 117939152, 40976204, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (742, 741, 3, '双桥区', '0314', '130800', '130802', 117939152, 40976204, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (743, 741, 3, '双滦区', '0314', '130800', '130803', 117797485, 40959756, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (744, 741, 3, '鹰手营子矿区', '0314', '130800', '130804', 117661154, 40546956, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (745, 741, 3, '承德县', '0314', '130800', '130821', 118172496, 40768637, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (746, 741, 3, '兴隆县', '0314', '130800', '130822', 117507098, 40418525, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (747, 741, 3, '平泉县', '0314', '130800', '130823', 118690238, 41005610, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (748, 741, 3, '滦平县', '0314', '130800', '130824', 117337124, 40936644, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (749, 741, 3, '隆化县', '0314', '130800', '130825', 117736343, 41316667, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (750, 741, 3, '丰宁满族自治县', '0314', '130800', '130826', 116651210, 41209903, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (751, 741, 3, '宽城满族自治县', '0314', '130800', '130827', 118488642, 40607981, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (752, 741, 3, '围场满族蒙古族自治县', '0314', '130800', '130828', 117764086, 41949404, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (753, 612, 2, '沧州市', '0317', '130000', '130900', 116857461, 38310582, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (754, 753, 3, '新华区', '0317', '130900', '130902', 116873049, 38308273, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (755, 753, 3, '运河区', '0317', '130900', '130903', 116840063, 38307405, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (756, 753, 3, '沧县', '0317', '130900', '130921', 117007478, 38219856, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (757, 753, 3, '青县', '0317', '130900', '130922', 116838384, 38569646, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (758, 753, 3, '东光县', '0317', '130900', '130923', 116542062, 37886550, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (759, 753, 3, '海兴县', '0317', '130900', '130924', 117496606, 38141582, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (760, 753, 3, '盐山县', '0317', '130900', '130925', 117229814, 38056141, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (761, 753, 3, '肃宁县', '0317', '130900', '130926', 115835856, 38427102, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (762, 753, 3, '南皮县', '0317', '130900', '130927', 116709171, 38042439, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (763, 753, 3, '吴桥县', '0317', '130900', '130928', 116391512, 37628182, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (764, 753, 3, '献县', '0317', '130900', '130929', 116123844, 38189661, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (765, 753, 3, '孟村回族自治县', '0317', '130900', '130930', 117105104, 38057953, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (766, 753, 3, '泊头市', '0317', '130900', '130981', 116570163, 38073479, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (767, 753, 3, '任丘市', '0317', '130900', '130982', 116106764, 38706513, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (768, 753, 3, '黄骅市', '0317', '130900', '130983', 117343803, 38369238, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (769, 753, 3, '河间市', '0317', '130900', '130984', 116089452, 38441490, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (770, 612, 2, '廊坊市', '0316', '130000', '131000', 116704441, 39523927, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (771, 770, 3, '安次区', '0316', '131000', '131002', 116694544, 39502569, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (772, 770, 3, '广阳区', '0316', '131000', '131003', 116713708, 39521931, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (773, 770, 3, '固安县', '0316', '131000', '131022', 116299894, 39436468, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (774, 770, 3, '永清县', '0316', '131000', '131023', 116498089, 39319717, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (775, 770, 3, '香河县', '0316', '131000', '131024', 117007161, 39757212, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (776, 770, 3, '大城县', '0316', '131000', '131025', 116640735, 38699215, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (777, 770, 3, '文安县', '0316', '131000', '131026', 116460107, 38866801, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (778, 770, 3, '大厂回族自治县', '0316', '131000', '131028', 116986501, 39889266, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (779, 770, 3, '霸州市', '0316', '131000', '131081', 116392021, 39117331, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (780, 770, 3, '三河市', '0316', '131000', '131082', 117077018, 39982778, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (781, 612, 2, '衡水市', '0318', '130000', '131100', 115665993, 37735097, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (782, 781, 3, '桃城区', '0318', '131100', '131102', 115694945, 37732237, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (783, 781, 3, '枣强县', '0318', '131100', '131121', 115726499, 37511512, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (784, 781, 3, '武邑县', '0318', '131100', '131122', 115892415, 37803774, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (785, 781, 3, '武强县', '0318', '131100', '131123', 115970236, 38036980, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (786, 781, 3, '饶阳县', '0318', '131100', '131124', 115726577, 38232671, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (787, 781, 3, '安平县', '0318', '131100', '131125', 115519627, 38233511, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (788, 781, 3, '故城县', '0318', '131100', '131126', 115966747, 37350981, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (789, 781, 3, '景县', '0318', '131100', '131127', 116258446, 37686622, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (790, 781, 3, '阜城县', '0318', '131100', '131128', 116164727, 37869945, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (791, 781, 3, '冀州市', '0318', '131100', '131181', 115579173, 37542788, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (792, 781, 3, '深州市', '0318', '131100', '131182', 115554596, 38003470, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (793, 1, 1, '山西省', '', '100000', '140000', 112549248, 37857014, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (794, 793, 2, '太原市', '0351', '140000', '140100', 112549248, 37857014, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (795, 794, 3, '小店区', '0351', '140100', '140105', 112564273, 37817974, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (796, 794, 3, '迎泽区', '0351', '140100', '140106', 112558851, 37855804, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (797, 794, 3, '杏花岭区', '0351', '140100', '140107', 112560743, 37879291, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (798, 794, 3, '尖草坪区', '0351', '140100', '140108', 112487122, 37939893, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (799, 794, 3, '万柏林区', '0351', '140100', '140109', 112522258, 37862653, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (800, 794, 3, '晋源区', '0351', '140100', '140110', 112477849, 37715619, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (801, 794, 3, '清徐县', '0351', '140100', '140121', 112357961, 37607290, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (802, 794, 3, '阳曲县', '0351', '140100', '140122', 112673818, 38058797, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (803, 794, 3, '娄烦县', '0351', '140100', '140123', 111793798, 38066035, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (804, 794, 3, '古交市', '0351', '140100', '140181', 112174353, 37908534, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (805, 793, 2, '大同市', '0352', '140000', '140200', 113295259, 40090310, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (806, 805, 3, '城区', '0352', '140200', '140202', 113301438, 40090511, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (807, 805, 3, '矿区', '0352', '140200', '140203', 113168656, 40036260, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (808, 805, 3, '南郊区', '0352', '140200', '140211', 113168920, 40018020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (809, 805, 3, '新荣区', '0352', '140200', '140212', 113141044, 40258269, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (810, 805, 3, '阳高县', '0352', '140200', '140221', 113749871, 40364927, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (811, 805, 3, '天镇县', '0352', '140200', '140222', 114091120, 40421336, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (812, 805, 3, '广灵县', '0352', '140200', '140223', 114279252, 39763051, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (813, 805, 3, '灵丘县', '0352', '140200', '140224', 114235760, 39438867, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (814, 805, 3, '浑源县', '0352', '140200', '140225', 113698091, 39699099, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (815, 805, 3, '左云县', '0352', '140200', '140226', 112706410, 40012873, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (816, 805, 3, '大同县', '0352', '140200', '140227', 113611306, 40039345, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (817, 793, 2, '阳泉市', '0353', '140000', '140300', 113583285, 37861188, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (818, 817, 3, '城区', '0353', '140300', '140302', 113586513, 37860938, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (819, 817, 3, '矿区', '0353', '140300', '140303', 113559066, 37870085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (820, 817, 3, '郊区', '0353', '140300', '140311', 113586640, 37940960, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (821, 817, 3, '平定县', '0353', '140300', '140321', 113631049, 37800289, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (822, 817, 3, '盂县', '0353', '140300', '140322', 113412230, 38086131, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (823, 793, 2, '长治市', '0355', '140000', '140400', 113113556, 36191112, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (824, 823, 3, '城区', '0355', '140400', '140402', 113114107, 36187896, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (825, 823, 3, '郊区', '0355', '140400', '140411', 113101211, 36218388, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (826, 823, 3, '长治县', '0355', '140400', '140421', 113056679, 36052438, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (827, 823, 3, '襄垣县', '0355', '140400', '140423', 113050094, 36532854, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (828, 823, 3, '屯留县', '0355', '140400', '140424', 112892741, 36314072, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (829, 823, 3, '平顺县', '0355', '140400', '140425', 113438791, 36200202, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (830, 823, 3, '黎城县', '0355', '140400', '140426', 113387366, 36502971, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (831, 823, 3, '壶关县', '0355', '140400', '140427', 113206138, 36110938, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (832, 823, 3, '长子县', '0355', '140400', '140428', 112884656, 36119484, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (833, 823, 3, '武乡县', '0355', '140400', '140429', 112865300, 36834315, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (834, 823, 3, '沁县', '0355', '140400', '140430', 112701380, 36757123, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (835, 823, 3, '沁源县', '0355', '140400', '140431', 112340878, 36500777, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (836, 823, 3, '潞城市', '0355', '140400', '140481', 113223245, 36332233, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (837, 793, 2, '晋城市', '0356', '140000', '140500', 112851274, 35497553, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (838, 837, 3, '城区', '0356', '140500', '140502', 112853106, 35496641, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (839, 837, 3, '沁水县', '0356', '140500', '140521', 112187213, 35689472, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (840, 837, 3, '阳城县', '0356', '140500', '140522', 112422014, 35482177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (841, 837, 3, '陵川县', '0356', '140500', '140524', 113278877, 35775614, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (842, 837, 3, '泽州县', '0356', '140500', '140525', 112899137, 35617221, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (843, 837, 3, '高平市', '0356', '140500', '140581', 112930691, 35791355, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (844, 793, 2, '朔州市', '0349', '140000', '140600', 112433387, 39331261, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (845, 844, 3, '朔城区', '0349', '140600', '140602', 112428676, 39324525, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (846, 844, 3, '平鲁区', '0349', '140600', '140603', 112295227, 39515603, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (847, 844, 3, '山阴县', '0349', '140600', '140621', 112816396, 39526770, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (848, 844, 3, '应县', '0349', '140600', '140622', 113187505, 39559187, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (849, 844, 3, '右玉县', '0349', '140600', '140623', 112465588, 39988812, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (850, 844, 3, '怀仁县', '0349', '140600', '140624', 113100512, 39820790, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (851, 793, 2, '晋中市', '0354', '140000', '140700', 112736465, 37696495, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (852, 851, 3, '榆次区', '0354', '140700', '140702', 112740056, 37697600, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (853, 851, 3, '榆社县', '0354', '140700', '140721', 112973521, 37069019, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (854, 851, 3, '左权县', '0354', '140700', '140722', 113377834, 37079672, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (855, 851, 3, '和顺县', '0354', '140700', '140723', 113572919, 37327027, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (856, 851, 3, '昔阳县', '0354', '140700', '140724', 113706166, 37604370, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (857, 851, 3, '寿阳县', '0354', '140700', '140725', 113177708, 37891136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (858, 851, 3, '太谷县', '0354', '140700', '140726', 112554103, 37424595, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (859, 851, 3, '祁县', '0354', '140700', '140727', 112330532, 37358739, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (860, 851, 3, '平遥县', '0354', '140700', '140728', 112174059, 37195474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (861, 851, 3, '灵石县', '0354', '140700', '140729', 111772759, 36847469, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (862, 851, 3, '介休市', '0354', '140700', '140781', 111913857, 37027616, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (863, 793, 2, '运城市', '0359', '140000', '140800', 111003957, 35022778, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (864, 863, 3, '盐湖区', '0359', '140800', '140802', 111000627, 35025643, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (865, 863, 3, '临猗县', '0359', '140800', '140821', 110774930, 35141883, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (866, 863, 3, '万荣县', '0359', '140800', '140822', 110843561, 35417042, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (867, 863, 3, '闻喜县', '0359', '140800', '140823', 111220306, 35353839, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (868, 863, 3, '稷山县', '0359', '140800', '140824', 110978996, 35600412, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (869, 863, 3, '新绛县', '0359', '140800', '140825', 111225205, 35613697, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (870, 863, 3, '绛县', '0359', '140800', '140826', 111576182, 35490450, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (871, 863, 3, '垣曲县', '0359', '140800', '140827', 111670990, 35298293, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (872, 863, 3, '夏县', '0359', '140800', '140828', 111223174, 35140441, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (873, 863, 3, '平陆县', '0359', '140800', '140829', 111212377, 34837256, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (874, 863, 3, '芮城县', '0359', '140800', '140830', 110691140, 34694769, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (875, 863, 3, '永济市', '0359', '140800', '140881', 110447984, 34865125, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (876, 863, 3, '河津市', '0359', '140800', '140882', 110710268, 35597150, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (877, 793, 2, '忻州市', '0350', '140000', '140900', 112733538, 38417690, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (878, 877, 3, '忻府区', '0350', '140900', '140902', 112734112, 38417743, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (879, 877, 3, '定襄县', '0350', '140900', '140921', 112963231, 38484948, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (880, 877, 3, '五台县', '0350', '140900', '140922', 113259012, 38725711, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (881, 877, 3, '代县', '0350', '140900', '140923', 112962519, 39065138, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (882, 877, 3, '繁峙县', '0350', '140900', '140924', 113267707, 39188104, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (883, 877, 3, '宁武县', '0350', '140900', '140925', 112307936, 39001718, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (884, 877, 3, '静乐县', '0350', '140900', '140926', 111940231, 38355947, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (885, 877, 3, '神池县', '0350', '140900', '140927', 112200438, 39088467, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (886, 877, 3, '五寨县', '0350', '140900', '140928', 111841015, 38912761, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (887, 877, 3, '岢岚县', '0350', '140900', '140929', 111569810, 38705625, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (888, 877, 3, '河曲县', '0350', '140900', '140930', 111146609, 39381895, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (889, 877, 3, '保德县', '0350', '140900', '140931', 111085688, 39022576, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (890, 877, 3, '偏关县', '0350', '140900', '140932', 111500477, 39442153, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (891, 877, 3, '原平市', '0350', '140900', '140981', 112713132, 38729186, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (892, 793, 2, '临汾市', '0357', '140000', '141000', 111517973, 36084150, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (893, 892, 3, '尧都区', '0357', '141000', '141002', 111522945, 36080366, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (894, 892, 3, '曲沃县', '0357', '141000', '141021', 111475529, 35641387, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (895, 892, 3, '翼城县', '0357', '141000', '141022', 111713508, 35738621, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (896, 892, 3, '襄汾县', '0357', '141000', '141023', 111442932, 35876139, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (897, 892, 3, '洪洞县', '0357', '141000', '141024', 111673692, 36255742, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (898, 892, 3, '古县', '0357', '141000', '141025', 111920207, 36268550, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (899, 892, 3, '安泽县', '0357', '141000', '141026', 112251372, 36146032, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (900, 892, 3, '浮山县', '0357', '141000', '141027', 111850039, 35971359, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (901, 892, 3, '吉县', '0357', '141000', '141028', 110682853, 36099355, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (902, 892, 3, '乡宁县', '0357', '141000', '141029', 110857365, 35975402, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (903, 892, 3, '大宁县', '0357', '141000', '141030', 110751283, 36463830, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (904, 892, 3, '隰县', '0357', '141000', '141031', 110935809, 36692675, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (905, 892, 3, '永和县', '0357', '141000', '141032', 110631276, 36760614, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (906, 892, 3, '蒲县', '0357', '141000', '141033', 111097330, 36411682, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (907, 892, 3, '汾西县', '0357', '141000', '141034', 111563021, 36653368, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (908, 892, 3, '侯马市', '0357', '141000', '141081', 111371272, 35620302, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (909, 892, 3, '霍州市', '0357', '141000', '141082', 111723103, 36572020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (910, 793, 2, '吕梁市', '0358', '140000', '141100', 111134335, 37524366, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (911, 910, 3, '离石区', '0358', '141100', '141102', 111134462, 37524037, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (912, 910, 3, '文水县', '0358', '141100', '141121', 112032595, 37436314, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (913, 910, 3, '交城县', '0358', '141100', '141122', 112159154, 37555155, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (914, 910, 3, '兴县', '0358', '141100', '141123', 111124816, 38464136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (915, 910, 3, '临县', '0358', '141100', '141124', 110995963, 37960806, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (916, 910, 3, '柳林县', '0358', '141100', '141125', 110896130, 37431664, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (917, 910, 3, '石楼县', '0358', '141100', '141126', 110837119, 36999426, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (918, 910, 3, '岚县', '0358', '141100', '141127', 111671555, 38278654, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (919, 910, 3, '方山县', '0358', '141100', '141128', 111238885, 37892632, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (920, 910, 3, '中阳县', '0358', '141100', '141129', 111193319, 37342054, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (921, 910, 3, '交口县', '0358', '141100', '141130', 111183188, 36983068, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (922, 910, 3, '孝义市', '0358', '141100', '141181', 111781568, 37144474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (923, 910, 3, '汾阳市', '0358', '141100', '141182', 111785273, 37267742, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (924, 1, 1, '内蒙古自治区', '', '100000', '150000', 111670801, 40818311, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (925, 924, 2, '呼和浩特市', '0471', '150000', '150100', 111670801, 40818311, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (926, 925, 3, '新城区', '0471', '150100', '150102', 111685964, 40826225, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (927, 925, 3, '回民区', '0471', '150100', '150103', 111662162, 40815149, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (928, 925, 3, '玉泉区', '0471', '150100', '150104', 111665430, 40799421, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (929, 925, 3, '赛罕区', '0471', '150100', '150105', 111698463, 40807834, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (930, 925, 3, '土默特左旗', '0471', '150100', '150121', 111133615, 40720416, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (931, 925, 3, '托克托县', '0471', '150100', '150122', 111197317, 40276729, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (932, 925, 3, '和林格尔县', '0471', '150100', '150123', 111824143, 40380288, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (933, 925, 3, '清水河县', '0471', '150100', '150124', 111672220, 39912479, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (934, 925, 3, '武川县', '0471', '150100', '150125', 111456563, 41094483, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (935, 924, 2, '包头市', '0472', '150000', '150200', 109840405, 40658168, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (936, 935, 3, '东河区', '0472', '150200', '150202', 110026895, 40587056, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (937, 935, 3, '昆都仑区', '0472', '150200', '150203', 109822932, 40661345, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (938, 935, 3, '青山区', '0472', '150200', '150204', 109880049, 40668558, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (939, 935, 3, '石拐区', '0472', '150200', '150205', 110272565, 40672094, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (940, 935, 3, '白云鄂博矿区', '0472', '150200', '150206', 109970160, 41769246, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (941, 935, 3, '九原区', '0472', '150200', '150207', 109968122, 40600581, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (942, 935, 3, '土默特右旗', '0472', '150200', '150221', 110526766, 40566434, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (943, 935, 3, '固阳县', '0472', '150200', '150222', 110063421, 41030004, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (944, 935, 3, '达尔罕茂明安联合旗', '0472', '150200', '150223', 110438452, 41702836, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (945, 924, 2, '乌海市', '0473', '150000', '150300', 106825563, 39673734, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (946, 945, 3, '海勃湾区', '0473', '150300', '150302', 106817762, 39673527, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (947, 945, 3, '海南区', '0473', '150300', '150303', 106884789, 39441530, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (948, 945, 3, '乌达区', '0473', '150300', '150304', 106722711, 39502288, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (949, 924, 2, '赤峰市', '0476', '150000', '150400', 118956806, 42275317, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (950, 949, 3, '红山区', '0476', '150400', '150402', 118961087, 42269732, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (951, 949, 3, '元宝山区', '0476', '150400', '150403', 119289877, 42041168, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (952, 949, 3, '松山区', '0476', '150400', '150404', 118938958, 42281046, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (953, 949, 3, '阿鲁科尔沁旗', '0476', '150400', '150421', 120094969, 43878770, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (954, 949, 3, '巴林左旗', '0476', '150400', '150422', 119391737, 43980715, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (955, 949, 3, '巴林右旗', '0476', '150400', '150423', 118678347, 43528963, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (956, 949, 3, '林西县', '0476', '150400', '150424', 118057750, 43605326, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (957, 949, 3, '克什克腾旗', '0476', '150400', '150425', 117542465, 43256233, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (958, 949, 3, '翁牛特旗', '0476', '150400', '150426', 119022619, 42937128, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (959, 949, 3, '喀喇沁旗', '0476', '150400', '150428', 118708572, 41927780, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (960, 949, 3, '宁城县', '0476', '150400', '150429', 119339242, 41598692, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (961, 949, 3, '敖汉旗', '0476', '150400', '150430', 119906486, 42287012, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (962, 924, 2, '通辽市', '0475', '150000', '150500', 122263119, 43617429, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (963, 962, 3, '科尔沁区', '0475', '150500', '150502', 122264042, 43617422, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (964, 962, 3, '科尔沁左翼中旗', '0475', '150500', '150521', 123313873, 44127166, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (965, 962, 3, '科尔沁左翼后旗', '0475', '150500', '150522', 122355155, 42954564, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (966, 962, 3, '开鲁县', '0475', '150500', '150523', 121308797, 43602432, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (967, 962, 3, '库伦旗', '0475', '150500', '150524', 121774886, 42734692, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (968, 962, 3, '奈曼旗', '0475', '150500', '150525', 120662543, 42846850, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (969, 962, 3, '扎鲁特旗', '0475', '150500', '150526', 120905275, 44555294, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (970, 962, 3, '霍林郭勒市', '0475', '150500', '150581', 119657862, 45532361, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (971, 924, 2, '鄂尔多斯市', '0477', '150000', '150600', 109990290, 39817179, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (972, 971, 3, '东胜区', '0477', '150600', '150602', 109989450, 39817880, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (973, 971, 3, '康巴什区', '0477', '150600', '150603', 109790076, 39607472, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (974, 971, 3, '达拉特旗', '0477', '150600', '150621', 110040281, 40404076, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (975, 971, 3, '准格尔旗', '0477', '150600', '150622', 111238332, 39865221, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (976, 971, 3, '鄂托克前旗', '0477', '150600', '150623', 107481720, 38183257, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (977, 971, 3, '鄂托克旗', '0477', '150600', '150624', 107982604, 39095752, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (978, 971, 3, '杭锦旗', '0477', '150600', '150625', 108736324, 39831789, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (979, 971, 3, '乌审旗', '0477', '150600', '150626', 108842454, 38596611, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (980, 971, 3, '伊金霍洛旗', '0477', '150600', '150627', 109787402, 39604312, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (981, 924, 2, '呼伦贝尔市', '0470', '150000', '150700', 119758168, 49215333, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (982, 981, 3, '海拉尔区', '0470', '150700', '150702', 119764923, 49213889, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (983, 981, 3, '扎赉诺尔区', '0470', '150700', '150703', 117716373, 49456567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (984, 981, 3, '阿荣旗', '0470', '150700', '150721', 123464615, 48130503, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (985, 981, 3, '莫力达瓦达斡尔族自治旗', '0470', '150700', '150722', 124507401, 48478385, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (986, 981, 3, '鄂伦春自治旗', '0470', '150700', '150723', 123725684, 50590177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (987, 981, 3, '鄂温克族自治旗', '0470', '150700', '150724', 119754041, 49143293, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (988, 981, 3, '陈巴尔虎旗', '0470', '150700', '150725', 119437609, 49328422, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (989, 981, 3, '新巴尔虎左旗', '0470', '150700', '150726', 118267454, 48216571, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (990, 981, 3, '新巴尔虎右旗', '0470', '150700', '150727', 116825991, 48669134, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (991, 981, 3, '满洲里市', '0470', '150700', '150781', 117455561, 49590788, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (992, 981, 3, '牙克石市', '0470', '150700', '150782', 120729005, 49287024, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (993, 981, 3, '扎兰屯市', '0470', '150700', '150783', 122744401, 48007412, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (994, 981, 3, '额尔古纳市', '0470', '150700', '150784', 120178636, 50243900, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (995, 981, 3, '根河市', '0470', '150700', '150785', 121532724, 50780454, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (996, 924, 2, '巴彦淖尔市', '0478', '150000', '150800', 107416959, 40757402, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (997, 996, 3, '临河区', '0478', '150800', '150802', 107417018, 40757092, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (998, 996, 3, '五原县', '0478', '150800', '150821', 108270658, 41097639, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (999, 996, 3, '磴口县', '0478', '150800', '150822', 107006056, 40330479, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1000, 996, 3, '乌拉特前旗', '0478', '150800', '150823', 108656816, 40725209, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1001, 996, 3, '乌拉特中旗', '0478', '150800', '150824', 108515255, 41572540, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1002, 996, 3, '乌拉特后旗', '0478', '150800', '150825', 107074941, 41084307, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1003, 996, 3, '杭锦后旗', '0478', '150800', '150826', 107147682, 40888797, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1004, 924, 2, '乌兰察布市', '0474', '150000', '150900', 113114543, 41034126, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1005, 1004, 3, '集宁区', '0474', '150900', '150902', 113116453, 41034134, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1006, 1004, 3, '卓资县', '0474', '150900', '150921', 112577702, 40895760, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1007, 1004, 3, '化德县', '0474', '150900', '150922', 114010080, 41899335, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1008, 1004, 3, '商都县', '0474', '150900', '150923', 113560643, 41560163, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1009, 1004, 3, '兴和县', '0474', '150900', '150924', 113834009, 40872437, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1010, 1004, 3, '凉城县', '0474', '150900', '150925', 112500911, 40531627, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1011, 1004, 3, '察哈尔右翼前旗', '0474', '150900', '150926', 113211958, 40786859, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1012, 1004, 3, '察哈尔右翼中旗', '0474', '150900', '150927', 112633563, 41274212, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1013, 1004, 3, '察哈尔右翼后旗', '0474', '150900', '150928', 113190600, 41447213, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1014, 1004, 3, '四子王旗', '0474', '150900', '150929', 111701230, 41528114, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1015, 1004, 3, '丰镇市', '0474', '150900', '150981', 113163462, 40437534, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1016, 924, 2, '兴安盟', '0482', '150000', '152200', 122070317, 46076268, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1017, 1016, 3, '乌兰浩特市', '0482', '152200', '152201', 122068975, 46077238, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1018, 1016, 3, '阿尔山市', '0482', '152200', '152202', 119943656, 47177000, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1019, 1016, 3, '科尔沁右翼前旗', '0482', '152200', '152221', 121957544, 46076497, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1020, 1016, 3, '科尔沁右翼中旗', '0482', '152200', '152222', 121472818, 45059645, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1021, 1016, 3, '扎赉特旗', '0482', '152200', '152223', 122909332, 46725136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1022, 1016, 3, '突泉县', '0482', '152200', '152224', 121564856, 45380986, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1023, 924, 2, '锡林郭勒盟', '0479', '150000', '152500', 116090996, 43944018, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1024, 1023, 3, '二连浩特市', '0479', '152500', '152501', 111979810, 43652895, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1025, 1023, 3, '锡林浩特市', '0479', '152500', '152502', 116091903, 43944301, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1026, 1023, 3, '阿巴嘎旗', '0479', '152500', '152522', 114970618, 44022728, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1027, 1023, 3, '苏尼特左旗', '0479', '152500', '152523', 113653412, 43854108, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1028, 1023, 3, '苏尼特右旗', '0479', '152500', '152524', 112655390, 42746662, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1029, 1023, 3, '东乌珠穆沁旗', '0479', '152500', '152525', 116980022, 45510307, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1030, 1023, 3, '西乌珠穆沁旗', '0479', '152500', '152526', 117615249, 44586147, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1031, 1023, 3, '太仆寺旗', '0479', '152500', '152527', 115287280, 41895199, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1032, 1023, 3, '镶黄旗', '0479', '152500', '152528', 113843869, 42239229, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1033, 1023, 3, '正镶白旗', '0479', '152500', '152529', 115031423, 42286807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1034, 1023, 3, '正蓝旗', '0479', '152500', '152530', 116003311, 42245895, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1035, 1023, 3, '多伦县', '0479', '152500', '152531', 116477288, 42197962, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1036, 924, 2, '阿拉善盟', '0483', '150000', '152900', 105706422, 38844814, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1037, 1036, 3, '阿拉善左旗', '0483', '152900', '152921', 105701920, 38847241, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1038, 1036, 3, '阿拉善右旗', '0483', '152900', '152922', 101671984, 39211590, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1039, 1036, 3, '额济纳旗', '0483', '152900', '152923', 101069440, 41958813, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1040, 1, 1, '辽宁省', '', '100000', '210000', 123429096, 41796767, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1041, 1040, 2, '沈阳市', '024', '210000', '210100', 123429096, 41796767, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1042, 1041, 3, '和平区', '024', '210100', '210102', 123406664, 41788074, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1043, 1041, 3, '沈河区', '024', '210100', '210103', 123445696, 41795591, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1044, 1041, 3, '大东区', '024', '210100', '210104', 123469956, 41808503, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1045, 1041, 3, '皇姑区', '024', '210100', '210105', 123405677, 41822336, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1046, 1041, 3, '铁西区', '024', '210100', '210106', 123350664, 41787808, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1047, 1041, 3, '苏家屯区', '024', '210100', '210111', 123341604, 41665904, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1048, 1041, 3, '浑南区', '024', '210100', '210112', 123458981, 41741946, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1049, 1041, 3, '沈北新区', '024', '210100', '210113', 123521471, 42052312, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1050, 1041, 3, '于洪区', '024', '210100', '210114', 123310829, 41795833, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1051, 1041, 3, '辽中区', '024', '210100', '210115', 122731269, 41512725, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1052, 1041, 3, '康平县', '024', '210100', '210123', 123352703, 42741533, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1053, 1041, 3, '法库县', '024', '210100', '210124', 123416722, 42507045, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1054, 1041, 3, '新民市', '024', '210100', '210181', 122828868, 41996508, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1055, 1040, 2, '大连市', '0411', '210000', '210200', 121618622, 38914590, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1056, 1055, 3, '中山区', '0411', '210200', '210202', 121643760, 38921553, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1057, 1055, 3, '西岗区', '0411', '210200', '210203', 121616112, 38914266, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1058, 1055, 3, '沙河口区', '0411', '210200', '210204', 121593702, 38912859, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1059, 1055, 3, '甘井子区', '0411', '210200', '210211', 121582614, 38975148, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1060, 1055, 3, '旅顺口区', '0411', '210200', '210212', 121267130, 38812043, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1061, 1055, 3, '金州区', '0411', '210200', '210213', 121789413, 39052745, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1062, 1055, 3, '长海县', '0411', '210200', '210224', 122587824, 39272399, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1063, 1055, 3, '瓦房店市', '0411', '210200', '210281', 122002656, 39630650, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1064, 1055, 3, '普兰店区', '0411', '210200', '210214', 121970500, 39401555, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1065, 1055, 3, '庄河市', '0411', '210200', '210283', 122970612, 39698290, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1066, 1040, 2, '鞍山市', '0412', '210000', '210300', 122995632, 41110626, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1067, 1066, 3, '铁东区', '0412', '210300', '210302', 122994475, 41110344, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1068, 1066, 3, '铁西区', '0412', '210300', '210303', 122971834, 41110690, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1069, 1066, 3, '立山区', '0412', '210300', '210304', 123024806, 41150622, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1070, 1066, 3, '千山区', '0412', '210300', '210311', 122949298, 41068909, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1071, 1066, 3, '台安县', '0412', '210300', '210321', 122429736, 41386860, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1072, 1066, 3, '岫岩满族自治县', '0412', '210300', '210323', 123288330, 40281509, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1073, 1066, 3, '海城市', '0412', '210300', '210381', 122752199, 40852533, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1074, 1040, 2, '抚顺市', '0413', '210000', '210400', 123921109, 41875956, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1075, 1074, 3, '新抚区', '0413', '210400', '210402', 123902858, 41860820, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1076, 1074, 3, '东洲区', '0413', '210400', '210403', 124047219, 41866829, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1077, 1074, 3, '望花区', '0413', '210400', '210404', 123801509, 41851803, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1078, 1074, 3, '顺城区', '0413', '210400', '210411', 123917165, 41881132, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1079, 1074, 3, '抚顺县', '0413', '210400', '210421', 124097979, 41922644, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1080, 1074, 3, '新宾满族自治县', '0413', '210400', '210422', 125037547, 41732456, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1081, 1074, 3, '清原满族自治县', '0413', '210400', '210423', 124927192, 42101350, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1082, 1040, 2, '本溪市', '0414', '210000', '210500', 123770519, 41297909, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1083, 1082, 3, '平山区', '0414', '210500', '210502', 123761231, 41291581, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1084, 1082, 3, '溪湖区', '0414', '210500', '210503', 123765226, 41330056, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1085, 1082, 3, '明山区', '0414', '210500', '210504', 123763288, 41302429, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1086, 1082, 3, '南芬区', '0414', '210500', '210505', 123748381, 41104093, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1087, 1082, 3, '本溪满族自治县', '0414', '210500', '210521', 124126156, 41300344, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1088, 1082, 3, '桓仁满族自治县', '0414', '210500', '210522', 125359195, 41268997, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1089, 1040, 2, '丹东市', '0415', '210000', '210600', 124383044, 40124296, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1090, 1089, 3, '元宝区', '0415', '210600', '210602', 124397814, 40136483, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1091, 1089, 3, '振兴区', '0415', '210600', '210603', 124361153, 40102801, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1092, 1089, 3, '振安区', '0415', '210600', '210604', 124427709, 40158557, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1093, 1089, 3, '宽甸满族自治县', '0415', '210600', '210624', 124784867, 40730412, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1094, 1089, 3, '东港市', '0415', '210600', '210681', 124149437, 39883467, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1095, 1089, 3, '凤城市', '0415', '210600', '210682', 124071067, 40457567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1096, 1040, 2, '锦州市', '0416', '210000', '210700', 121135742, 41119269, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1097, 1096, 3, '古塔区', '0416', '210700', '210702', 121130085, 41115719, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1098, 1096, 3, '凌河区', '0416', '210700', '210703', 121151304, 41114662, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1099, 1096, 3, '太和区', '0416', '210700', '210711', 121107297, 41105378, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1100, 1096, 3, '黑山县', '0416', '210700', '210726', 122117915, 41691804, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1101, 1096, 3, '义县', '0416', '210700', '210727', 121242831, 41537224, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1102, 1096, 3, '凌海市', '0416', '210700', '210781', 121364236, 41171738, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1103, 1096, 3, '北镇市', '0416', '210700', '210782', 121795962, 41598764, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1104, 1040, 2, '营口市', '0417', '210000', '210800', 122235151, 40667432, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1105, 1104, 3, '站前区', '0417', '210800', '210802', 122253235, 40669949, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1106, 1104, 3, '西市区', '0417', '210800', '210803', 122210067, 40663086, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1107, 1104, 3, '鲅鱼圈区', '0417', '210800', '210804', 122127242, 40263646, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1108, 1104, 3, '老边区', '0417', '210800', '210811', 122382584, 40682723, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1109, 1104, 3, '盖州市', '0417', '210800', '210881', 122355534, 40405234, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1110, 1104, 3, '大石桥市', '0417', '210800', '210882', 122505894, 40633973, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1111, 1040, 2, '阜新市', '0418', '210000', '210900', 121648962, 42011796, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1112, 1111, 3, '海州区', '0418', '210900', '210902', 121657639, 42011162, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1113, 1111, 3, '新邱区', '0418', '210900', '210903', 121790541, 42086603, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1114, 1111, 3, '太平区', '0418', '210900', '210904', 121677575, 42011145, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1115, 1111, 3, '清河门区', '0418', '210900', '210905', 121420180, 41780477, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1116, 1111, 3, '细河区', '0418', '210900', '210911', 121654791, 42019218, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1117, 1111, 3, '阜新蒙古族自治县', '0418', '210900', '210921', 121743125, 42058607, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1118, 1111, 3, '彰武县', '0418', '210900', '210922', 122537444, 42384823, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1119, 1040, 2, '辽阳市', '0419', '210000', '211000', 123181520, 41269402, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1120, 1119, 3, '白塔区', '0419', '211000', '211002', 123172611, 41267450, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1121, 1119, 3, '文圣区', '0419', '211000', '211003', 123188227, 41266765, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1122, 1119, 3, '宏伟区', '0419', '211000', '211004', 123200461, 41205747, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1123, 1119, 3, '弓长岭区', '0419', '211000', '211005', 123431633, 41157831, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1124, 1119, 3, '太子河区', '0419', '211000', '211011', 123185336, 41251682, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1125, 1119, 3, '辽阳县', '0419', '211000', '211021', 123079674, 41216479, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1126, 1119, 3, '灯塔市', '0419', '211000', '211081', 123325864, 41427836, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1127, 1040, 2, '盘锦市', '0427', '210000', '211100', 122069570, 41124484, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1128, 1127, 3, '双台子区', '0427', '211100', '211102', 122055733, 41190365, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1129, 1127, 3, '兴隆台区', '0427', '211100', '211103', 122071624, 41122423, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1130, 1127, 3, '大洼区', '0427', '211100', '211121', 122071708, 40994428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1131, 1127, 3, '盘山县', '0427', '211100', '211122', 121985280, 41240701, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1132, 1040, 2, '铁岭市', '0410', '210000', '211200', 123844279, 42290585, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1133, 1132, 3, '银州区', '0410', '211200', '211202', 123844877, 42292278, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1134, 1132, 3, '清河区', '0410', '211200', '211204', 124148960, 42542978, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1135, 1132, 3, '铁岭县', '0410', '211200', '211221', 123725669, 42223316, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1136, 1132, 3, '西丰县', '0410', '211200', '211223', 124723320, 42738091, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1137, 1132, 3, '昌图县', '0410', '211200', '211224', 124110170, 42784441, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1138, 1132, 3, '调兵山市', '0410', '211200', '211281', 123545366, 42450734, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1139, 1132, 3, '开原市', '0410', '211200', '211282', 124045551, 42542141, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1140, 1040, 2, '朝阳市', '0421', '210000', '211300', 120451176, 41576758, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1141, 1140, 3, '双塔区', '0421', '211300', '211302', 120448770, 41579389, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1142, 1140, 3, '龙城区', '0421', '211300', '211303', 120413376, 41576749, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1143, 1140, 3, '朝阳县', '0421', '211300', '211321', 120404217, 41526342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1144, 1140, 3, '建平县', '0421', '211300', '211322', 119642363, 41402576, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1145, 1140, 3, '喀喇沁左翼蒙古族自治县', '0421', '211300', '211324', 119744883, 41125428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1146, 1140, 3, '北票市', '0421', '211300', '211381', 120766951, 41803286, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1147, 1140, 3, '凌源市', '0421', '211300', '211382', 119404789, 41243086, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1148, 1040, 2, '葫芦岛市', '0429', '210000', '211400', 120856394, 40755572, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1149, 1148, 3, '连山区', '0429', '211400', '211402', 120859370, 40755143, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1150, 1148, 3, '龙港区', '0429', '211400', '211403', 120838569, 40709991, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1151, 1148, 3, '南票区', '0429', '211400', '211404', 120752314, 41098813, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1152, 1148, 3, '绥中县', '0429', '211400', '211421', 120342112, 40328407, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1153, 1148, 3, '建昌县', '0429', '211400', '211422', 119807776, 40812871, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1154, 1148, 3, '兴城市', '0429', '211400', '211481', 120729365, 40619413, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1155, 1, 1, '吉林省', '', '100000', '220000', 125324500, 43886841, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1156, 1155, 2, '长春市', '0431', '220000', '220100', 125324500, 43886841, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1157, 1156, 3, '南关区', '0431', '220100', '220102', 125337237, 43890235, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1158, 1156, 3, '宽城区', '0431', '220100', '220103', 125342828, 43903823, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1159, 1156, 3, '朝阳区', '0431', '220100', '220104', 125318042, 43864910, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1160, 1156, 3, '二道区', '0431', '220100', '220105', 125384727, 43870824, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1161, 1156, 3, '绿园区', '0431', '220100', '220106', 125272467, 43892177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1162, 1156, 3, '双阳区', '0431', '220100', '220112', 125659018, 43525168, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1163, 1156, 3, '九台区', '0431', '220100', '220113', 125844682, 44157155, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1164, 1156, 3, '农安县', '0431', '220100', '220122', 125175287, 44431258, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1165, 1156, 3, '榆树市', '0431', '220100', '220182', 126550107, 44827642, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1166, 1156, 3, '德惠市', '0431', '220100', '220183', 125703327, 44533909, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1167, 1155, 2, '吉林市', '0432', '220000', '220200', 126553020, 43843577, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1168, 1167, 3, '昌邑区', '0432', '220200', '220202', 126570766, 43851118, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1169, 1167, 3, '龙潭区', '0432', '220200', '220203', 126561429, 43909755, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1170, 1167, 3, '船营区', '0432', '220200', '220204', 126552390, 43843804, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1171, 1167, 3, '丰满区', '0432', '220200', '220211', 126560759, 43816594, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1172, 1167, 3, '永吉县', '0432', '220200', '220221', 126501622, 43667416, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1173, 1167, 3, '蛟河市', '0432', '220200', '220281', 127342739, 43720579, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1174, 1167, 3, '桦甸市', '0432', '220200', '220282', 126745445, 42972093, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1175, 1167, 3, '舒兰市', '0432', '220200', '220283', 126947813, 44410906, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1176, 1167, 3, '磐石市', '0432', '220200', '220284', 126059929, 42942476, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1177, 1155, 2, '四平市', '0434', '220000', '220300', 124370785, 43170344, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1178, 1177, 3, '铁西区', '0434', '220300', '220302', 124360894, 43176263, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1179, 1177, 3, '铁东区', '0434', '220300', '220303', 124388464, 43167260, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1180, 1177, 3, '梨树县', '0434', '220300', '220322', 124335802, 43308310, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1181, 1177, 3, '伊通满族自治县', '0434', '220300', '220323', 125303124, 43345464, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1182, 1177, 3, '公主岭市', '0434', '220300', '220381', 124817588, 43509474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1183, 1177, 3, '双辽市', '0434', '220300', '220382', 123505283, 43518275, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1184, 1155, 2, '辽源市', '0437', '220000', '220400', 125145349, 42902692, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1185, 1184, 3, '龙山区', '0437', '220400', '220402', 125145164, 42902702, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1186, 1184, 3, '西安区', '0437', '220400', '220403', 125151424, 42920415, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1187, 1184, 3, '东丰县', '0437', '220400', '220421', 125529623, 42675228, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1188, 1184, 3, '东辽县', '0437', '220400', '220422', 124991995, 42927724, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1189, 1155, 2, '通化市', '0435', '220000', '220500', 125936501, 41721177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1190, 1189, 3, '东昌区', '0435', '220500', '220502', 125936716, 41721233, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1191, 1189, 3, '二道江区', '0435', '220500', '220503', 126045987, 41777564, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1192, 1189, 3, '通化县', '0435', '220500', '220521', 125753121, 41677918, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1193, 1189, 3, '辉南县', '0435', '220500', '220523', 126042821, 42683459, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1194, 1189, 3, '柳河县', '0435', '220500', '220524', 125740536, 42281484, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1195, 1189, 3, '梅河口市', '0435', '220500', '220581', 125687336, 42530002, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1196, 1189, 3, '集安市', '0435', '220500', '220582', 126186204, 41126276, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1197, 1155, 2, '白山市', '0439', '220000', '220600', 126427839, 41942505, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1198, 1197, 3, '浑江区', '0439', '220600', '220602', 126428035, 41943065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1199, 1197, 3, '江源区', '0439', '220600', '220605', 126584229, 42048109, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1200, 1197, 3, '抚松县', '0439', '220600', '220621', 127273796, 42332643, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1201, 1197, 3, '靖宇县', '0439', '220600', '220622', 126808386, 42389689, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1202, 1197, 3, '长白朝鲜族自治县', '0439', '220600', '220623', 128203384, 41419361, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1203, 1197, 3, '临江市', '0439', '220600', '220681', 126919296, 41810689, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1204, 1155, 2, '松原市', '0438', '220000', '220700', 124823608, 45118243, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1205, 1204, 3, '宁江区', '0438', '220700', '220702', 124827851, 45176498, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1206, 1204, 3, '前郭尔罗斯蒙古族自治县', '0438', '220700', '220721', 124826808, 45116288, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1207, 1204, 3, '长岭县', '0438', '220700', '220722', 123985184, 44276579, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1208, 1204, 3, '乾安县', '0438', '220700', '220723', 124024361, 45006846, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1209, 1204, 3, '扶余市', '0438', '220700', '220781', 126042758, 44986199, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1210, 1155, 2, '白城市', '0436', '220000', '220800', 122841114, 45619026, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1211, 1210, 3, '洮北区', '0436', '220800', '220802', 122842499, 45619253, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1212, 1210, 3, '镇赉县', '0436', '220800', '220821', 123202246, 45846089, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1213, 1210, 3, '通榆县', '0436', '220800', '220822', 123088543, 44809150, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1214, 1210, 3, '洮南市', '0436', '220800', '220881', 122783779, 45339113, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1215, 1210, 3, '大安市', '0436', '220800', '220882', 124291512, 45507648, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1216, 1155, 2, '延边朝鲜族自治州', '1433', '220000', '222400', 129513228, 42904823, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1217, 1216, 3, '延吉市', '1433', '222400', '222401', 129515790, 42906964, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1218, 1216, 3, '图们市', '1433', '222400', '222402', 129846701, 42966621, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1219, 1216, 3, '敦化市', '1433', '222400', '222403', 128229860, 43366921, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1220, 1216, 3, '珲春市', '1433', '222400', '222404', 130365787, 42871057, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1221, 1216, 3, '龙井市', '1433', '222400', '222405', 129425747, 42771029, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1222, 1216, 3, '和龙市', '1433', '222400', '222406', 129008748, 42547004, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1223, 1216, 3, '汪清县', '1433', '222400', '222424', 129766161, 43315426, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1224, 1216, 3, '安图县', '1433', '222400', '222426', 128901864, 43110994, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1225, 1, 1, '黑龙江省', '', '100000', '230000', 126642464, 45756967, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1226, 1225, 2, '哈尔滨市', '0451', '230000', '230100', 126642464, 45756967, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1227, 1226, 3, '道里区', '0451', '230100', '230102', 126612532, 45762035, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1228, 1226, 3, '南岗区', '0451', '230100', '230103', 126652098, 45755971, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1229, 1226, 3, '道外区', '0451', '230100', '230104', 126648838, 45784540, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1230, 1226, 3, '平房区', '0451', '230100', '230108', 126629257, 45605567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1231, 1226, 3, '松北区', '0451', '230100', '230109', 126563066, 45814656, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1232, 1226, 3, '香坊区', '0451', '230100', '230110', 126667049, 45713067, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1233, 1226, 3, '呼兰区', '0451', '230100', '230111', 126603302, 45984230, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1234, 1226, 3, '阿城区', '0451', '230100', '230112', 126972726, 45538372, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1235, 1226, 3, '双城区', '0451', '230100', '230113', 126308784, 45377942, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1236, 1226, 3, '依兰县', '0451', '230100', '230123', 129565594, 46315105, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1237, 1226, 3, '方正县', '0451', '230100', '230124', 128836131, 45839536, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1238, 1226, 3, '宾县', '0451', '230100', '230125', 127485940, 45759369, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1239, 1226, 3, '巴彦县', '0451', '230100', '230126', 127403602, 46081889, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1240, 1226, 3, '木兰县', '0451', '230100', '230127', 128042675, 45949826, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1241, 1226, 3, '通河县', '0451', '230100', '230128', 128747785, 45977618, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1242, 1226, 3, '延寿县', '0451', '230100', '230129', 128331886, 45455648, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1243, 1226, 3, '尚志市', '0451', '230100', '230183', 127968539, 45214953, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1244, 1226, 3, '五常市', '0451', '230100', '230184', 127157590, 44919418, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1245, 1225, 2, '齐齐哈尔市', '0452', '230000', '230200', 123957920, 47342081, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1246, 1245, 3, '龙沙区', '0452', '230200', '230202', 123957338, 47341736, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1247, 1245, 3, '建华区', '0452', '230200', '230203', 123955888, 47354494, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1248, 1245, 3, '铁锋区', '0452', '230200', '230204', 123973555, 47339499, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1249, 1245, 3, '昂昂溪区', '0452', '230200', '230205', 123813181, 47156867, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1250, 1245, 3, '富拉尔基区', '0452', '230200', '230206', 123638873, 47206970, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1251, 1245, 3, '碾子山区', '0452', '230200', '230207', 122887972, 47514010, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1252, 1245, 3, '梅里斯达斡尔族区', '0452', '230200', '230208', 123754599, 47311113, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1253, 1245, 3, '龙江县', '0452', '230200', '230221', 123187225, 47336388, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1254, 1245, 3, '依安县', '0452', '230200', '230223', 125307561, 47890098, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1255, 1245, 3, '泰来县', '0452', '230200', '230224', 123419530, 46392330, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1256, 1245, 3, '甘南县', '0452', '230200', '230225', 123506034, 47917838, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1257, 1245, 3, '富裕县', '0452', '230200', '230227', 124469106, 47797172, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1258, 1245, 3, '克山县', '0452', '230200', '230229', 125874355, 48034342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1259, 1245, 3, '克东县', '0452', '230200', '230230', 126249094, 48037320, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1260, 1245, 3, '拜泉县', '0452', '230200', '230231', 126091911, 47607363, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1261, 1245, 3, '讷河市', '0452', '230200', '230281', 124882172, 48481133, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1262, 1225, 2, '鸡西市', '0467', '230000', '230300', 130975966, 45300046, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1263, 1262, 3, '鸡冠区', '0467', '230300', '230302', 130974374, 45300340, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1264, 1262, 3, '恒山区', '0467', '230300', '230303', 130910636, 45213242, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1265, 1262, 3, '滴道区', '0467', '230300', '230304', 130846823, 45348812, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1266, 1262, 3, '梨树区', '0467', '230300', '230305', 130697780, 45092195, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1267, 1262, 3, '城子河区', '0467', '230300', '230306', 131010501, 45338248, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1268, 1262, 3, '麻山区', '0467', '230300', '230307', 130481125, 45209607, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1269, 1262, 3, '鸡东县', '0467', '230300', '230321', 131148907, 45250892, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1270, 1262, 3, '虎林市', '0467', '230300', '230381', 132973881, 45767985, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1271, 1262, 3, '密山市', '0467', '230300', '230382', 131874136, 45547250, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1272, 1225, 2, '鹤岗市', '0468', '230000', '230400', 130277487, 47332085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1273, 1272, 3, '向阳区', '0468', '230400', '230402', 130292477, 47345372, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1274, 1272, 3, '工农区', '0468', '230400', '230403', 130276652, 47331678, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1275, 1272, 3, '南山区', '0468', '230400', '230404', 130275533, 47313240, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1276, 1272, 3, '兴安区', '0468', '230400', '230405', 130236168, 47252911, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1277, 1272, 3, '东山区', '0468', '230400', '230406', 130317140, 47337385, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1278, 1272, 3, '兴山区', '0468', '230400', '230407', 130305340, 47359970, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1279, 1272, 3, '萝北县', '0468', '230400', '230421', 130829086, 47577577, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1280, 1272, 3, '绥滨县', '0468', '230400', '230422', 131860526, 47289892, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1281, 1225, 2, '双鸭山市', '0469', '230000', '230500', 131157304, 46643442, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1282, 1281, 3, '尖山区', '0469', '230500', '230502', 131158960, 46642961, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1283, 1281, 3, '岭东区', '0469', '230500', '230503', 131163675, 46591076, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1284, 1281, 3, '四方台区', '0469', '230500', '230505', 131333181, 46594347, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1285, 1281, 3, '宝山区', '0469', '230500', '230506', 131404294, 46573366, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1286, 1281, 3, '集贤县', '0469', '230500', '230521', 131139330, 46728980, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1287, 1281, 3, '友谊县', '0469', '230500', '230522', 131810622, 46775159, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1288, 1281, 3, '宝清县', '0469', '230500', '230523', 132206415, 46328781, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1289, 1281, 3, '饶河县', '0469', '230500', '230524', 134021162, 46801288, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1290, 1225, 2, '大庆市', '0459', '230000', '230600', 125112720, 46590734, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1291, 1290, 3, '萨尔图区', '0459', '230600', '230602', 125114643, 46596356, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1292, 1290, 3, '龙凤区', '0459', '230600', '230603', 125145794, 46573948, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1293, 1290, 3, '让胡路区', '0459', '230600', '230604', 124868341, 46653254, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1294, 1290, 3, '红岗区', '0459', '230600', '230605', 124889528, 46403049, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1295, 1290, 3, '大同区', '0459', '230600', '230606', 124818509, 46034304, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1296, 1290, 3, '肇州县', '0459', '230600', '230621', 125273254, 45708685, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1297, 1290, 3, '肇源县', '0459', '230600', '230622', 125081974, 45518832, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1298, 1290, 3, '林甸县', '0459', '230600', '230623', 124877742, 47186411, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1299, 1290, 3, '杜尔伯特蒙古族自治县', '0459', '230600', '230624', 124446259, 46865973, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1300, 1225, 2, '伊春市', '0458', '230000', '230700', 128899396, 47724775, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1301, 1300, 3, '伊春区', '0458', '230700', '230702', 128899284, 47726851, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1302, 1300, 3, '南岔区', '0458', '230700', '230703', 129282459, 47137314, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1303, 1300, 3, '友好区', '0458', '230700', '230704', 128838961, 47854303, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1304, 1300, 3, '西林区', '0458', '230700', '230705', 129311441, 47479437, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1305, 1300, 3, '翠峦区', '0458', '230700', '230706', 128671746, 47726228, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1306, 1300, 3, '新青区', '0458', '230700', '230707', 129529950, 48288292, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1307, 1300, 3, '美溪区', '0458', '230700', '230708', 129133411, 47636102, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1308, 1300, 3, '金山屯区', '0458', '230700', '230709', 129435944, 47412950, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1309, 1300, 3, '五营区', '0458', '230700', '230710', 129245027, 48108204, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1310, 1300, 3, '乌马河区', '0458', '230700', '230711', 128802941, 47726961, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1311, 1300, 3, '汤旺河区', '0458', '230700', '230712', 129572240, 48453651, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1312, 1300, 3, '带岭区', '0458', '230700', '230713', 129021151, 47027532, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1313, 1300, 3, '乌伊岭区', '0458', '230700', '230714', 129437847, 48591120, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1314, 1300, 3, '红星区', '0458', '230700', '230715', 129388796, 48238368, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1315, 1300, 3, '上甘岭区', '0458', '230700', '230716', 129025080, 47974859, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1316, 1300, 3, '嘉荫县', '0458', '230700', '230722', 130397684, 48891378, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1317, 1300, 3, '铁力市', '0458', '230700', '230781', 128030561, 46985772, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1318, 1225, 2, '佳木斯市', '0454', '230000', '230800', 130361634, 46809606, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1319, 1318, 3, '向阳区', '0454', '230800', '230803', 130361786, 46809645, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1320, 1318, 3, '前进区', '0454', '230800', '230804', 130377683, 46812345, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1321, 1318, 3, '东风区', '0454', '230800', '230805', 130403297, 46822476, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1322, 1318, 3, '郊区', '0454', '230800', '230811', 130351587, 46807120, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1323, 1318, 3, '桦南县', '0454', '230800', '230822', 130570112, 46240118, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1324, 1318, 3, '桦川县', '0454', '230800', '230826', 130723713, 47023039, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1325, 1318, 3, '汤原县', '0454', '230800', '230828', 129904463, 46730048, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1326, 1318, 3, '抚远市', '0454', '230800', '230833', 134294501, 48364707, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1327, 1318, 3, '同江市', '0454', '230800', '230881', 132510119, 47651131, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1328, 1318, 3, '富锦市', '0454', '230800', '230882', 132037950, 47250747, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1329, 1225, 2, '七台河市', '0464', '230000', '230900', 131015583, 45771266, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1330, 1329, 3, '新兴区', '0464', '230900', '230902', 130889481, 45794258, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1331, 1329, 3, '桃山区', '0464', '230900', '230903', 131015848, 45771217, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1332, 1329, 3, '茄子河区', '0464', '230900', '230904', 131071561, 45776587, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1333, 1329, 3, '勃利县', '0464', '230900', '230921', 130575025, 45751573, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1334, 1225, 2, '牡丹江市', '0453', '230000', '231000', 129618602, 44582962, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1335, 1334, 3, '东安区', '0453', '231000', '231002', 129623291, 44582399, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1336, 1334, 3, '阳明区', '0453', '231000', '231003', 129634645, 44596328, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1337, 1334, 3, '爱民区', '0453', '231000', '231004', 129601232, 44595443, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1338, 1334, 3, '西安区', '0453', '231000', '231005', 129613110, 44581032, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1339, 1334, 3, '东宁市', '0453', '231000', '231086', 131125295, 44063578, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1340, 1334, 3, '林口县', '0453', '231000', '231025', 130268402, 45286645, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1341, 1334, 3, '绥芬河市', '0453', '231000', '231081', 131164855, 44396864, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1342, 1334, 3, '海林市', '0453', '231000', '231083', 129387902, 44574149, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1343, 1334, 3, '宁安市', '0453', '231000', '231084', 129470019, 44346836, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1344, 1334, 3, '穆棱市', '0453', '231000', '231085', 130527085, 44919670, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1345, 1225, 2, '黑河市', '0456', '230000', '231100', 127499023, 50249585, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1346, 1345, 3, '爱辉区', '0456', '231100', '231102', 127497639, 50249027, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1347, 1345, 3, '嫩江县', '0456', '231100', '231121', 125229904, 49177461, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1348, 1345, 3, '逊克县', '0456', '231100', '231123', 128476152, 49582974, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1349, 1345, 3, '孙吴县', '0456', '231100', '231124', 127327315, 49423941, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1350, 1345, 3, '北安市', '0456', '231100', '231181', 126508737, 48245437, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1351, 1345, 3, '五大连池市', '0456', '231100', '231182', 126197694, 48512688, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1352, 1225, 2, '绥化市', '0455', '230000', '231200', 126992930, 46637393, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1353, 1352, 3, '北林区', '0455', '231200', '231202', 126990665, 46634912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1354, 1352, 3, '望奎县', '0455', '231200', '231221', 126484191, 46833520, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1355, 1352, 3, '兰西县', '0455', '231200', '231222', 126289315, 46259037, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1356, 1352, 3, '青冈县', '0455', '231200', '231223', 126112268, 46686596, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1357, 1352, 3, '庆安县', '0455', '231200', '231224', 127510024, 46879203, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1358, 1352, 3, '明水县', '0455', '231200', '231225', 125907544, 47183527, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1359, 1352, 3, '绥棱县', '0455', '231200', '231226', 127111121, 47247195, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1360, 1352, 3, '安达市', '0455', '231200', '231281', 125329926, 46410614, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1361, 1352, 3, '肇东市', '0455', '231200', '231282', 125991402, 46069471, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1362, 1352, 3, '海伦市', '0455', '231200', '231283', 126969383, 47460428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1363, 1225, 2, '大兴安岭地区', '0457', '230000', '232700', 124711526, 52335262, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1364, 1363, 3, '加格达奇区', '0457', '232700', '232701', 124126716, 50424654, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1365, 1363, 3, '呼玛县', '0457', '232700', '232721', 126662105, 51726998, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1366, 1363, 3, '塔河县', '0457', '232700', '232722', 124710516, 52335229, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1367, 1363, 3, '漠河县', '0457', '232700', '232723', 122536256, 52972074, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1368, 1, 1, '上海市', '021', '100000', '310000', 121472644, 31231706, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1369, 1368, 2, '上海市市辖区', '021', '310000', '310100', 121472644, 31231706, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1370, 1369, 3, '黄浦区', '021', '310100', '310101', 121490317, 31222771, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1371, 1369, 3, '徐汇区', '021', '310100', '310104', 121437520, 31179973, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1372, 1369, 3, '长宁区', '021', '310100', '310105', 121422200, 31218123, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1373, 1369, 3, '静安区', '021', '310100', '310106', 121448224, 31229003, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1374, 1369, 3, '普陀区', '021', '310100', '310107', 121392499, 31241701, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1375, 1369, 3, '虹口区', '021', '310100', '310109', 121491832, 31260970, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1376, 1369, 3, '杨浦区', '021', '310100', '310110', 121522797, 31270755, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1377, 1369, 3, '闵行区', '021', '310100', '310112', 121375972, 31111658, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1378, 1369, 3, '宝山区', '021', '310100', '310113', 121489934, 31398896, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1379, 1369, 3, '嘉定区', '021', '310100', '310114', 121250333, 31383524, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1380, 1369, 3, '浦东新区', '021', '310100', '310115', 121567706, 31245944, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1381, 1369, 3, '金山区', '021', '310100', '310116', 121330736, 30724697, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1382, 1369, 3, '松江区', '021', '310100', '310117', 121223543, 31030470, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1383, 1369, 3, '青浦区', '021', '310100', '310118', 121113021, 31151209, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1384, 1369, 3, '奉贤区', '021', '310100', '310120', 121458472, 30912345, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1385, 1369, 3, '崇明县', '021', '310100', '310230', 121397516, 31626946, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1386, 1368, 2, '上海市郊县', '021', '310000', '310200', 121397417, 31623587, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1387, 1, 1, '江苏省', '', '100000', '320000', 118767413, 32041544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1388, 1387, 2, '南京市', '025', '320000', '320100', 118767413, 32041544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1389, 1388, 3, '玄武区', '025', '320100', '320102', 118792199, 32050677, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1390, 1388, 3, '秦淮区', '025', '320100', '320104', 118786088, 32033817, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1391, 1388, 3, '建邺区', '025', '320100', '320105', 118732688, 32004537, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1392, 1388, 3, '鼓楼区', '025', '320100', '320106', 118769739, 32066966, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1393, 1388, 3, '浦口区', '025', '320100', '320111', 118625307, 32058390, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1394, 1388, 3, '栖霞区', '025', '320100', '320113', 118808702, 32102147, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1395, 1388, 3, '雨花台区', '025', '320100', '320114', 118772070, 31995946, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1396, 1388, 3, '江宁区', '025', '320100', '320115', 118850621, 31953418, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1397, 1388, 3, '六合区', '025', '320100', '320116', 118850650, 32340655, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1398, 1388, 3, '溧水区', '025', '320100', '320117', 119028732, 31653061, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1399, 1388, 3, '高淳区', '025', '320100', '320118', 118875890, 31327132, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1400, 1387, 2, '无锡市', '0510', '320000', '320200', 120301663, 31574729, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1401, 1400, 3, '梁溪区', '0510', '320200', '320213', 120296595, 31575706, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1402, 1400, 3, '新吴区', '0510', '320200', '320214', 120352782, 31550966, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1403, 1400, 3, '锡山区', '0510', '320200', '320205', 120357298, 31585559, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1404, 1400, 3, '惠山区', '0510', '320200', '320206', 120303543, 31681019, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1405, 1400, 3, '滨湖区', '0510', '320200', '320211', 120266053, 31550228, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1406, 1400, 3, '江阴市', '0510', '320200', '320281', 120275891, 31910984, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1407, 1400, 3, '宜兴市', '0510', '320200', '320282', 119820538, 31364384, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1408, 1387, 2, '徐州市', '0516', '320000', '320300', 117184811, 34261792, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1409, 1408, 3, '鼓楼区', '0516', '320300', '320302', 117192941, 34269397, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1410, 1408, 3, '云龙区', '0516', '320300', '320303', 117194589, 34254805, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1411, 1408, 3, '贾汪区', '0516', '320300', '320305', 117450212, 34441642, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1412, 1408, 3, '泉山区', '0516', '320300', '320311', 117182225, 34262249, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1413, 1408, 3, '铜山区', '0516', '320300', '320312', 117183894, 34192880, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1414, 1408, 3, '丰县', '0516', '320300', '320321', 116592888, 34696946, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1415, 1408, 3, '沛县', '0516', '320300', '320322', 116937182, 34729044, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1416, 1408, 3, '睢宁县', '0516', '320300', '320324', 117950660, 33899222, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1417, 1408, 3, '新沂市', '0516', '320300', '320381', 118345828, 34368779, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1418, 1408, 3, '邳州市', '0516', '320300', '320382', 117963923, 34314708, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1419, 1387, 2, '常州市', '0519', '320000', '320400', 119946973, 31772752, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1420, 1419, 3, '天宁区', '0519', '320400', '320402', 119963783, 31779632, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1421, 1419, 3, '钟楼区', '0519', '320400', '320404', 119948388, 31780960, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1422, 1419, 3, '新北区', '0519', '320400', '320411', 119974654, 31824664, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1423, 1419, 3, '武进区', '0519', '320400', '320412', 119958773, 31718566, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1424, 1419, 3, '溧阳市', '0519', '320400', '320481', 119487816, 31427081, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1425, 1419, 3, '金坛区', '0519', '320400', '320413', 119573395, 31744399, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1426, 1387, 2, '苏州市', '0512', '320000', '320500', 120619585, 31299379, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1427, 1426, 3, '虎丘区', '0512', '320500', '320505', 120566833, 31294845, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1428, 1426, 3, '吴中区', '0512', '320500', '320506', 120624621, 31270839, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1429, 1426, 3, '相城区', '0512', '320500', '320507', 120618956, 31396684, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1430, 1426, 3, '姑苏区', '0512', '320500', '320508', 120622249, 31311414, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1431, 1426, 3, '吴江区', '0512', '320500', '320509', 120641601, 31160404, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1432, 1426, 3, '常熟市', '0512', '320500', '320581', 120748520, 31658156, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1433, 1426, 3, '张家港市', '0512', '320500', '320582', 120543441, 31865553, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1434, 1426, 3, '昆山市', '0512', '320500', '320583', 120958137, 31381925, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1435, 1426, 3, '太仓市', '0512', '320500', '320585', 121112275, 31452568, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1436, 1387, 2, '南通市', '0513', '320000', '320600', 120864608, 32016212, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1437, 1436, 3, '崇川区', '0513', '320600', '320602', 120866350, 32015278, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1438, 1436, 3, '港闸区', '0513', '320600', '320611', 120833900, 32040298, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1439, 1436, 3, '通州区', '0513', '320600', '320612', 121073171, 32084287, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1440, 1436, 3, '海安县', '0513', '320600', '320621', 120465995, 32540289, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1441, 1436, 3, '如东县', '0513', '320600', '320623', 121186088, 32311832, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1442, 1436, 3, '启东市', '0513', '320600', '320681', 121659724, 31810158, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1443, 1436, 3, '如皋市', '0513', '320600', '320682', 120566324, 32391591, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1444, 1436, 3, '海门市', '0513', '320600', '320684', 121176609, 31893528, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1445, 1387, 2, '连云港市', '0518', '320000', '320700', 119178821, 34600018, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1446, 1445, 3, '连云区', '0518', '320700', '320703', 119366487, 34739529, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1447, 1445, 3, '海州区', '0518', '320700', '320706', 119179793, 34601584, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1448, 1445, 3, '赣榆区', '0518', '320700', '320707', 119128774, 34839154, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1449, 1445, 3, '东海县', '0518', '320700', '320722', 118766489, 34522859, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1450, 1445, 3, '灌云县', '0518', '320700', '320723', 119255741, 34298436, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1451, 1445, 3, '灌南县', '0518', '320700', '320724', 119352331, 34092553, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1452, 1387, 2, '淮安市', '0517', '320000', '320800', 119021265, 33597506, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1453, 1452, 3, '清河区', '0517', '320800', '320802', 119019454, 33603234, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1454, 1452, 3, '淮安区', '0517', '320800', '320803', 119146340, 33507499, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1455, 1452, 3, '淮阴区', '0517', '320800', '320804', 119020817, 33622452, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1456, 1452, 3, '清浦区', '0517', '320800', '320811', 119030498, 33580740, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1457, 1452, 3, '涟水县', '0517', '320800', '320826', 119266078, 33771308, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1458, 1452, 3, '洪泽县', '0517', '320800', '320829', 118867875, 33294975, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1459, 1452, 3, '盱眙县', '0517', '320800', '320830', 118493823, 33004390, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1460, 1452, 3, '金湖县', '0517', '320800', '320831', 119016936, 33018161, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1461, 1387, 2, '盐城市', '0515', '320000', '320900', 120139998, 33377631, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1462, 1461, 3, '亭湖区', '0515', '320900', '320902', 120136078, 33383912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1463, 1461, 3, '盐都区', '0515', '320900', '320903', 120139753, 33341288, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1464, 1461, 3, '响水县', '0515', '320900', '320921', 119579573, 34199960, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1465, 1461, 3, '滨海县', '0515', '320900', '320922', 119828434, 33989888, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1466, 1461, 3, '阜宁县', '0515', '320900', '320923', 119805338, 33785730, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1467, 1461, 3, '射阳县', '0515', '320900', '320924', 120257444, 33773779, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1468, 1461, 3, '建湖县', '0515', '320900', '320925', 119793105, 33472620, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1469, 1461, 3, '东台市', '0515', '320900', '320981', 120314101, 32853174, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1470, 1461, 3, '大丰区', '0515', '320900', '320904', 120470324, 33199531, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1471, 1387, 2, '扬州市', '0514', '320000', '321000', 119421003, 32393158, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1472, 1471, 3, '广陵区', '0514', '321000', '321002', 119442267, 32392153, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1473, 1471, 3, '邗江区', '0514', '321000', '321003', 119397777, 32377899, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1474, 1471, 3, '江都区', '0514', '321000', '321012', 119567481, 32426564, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1475, 1471, 3, '宝应县', '0514', '321000', '321023', 119321284, 33236939, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1476, 1471, 3, '仪征市', '0514', '321000', '321081', 119182443, 32271965, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1477, 1471, 3, '高邮市', '0514', '321000', '321084', 119443842, 32785164, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1478, 1387, 2, '镇江市', '0511', '320000', '321100', 119452753, 32204402, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1479, 1478, 3, '京口区', '0511', '321100', '321102', 119454571, 32206190, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1480, 1478, 3, '润州区', '0511', '321100', '321111', 119414877, 32213501, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1481, 1478, 3, '丹徒区', '0511', '321100', '321112', 119433883, 32128971, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1482, 1478, 3, '丹阳市', '0511', '321100', '321181', 119581911, 31991459, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1483, 1478, 3, '扬中市', '0511', '321100', '321182', 119828054, 32237266, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1484, 1478, 3, '句容市', '0511', '321100', '321183', 119167135, 31947355, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1485, 1387, 2, '泰州市', '0523', '320000', '321200', 119915176, 32484882, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1486, 1485, 3, '海陵区', '0523', '321200', '321202', 119920187, 32488405, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1487, 1485, 3, '高港区', '0523', '321200', '321203', 119881660, 32315700, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1488, 1485, 3, '姜堰区', '0523', '321200', '321204', 120148208, 32508483, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1489, 1485, 3, '兴化市', '0523', '321200', '321281', 119840162, 32938065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1490, 1485, 3, '靖江市', '0523', '321200', '321282', 120268250, 32018168, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1491, 1485, 3, '泰兴市', '0523', '321200', '321283', 120020228, 32168784, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1492, 1387, 2, '宿迁市', '0527', '320000', '321300', 118275162, 33963008, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1493, 1492, 3, '宿城区', '0527', '321300', '321302', 118278984, 33937726, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1494, 1492, 3, '宿豫区', '0527', '321300', '321311', 118330012, 33941071, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1495, 1492, 3, '沭阳县', '0527', '321300', '321322', 118775889, 34129097, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1496, 1492, 3, '泗阳县', '0527', '321300', '321323', 118681284, 33711433, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1497, 1492, 3, '泗洪县', '0527', '321300', '321324', 118211824, 33456538, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1498, 1, 1, '浙江省', '', '100000', '330000', 120153576, 30287459, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1499, 1498, 2, '杭州市', '0571', '330000', '330100', 120153576, 30287459, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1500, 1499, 3, '上城区', '0571', '330100', '330102', 120171465, 30250236, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1501, 1499, 3, '下城区', '0571', '330100', '330103', 120172763, 30276271, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1502, 1499, 3, '江干区', '0571', '330100', '330104', 120202633, 30266603, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1503, 1499, 3, '拱墅区', '0571', '330100', '330105', 120150053, 30314697, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1504, 1499, 3, '西湖区', '0571', '330100', '330106', 120147376, 30272934, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1505, 1499, 3, '滨江区', '0571', '330100', '330108', 120210620, 30206615, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1506, 1499, 3, '萧山区', '0571', '330100', '330109', 120270690, 30162932, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1507, 1499, 3, '余杭区', '0571', '330100', '330110', 120301737, 30421187, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1508, 1499, 3, '富阳区', '0571', '330100', '330111', 119949869, 30049871, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1509, 1499, 3, '桐庐县', '0571', '330100', '330122', 119685045, 29797437, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1510, 1499, 3, '淳安县', '0571', '330100', '330127', 119044276, 29604177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1511, 1499, 3, '建德市', '0571', '330100', '330182', 119279089, 29472284, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1512, 1499, 3, '临安市', '0571', '330100', '330185', 119715101, 30231153, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1513, 1498, 2, '宁波市', '0574', '330000', '330200', 121549792, 29868388, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1514, 1513, 3, '海曙区', '0574', '330200', '330203', 121539698, 29874452, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1515, 1513, 3, '江东区', '0574', '330200', '330204', 121572991, 29866542, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1516, 1513, 3, '江北区', '0574', '330200', '330205', 121559282, 29888361, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1517, 1513, 3, '北仑区', '0574', '330200', '330206', 121831303, 29909440, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1518, 1513, 3, '镇海区', '0574', '330200', '330211', 121713162, 29952107, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1519, 1513, 3, '鄞州区', '0574', '330200', '330212', 121558436, 29831662, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1520, 1513, 3, '象山县', '0574', '330200', '330225', 121877091, 29470206, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1521, 1513, 3, '宁海县', '0574', '330200', '330226', 121432606, 29299836, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1522, 1513, 3, '余姚市', '0574', '330200', '330281', 121156294, 30045404, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1523, 1513, 3, '慈溪市', '0574', '330200', '330282', 121248052, 30177142, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1524, 1513, 3, '奉化市', '0574', '330200', '330283', 121410890, 29662348, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1525, 1498, 2, '温州市', '0577', '330000', '330300', 120672111, 28000575, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1526, 1525, 3, '鹿城区', '0577', '330300', '330302', 120674231, 28003352, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1527, 1525, 3, '龙湾区', '0577', '330300', '330303', 120763469, 27970254, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1528, 1525, 3, '瓯海区', '0577', '330300', '330304', 120637145, 28006444, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1529, 1525, 3, '洞头区', '0577', '330300', '330305', 121156181, 27836057, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1530, 1525, 3, '永嘉县', '0577', '330300', '330324', 120690968, 28153886, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1531, 1525, 3, '平阳县', '0577', '330300', '330326', 120564387, 27669300, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1532, 1525, 3, '苍南县', '0577', '330300', '330327', 120406256, 27507743, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1533, 1525, 3, '文成县', '0577', '330300', '330328', 120092450, 27789133, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1534, 1525, 3, '泰顺县', '0577', '330300', '330329', 119716240, 27557309, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1535, 1525, 3, '瑞安市', '0577', '330300', '330381', 120646171, 27779321, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1536, 1525, 3, '乐清市', '0577', '330300', '330382', 120967147, 28116083, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1537, 1498, 2, '嘉兴市', '0573', '330000', '330400', 120750865, 30762653, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1538, 1537, 3, '南湖区', '0573', '330400', '330402', 120749953, 30764652, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1539, 1537, 3, '秀洲区', '0573', '330400', '330411', 120720431, 30763323, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1540, 1537, 3, '嘉善县', '0573', '330400', '330421', 120921871, 30841352, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1541, 1537, 3, '海盐县', '0573', '330400', '330424', 120942017, 30522223, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1542, 1537, 3, '海宁市', '0573', '330400', '330481', 120688821, 30525544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1543, 1537, 3, '平湖市', '0573', '330400', '330482', 121014666, 30698921, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1544, 1537, 3, '桐乡市', '0573', '330400', '330483', 120551085, 30629065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1545, 1498, 2, '湖州市', '0572', '330000', '330500', 120102398, 30867198, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1546, 1545, 3, '吴兴区', '0572', '330500', '330502', 120101416, 30867252, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1547, 1545, 3, '南浔区', '0572', '330500', '330503', 120417195, 30872742, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1548, 1545, 3, '德清县', '0572', '330500', '330521', 119967662, 30534927, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1549, 1545, 3, '长兴县', '0572', '330500', '330522', 119910122, 31004750, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1550, 1545, 3, '安吉县', '0572', '330500', '330523', 119687891, 30631974, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1551, 1498, 2, '绍兴市', '0575', '330000', '330600', 120582112, 29997117, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1552, 1551, 3, '越城区', '0575', '330600', '330602', 120585315, 29996993, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1553, 1551, 3, '柯桥区', '0575', '330600', '330603', 120476075, 30078038, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1554, 1551, 3, '上虞区', '0575', '330600', '330604', 120874185, 30016769, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1555, 1551, 3, '新昌县', '0575', '330600', '330624', 120905665, 29501205, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1556, 1551, 3, '诸暨市', '0575', '330600', '330681', 120244326, 29713662, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1557, 1551, 3, '嵊州市', '0575', '330600', '330683', 120828880, 29586606, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1558, 1498, 2, '金华市', '0579', '330000', '330700', 119649506, 29089524, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1559, 1558, 3, '婺城区', '0579', '330700', '330702', 119652579, 29082607, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1560, 1558, 3, '金东区', '0579', '330700', '330703', 119681264, 29095835, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1561, 1558, 3, '武义县', '0579', '330700', '330723', 119819159, 28896563, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1562, 1558, 3, '浦江县', '0579', '330700', '330726', 119893363, 29451254, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1563, 1558, 3, '磐安县', '0579', '330700', '330727', 120445130, 29052627, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1564, 1558, 3, '兰溪市', '0579', '330700', '330781', 119460521, 29210065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1565, 1558, 3, '义乌市', '0579', '330700', '330782', 120074911, 29306863, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1566, 1558, 3, '东阳市', '0579', '330700', '330783', 120233340, 29262546, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1567, 1558, 3, '永康市', '0579', '330700', '330784', 120036328, 28895293, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1568, 1498, 2, '衢州市', '0570', '330000', '330800', 118872630, 28941708, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1569, 1568, 3, '柯城区', '0570', '330800', '330802', 118873041, 28944539, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1570, 1568, 3, '衢江区', '0570', '330800', '330803', 118957683, 28973195, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1571, 1568, 3, '常山县', '0570', '330800', '330822', 118521654, 28900039, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1572, 1568, 3, '开化县', '0570', '330800', '330824', 118414435, 29136503, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1573, 1568, 3, '龙游县', '0570', '330800', '330825', 119172525, 29031364, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1574, 1568, 3, '江山市', '0570', '330800', '330881', 118627879, 28734674, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1575, 1498, 2, '舟山市', '0580', '330000', '330900', 122106863, 30016028, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1576, 1575, 3, '定海区', '0580', '330900', '330902', 122108496, 30016423, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1577, 1575, 3, '普陀区', '0580', '330900', '330903', 122301953, 29945614, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1578, 1575, 3, '岱山县', '0580', '330900', '330921', 122201132, 30242865, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1579, 1575, 3, '嵊泗县', '0580', '330900', '330922', 122457809, 30727166, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1580, 1498, 2, '台州市', '0576', '330000', '331000', 121428599, 28661378, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1581, 1580, 3, '椒江区', '0576', '331000', '331002', 121431049, 28676150, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1582, 1580, 3, '黄岩区', '0576', '331000', '331003', 121262138, 28644880, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1583, 1580, 3, '路桥区', '0576', '331000', '331004', 121372920, 28581799, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1584, 1580, 3, '玉环县', '0576', '331000', '331021', 121232337, 28128420, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1585, 1580, 3, '三门县', '0576', '331000', '331022', 121376429, 29118955, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1586, 1580, 3, '天台县', '0576', '331000', '331023', 121031227, 29141126, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1587, 1580, 3, '仙居县', '0576', '331000', '331024', 120735074, 28849213, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1588, 1580, 3, '温岭市', '0576', '331000', '331081', 121373611, 28368781, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1589, 1580, 3, '临海市', '0576', '331000', '331082', 121131229, 28845441, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1590, 1498, 2, '丽水市', '0578', '330000', '331100', 119921786, 28451993, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1591, 1590, 3, '莲都区', '0578', '331100', '331102', 119922293, 28451103, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1592, 1590, 3, '青田县', '0578', '331100', '331121', 120291939, 28135247, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1593, 1590, 3, '缙云县', '0578', '331100', '331122', 120078965, 28654208, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1594, 1590, 3, '遂昌县', '0578', '331100', '331123', 119275890, 28592400, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1595, 1590, 3, '松阳县', '0578', '331100', '331124', 119485292, 28449937, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1596, 1590, 3, '云和县', '0578', '331100', '331125', 119569458, 28111077, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1597, 1590, 3, '庆元县', '0578', '331100', '331126', 119067233, 27618231, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1598, 1590, 3, '景宁畲族自治县', '0578', '331100', '331127', 119634669, 27977247, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1599, 1590, 3, '龙泉市', '0578', '331100', '331181', 119132319, 28069177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1600, 1, 1, '安徽省', '', '100000', '340000', 117283042, 31861190, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1601, 1600, 2, '合肥市', '0551', '340000', '340100', 117283042, 31861190, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1602, 1601, 3, '瑶海区', '0551', '340100', '340102', 117315358, 31869610, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1603, 1601, 3, '庐阳区', '0551', '340100', '340103', 117283776, 31869011, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1604, 1601, 3, '蜀山区', '0551', '340100', '340104', 117262072, 31855868, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1605, 1601, 3, '包河区', '0551', '340100', '340111', 117285751, 31829560, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1606, 1601, 3, '长丰县', '0551', '340100', '340121', 117164699, 32478548, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1607, 1601, 3, '肥东县', '0551', '340100', '340122', 117463222, 31883992, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1608, 1601, 3, '肥西县', '0551', '340100', '340123', 117166118, 31719646, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1609, 1601, 3, '庐江县', '0551', '340100', '340124', 117289844, 31251488, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1610, 1601, 3, '巢湖市', '0551', '340100', '340181', 117874155, 31600518, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1611, 1600, 2, '芜湖市', '0553', '340000', '340200', 118376451, 31326319, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1612, 1611, 3, '镜湖区', '0553', '340200', '340202', 118376343, 31325590, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1613, 1611, 3, '弋江区', '0553', '340200', '340203', 118377476, 31313394, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1614, 1611, 3, '鸠江区', '0553', '340200', '340207', 118400174, 31362716, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1615, 1611, 3, '三山区', '0553', '340200', '340208', 118233987, 31225423, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1616, 1611, 3, '芜湖县', '0553', '340200', '340221', 118572301, 31145262, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1617, 1611, 3, '繁昌县', '0553', '340200', '340222', 118201349, 31080896, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1618, 1611, 3, '南陵县', '0553', '340200', '340223', 118337104, 30919638, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1619, 1611, 3, '无为县', '0553', '340200', '340225', 117911432, 31303075, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1620, 1600, 2, '蚌埠市', '0552', '340000', '340300', 117363228, 32939667, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1621, 1620, 3, '龙子湖区', '0552', '340300', '340302', 117382312, 32950452, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1622, 1620, 3, '蚌山区', '0552', '340300', '340303', 117355789, 32938066, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1623, 1620, 3, '禹会区', '0552', '340300', '340304', 117352590, 32931933, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1624, 1620, 3, '淮上区', '0552', '340300', '340311', 117347090, 32963147, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1625, 1620, 3, '怀远县', '0552', '340300', '340321', 117200171, 32956933, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1626, 1620, 3, '五河县', '0552', '340300', '340322', 117888809, 33146202, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1627, 1620, 3, '固镇县', '0552', '340300', '340323', 117315962, 33318679, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1628, 1600, 2, '淮南市', '0554', '340000', '340400', 117018329, 32647574, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1629, 1628, 3, '大通区', '0554', '340400', '340402', 117052927, 32632066, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1630, 1628, 3, '田家庵区', '0554', '340400', '340403', 117018318, 32644342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1631, 1628, 3, '谢家集区', '0554', '340400', '340404', 116865354, 32598289, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1632, 1628, 3, '八公山区', '0554', '340400', '340405', 116841111, 32628228, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1633, 1628, 3, '潘集区', '0554', '340400', '340406', 116816879, 32782117, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1634, 1628, 3, '凤台县', '0554', '340400', '340421', 116722769, 32705382, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1635, 1628, 3, '寿县', '0554', '340400', '340422', 116785349, 32577303, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1636, 1600, 2, '马鞍山市', '0555', '340000', '340500', 118507906, 31689362, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1637, 1636, 3, '花山区', '0555', '340500', '340503', 118511308, 31699020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1638, 1636, 3, '雨山区', '0555', '340500', '340504', 118493104, 31685912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1639, 1636, 3, '博望区', '0555', '340500', '340506', 118843742, 31562321, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1640, 1636, 3, '当涂县', '0555', '340500', '340521', 118489873, 31556167, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1641, 1636, 3, '含山县', '0555', '340500', '340522', 118105545, 31727758, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1642, 1636, 3, '和县', '0555', '340500', '340523', 118362998, 31716634, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1643, 1600, 2, '淮北市', '0561', '340000', '340600', 116794664, 33971707, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1644, 1643, 3, '杜集区', '0561', '340600', '340602', 116833925, 33991218, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1645, 1643, 3, '相山区', '0561', '340600', '340603', 116790775, 33970916, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1646, 1643, 3, '烈山区', '0561', '340600', '340604', 116809465, 33889529, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1647, 1643, 3, '濉溪县', '0561', '340600', '340621', 116767435, 33916407, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1648, 1600, 2, '铜陵市', '0562', '340000', '340700', 117816576, 30929935, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1649, 1648, 3, '铜官区', '0562', '340700', '340705', 117818427, 30931820, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1650, 1648, 3, '郊区', '0562', '340700', '340711', 117807070, 30908927, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1651, 1648, 3, '义安区', '0562', '340700', '340706', 117792288, 30952338, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1652, 1648, 3, '枞阳县', '0562', '340700', '340722', 117222027, 30700615, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1653, 1600, 2, '安庆市', '0556', '340000', '340800', 117043551, 30508830, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1654, 1653, 3, '迎江区', '0556', '340800', '340802', 117044965, 30506375, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1655, 1653, 3, '大观区', '0556', '340800', '340803', 117034512, 30505632, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1656, 1653, 3, '宜秀区', '0556', '340800', '340811', 117070003, 30541323, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1657, 1653, 3, '怀宁县', '0556', '340800', '340822', 116828664, 30734994, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1658, 1653, 3, '潜山县', '0556', '340800', '340824', 116573666, 30638222, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1659, 1653, 3, '太湖县', '0556', '340800', '340825', 116305225, 30451869, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1660, 1653, 3, '宿松县', '0556', '340800', '340826', 116120204, 30158327, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1661, 1653, 3, '望江县', '0556', '340800', '340827', 116690927, 30124910, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1662, 1653, 3, '岳西县', '0556', '340800', '340828', 116360482, 30848502, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1663, 1653, 3, '桐城市', '0556', '340800', '340881', 116959656, 31050576, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1664, 1600, 2, '黄山市', '0559', '340000', '341000', 118317325, 29709239, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1665, 1664, 3, '屯溪区', '0559', '341000', '341002', 118317354, 29709186, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1666, 1664, 3, '黄山区', '0559', '341000', '341003', 118136639, 30294517, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1667, 1664, 3, '徽州区', '0559', '341000', '341004', 118339743, 29825201, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1668, 1664, 3, '歙县', '0559', '341000', '341021', 118428025, 29867748, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1669, 1664, 3, '休宁县', '0559', '341000', '341022', 118188531, 29788878, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1670, 1664, 3, '黟县', '0559', '341000', '341023', 117942911, 29923812, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1671, 1664, 3, '祁门县', '0559', '341000', '341024', 117717237, 29853472, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1672, 1600, 2, '滁州市', '0550', '340000', '341100', 118316264, 32303627, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1673, 1672, 3, '琅琊区', '0550', '341100', '341102', 118316475, 32303797, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1674, 1672, 3, '南谯区', '0550', '341100', '341103', 118296955, 32329841, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1675, 1672, 3, '来安县', '0550', '341100', '341122', 118433293, 32450231, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1676, 1672, 3, '全椒县', '0550', '341100', '341124', 118268576, 32093850, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1677, 1672, 3, '定远县', '0550', '341100', '341125', 117683713, 32527105, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1678, 1672, 3, '凤阳县', '0550', '341100', '341126', 117562461, 32867146, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1679, 1672, 3, '天长市', '0550', '341100', '341181', 119011212, 32681500, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1680, 1672, 3, '明光市', '0550', '341100', '341182', 117998048, 32781205, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1681, 1600, 2, '阜阳市', '1558', '340000', '341200', 115819729, 32896969, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1682, 1681, 3, '颍州区', '1558', '341200', '341202', 115813914, 32891238, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1683, 1681, 3, '颍东区', '1558', '341200', '341203', 115858747, 32908861, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1684, 1681, 3, '颍泉区', '1558', '341200', '341204', 115804525, 32924796, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1685, 1681, 3, '临泉县', '1558', '341200', '341221', 115261688, 33062697, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1686, 1681, 3, '太和县', '1558', '341200', '341222', 115627243, 33162290, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1687, 1681, 3, '阜南县', '1558', '341200', '341225', 115590534, 32638102, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1688, 1681, 3, '颍上县', '1558', '341200', '341226', 116259122, 32637065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1689, 1681, 3, '界首市', '1558', '341200', '341282', 115362117, 33261530, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1690, 1600, 2, '宿州市', '0557', '340000', '341300', 116984084, 33633891, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1691, 1690, 3, '埇桥区', '0557', '341300', '341302', 116983309, 33633853, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1692, 1690, 3, '砀山县', '0557', '341300', '341321', 116351113, 34426247, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1693, 1690, 3, '萧县', '0557', '341300', '341322', 116945399, 34183266, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1694, 1690, 3, '灵璧县', '0557', '341300', '341323', 117551493, 33540629, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1695, 1690, 3, '泗县', '0557', '341300', '341324', 117885443, 33477580, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1696, 1600, 2, '六安市', '0564', '340000', '341500', 116507676, 31752889, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1697, 1696, 3, '金安区', '0564', '341500', '341502', 116503288, 31754491, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1698, 1696, 3, '裕安区', '0564', '341500', '341503', 116494543, 31750692, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1699, 1696, 3, '叶集区', '0564', '341500', '341504', 115913594, 31847680, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1700, 1696, 3, '霍邱县', '0564', '341500', '341522', 116278875, 32341305, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1701, 1696, 3, '舒城县', '0564', '341500', '341523', 116944088, 31462848, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1702, 1696, 3, '金寨县', '0564', '341500', '341524', 115878514, 31681624, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1703, 1696, 3, '霍山县', '0564', '341500', '341525', 116333078, 31402456, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1704, 1600, 2, '亳州市', '0558', '340000', '341600', 115782939, 33869338, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1705, 1704, 3, '谯城区', '0558', '341600', '341602', 115781214, 33869284, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1706, 1704, 3, '涡阳县', '0558', '341600', '341621', 116211551, 33502831, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1707, 1704, 3, '蒙城县', '0558', '341600', '341622', 116560337, 33260814, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1708, 1704, 3, '利辛县', '0558', '341600', '341623', 116207782, 33143503, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1709, 1600, 2, '池州市', '0566', '340000', '341700', 117489157, 30656037, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1710, 1709, 3, '贵池区', '0566', '341700', '341702', 117488342, 30657378, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1711, 1709, 3, '东至县', '0566', '341700', '341721', 117021476, 30096568, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1712, 1709, 3, '石台县', '0566', '341700', '341722', 117482907, 30210324, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1713, 1709, 3, '青阳县', '0566', '341700', '341723', 117857395, 30638180, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1714, 1600, 2, '宣城市', '0563', '340000', '341800', 118757995, 30945667, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1715, 1714, 3, '宣州区', '0563', '341800', '341802', 118758412, 30946003, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1716, 1714, 3, '郎溪县', '0563', '341800', '341821', 119185024, 31127834, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1717, 1714, 3, '广德县', '0563', '341800', '341822', 119417521, 30893116, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1718, 1714, 3, '泾县', '0563', '341800', '341823', 118412397, 30685975, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1719, 1714, 3, '绩溪县', '0563', '341800', '341824', 118594705, 30065267, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1720, 1714, 3, '旌德县', '0563', '341800', '341825', 118543081, 30288057, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1721, 1714, 3, '宁国市', '0563', '341800', '341881', 118983407, 30626529, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1722, 1, 1, '福建省', '', '100000', '350000', 119306239, 26075302, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1723, 1722, 2, '福州市', '0591', '350000', '350100', 119306239, 26075302, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1724, 1723, 3, '鼓楼区', '0591', '350100', '350102', 119299290, 26082284, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1725, 1723, 3, '台江区', '0591', '350100', '350103', 119310156, 26058616, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1726, 1723, 3, '仓山区', '0591', '350100', '350104', 119320988, 26038912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1727, 1723, 3, '马尾区', '0591', '350100', '350105', 119458725, 25991975, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1728, 1723, 3, '晋安区', '0591', '350100', '350111', 119328597, 26078837, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1729, 1723, 3, '闽侯县', '0591', '350100', '350121', 119145117, 26148567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1730, 1723, 3, '连江县', '0591', '350100', '350122', 119538365, 26202109, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1731, 1723, 3, '罗源县', '0591', '350100', '350123', 119552645, 26487234, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1732, 1723, 3, '闽清县', '0591', '350100', '350124', 118868416, 26223793, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1733, 1723, 3, '永泰县', '0591', '350100', '350125', 118939089, 25864825, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1734, 1723, 3, '平潭县', '0591', '350100', '350128', 119791197, 25503672, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1735, 1723, 3, '福清市', '0591', '350100', '350181', 119376992, 25720402, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1736, 1723, 3, '长乐市', '0591', '350100', '350182', 119510849, 25960583, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1737, 1722, 2, '厦门市', '0592', '350000', '350200', 118110220, 24490474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1738, 1737, 3, '思明区', '0592', '350200', '350203', 118087828, 24462059, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1739, 1737, 3, '海沧区', '0592', '350200', '350205', 118036364, 24492512, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1740, 1737, 3, '湖里区', '0592', '350200', '350206', 118109430, 24512764, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1741, 1737, 3, '集美区', '0592', '350200', '350211', 118100869, 24572874, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1742, 1737, 3, '同安区', '0592', '350200', '350212', 118150455, 24729333, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1743, 1737, 3, '翔安区', '0592', '350200', '350213', 118242811, 24637479, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1744, 1722, 2, '莆田市', '0594', '350000', '350300', 119007558, 25431011, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1745, 1744, 3, '城厢区', '0594', '350300', '350302', 119001028, 25433737, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1746, 1744, 3, '涵江区', '0594', '350300', '350303', 119119102, 25459273, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1747, 1744, 3, '荔城区', '0594', '350300', '350304', 119020047, 25430047, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1748, 1744, 3, '秀屿区', '0594', '350300', '350305', 119092607, 25316141, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1749, 1744, 3, '仙游县', '0594', '350300', '350322', 118694331, 25356529, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1750, 1722, 2, '三明市', '0598', '350000', '350400', 117635001, 26265444, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1751, 1750, 3, '梅列区', '0598', '350400', '350402', 117636870, 26269208, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1752, 1750, 3, '三元区', '0598', '350400', '350403', 117607418, 26234191, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1753, 1750, 3, '明溪县', '0598', '350400', '350421', 117201845, 26357375, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1754, 1750, 3, '清流县', '0598', '350400', '350423', 116815821, 26177610, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1755, 1750, 3, '宁化县', '0598', '350400', '350424', 116659725, 26259932, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1756, 1750, 3, '大田县', '0598', '350400', '350425', 117849355, 25690803, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1757, 1750, 3, '尤溪县', '0598', '350400', '350426', 118188577, 26169261, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1758, 1750, 3, '沙县', '0598', '350400', '350427', 117789095, 26397361, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1759, 1750, 3, '将乐县', '0598', '350400', '350428', 117473558, 26728667, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1760, 1750, 3, '泰宁县', '0598', '350400', '350429', 117177522, 26897995, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1761, 1750, 3, '建宁县', '0598', '350400', '350430', 116845832, 26831398, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1762, 1750, 3, '永安市', '0598', '350400', '350481', 117364447, 25974075, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1763, 1722, 2, '泉州市', '0595', '350000', '350500', 118589421, 24908853, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1764, 1763, 3, '鲤城区', '0595', '350500', '350502', 118588929, 24907645, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1765, 1763, 3, '丰泽区', '0595', '350500', '350503', 118605147, 24896041, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1766, 1763, 3, '洛江区', '0595', '350500', '350504', 118670312, 24941153, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1767, 1763, 3, '泉港区', '0595', '350500', '350505', 118912285, 25126859, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1768, 1763, 3, '惠安县', '0595', '350500', '350521', 118798954, 25028718, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1769, 1763, 3, '安溪县', '0595', '350500', '350524', 118186014, 25056824, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1770, 1763, 3, '永春县', '0595', '350500', '350525', 118295030, 25320721, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1771, 1763, 3, '德化县', '0595', '350500', '350526', 118242986, 25489004, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1772, 1763, 3, '金门县', '0595', '350500', '350527', 118323221, 24436417, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1773, 1763, 3, '石狮市', '0595', '350500', '350581', 118628402, 24731978, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1774, 1763, 3, '晋江市', '0595', '350500', '350582', 118577338, 24807322, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1775, 1763, 3, '南安市', '0595', '350500', '350583', 118387031, 24959494, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1776, 1722, 2, '漳州市', '0596', '350000', '350600', 117661801, 24510897, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1777, 1776, 3, '芗城区', '0596', '350600', '350602', 117656461, 24509955, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1778, 1776, 3, '龙文区', '0596', '350600', '350603', 117671387, 24515656, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1779, 1776, 3, '云霄县', '0596', '350600', '350622', 117340946, 23950486, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1780, 1776, 3, '漳浦县', '0596', '350600', '350623', 117614023, 24117907, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1781, 1776, 3, '诏安县', '0596', '350600', '350624', 117176083, 23710834, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1782, 1776, 3, '长泰县', '0596', '350600', '350625', 117755913, 24621475, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1783, 1776, 3, '东山县', '0596', '350600', '350626', 117427679, 23702845, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1784, 1776, 3, '南靖县', '0596', '350600', '350627', 117365462, 24516425, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1785, 1776, 3, '平和县', '0596', '350600', '350628', 117313549, 24366158, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1786, 1776, 3, '华安县', '0596', '350600', '350629', 117536310, 25001416, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1787, 1776, 3, '龙海市', '0596', '350600', '350681', 117817292, 24445341, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1788, 1722, 2, '南平市', '0599', '350000', '350700', 118178459, 26635627, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1789, 1788, 3, '延平区', '0599', '350700', '350702', 118178918, 26636079, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1790, 1788, 3, '建阳区', '0599', '350700', '350703', 118122670, 27332067, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1791, 1788, 3, '顺昌县', '0599', '350700', '350721', 117807710, 26792851, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1792, 1788, 3, '浦城县', '0599', '350700', '350722', 118536822, 27920412, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1793, 1788, 3, '光泽县', '0599', '350700', '350723', 117337897, 27542803, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1794, 1788, 3, '松溪县', '0599', '350700', '350724', 118783491, 27525785, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1795, 1788, 3, '政和县', '0599', '350700', '350725', 118858661, 27365398, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1796, 1788, 3, '邵武市', '0599', '350700', '350781', 117491544, 27337952, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1797, 1788, 3, '武夷山市', '0599', '350700', '350782', 118032796, 27751733, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1798, 1788, 3, '建瓯市', '0599', '350700', '350783', 118321765, 27035020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1799, 1722, 2, '龙岩市', '0597', '350000', '350800', 117029780, 25091603, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1800, 1799, 3, '新罗区', '0597', '350800', '350802', 117030721, 25091800, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1801, 1799, 3, '永定区', '0597', '350800', '350803', 116732691, 24720442, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1802, 1799, 3, '长汀县', '0597', '350800', '350821', 116361007, 25842278, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1803, 1799, 3, '上杭县', '0597', '350800', '350823', 116424774, 25050019, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1804, 1799, 3, '武平县', '0597', '350800', '350824', 116100928, 25088650, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1805, 1799, 3, '连城县', '0597', '350800', '350825', 116756687, 25708506, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1806, 1799, 3, '漳平市', '0597', '350800', '350881', 117420730, 25291597, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1807, 1722, 2, '宁德市', '0593', '350000', '350900', 119527082, 26659240, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1808, 1807, 3, '蕉城区', '0593', '350900', '350902', 119527225, 26659253, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1809, 1807, 3, '霞浦县', '0593', '350900', '350921', 120005214, 26882068, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1810, 1807, 3, '古田县', '0593', '350900', '350922', 118743156, 26577491, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1811, 1807, 3, '屏南县', '0593', '350900', '350923', 118987544, 26910826, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1812, 1807, 3, '寿宁县', '0593', '350900', '350924', 119506733, 27457798, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1813, 1807, 3, '周宁县', '0593', '350900', '350925', 119338239, 27103106, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1814, 1807, 3, '柘荣县', '0593', '350900', '350926', 119898226, 27236163, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1815, 1807, 3, '福安市', '0593', '350900', '350981', 119650798, 27084246, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1816, 1807, 3, '福鼎市', '0593', '350900', '350982', 120219761, 27318884, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1817, 1, 1, '江西省', '', '100000', '360000', 115892151, 28676493, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1818, 1817, 2, '南昌市', '0791', '360000', '360100', 115892151, 28676493, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1819, 1818, 3, '东湖区', '0791', '360100', '360102', 115889675, 28682988, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1820, 1818, 3, '西湖区', '0791', '360100', '360103', 115910650, 28662901, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1821, 1818, 3, '青云谱区', '0791', '360100', '360104', 115907292, 28635724, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1822, 1818, 3, '湾里区', '0791', '360100', '360105', 115731324, 28714803, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1823, 1818, 3, '青山湖区', '0791', '360100', '360111', 115949044, 28689292, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1824, 1818, 3, '南昌县', '0791', '360100', '360121', 115942465, 28543781, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1825, 1818, 3, '新建区', '0791', '360100', '360112', 115820806, 28690788, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1826, 1818, 3, '安义县', '0791', '360100', '360123', 115553109, 28841334, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1827, 1818, 3, '进贤县', '0791', '360100', '360124', 116267671, 28365681, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1828, 1817, 2, '景德镇市', '0798', '360000', '360200', 117214664, 29292560, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1829, 1828, 3, '昌江区', '0798', '360200', '360202', 117195023, 29288465, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1830, 1828, 3, '珠山区', '0798', '360200', '360203', 117214814, 29292812, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1831, 1828, 3, '浮梁县', '0798', '360200', '360222', 117217611, 29352251, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1832, 1828, 3, '乐平市', '0798', '360200', '360281', 117129376, 28967361, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1833, 1817, 2, '萍乡市', '0799', '360000', '360300', 113852186, 27622946, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1834, 1833, 3, '安源区', '0799', '360300', '360302', 113855044, 27625826, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1835, 1833, 3, '湘东区', '0799', '360300', '360313', 113745600, 27639319, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1836, 1833, 3, '莲花县', '0799', '360300', '360321', 113955582, 27127807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1837, 1833, 3, '上栗县', '0799', '360300', '360322', 113800525, 27877041, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1838, 1833, 3, '芦溪县', '0799', '360300', '360323', 114041206, 27633633, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1839, 1817, 2, '九江市', '0792', '360000', '360400', 115992811, 29712034, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1840, 1839, 3, '濂溪区', '0792', '360400', '360402', 115990120, 29676175, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1841, 1839, 3, '浔阳区', '0792', '360400', '360403', 115995947, 29724650, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1842, 1839, 3, '九江县', '0792', '360400', '360421', 115892977, 29610264, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1843, 1839, 3, '武宁县', '0792', '360400', '360423', 115105646, 29260182, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1844, 1839, 3, '修水县', '0792', '360400', '360424', 114573428, 29032729, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1845, 1839, 3, '永修县', '0792', '360400', '360425', 115809055, 29018212, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1846, 1839, 3, '德安县', '0792', '360400', '360426', 115762611, 29327474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1847, 1839, 3, '庐山市', '0792', '360400', '360427', 116043743, 29456169, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1848, 1839, 3, '都昌县', '0792', '360400', '360428', 116205114, 29275105, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1849, 1839, 3, '湖口县', '0792', '360400', '360429', 116244313, 29726300, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1850, 1839, 3, '彭泽县', '0792', '360400', '360430', 116555840, 29898865, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1851, 1839, 3, '瑞昌市', '0792', '360400', '360481', 115669081, 29676599, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1852, 1839, 3, '共青城市', '0792', '360400', '360482', 115805712, 29247884, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1853, 1817, 2, '新余市', '0790', '360000', '360500', 114930835, 27810834, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1854, 1853, 3, '渝水区', '0790', '360500', '360502', 114923923, 27819171, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1855, 1853, 3, '分宜县', '0790', '360500', '360521', 114675262, 27811301, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1856, 1817, 2, '鹰潭市', '0701', '360000', '360600', 117033838, 28238638, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1857, 1856, 3, '月湖区', '0701', '360600', '360602', 117034112, 28239076, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1858, 1856, 3, '余江县', '0701', '360600', '360622', 116822763, 28206177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1859, 1856, 3, '贵溪市', '0701', '360600', '360681', 117212103, 28283693, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1860, 1817, 2, '赣州市', '0797', '360000', '360700', 114940278, 25850970, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1861, 1860, 3, '章贡区', '0797', '360700', '360702', 114938720, 25851367, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1862, 1860, 3, '南康区', '0797', '360700', '360703', 114756933, 25661721, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1863, 1860, 3, '赣县', '0797', '360700', '360721', 115018461, 25865432, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1864, 1860, 3, '信丰县', '0797', '360700', '360722', 114930893, 25380230, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1865, 1860, 3, '大余县', '0797', '360700', '360723', 114362243, 25395937, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1866, 1860, 3, '上犹县', '0797', '360700', '360724', 114540537, 25794284, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1867, 1860, 3, '崇义县', '0797', '360700', '360725', 114307348, 25687911, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1868, 1860, 3, '安远县', '0797', '360700', '360726', 115392328, 25134591, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1869, 1860, 3, '龙南县', '0797', '360700', '360727', 114792657, 24904760, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1870, 1860, 3, '定南县', '0797', '360700', '360728', 115032670, 24774277, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1871, 1860, 3, '全南县', '0797', '360700', '360729', 114531589, 24742651, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1872, 1860, 3, '宁都县', '0797', '360700', '360730', 116018782, 26472054, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1873, 1860, 3, '于都县', '0797', '360700', '360731', 115411198, 25955033, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1874, 1860, 3, '兴国县', '0797', '360700', '360732', 115351896, 26330489, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1875, 1860, 3, '会昌县', '0797', '360700', '360733', 115791158, 25599125, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1876, 1860, 3, '寻乌县', '0797', '360700', '360734', 115651399, 24954136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1877, 1860, 3, '石城县', '0797', '360700', '360735', 116342249, 26326582, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1878, 1860, 3, '瑞金市', '0797', '360700', '360781', 116034854, 25875278, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1879, 1817, 2, '吉安市', '0796', '360000', '360800', 114986373, 27111699, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1880, 1879, 3, '吉州区', '0796', '360800', '360802', 114987331, 27112367, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1881, 1879, 3, '青原区', '0796', '360800', '360803', 115016306, 27105879, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1882, 1879, 3, '吉安县', '0796', '360800', '360821', 114905117, 27040042, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1883, 1879, 3, '吉水县', '0796', '360800', '360822', 115134569, 27213445, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1884, 1879, 3, '峡江县', '0796', '360800', '360823', 115319331, 27580862, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1885, 1879, 3, '新干县', '0796', '360800', '360824', 115399294, 27755758, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1886, 1879, 3, '永丰县', '0796', '360800', '360825', 115435559, 27321087, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1887, 1879, 3, '泰和县', '0796', '360800', '360826', 114901393, 26790164, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1888, 1879, 3, '遂川县', '0796', '360800', '360827', 114516890, 26323705, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1889, 1879, 3, '万安县', '0796', '360800', '360828', 114784694, 26462085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1890, 1879, 3, '安福县', '0796', '360800', '360829', 114613840, 27382746, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1891, 1879, 3, '永新县', '0796', '360800', '360830', 114242534, 26944721, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1892, 1879, 3, '井冈山市', '0796', '360800', '360881', 114284421, 26745919, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1893, 1817, 2, '宜春市', '0795', '360000', '360900', 114391136, 27804300, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1894, 1893, 3, '袁州区', '0795', '360900', '360902', 114387379, 27800117, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1895, 1893, 3, '奉新县', '0795', '360900', '360921', 115389899, 28700672, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1896, 1893, 3, '万载县', '0795', '360900', '360922', 114449012, 28104528, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1897, 1893, 3, '上高县', '0795', '360900', '360923', 114932653, 28234789, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1898, 1893, 3, '宜丰县', '0795', '360900', '360924', 114787381, 28388289, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1899, 1893, 3, '靖安县', '0795', '360900', '360925', 115361744, 28860540, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1900, 1893, 3, '铜鼓县', '0795', '360900', '360926', 114370140, 28520956, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1901, 1893, 3, '丰城市', '0795', '360900', '360981', 115786005, 28191584, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1902, 1893, 3, '樟树市', '0795', '360900', '360982', 115543388, 28055898, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1903, 1893, 3, '高安市', '0795', '360900', '360983', 115381527, 28420951, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1904, 1817, 2, '抚州市', '0794', '360000', '361000', 116358351, 27983850, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1905, 1904, 3, '临川区', '0794', '361000', '361002', 116361404, 27981919, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1906, 1904, 3, '南城县', '0794', '361000', '361021', 116639450, 27555310, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1907, 1904, 3, '黎川县', '0794', '361000', '361022', 116914570, 27292561, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1908, 1904, 3, '南丰县', '0794', '361000', '361023', 116532994, 27210132, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1909, 1904, 3, '崇仁县', '0794', '361000', '361024', 116059109, 27760907, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1910, 1904, 3, '乐安县', '0794', '361000', '361025', 115838432, 27420101, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1911, 1904, 3, '宜黄县', '0794', '361000', '361026', 116223023, 27546512, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1912, 1904, 3, '金溪县', '0794', '361000', '361027', 116778751, 27907387, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1913, 1904, 3, '资溪县', '0794', '361000', '361028', 117066095, 27706530, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1914, 1904, 3, '东乡县', '0794', '361000', '361029', 116605341, 28232500, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1915, 1904, 3, '广昌县', '0794', '361000', '361030', 116327291, 26838426, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1916, 1817, 2, '上饶市', '0793', '360000', '361100', 117971185, 28444420, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1917, 1916, 3, '信州区', '0793', '361100', '361102', 117970522, 28445378, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1918, 1916, 3, '广丰区', '0793', '361100', '361103', 118189852, 28440285, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1919, 1916, 3, '上饶县', '0793', '361100', '361121', 117906120, 28453897, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1920, 1916, 3, '玉山县', '0793', '361100', '361123', 118244408, 28673479, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1921, 1916, 3, '铅山县', '0793', '361100', '361124', 117711906, 28310892, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1922, 1916, 3, '横峰县', '0793', '361100', '361125', 117608247, 28415103, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1923, 1916, 3, '弋阳县', '0793', '361100', '361126', 117435002, 28402391, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1924, 1916, 3, '余干县', '0793', '361100', '361127', 116691072, 28691730, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1925, 1916, 3, '鄱阳县', '0793', '361100', '361128', 116673748, 28993374, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1926, 1916, 3, '万年县', '0793', '361100', '361129', 117070150, 28692589, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1927, 1916, 3, '婺源县', '0793', '361100', '361130', 117862190, 29254015, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1928, 1916, 3, '德兴市', '0793', '361100', '361181', 117578732, 28945034, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1929, 1, 1, '山东省', '', '100000', '370000', 117000923, 36675807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1930, 1929, 2, '济南市', '0531', '370000', '370100', 117000923, 36675807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1931, 1930, 3, '历下区', '0531', '370100', '370102', 117038620, 36664169, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1932, 1930, 3, '市中区', '0531', '370100', '370103', 116998980, 36657354, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1933, 1930, 3, '槐荫区', '0531', '370100', '370104', 116947921, 36668205, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1934, 1930, 3, '天桥区', '0531', '370100', '370105', 116996086, 36693374, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1935, 1930, 3, '历城区', '0531', '370100', '370112', 117063744, 36681744, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1936, 1930, 3, '长清区', '0531', '370100', '370113', 116745880, 36561049, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1937, 1930, 3, '平阴县', '0531', '370100', '370124', 116455054, 36286923, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1938, 1930, 3, '济阳县', '0531', '370100', '370125', 117176035, 36976772, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1939, 1930, 3, '商河县', '0531', '370100', '370126', 117156369, 37310544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1940, 1930, 3, '章丘市', '0531', '370100', '370181', 117540690, 36712090, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1941, 1929, 2, '青岛市', '0532', '370000', '370200', 120355173, 36082982, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1942, 1941, 3, '市南区', '0532', '370200', '370202', 120395966, 36070892, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1943, 1941, 3, '市北区', '0532', '370200', '370203', 120355026, 36083819, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1944, 1941, 3, '黄岛区', '0532', '370200', '370211', 119995518, 35875138, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1945, 1941, 3, '崂山区', '0532', '370200', '370212', 120467393, 36102569, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1946, 1941, 3, '李沧区', '0532', '370200', '370213', 120421236, 36160023, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1947, 1941, 3, '城阳区', '0532', '370200', '370214', 120389135, 36306833, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1948, 1941, 3, '胶州市', '0532', '370200', '370281', 120006202, 36285878, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1949, 1941, 3, '即墨市', '0532', '370200', '370282', 120447352, 36390847, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1950, 1941, 3, '平度市', '0532', '370200', '370283', 119959012, 36788828, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1951, 1941, 3, '莱西市', '0532', '370200', '370285', 120526226, 36865090, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1952, 1929, 2, '淄博市', '0533', '370000', '370300', 118047648, 36814939, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1953, 1952, 3, '淄川区', '0533', '370300', '370302', 117967696, 36647272, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1954, 1952, 3, '张店区', '0533', '370300', '370303', 118053521, 36807049, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1955, 1952, 3, '博山区', '0533', '370300', '370304', 117858230, 36497567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1956, 1952, 3, '临淄区', '0533', '370300', '370305', 118306018, 36816657, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1957, 1952, 3, '周村区', '0533', '370300', '370306', 117851036, 36803699, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1958, 1952, 3, '桓台县', '0533', '370300', '370321', 118101556, 36959773, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1959, 1952, 3, '高青县', '0533', '370300', '370322', 117829839, 37169581, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1960, 1952, 3, '沂源县', '0533', '370300', '370323', 118166161, 36186282, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1961, 1929, 2, '枣庄市', '0632', '370000', '370400', 117557964, 34856424, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1962, 1961, 3, '市中区', '0632', '370400', '370402', 117557281, 34856651, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1963, 1961, 3, '薛城区', '0632', '370400', '370403', 117265293, 34797890, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1964, 1961, 3, '峄城区', '0632', '370400', '370404', 117586316, 34767713, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1965, 1961, 3, '台儿庄区', '0632', '370400', '370405', 117734747, 34564815, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1966, 1961, 3, '山亭区', '0632', '370400', '370406', 117458968, 35096077, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1967, 1961, 3, '滕州市', '0632', '370400', '370481', 117162098, 35088498, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1968, 1929, 2, '东营市', '0546', '370000', '370500', 118664710, 37434564, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1969, 1968, 3, '东营区', '0546', '370500', '370502', 118507543, 37461567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1970, 1968, 3, '河口区', '0546', '370500', '370503', 118529613, 37886015, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1971, 1968, 3, '垦利县', '0546', '370500', '370521', 118551314, 37588679, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1972, 1968, 3, '利津县', '0546', '370500', '370522', 118248854, 37493365, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1973, 1968, 3, '广饶县', '0546', '370500', '370523', 118407522, 37051610, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1974, 1929, 2, '烟台市', '0535', '370000', '370600', 121391382, 37539297, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1975, 1974, 3, '芝罘区', '0535', '370600', '370602', 121385877, 37540925, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1976, 1974, 3, '福山区', '0535', '370600', '370611', 121264741, 37496875, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1977, 1974, 3, '牟平区', '0535', '370600', '370612', 121601510, 37388356, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1978, 1974, 3, '莱山区', '0535', '370600', '370613', 121448866, 37473549, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1979, 1974, 3, '长岛县', '0535', '370600', '370634', 120738345, 37916194, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1980, 1974, 3, '龙口市', '0535', '370600', '370681', 120528328, 37648446, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1981, 1974, 3, '莱阳市', '0535', '370600', '370682', 120711151, 36977037, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1982, 1974, 3, '莱州市', '0535', '370600', '370683', 119942135, 37182725, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1983, 1974, 3, '蓬莱市', '0535', '370600', '370684', 120762689, 37811168, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1984, 1974, 3, '招远市', '0535', '370600', '370685', 120403142, 37364919, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1985, 1974, 3, '栖霞市', '0535', '370600', '370686', 120834097, 37305854, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1986, 1974, 3, '海阳市', '0535', '370600', '370687', 121168392, 36780657, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1987, 1929, 2, '潍坊市', '0536', '370000', '370700', 119107078, 36709250, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1988, 1987, 3, '潍城区', '0536', '370700', '370702', 119103784, 36710062, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1989, 1987, 3, '寒亭区', '0536', '370700', '370703', 119207866, 36772103, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1990, 1987, 3, '坊子区', '0536', '370700', '370704', 119166326, 36654616, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1991, 1987, 3, '奎文区', '0536', '370700', '370705', 119137357, 36709494, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1992, 1987, 3, '临朐县', '0536', '370700', '370724', 118539876, 36516371, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1993, 1987, 3, '昌乐县', '0536', '370700', '370725', 118839995, 36703253, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1994, 1987, 3, '青州市', '0536', '370700', '370781', 118484693, 36697855, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1995, 1987, 3, '诸城市', '0536', '370700', '370782', 119403182, 35997093, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1996, 1987, 3, '寿光市', '0536', '370700', '370783', 118736451, 36874411, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1997, 1987, 3, '安丘市', '0536', '370700', '370784', 119206886, 36427417, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1998, 1987, 3, '高密市', '0536', '370700', '370785', 119757033, 36377540, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (1999, 1987, 3, '昌邑市', '0536', '370700', '370786', 119394502, 36854937, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2000, 1929, 2, '济宁市', '0537', '370000', '370800', 116587245, 35415393, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2001, 2000, 3, '任城区', '0537', '370800', '370811', 116595261, 35414828, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2002, 2000, 3, '兖州区', '0537', '370800', '370812', 116828996, 35556445, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2003, 2000, 3, '微山县', '0537', '370800', '370826', 117128610, 34809525, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2004, 2000, 3, '鱼台县', '0537', '370800', '370827', 116650023, 34997706, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2005, 2000, 3, '金乡县', '0537', '370800', '370828', 116310364, 35069770, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2006, 2000, 3, '嘉祥县', '0537', '370800', '370829', 116342885, 35398098, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2007, 2000, 3, '汶上县', '0537', '370800', '370830', 116487146, 35721746, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2008, 2000, 3, '泗水县', '0537', '370800', '370831', 117273605, 35653216, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2009, 2000, 3, '梁山县', '0537', '370800', '370832', 116089630, 35801843, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2010, 2000, 3, '曲阜市', '0537', '370800', '370881', 116991885, 35592788, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2011, 2000, 3, '邹城市', '0537', '370800', '370883', 116966730, 35405259, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2012, 1929, 2, '泰安市', '0538', '370000', '370900', 117129063, 36194968, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2013, 2012, 3, '泰山区', '0538', '370900', '370902', 117129984, 36189313, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2014, 2012, 3, '岱岳区', '0538', '370900', '370911', 117043530, 36184100, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2015, 2012, 3, '宁阳县', '0538', '370900', '370921', 116799297, 35767540, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2016, 2012, 3, '东平县', '0538', '370900', '370923', 116461052, 35930467, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2017, 2012, 3, '新泰市', '0538', '370900', '370982', 117766092, 35910387, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2018, 2012, 3, '肥城市', '0538', '370900', '370983', 116763703, 36185600, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2019, 1929, 2, '威海市', '0631', '370000', '371000', 122116394, 37509691, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2020, 2019, 3, '环翠区', '0631', '371000', '371002', 122116189, 37510754, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2021, 2019, 3, '文登区', '0631', '371000', '371003', 122057139, 37196211, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2022, 2019, 3, '荣成市', '0631', '371000', '371082', 122422896, 37160134, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2023, 2019, 3, '乳山市', '0631', '371000', '371083', 121536346, 36919622, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2024, 1929, 2, '日照市', '0633', '370000', '371100', 119461208, 35428588, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2025, 2024, 3, '东港区', '0633', '371100', '371102', 119457703, 35426152, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2026, 2024, 3, '岚山区', '0633', '371100', '371103', 119315844, 35119794, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2027, 2024, 3, '五莲县', '0633', '371100', '371121', 119206745, 35751936, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2028, 2024, 3, '莒县', '0633', '371100', '371122', 118832859, 35588115, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2029, 1929, 2, '莱芜市', '0634', '370000', '371200', 117677736, 36214397, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2030, 2029, 3, '莱城区', '0634', '371200', '371202', 117678351, 36213662, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2031, 2029, 3, '钢城区', '0634', '371200', '371203', 117820330, 36058038, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2032, 1929, 2, '临沂市', '0539', '370000', '371300', 118326443, 35065282, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2033, 2032, 3, '兰山区', '0539', '371300', '371302', 118327667, 35061631, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2034, 2032, 3, '罗庄区', '0539', '371300', '371311', 118284795, 34997204, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2035, 2032, 3, '河东区', '0539', '371300', '371312', 118398296, 35085004, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2036, 2032, 3, '沂南县', '0539', '371300', '371321', 118455395, 35547002, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2037, 2032, 3, '郯城县', '0539', '371300', '371322', 118342963, 34614741, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2038, 2032, 3, '沂水县', '0539', '371300', '371323', 118634543, 35787029, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2039, 2032, 3, '兰陵县', '0539', '371300', '371324', 118049968, 34855573, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2040, 2032, 3, '费县', '0539', '371300', '371325', 117968869, 35269174, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2041, 2032, 3, '平邑县', '0539', '371300', '371326', 117631884, 35511519, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2042, 2032, 3, '莒南县', '0539', '371300', '371327', 118838322, 35175911, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2043, 2032, 3, '蒙阴县', '0539', '371300', '371328', 117943271, 35712435, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2044, 2032, 3, '临沭县', '0539', '371300', '371329', 118648379, 34917062, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2045, 1929, 2, '德州市', '0534', '370000', '371400', 116307428, 37453968, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2046, 2045, 3, '德城区', '0534', '371400', '371402', 116307076, 37453923, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2047, 2045, 3, '陵城区', '0534', '371400', '371403', 116574929, 37332848, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2048, 2045, 3, '宁津县', '0534', '371400', '371422', 116793720, 37649619, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2049, 2045, 3, '庆云县', '0534', '371400', '371423', 117390507, 37777724, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2050, 2045, 3, '临邑县', '0534', '371400', '371424', 116867028, 37192044, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2051, 2045, 3, '齐河县', '0534', '371400', '371425', 116758394, 36795497, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2052, 2045, 3, '平原县', '0534', '371400', '371426', 116433904, 37164465, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2053, 2045, 3, '夏津县', '0534', '371400', '371427', 116003816, 36950501, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2054, 2045, 3, '武城县', '0534', '371400', '371428', 116078627, 37209527, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2055, 2045, 3, '乐陵市', '0534', '371400', '371481', 117216657, 37729115, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2056, 2045, 3, '禹城市', '0534', '371400', '371482', 116642554, 36934485, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2057, 1929, 2, '聊城市', '0635', '370000', '371500', 115980367, 36456013, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2058, 2057, 3, '东昌府区', '0635', '371500', '371502', 115980023, 36456060, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2059, 2057, 3, '阳谷县', '0635', '371500', '371521', 115784287, 36113708, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2060, 2057, 3, '莘县', '0635', '371500', '371522', 115667291, 36237597, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2061, 2057, 3, '茌平县', '0635', '371500', '371523', 116253350, 36591934, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2062, 2057, 3, '东阿县', '0635', '371500', '371524', 116248855, 36336004, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2063, 2057, 3, '冠县', '0635', '371500', '371525', 115444808, 36483753, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2064, 2057, 3, '高唐县', '0635', '371500', '371526', 116229662, 36859755, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2065, 2057, 3, '临清市', '0635', '371500', '371581', 115713462, 36842598, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2066, 1929, 2, '滨州市', '0543', '370000', '371600', 118016974, 37383542, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2067, 2066, 3, '滨城区', '0543', '371600', '371602', 118020149, 37384842, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2068, 2066, 3, '沾化区', '0543', '371600', '371603', 118129902, 37698456, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2069, 2066, 3, '惠民县', '0543', '371600', '371621', 117508941, 37483876, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2070, 2066, 3, '阳信县', '0543', '371600', '371622', 117581326, 37640492, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2071, 2066, 3, '无棣县', '0543', '371600', '371623', 117616325, 37740848, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2072, 2066, 3, '博兴县', '0543', '371600', '371625', 118123096, 37147002, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2073, 2066, 3, '邹平县', '0543', '371600', '371626', 117736807, 36878030, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2074, 1929, 2, '菏泽市', '0530', '370000', '371700', 115469381, 35246531, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2075, 2074, 3, '牡丹区', '0530', '371700', '371702', 115470946, 35243110, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2076, 2074, 3, '曹县', '0530', '371700', '371721', 115549482, 34823253, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2077, 2074, 3, '单县', '0530', '371700', '371722', 116082620, 34790851, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2078, 2074, 3, '成武县', '0530', '371700', '371723', 115897349, 34947366, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2079, 2074, 3, '巨野县', '0530', '371700', '371724', 116089341, 35390999, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2080, 2074, 3, '郓城县', '0530', '371700', '371725', 115938850, 35594773, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2081, 2074, 3, '鄄城县', '0530', '371700', '371726', 115514340, 35560257, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2082, 2074, 3, '定陶区', '0530', '371700', '371727', 115569601, 35072701, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2083, 2074, 3, '东明县', '0530', '371700', '371728', 115098412, 35289637, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2084, 1, 1, '河南省', '', '100000', '410000', 113665412, 34757975, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2085, 2084, 2, '郑州市', '0371', '410000', '410100', 113665412, 34757975, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2086, 2085, 3, '中原区', '0371', '410100', '410102', 113611576, 34748286, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2087, 2085, 3, '二七区', '0371', '410100', '410103', 113645422, 34730936, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2088, 2085, 3, '管城回族区', '0371', '410100', '410104', 113685313, 34746453, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2089, 2085, 3, '金水区', '0371', '410100', '410105', 113686037, 34775838, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2090, 2085, 3, '上街区', '0371', '410100', '410106', 113298282, 34808689, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2091, 2085, 3, '惠济区', '0371', '410100', '410108', 113618360, 34828591, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2092, 2085, 3, '中牟县', '0371', '410100', '410122', 114022521, 34721976, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2093, 2085, 3, '巩义市', '0371', '410100', '410181', 112982830, 34752180, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2094, 2085, 3, '荥阳市', '0371', '410100', '410182', 113391523, 34789077, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2095, 2085, 3, '新密市', '0371', '410100', '410183', 113380616, 34537846, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2096, 2085, 3, '新郑市', '0371', '410100', '410184', 113739670, 34394219, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2097, 2085, 3, '登封市', '0371', '410100', '410185', 113037768, 34459939, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2098, 2084, 2, '开封市', '0378', '410000', '410200', 114341447, 34797049, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2099, 2098, 3, '龙亭区', '0378', '410200', '410202', 114353348, 34799833, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2100, 2098, 3, '顺河回族区', '0378', '410200', '410203', 114364875, 34800459, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2101, 2098, 3, '鼓楼区', '0378', '410200', '410204', 114348500, 34792383, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2102, 2098, 3, '禹王台区', '0378', '410200', '410205', 114350246, 34779727, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2103, 2098, 3, '祥符区', '0378', '410200', '410212', 114437622, 34756476, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2104, 2098, 3, '杞县', '0378', '410200', '410221', 114770472, 34554585, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2105, 2098, 3, '通许县', '0378', '410200', '410222', 114467734, 34477302, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2106, 2098, 3, '尉氏县', '0378', '410200', '410223', 114193927, 34412256, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2107, 2098, 3, '兰考县', '0378', '410200', '410225', 114820572, 34829899, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2108, 2084, 2, '洛阳市', '0379', '410000', '410300', 112434468, 34663041, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2109, 2108, 3, '老城区', '0379', '410300', '410302', 112477298, 34682945, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2110, 2108, 3, '西工区', '0379', '410300', '410303', 112443232, 34667847, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2111, 2108, 3, '瀍河回族区', '0379', '410300', '410304', 112491625, 34684738, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2112, 2108, 3, '涧西区', '0379', '410300', '410305', 112399243, 34654251, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2113, 2108, 3, '吉利区', '0379', '410300', '410306', 112584796, 34899093, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2114, 2108, 3, '洛龙区', '0379', '410300', '410311', 112456634, 34618557, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2115, 2108, 3, '孟津县', '0379', '410300', '410322', 112443892, 34826485, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2116, 2108, 3, '新安县', '0379', '410300', '410323', 112141403, 34728679, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2117, 2108, 3, '栾川县', '0379', '410300', '410324', 111618386, 33783195, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2118, 2108, 3, '嵩县', '0379', '410300', '410325', 112087765, 34131563, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2119, 2108, 3, '汝阳县', '0379', '410300', '410326', 112473789, 34153230, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2120, 2108, 3, '宜阳县', '0379', '410300', '410327', 112179989, 34516478, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2121, 2108, 3, '洛宁县', '0379', '410300', '410328', 111655399, 34387179, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2122, 2108, 3, '伊川县', '0379', '410300', '410329', 112429384, 34423416, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2123, 2108, 3, '偃师市', '0379', '410300', '410381', 112787739, 34723042, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2124, 2084, 2, '平顶山市', '0375', '410000', '410400', 113307718, 33735241, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2125, 2124, 3, '新华区', '0375', '410400', '410402', 113299061, 33737579, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2126, 2124, 3, '卫东区', '0375', '410400', '410403', 113310327, 33739285, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2127, 2124, 3, '石龙区', '0375', '410400', '410404', 112889885, 33901538, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2128, 2124, 3, '湛河区', '0375', '410400', '410411', 113320873, 33725681, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2129, 2124, 3, '宝丰县', '0375', '410400', '410421', 113066812, 33866359, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2130, 2124, 3, '叶县', '0375', '410400', '410422', 113358298, 33621252, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2131, 2124, 3, '鲁山县', '0375', '410400', '410423', 112906703, 33740325, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2132, 2124, 3, '郏县', '0375', '410400', '410425', 113220451, 33971993, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2133, 2124, 3, '舞钢市', '0375', '410400', '410481', 113526250, 33302082, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2134, 2124, 3, '汝州市', '0375', '410400', '410482', 112845336, 34167408, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2135, 2084, 2, '安阳市', '0372', '410000', '410500', 114352482, 36103442, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2136, 2135, 3, '文峰区', '0372', '410500', '410502', 114352562, 36098101, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2137, 2135, 3, '北关区', '0372', '410500', '410503', 114352646, 36109780, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2138, 2135, 3, '殷都区', '0372', '410500', '410505', 114300098, 36108974, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2139, 2135, 3, '龙安区', '0372', '410500', '410506', 114323522, 36095568, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2140, 2135, 3, '安阳县', '0372', '410500', '410522', 114130207, 36130585, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2141, 2135, 3, '汤阴县', '0372', '410500', '410523', 114362357, 35922349, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2142, 2135, 3, '滑县', '0372', '410500', '410526', 114524000, 35574628, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2143, 2135, 3, '内黄县', '0372', '410500', '410527', 114904582, 35953702, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2144, 2135, 3, '林州市', '0372', '410500', '410581', 113823767, 36063403, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2145, 2084, 2, '鹤壁市', '0392', '410000', '410600', 114295444, 35748236, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2146, 2145, 3, '鹤山区', '0392', '410600', '410602', 114166551, 35936128, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2147, 2145, 3, '山城区', '0392', '410600', '410603', 114184202, 35896058, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2148, 2145, 3, '淇滨区', '0392', '410600', '410611', 114293917, 35748382, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2149, 2145, 3, '浚县', '0392', '410600', '410621', 114550162, 35671282, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2150, 2145, 3, '淇县', '0392', '410600', '410622', 114200379, 35609478, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2151, 2084, 2, '新乡市', '0373', '410000', '410700', 113883991, 35302616, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2152, 2151, 3, '红旗区', '0373', '410700', '410702', 113878158, 35302684, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2153, 2151, 3, '卫滨区', '0373', '410700', '410703', 113866065, 35304905, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2154, 2151, 3, '凤泉区', '0373', '410700', '410704', 113906712, 35379855, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2155, 2151, 3, '牧野区', '0373', '410700', '410711', 113897160, 35312974, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2156, 2151, 3, '新乡县', '0373', '410700', '410721', 113806186, 35190021, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2157, 2151, 3, '获嘉县', '0373', '410700', '410724', 113657249, 35261685, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2158, 2151, 3, '原阳县', '0373', '410700', '410725', 113965966, 35054001, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2159, 2151, 3, '延津县', '0373', '410700', '410726', 114200982, 35149515, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2160, 2151, 3, '封丘县', '0373', '410700', '410727', 114423405, 35040570, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2161, 2151, 3, '长垣县', '0373', '410700', '410728', 114673807, 35196150, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2162, 2151, 3, '卫辉市', '0373', '410700', '410781', 114065855, 35404295, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2163, 2151, 3, '辉县市', '0373', '410700', '410782', 113802518, 35461318, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2164, 2084, 2, '焦作市', '0391', '410000', '410800', 113238266, 35239040, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2165, 2164, 3, '解放区', '0391', '410800', '410802', 113226126, 35241353, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2166, 2164, 3, '中站区', '0391', '410800', '410803', 113175485, 35236145, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2167, 2164, 3, '马村区', '0391', '410800', '410804', 113321703, 35265453, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2168, 2164, 3, '山阳区', '0391', '410800', '410811', 113267660, 35214760, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2169, 2164, 3, '修武县', '0391', '410800', '410821', 113447465, 35229923, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2170, 2164, 3, '博爱县', '0391', '410800', '410822', 113069313, 35170351, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2171, 2164, 3, '武陟县', '0391', '410800', '410823', 113408334, 35098850, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2172, 2164, 3, '温县', '0391', '410800', '410825', 113079118, 34941233, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2173, 2164, 3, '沁阳市', '0391', '410800', '410882', 112934538, 35089010, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2174, 2164, 3, '孟州市', '0391', '410800', '410883', 112787080, 34909630, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2175, 2084, 2, '濮阳市', '0393', '410000', '410900', 115041299, 35768234, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2176, 2175, 3, '华龙区', '0393', '410900', '410902', 115031840, 35760473, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2177, 2175, 3, '清丰县', '0393', '410900', '410922', 115107287, 35902413, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2178, 2175, 3, '南乐县', '0393', '410900', '410923', 115204336, 36075204, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2179, 2175, 3, '范县', '0393', '410900', '410926', 115504212, 35851977, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2180, 2175, 3, '台前县', '0393', '410900', '410927', 115855681, 35996474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2181, 2175, 3, '濮阳县', '0393', '410900', '410928', 115023844, 35710349, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2182, 2084, 2, '许昌市', '0374', '410000', '411000', 113826063, 34022956, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2183, 2182, 3, '魏都区', '0374', '411000', '411002', 113828307, 34027110, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2184, 2182, 3, '许昌县', '0374', '411000', '411023', 113842898, 34005018, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2185, 2182, 3, '鄢陵县', '0374', '411000', '411024', 114188507, 34100502, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2186, 2182, 3, '襄城县', '0374', '411000', '411025', 113493166, 33855943, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2187, 2182, 3, '禹州市', '0374', '411000', '411081', 113471316, 34154403, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2188, 2182, 3, '长葛市', '0374', '411000', '411082', 113768912, 34219257, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2189, 2084, 2, '漯河市', '0395', '410000', '411100', 114026405, 33575855, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2190, 2189, 3, '源汇区', '0395', '411100', '411102', 114017948, 33565441, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2191, 2189, 3, '郾城区', '0395', '411100', '411103', 114016813, 33588897, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2192, 2189, 3, '召陵区', '0395', '411100', '411104', 114051686, 33567555, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2193, 2189, 3, '舞阳县', '0395', '411100', '411121', 113610565, 33436278, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2194, 2189, 3, '临颍县', '0395', '411100', '411122', 113938891, 33806090, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2195, 2084, 2, '三门峡市', '0398', '410000', '411200', 111194099, 34777338, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2196, 2195, 3, '湖滨区', '0398', '411200', '411202', 111194870, 34778120, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2197, 2195, 3, '陕州区', '0398', '411200', '411203', 111103851, 34720244, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2198, 2195, 3, '渑池县', '0398', '411200', '411221', 111762992, 34763487, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2199, 2195, 3, '卢氏县', '0398', '411200', '411224', 111052649, 34053995, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2200, 2195, 3, '义马市', '0398', '411200', '411281', 111869417, 34746868, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2201, 2195, 3, '灵宝市', '0398', '411200', '411282', 110885770, 34521264, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2202, 2084, 2, '南阳市', '0377', '410000', '411300', 112540918, 32999082, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2203, 2202, 3, '宛城区', '0377', '411300', '411302', 112544591, 32994857, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2204, 2202, 3, '卧龙区', '0377', '411300', '411303', 112528789, 32989877, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2205, 2202, 3, '南召县', '0377', '411300', '411321', 112435583, 33488616, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2206, 2202, 3, '方城县', '0377', '411300', '411322', 113010933, 33255138, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2207, 2202, 3, '西峡县', '0377', '411300', '411323', 111485772, 33302981, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2208, 2202, 3, '镇平县', '0377', '411300', '411324', 112232722, 33036651, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2209, 2202, 3, '内乡县', '0377', '411300', '411325', 111843801, 33046357, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2210, 2202, 3, '淅川县', '0377', '411300', '411326', 111489026, 33136105, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2211, 2202, 3, '社旗县', '0377', '411300', '411327', 112938279, 33056126, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2212, 2202, 3, '唐河县', '0377', '411300', '411328', 112838492, 32687891, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2213, 2202, 3, '新野县', '0377', '411300', '411329', 112365624, 32524006, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2214, 2202, 3, '桐柏县', '0377', '411300', '411330', 113406059, 32367153, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2215, 2202, 3, '邓州市', '0377', '411300', '411381', 112092716, 32681641, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2216, 2084, 2, '商丘市', '0370', '410000', '411400', 115650497, 34437054, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2217, 2216, 3, '梁园区', '0370', '411400', '411402', 115654590, 34436553, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2218, 2216, 3, '睢阳区', '0370', '411400', '411403', 115653813, 34390536, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2219, 2216, 3, '民权县', '0370', '411400', '411421', 115148146, 34648455, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2220, 2216, 3, '睢县', '0370', '411400', '411422', 115070109, 34428433, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2221, 2216, 3, '宁陵县', '0370', '411400', '411423', 115320055, 34449299, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2222, 2216, 3, '柘城县', '0370', '411400', '411424', 115307433, 34075277, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2223, 2216, 3, '虞城县', '0370', '411400', '411425', 115863811, 34399634, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2224, 2216, 3, '夏邑县', '0370', '411400', '411426', 116139890, 34240894, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2225, 2216, 3, '永城市', '0370', '411400', '411481', 116449672, 33931318, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2226, 2084, 2, '信阳市', '0376', '410000', '411500', 114075031, 32123274, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2227, 2226, 3, '浉河区', '0376', '411500', '411502', 114075031, 32123274, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2228, 2226, 3, '平桥区', '0376', '411500', '411503', 114126027, 32098394, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2229, 2226, 3, '罗山县', '0376', '411500', '411521', 114533414, 32203206, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2230, 2226, 3, '光山县', '0376', '411500', '411522', 114903577, 32010398, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2231, 2226, 3, '新县', '0376', '411500', '411523', 114877050, 31635150, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2232, 2226, 3, '商城县', '0376', '411500', '411524', 115406297, 31799982, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2233, 2226, 3, '固始县', '0376', '411500', '411525', 115667328, 32183073, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2234, 2226, 3, '潢川县', '0376', '411500', '411526', 115050123, 32134023, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2235, 2226, 3, '淮滨县', '0376', '411500', '411527', 115415451, 32452638, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2236, 2226, 3, '息县', '0376', '411500', '411528', 114740713, 32344744, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2237, 2084, 2, '周口市', '0394', '410000', '411600', 114649653, 33620357, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2238, 2237, 3, '川汇区', '0394', '411600', '411602', 114652136, 33614836, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2239, 2237, 3, '扶沟县', '0394', '411600', '411621', 114392008, 34054061, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2240, 2237, 3, '西华县', '0394', '411600', '411622', 114530067, 33784378, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2241, 2237, 3, '商水县', '0394', '411600', '411623', 114609270, 33543844, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2242, 2237, 3, '沈丘县', '0394', '411600', '411624', 115078375, 33395514, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2243, 2237, 3, '郸城县', '0394', '411600', '411625', 115189000, 33643852, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2244, 2237, 3, '淮阳县', '0394', '411600', '411626', 114870166, 33732547, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2245, 2237, 3, '太康县', '0394', '411600', '411627', 114853834, 34065312, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2246, 2237, 3, '鹿邑县', '0394', '411600', '411628', 115486386, 33861067, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2247, 2237, 3, '项城市', '0394', '411600', '411681', 114899521, 33443085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2248, 2084, 2, '驻马店市', '0396', '410000', '411700', 114024736, 32980168, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2249, 2248, 3, '驿城区', '0396', '411700', '411702', 114029149, 32977559, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2250, 2248, 3, '西平县', '0396', '411700', '411721', 114026864, 33382315, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2251, 2248, 3, '上蔡县', '0396', '411700', '411722', 114266892, 33264719, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2252, 2248, 3, '平舆县', '0396', '411700', '411723', 114637105, 32955626, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2253, 2248, 3, '正阳县', '0396', '411700', '411724', 114389480, 32601826, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2254, 2248, 3, '确山县', '0396', '411700', '411725', 114026679, 32801538, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2255, 2248, 3, '泌阳县', '0396', '411700', '411726', 113326050, 32725129, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2256, 2248, 3, '汝南县', '0396', '411700', '411727', 114359495, 33004534, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2257, 2248, 3, '遂平县', '0396', '411700', '411728', 114003710, 33146980, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2258, 2248, 3, '新蔡县', '0396', '411700', '411729', 114975246, 32749948, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2259, 2084, 2, '济源市', '1391', '410000', '419001', 112590047, 35090378, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2260, 1, 1, '湖北省', '', '100000', '420000', 114298572, 30584355, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2261, 2260, 2, '武汉市', '027', '420000', '420100', 114298572, 30584355, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2262, 2261, 3, '江岸区', '027', '420100', '420102', 114303040, 30594911, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2263, 2261, 3, '江汉区', '027', '420100', '420103', 114283109, 30578771, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2264, 2261, 3, '硚口区', '027', '420100', '420104', 114264568, 30570610, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2265, 2261, 3, '汉阳区', '027', '420100', '420105', 114265807, 30549326, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2266, 2261, 3, '武昌区', '027', '420100', '420106', 114307344, 30546536, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2267, 2261, 3, '青山区', '027', '420100', '420107', 114397070, 30634215, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2268, 2261, 3, '洪山区', '027', '420100', '420111', 114400718, 30504259, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2269, 2261, 3, '东西湖区', '027', '420100', '420112', 114142483, 30622467, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2270, 2261, 3, '汉南区', '027', '420100', '420113', 114081240, 30309637, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2271, 2261, 3, '蔡甸区', '027', '420100', '420114', 114029341, 30582186, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2272, 2261, 3, '江夏区', '027', '420100', '420115', 114313961, 30349045, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2273, 2261, 3, '黄陂区', '027', '420100', '420116', 114374025, 30874155, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2274, 2261, 3, '新洲区', '027', '420100', '420117', 114802108, 30842149, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2275, 2260, 2, '黄石市', '0714', '420000', '420200', 115077048, 30220074, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2276, 2275, 3, '黄石港区', '0714', '420200', '420202', 115090164, 30212086, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2277, 2275, 3, '西塞山区', '0714', '420200', '420203', 115093354, 30205365, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2278, 2275, 3, '下陆区', '0714', '420200', '420204', 114975755, 30177845, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2279, 2275, 3, '铁山区', '0714', '420200', '420205', 114901366, 30206010, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2280, 2275, 3, '阳新县', '0714', '420200', '420222', 115212883, 29841572, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2281, 2275, 3, '大冶市', '0714', '420200', '420281', 114974842, 30098804, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2282, 2260, 2, '十堰市', '0719', '420000', '420300', 110787916, 32646907, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2283, 2282, 3, '茅箭区', '0719', '420300', '420302', 110786210, 32644463, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2284, 2282, 3, '张湾区', '0719', '420300', '420303', 110772365, 32652516, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2285, 2282, 3, '郧阳区', '0719', '420300', '420304', 110812099, 32838267, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2286, 2282, 3, '郧西县', '0719', '420300', '420322', 110426472, 32991456, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2287, 2282, 3, '竹山县', '0719', '420300', '420323', 110229600, 32225859, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2288, 2282, 3, '竹溪县', '0719', '420300', '420324', 109717196, 32315342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2289, 2282, 3, '房县', '0719', '420300', '420325', 110741966, 32055002, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2290, 2282, 3, '丹江口市', '0719', '420300', '420381', 111513793, 32538839, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2291, 2260, 2, '宜昌市', '0717', '420000', '420500', 111290843, 30702636, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2292, 2291, 3, '西陵区', '0717', '420500', '420502', 111295468, 30702476, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2293, 2291, 3, '伍家岗区', '0717', '420500', '420503', 111307215, 30679053, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2294, 2291, 3, '点军区', '0717', '420500', '420504', 111268163, 30692322, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2295, 2291, 3, '猇亭区', '0717', '420500', '420505', 111427642, 30530744, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2296, 2291, 3, '夷陵区', '0717', '420500', '420506', 111326747, 30770199, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2297, 2291, 3, '远安县', '0717', '420500', '420525', 111643310, 31059626, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2298, 2291, 3, '兴山县', '0717', '420500', '420526', 110754499, 31347950, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2299, 2291, 3, '秭归县', '0717', '420500', '420527', 110976785, 30823908, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2300, 2291, 3, '长阳土家族自治县', '0717', '420500', '420528', 111198475, 30466534, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2301, 2291, 3, '五峰土家族自治县', '0717', '420500', '420529', 110674938, 30199252, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2302, 2291, 3, '宜都市', '0717', '420500', '420581', 111454367, 30387234, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2303, 2291, 3, '当阳市', '0717', '420500', '420582', 111793419, 30824492, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2304, 2291, 3, '枝江市', '0717', '420500', '420583', 111751799, 30425364, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2305, 2260, 2, '襄阳市', '0710', '420000', '420600', 112144146, 32042426, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2306, 2305, 3, '襄城区', '0710', '420600', '420602', 112150327, 32015088, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2307, 2305, 3, '樊城区', '0710', '420600', '420606', 112139570, 32058588, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2308, 2305, 3, '襄州区', '0710', '420600', '420607', 112197378, 32085517, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2309, 2305, 3, '南漳县', '0710', '420600', '420624', 111844424, 31776920, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2310, 2305, 3, '谷城县', '0710', '420600', '420625', 111640147, 32262676, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2311, 2305, 3, '保康县', '0710', '420600', '420626', 111262235, 31873507, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2312, 2305, 3, '老河口市', '0710', '420600', '420682', 111675732, 32385438, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2313, 2305, 3, '枣阳市', '0710', '420600', '420683', 112765268, 32123083, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2314, 2305, 3, '宜城市', '0710', '420600', '420684', 112261441, 31709203, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2315, 2260, 2, '鄂州市', '0711', '420000', '420700', 114890593, 30396536, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2316, 2315, 3, '梁子湖区', '0711', '420700', '420702', 114681967, 30098191, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2317, 2315, 3, '华容区', '0711', '420700', '420703', 114741480, 30534468, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2318, 2315, 3, '鄂城区', '0711', '420700', '420704', 114890012, 30396690, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2319, 2260, 2, '荆门市', '0724', '420000', '420800', 112204251, 31035420, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2320, 2319, 3, '东宝区', '0724', '420800', '420802', 112204804, 31033461, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2321, 2319, 3, '掇刀区', '0724', '420800', '420804', 112198413, 30980798, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2322, 2319, 3, '京山县', '0724', '420800', '420821', 113114595, 31022458, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2323, 2319, 3, '沙洋县', '0724', '420800', '420822', 112595218, 30703590, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2324, 2319, 3, '钟祥市', '0724', '420800', '420881', 112587267, 31165573, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2325, 2260, 2, '孝感市', '0712', '420000', '420900', 113926655, 30926423, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2326, 2325, 3, '孝南区', '0712', '420900', '420902', 113925849, 30925966, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2327, 2325, 3, '孝昌县', '0712', '420900', '420921', 113988964, 31251618, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2328, 2325, 3, '大悟县', '0712', '420900', '420922', 114126249, 31565483, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2329, 2325, 3, '云梦县', '0712', '420900', '420923', 113750616, 31021691, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2330, 2325, 3, '应城市', '0712', '420900', '420981', 113573842, 30939038, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2331, 2325, 3, '安陆市', '0712', '420900', '420982', 113690401, 31261740, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2332, 2325, 3, '汉川市', '0712', '420900', '420984', 113835301, 30652165, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2333, 2260, 2, '荆州市', '0716', '420000', '421000', 112238130, 30326857, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2334, 2333, 3, '沙市区', '0716', '421000', '421002', 112257433, 30315895, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2335, 2333, 3, '荆州区', '0716', '421000', '421003', 112195354, 30350674, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2336, 2333, 3, '公安县', '0716', '421000', '421022', 112230179, 30059065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2337, 2333, 3, '监利县', '0716', '421000', '421023', 112904344, 29820079, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2338, 2333, 3, '江陵县', '0716', '421000', '421024', 112417350, 30033919, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2339, 2333, 3, '石首市', '0716', '421000', '421081', 112408870, 29716437, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2340, 2333, 3, '洪湖市', '0716', '421000', '421083', 113470304, 29812970, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2341, 2333, 3, '松滋市', '0716', '421000', '421087', 111778180, 30176037, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2342, 2260, 2, '黄冈市', '0713', '420000', '421100', 114879365, 30447711, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2343, 2342, 3, '黄州区', '0713', '421100', '421102', 114878934, 30447435, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2344, 2342, 3, '团风县', '0713', '421100', '421121', 114872029, 30635690, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2345, 2342, 3, '红安县', '0713', '421100', '421122', 114615095, 31284777, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2346, 2342, 3, '罗田县', '0713', '421100', '421123', 115398984, 30781679, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2347, 2342, 3, '英山县', '0713', '421100', '421124', 115677530, 30735794, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2348, 2342, 3, '浠水县', '0713', '421100', '421125', 115263440, 30454837, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2349, 2342, 3, '蕲春县', '0713', '421100', '421126', 115433964, 30234927, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2350, 2342, 3, '黄梅县', '0713', '421100', '421127', 115942548, 30075113, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2351, 2342, 3, '麻城市', '0713', '421100', '421181', 115025410, 31177906, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2352, 2342, 3, '武穴市', '0713', '421100', '421182', 115562420, 29849342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2353, 2260, 2, '咸宁市', '0715', '420000', '421200', 114328963, 29832798, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2354, 2353, 3, '咸安区', '0715', '421200', '421202', 114333894, 29824716, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2355, 2353, 3, '嘉鱼县', '0715', '421200', '421221', 113921547, 29973363, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2356, 2353, 3, '通城县', '0715', '421200', '421222', 113814131, 29246076, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2357, 2353, 3, '崇阳县', '0715', '421200', '421223', 114049958, 29541010, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2358, 2353, 3, '通山县', '0715', '421200', '421224', 114493163, 29604455, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2359, 2353, 3, '赤壁市', '0715', '421200', '421281', 113883660, 29716879, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2360, 2260, 2, '随州市', '0722', '420000', '421300', 113373770, 31717497, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2361, 2360, 3, '曾都区', '0722', '421300', '421303', 113374519, 31717521, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2362, 2360, 3, '随县', '0722', '421300', '421321', 113301384, 31854246, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2363, 2360, 3, '广水市', '0722', '421300', '421381', 113826601, 31617731, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2364, 2260, 2, '恩施土家族苗族自治州', '0718', '420000', '422800', 109486990, 30283114, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2365, 2364, 3, '恩施市', '0718', '422800', '422801', 109486761, 30282406, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2366, 2364, 3, '利川市', '0718', '422800', '422802', 108943491, 30294247, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2367, 2364, 3, '建始县', '0718', '422800', '422822', 109723822, 30601632, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2368, 2364, 3, '巴东县', '0718', '422800', '422823', 110336665, 31041403, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2369, 2364, 3, '宣恩县', '0718', '422800', '422825', 109482819, 29988670, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2370, 2364, 3, '咸丰县', '0718', '422800', '422826', 109150410, 29678967, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2371, 2364, 3, '来凤县', '0718', '422800', '422827', 109408328, 29506945, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2372, 2364, 3, '鹤峰县', '0718', '422800', '422828', 110033699, 29887298, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2373, 2260, 2, '仙桃市', '0728', '420000', '429004', 113453974, 30364953, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2374, 2260, 2, '潜江市', '2728', '420000', '429005', 112896866, 30421215, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2375, 2260, 2, '天门市', '1728', '420000', '429006', 113165862, 30653061, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2376, 2260, 2, '神农架林区', '1719', '420000', '429021', 110671525, 31744449, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2377, 1, 1, '湖南省', '', '100000', '430000', 112982279, 28194090, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2378, 2377, 2, '长沙市', '0731', '430000', '430100', 112982279, 28194090, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2379, 2378, 3, '芙蓉区', '0731', '430100', '430102', 112988094, 28193106, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2380, 2378, 3, '天心区', '0731', '430100', '430103', 112973070, 28192375, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2381, 2378, 3, '岳麓区', '0731', '430100', '430104', 112911591, 28213044, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2382, 2378, 3, '开福区', '0731', '430100', '430105', 112985525, 28201336, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2383, 2378, 3, '雨花区', '0731', '430100', '430111', 113016337, 28109937, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2384, 2378, 3, '望城区', '0731', '430100', '430112', 112819549, 28347458, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2385, 2378, 3, '长沙县', '0731', '430100', '430121', 113080098, 28237888, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2386, 2378, 3, '宁乡县', '0731', '430100', '430124', 112553182, 28253928, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2387, 2378, 3, '浏阳市', '0731', '430100', '430181', 113633301, 28141112, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2388, 2377, 2, '株洲市', '0733', '430000', '430200', 113151737, 27835806, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2389, 2388, 3, '荷塘区', '0733', '430200', '430202', 113162548, 27833036, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2390, 2388, 3, '芦淞区', '0733', '430200', '430203', 113155169, 27827246, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2391, 2388, 3, '石峰区', '0733', '430200', '430204', 113112950, 27871945, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2392, 2388, 3, '天元区', '0733', '430200', '430211', 113136252, 27826909, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2393, 2388, 3, '株洲县', '0733', '430200', '430221', 113146176, 27705844, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2394, 2388, 3, '攸县', '0733', '430200', '430223', 113345774, 27000071, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2395, 2388, 3, '茶陵县', '0733', '430200', '430224', 113546509, 26789534, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2396, 2388, 3, '炎陵县', '0733', '430200', '430225', 113776884, 26489459, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2397, 2388, 3, '醴陵市', '0733', '430200', '430281', 113507157, 27657873, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2398, 2377, 2, '湘潭市', '0732', '430000', '430300', 112944052, 27829730, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2399, 2398, 3, '雨湖区', '0732', '430300', '430302', 112907427, 27860770, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2400, 2398, 3, '岳塘区', '0732', '430300', '430304', 112927707, 27828854, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2401, 2398, 3, '湘潭县', '0732', '430300', '430321', 112952829, 27778601, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2402, 2398, 3, '湘乡市', '0732', '430300', '430381', 112525217, 27734918, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2403, 2398, 3, '韶山市', '0732', '430300', '430382', 112528480, 27922682, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2404, 2377, 2, '衡阳市', '0734', '430000', '430400', 112607693, 26900358, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2405, 2404, 3, '珠晖区', '0734', '430400', '430405', 112626324, 26891063, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2406, 2404, 3, '雁峰区', '0734', '430400', '430406', 112612241, 26893694, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2407, 2404, 3, '石鼓区', '0734', '430400', '430407', 112607635, 26903908, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2408, 2404, 3, '蒸湘区', '0734', '430400', '430408', 112570608, 26890870, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2409, 2404, 3, '南岳区', '0734', '430400', '430412', 112734147, 27240536, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2410, 2404, 3, '衡阳县', '0734', '430400', '430421', 112379643, 26962388, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2411, 2404, 3, '衡南县', '0734', '430400', '430422', 112677459, 26739973, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2412, 2404, 3, '衡山县', '0734', '430400', '430423', 112869710, 27234808, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2413, 2404, 3, '衡东县', '0734', '430400', '430424', 112950412, 27083531, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2414, 2404, 3, '祁东县', '0734', '430400', '430426', 112111192, 26787109, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2415, 2404, 3, '耒阳市', '0734', '430400', '430481', 112847215, 26414162, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2416, 2404, 3, '常宁市', '0734', '430400', '430482', 112396821, 26406773, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2417, 2377, 2, '邵阳市', '0739', '430000', '430500', 111469230, 27237842, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2418, 2417, 3, '双清区', '0739', '430500', '430502', 111479756, 27240001, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2419, 2417, 3, '大祥区', '0739', '430500', '430503', 111462968, 27233593, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2420, 2417, 3, '北塔区', '0739', '430500', '430511', 111452315, 27245688, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2421, 2417, 3, '邵东县', '0739', '430500', '430521', 111743168, 27257273, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2422, 2417, 3, '新邵县', '0739', '430500', '430522', 111459762, 27311429, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2423, 2417, 3, '邵阳县', '0739', '430500', '430523', 111275700, 26989713, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2424, 2417, 3, '隆回县', '0739', '430500', '430524', 111038785, 27116002, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2425, 2417, 3, '洞口县', '0739', '430500', '430525', 110579212, 27062286, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2426, 2417, 3, '绥宁县', '0739', '430500', '430527', 110155075, 26580622, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2427, 2417, 3, '新宁县', '0739', '430500', '430528', 110859115, 26438912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2428, 2417, 3, '城步苗族自治县', '0739', '430500', '430529', 110313226, 26363575, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2429, 2417, 3, '武冈市', '0739', '430500', '430581', 110636804, 26732086, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2430, 2377, 2, '岳阳市', '0730', '430000', '430600', 113132855, 29370290, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2431, 2430, 3, '岳阳楼区', '0730', '430600', '430602', 113120751, 29366784, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2432, 2430, 3, '云溪区', '0730', '430600', '430603', 113273870, 29473395, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2433, 2430, 3, '君山区', '0730', '430600', '430611', 113004082, 29438062, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2434, 2430, 3, '岳阳县', '0730', '430600', '430621', 113116073, 29144843, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2435, 2430, 3, '华容县', '0730', '430600', '430623', 112559369, 29524107, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2436, 2430, 3, '湘阴县', '0730', '430600', '430624', 112889748, 28677498, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2437, 2430, 3, '平江县', '0730', '430600', '430626', 113593751, 28701523, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2438, 2430, 3, '汨罗市', '0730', '430600', '430681', 113079419, 28803149, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2439, 2430, 3, '临湘市', '0730', '430600', '430682', 113450809, 29471594, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2440, 2377, 2, '常德市', '0736', '430000', '430700', 111691347, 29040225, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2441, 2440, 3, '武陵区', '0736', '430700', '430702', 111690718, 29040477, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2442, 2440, 3, '鼎城区', '0736', '430700', '430703', 111685327, 29014426, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2443, 2440, 3, '安乡县', '0736', '430700', '430721', 112172289, 29414483, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2444, 2440, 3, '汉寿县', '0736', '430700', '430722', 111968506, 28907319, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2445, 2440, 3, '澧县', '0736', '430700', '430723', 111761682, 29642640, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2446, 2440, 3, '临澧县', '0736', '430700', '430724', 111645602, 29443217, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2447, 2440, 3, '桃源县', '0736', '430700', '430725', 111484503, 28902734, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2448, 2440, 3, '石门县', '0736', '430700', '430726', 111379087, 29584703, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2449, 2440, 3, '津市市', '0736', '430700', '430781', 111879609, 29630867, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2450, 2377, 2, '张家界市', '0744', '430000', '430800', 110479921, 29127401, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2451, 2450, 3, '永定区', '0744', '430800', '430802', 110484559, 29125961, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2452, 2450, 3, '武陵源区', '0744', '430800', '430811', 110547580, 29347827, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2453, 2450, 3, '慈利县', '0744', '430800', '430821', 111132702, 29423876, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2454, 2450, 3, '桑植县', '0744', '430800', '430822', 110164039, 29399939, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2455, 2377, 2, '益阳市', '0737', '430000', '430900', 112355042, 28570066, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2456, 2455, 3, '资阳区', '0737', '430900', '430902', 112330840, 28592771, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2457, 2455, 3, '赫山区', '0737', '430900', '430903', 112360946, 28568327, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2458, 2455, 3, '南县', '0737', '430900', '430921', 112410399, 29372181, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2459, 2455, 3, '桃江县', '0737', '430900', '430922', 112139732, 28520993, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2460, 2455, 3, '安化县', '0737', '430900', '430923', 111221824, 28377421, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2461, 2455, 3, '沅江市', '0737', '430900', '430981', 112361088, 28839713, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2462, 2377, 2, '郴州市', '0735', '430000', '431000', 113032067, 25793589, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2463, 2462, 3, '北湖区', '0735', '431000', '431002', 113032208, 25792628, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2464, 2462, 3, '苏仙区', '0735', '431000', '431003', 113038698, 25793157, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2465, 2462, 3, '桂阳县', '0735', '431000', '431021', 112734466, 25737447, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2466, 2462, 3, '宜章县', '0735', '431000', '431022', 112947884, 25394345, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2467, 2462, 3, '永兴县', '0735', '431000', '431023', 113114819, 26129392, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2468, 2462, 3, '嘉禾县', '0735', '431000', '431024', 112370618, 25587309, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2469, 2462, 3, '临武县', '0735', '431000', '431025', 112564589, 25279119, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2470, 2462, 3, '汝城县', '0735', '431000', '431026', 113685686, 25553759, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2471, 2462, 3, '桂东县', '0735', '431000', '431027', 113945879, 26073917, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2472, 2462, 3, '安仁县', '0735', '431000', '431028', 113272170, 26708625, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2473, 2462, 3, '资兴市', '0735', '431000', '431081', 113236820, 25974152, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2474, 2377, 2, '永州市', '0746', '430000', '431100', 111608019, 26434516, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2475, 2474, 3, '零陵区', '0746', '431100', '431102', 111626348, 26223347, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2476, 2474, 3, '冷水滩区', '0746', '431100', '431103', 111607156, 26434364, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2477, 2474, 3, '祁阳县', '0746', '431100', '431121', 111857340, 26585929, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2478, 2474, 3, '东安县', '0746', '431100', '431122', 111313035, 26397278, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2479, 2474, 3, '双牌县', '0746', '431100', '431123', 111662146, 25959397, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2480, 2474, 3, '道县', '0746', '431100', '431124', 111591614, 25518444, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2481, 2474, 3, '江永县', '0746', '431100', '431125', 111346803, 25268154, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2482, 2474, 3, '宁远县', '0746', '431100', '431126', 111944529, 25584112, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2483, 2474, 3, '蓝山县', '0746', '431100', '431127', 112194195, 25375255, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2484, 2474, 3, '新田县', '0746', '431100', '431128', 112220341, 25906927, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2485, 2474, 3, '江华瑶族自治县', '0746', '431100', '431129', 111577276, 25182596, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2486, 2377, 2, '怀化市', '0745', '430000', '431200', 109978240, 27550082, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2487, 2486, 3, '鹤城区', '0745', '431200', '431202', 109982242, 27548474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2488, 2486, 3, '中方县', '0745', '431200', '431221', 109948061, 27437360, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2489, 2486, 3, '沅陵县', '0745', '431200', '431222', 110399161, 28455554, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2490, 2486, 3, '辰溪县', '0745', '431200', '431223', 110196953, 28005474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2491, 2486, 3, '溆浦县', '0745', '431200', '431224', 110593373, 27903802, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2492, 2486, 3, '会同县', '0745', '431200', '431225', 109720785, 26870789, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2493, 2486, 3, '麻阳苗族自治县', '0745', '431200', '431226', 109802807, 27865991, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2494, 2486, 3, '新晃侗族自治县', '0745', '431200', '431227', 109174443, 27359897, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2495, 2486, 3, '芷江侗族自治县', '0745', '431200', '431228', 109687777, 27437996, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2496, 2486, 3, '靖州苗族侗族自治县', '0745', '431200', '431229', 109691159, 26573511, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2497, 2486, 3, '通道侗族自治县', '0745', '431200', '431230', 109783359, 26158349, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2498, 2486, 3, '洪江市', '0745', '431200', '431281', 109831765, 27201876, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2499, 2377, 2, '娄底市', '0738', '430000', '431300', 112008497, 27728136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2500, 2499, 3, '娄星区', '0738', '431300', '431302', 112008486, 27726643, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2501, 2499, 3, '双峰县', '0738', '431300', '431321', 112198245, 27459126, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2502, 2499, 3, '新化县', '0738', '431300', '431322', 111306747, 27737456, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2503, 2499, 3, '冷水江市', '0738', '431300', '431381', 111434674, 27685759, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2504, 2499, 3, '涟源市', '0738', '431300', '431382', 111670847, 27692301, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2505, 2377, 2, '湘西土家族苗族自治州', '0743', '430000', '433100', 109739735, 28314296, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2506, 2505, 3, '吉首市', '0743', '433100', '433101', 109738273, 28314827, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2507, 2505, 3, '泸溪县', '0743', '433100', '433122', 110214428, 28214516, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2508, 2505, 3, '凤凰县', '0743', '433100', '433123', 109599191, 27948308, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2509, 2505, 3, '花垣县', '0743', '433100', '433124', 109479063, 28581352, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2510, 2505, 3, '保靖县', '0743', '433100', '433125', 109651445, 28709605, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2511, 2505, 3, '古丈县', '0743', '433100', '433126', 109949592, 28616973, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2512, 2505, 3, '永顺县', '0743', '433100', '433127', 109853292, 28998068, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2513, 2505, 3, '龙山县', '0743', '433100', '433130', 109441189, 29453438, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2514, 1, 1, '广东省', '', '100000', '440000', 113280637, 23125178, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2515, 2514, 2, '广州市', '020', '440000', '440100', 113280637, 23125178, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2516, 2515, 3, '荔湾区', '020', '440100', '440103', 113243038, 23124943, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2517, 2515, 3, '越秀区', '020', '440100', '440104', 113280714, 23125624, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2518, 2515, 3, '海珠区', '020', '440100', '440105', 113262008, 23103131, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2519, 2515, 3, '天河区', '020', '440100', '440106', 113335367, 23135590, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2520, 2515, 3, '白云区', '020', '440100', '440111', 113262831, 23162281, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2521, 2515, 3, '黄埔区', '020', '440100', '440112', 113450761, 23103239, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2522, 2515, 3, '番禺区', '020', '440100', '440113', 113364619, 22938582, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2523, 2515, 3, '花都区', '020', '440100', '440114', 113211184, 23392050, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2524, 2515, 3, '南沙区', '020', '440100', '440115', 113537380, 22794531, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2525, 2515, 3, '从化区', '020', '440100', '440117', 113587386, 23545283, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2526, 2515, 3, '增城区', '020', '440100', '440118', 113829579, 23290497, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2527, 2514, 2, '韶关市', '0751', '440000', '440200', 113591544, 24801322, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2528, 2527, 3, '武江区', '0751', '440200', '440203', 113588289, 24800160, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2529, 2527, 3, '浈江区', '0751', '440200', '440204', 113599224, 24803977, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2530, 2527, 3, '曲江区', '0751', '440200', '440205', 113605582, 24680195, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2531, 2527, 3, '始兴县', '0751', '440200', '440222', 114067205, 24948364, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2532, 2527, 3, '仁化县', '0751', '440200', '440224', 113748627, 25088226, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2533, 2527, 3, '翁源县', '0751', '440200', '440229', 114131289, 24353887, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2534, 2527, 3, '乳源瑶族自治县', '0751', '440200', '440232', 113278417, 24776109, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2535, 2527, 3, '新丰县', '0751', '440200', '440233', 114207034, 24055412, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2536, 2527, 3, '乐昌市', '0751', '440200', '440281', 113352413, 25128445, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2537, 2527, 3, '南雄市', '0751', '440200', '440282', 114311231, 25115328, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2538, 2514, 2, '深圳市', '0755', '440000', '440300', 114085947, 22547000, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2539, 2538, 3, '罗湖区', '0755', '440300', '440303', 114123885, 22555341, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2540, 2538, 3, '福田区', '0755', '440300', '440304', 114050960, 22541009, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2541, 2538, 3, '南山区', '0755', '440300', '440305', 113929430, 22531221, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2542, 2538, 3, '宝安区', '0755', '440300', '440306', 113828671, 22754741, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2543, 2538, 3, '龙岗区', '0755', '440300', '440307', 114251372, 22721511, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2544, 2538, 3, '盐田区', '0755', '440300', '440308', 114235366, 22555069, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2545, 2514, 2, '珠海市', '0756', '440000', '440400', 113553986, 22224979, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2546, 2545, 3, '香洲区', '0756', '440400', '440402', 113550270, 22271249, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2547, 2545, 3, '斗门区', '0756', '440400', '440403', 113297739, 22209117, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2548, 2545, 3, '金湾区', '0756', '440400', '440404', 113345071, 22139122, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2549, 2514, 2, '汕头市', '0754', '440000', '440500', 116708463, 23371020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2550, 2549, 3, '龙湖区', '0754', '440500', '440507', 116732015, 23373754, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2551, 2549, 3, '金平区', '0754', '440500', '440511', 116703583, 23367071, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2552, 2549, 3, '濠江区', '0754', '440500', '440512', 116729528, 23279345, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2553, 2549, 3, '潮阳区', '0754', '440500', '440513', 116602602, 23262336, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2554, 2549, 3, '潮南区', '0754', '440500', '440514', 116423607, 23249798, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2555, 2549, 3, '澄海区', '0754', '440500', '440515', 116763360, 23468440, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2556, 2549, 3, '南澳县', '0754', '440500', '440523', 117027105, 23419562, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2557, 2514, 2, '佛山市', '0757', '440000', '440600', 113122717, 23028762, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2558, 2557, 3, '禅城区', '0757', '440600', '440604', 113112414, 23019643, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2559, 2557, 3, '南海区', '0757', '440600', '440605', 113145577, 23031562, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2560, 2557, 3, '顺德区', '0757', '440600', '440606', 113281826, 22758510, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2561, 2557, 3, '三水区', '0757', '440600', '440607', 112899414, 23165040, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2562, 2557, 3, '高明区', '0757', '440600', '440608', 112882123, 22893855, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2563, 2514, 2, '江门市', '0750', '440000', '440700', 113094942, 22590431, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2564, 2563, 3, '蓬江区', '0750', '440700', '440703', 113078590, 22596770, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2565, 2563, 3, '江海区', '0750', '440700', '440704', 113120601, 22572211, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2566, 2563, 3, '新会区', '0750', '440700', '440705', 113038584, 22520247, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2567, 2563, 3, '台山市', '0750', '440700', '440781', 112793414, 22250713, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2568, 2563, 3, '开平市', '0750', '440700', '440783', 112692262, 22366286, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2569, 2563, 3, '鹤山市', '0750', '440700', '440784', 112961795, 22768104, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2570, 2563, 3, '恩平市', '0750', '440700', '440785', 112314051, 22182956, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2571, 2514, 2, '湛江市', '0759', '440000', '440800', 110364977, 21274898, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2572, 2571, 3, '赤坎区', '0759', '440800', '440802', 110361634, 21273365, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2573, 2571, 3, '霞山区', '0759', '440800', '440803', 110406382, 21194229, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2574, 2571, 3, '坡头区', '0759', '440800', '440804', 110455632, 21244410, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2575, 2571, 3, '麻章区', '0759', '440800', '440811', 110329167, 21265997, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2576, 2571, 3, '遂溪县', '0759', '440800', '440823', 110255321, 21376915, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2577, 2571, 3, '徐闻县', '0759', '440800', '440825', 110175718, 20326083, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2578, 2571, 3, '廉江市', '0759', '440800', '440881', 110284961, 21611281, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2579, 2571, 3, '雷州市', '0759', '440800', '440882', 110088275, 20908523, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2580, 2571, 3, '吴川市', '0759', '440800', '440883', 110780508, 21428453, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2581, 2514, 2, '茂名市', '0668', '440000', '440900', 110919229, 21659751, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2582, 2581, 3, '茂南区', '0668', '440900', '440902', 110920542, 21660425, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2583, 2581, 3, '电白区', '0668', '440900', '440904', 111007264, 21507219, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2584, 2581, 3, '高州市', '0668', '440900', '440981', 110853251, 21915153, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2585, 2581, 3, '化州市', '0668', '440900', '440982', 110638390, 21654953, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2586, 2581, 3, '信宜市', '0668', '440900', '440983', 110941656, 22352681, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2587, 2514, 2, '肇庆市', '0758', '440000', '441200', 112472529, 23051546, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2588, 2587, 3, '端州区', '0758', '441200', '441202', 112472329, 23052662, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2589, 2587, 3, '鼎湖区', '0758', '441200', '441203', 112565249, 23155822, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2590, 2587, 3, '广宁县', '0758', '441200', '441223', 112440419, 23631486, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2591, 2587, 3, '怀集县', '0758', '441200', '441224', 112182466, 23913072, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2592, 2587, 3, '封开县', '0758', '441200', '441225', 111502973, 23434731, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2593, 2587, 3, '德庆县', '0758', '441200', '441226', 111781560, 23141711, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2594, 2587, 3, '高要区', '0758', '441200', '441204', 112460846, 23027694, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2595, 2587, 3, '四会市', '0758', '441200', '441284', 112695028, 23340324, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2596, 2514, 2, '惠州市', '0752', '440000', '441300', 114412599, 23079404, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2597, 2596, 3, '惠城区', '0752', '441300', '441302', 114413978, 23079883, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2598, 2596, 3, '惠阳区', '0752', '441300', '441303', 114469444, 22788510, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2599, 2596, 3, '博罗县', '0752', '441300', '441322', 114284254, 23167575, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2600, 2596, 3, '惠东县', '0752', '441300', '441323', 114723092, 22983036, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2601, 2596, 3, '龙门县', '0752', '441300', '441324', 114259986, 23723894, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2602, 2514, 2, '梅州市', '0753', '440000', '441400', 116117582, 24299112, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2603, 2602, 3, '梅江区', '0753', '441400', '441402', 116121160, 24302593, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2604, 2602, 3, '梅县区', '0753', '441400', '441403', 116083482, 24267825, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2605, 2602, 3, '大埔县', '0753', '441400', '441422', 116695520, 24351587, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2606, 2602, 3, '丰顺县', '0753', '441400', '441423', 116184419, 23752771, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2607, 2602, 3, '五华县', '0753', '441400', '441424', 115775004, 23925424, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2608, 2602, 3, '平远县', '0753', '441400', '441426', 115891729, 24569651, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2609, 2602, 3, '蕉岭县', '0753', '441400', '441427', 116170531, 24653313, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2610, 2602, 3, '兴宁市', '0753', '441400', '441481', 115731648, 24138077, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2611, 2514, 2, '汕尾市', '0660', '440000', '441500', 115364238, 22774485, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2612, 2611, 3, '城区', '0660', '441500', '441502', 115363667, 22776227, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2613, 2611, 3, '海丰县', '0660', '441500', '441521', 115337324, 22971042, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2614, 2611, 3, '陆河县', '0660', '441500', '441523', 115657565, 23302682, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2615, 2611, 3, '陆丰市', '0660', '441500', '441581', 115644203, 22946104, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2616, 2514, 2, '河源市', '0762', '440000', '441600', 114697802, 23746266, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2617, 2616, 3, '源城区', '0762', '441600', '441602', 114696828, 23746255, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2618, 2616, 3, '紫金县', '0762', '441600', '441621', 115184383, 23633744, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2619, 2616, 3, '龙川县', '0762', '441600', '441622', 115256415, 24101174, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2620, 2616, 3, '连平县', '0762', '441600', '441623', 114495952, 24364227, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2621, 2616, 3, '和平县', '0762', '441600', '441624', 114941473, 24443180, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2622, 2616, 3, '东源县', '0762', '441600', '441625', 114742711, 23789093, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2623, 2514, 2, '阳江市', '0662', '440000', '441700', 111975107, 21859222, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2624, 2623, 3, '江城区', '0662', '441700', '441702', 111968909, 21859182, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2625, 2623, 3, '阳东区', '0662', '441700', '441704', 112011267, 21864728, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2626, 2623, 3, '阳西县', '0662', '441700', '441721', 111617556, 21753670, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2627, 2623, 3, '阳春市', '0662', '441700', '441781', 111790500, 22169598, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2628, 2514, 2, '清远市', '0763', '440000', '441800', 113051227, 23685022, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2629, 2628, 3, '清城区', '0763', '441800', '441802', 113048698, 23688976, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2630, 2628, 3, '清新区', '0763', '441800', '441803', 113015203, 23736949, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2631, 2628, 3, '佛冈县', '0763', '441800', '441821', 113534094, 23866739, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2632, 2628, 3, '阳山县', '0763', '441800', '441823', 112634019, 24470286, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2633, 2628, 3, '连山壮族瑶族自治县', '0763', '441800', '441825', 112086555, 24567271, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2634, 2628, 3, '连南瑶族自治县', '0763', '441800', '441826', 112290808, 24719097, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2635, 2628, 3, '英德市', '0763', '441800', '441881', 113405404, 24186120, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2636, 2628, 3, '连州市', '0763', '441800', '441882', 112379271, 24783966, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2637, 2514, 2, '东莞市', '0769', '440000', '441900', 113746262, 23046237, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2638, 2640, 3, '东宝路', '0769', '441900', '441900', 113785219, 23043826, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2639, 2640, 3, '花园新村', '0769', '441900', '441900', 113763278, 23054373, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2640, 2640, 3, '三元里', '0769', '441900', '441900', 113740978, 23009399, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2641, 2514, 2, '中山市', '0760', '440000', '442000', 113382391, 22521113, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2642, 2643, 3, '竹苑', '0760', '442000', '442000', 113398455, 22515970, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2643, 2643, 3, '湖滨北路', '0760', '442000', '442000', 113382618, 22542919, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2644, 2514, 2, '潮州市', '0768', '440000', '445100', 116632301, 23661701, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2645, 2644, 3, '湘桥区', '0768', '445100', '445102', 116633650, 23664675, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2646, 2644, 3, '潮安区', '0768', '445100', '445103', 116679310, 23461012, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2647, 2644, 3, '饶平县', '0768', '445100', '445122', 117002050, 23668171, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2648, 2514, 2, '揭阳市', '0663', '440000', '445200', 116355733, 23543778, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2649, 2648, 3, '榕城区', '0663', '445200', '445202', 116357045, 23535524, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2650, 2648, 3, '揭东区', '0663', '445200', '445203', 116412947, 23569887, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2651, 2648, 3, '揭西县', '0663', '445200', '445222', 115838708, 23427300, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2652, 2648, 3, '惠来县', '0663', '445200', '445224', 116295832, 23029834, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2653, 2648, 3, '普宁市', '0663', '445200', '445281', 116165082, 23297880, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2654, 2514, 2, '云浮市', '0766', '440000', '445300', 112044439, 22929801, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2655, 2654, 3, '云城区', '0766', '445300', '445302', 112044710, 22930827, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2656, 2654, 3, '云安区', '0766', '445300', '445303', 112005609, 23073152, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2657, 2654, 3, '新兴县', '0766', '445300', '445321', 112230830, 22703204, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2658, 2654, 3, '郁南县', '0766', '445300', '445322', 111535921, 23237709, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2659, 2654, 3, '罗定市', '0766', '445300', '445381', 111578201, 22765415, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2660, 1, 1, '广西壮族自治区', '', '100000', '450000', 108320004, 22824020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2661, 2660, 2, '南宁市', '0771', '450000', '450100', 108320004, 22824020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2662, 2661, 3, '兴宁区', '0771', '450100', '450102', 108320189, 22819511, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2663, 2661, 3, '青秀区', '0771', '450100', '450103', 108346113, 22816614, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2664, 2661, 3, '江南区', '0771', '450100', '450105', 108310478, 22799593, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2665, 2661, 3, '西乡塘区', '0771', '450100', '450107', 108306903, 22832779, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2666, 2661, 3, '良庆区', '0771', '450100', '450108', 108322102, 22759090, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2667, 2661, 3, '邕宁区', '0771', '450100', '450109', 108484251, 22756598, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2668, 2661, 3, '武鸣区', '0771', '450100', '450110', 108280717, 23157163, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2669, 2661, 3, '隆安县', '0771', '450100', '450123', 107688661, 23174763, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2670, 2661, 3, '马山县', '0771', '450100', '450124', 108172903, 23711758, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2671, 2661, 3, '上林县', '0771', '450100', '450125', 108603937, 23431769, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2672, 2661, 3, '宾阳县', '0771', '450100', '450126', 108816735, 23216884, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2673, 2661, 3, '横县', '0771', '450100', '450127', 109270987, 22687430, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2674, 2660, 2, '柳州市', '0772', '450000', '450200', 109411703, 24314617, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2675, 2674, 3, '城中区', '0772', '450200', '450202', 109411749, 24312324, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2676, 2674, 3, '鱼峰区', '0772', '450200', '450203', 109415364, 24303848, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2677, 2674, 3, '柳南区', '0772', '450200', '450204', 109395936, 24287013, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2678, 2674, 3, '柳北区', '0772', '450200', '450205', 109406577, 24359145, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2679, 2674, 3, '柳江区', '0772', '450200', '450221', 109334503, 24257512, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2680, 2674, 3, '柳城县', '0772', '450200', '450222', 109245812, 24655121, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2681, 2674, 3, '鹿寨县', '0772', '450200', '450223', 109740805, 24483405, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2682, 2674, 3, '融安县', '0772', '450200', '450224', 109403621, 25214703, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2683, 2674, 3, '融水苗族自治县', '0772', '450200', '450225', 109252744, 25068812, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2684, 2674, 3, '三江侗族自治县', '0772', '450200', '450226', 109614846, 25785530, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2685, 2660, 2, '桂林市', '0773', '450000', '450300', 110299121, 25274215, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2686, 2685, 3, '秀峰区', '0773', '450300', '450302', 110292445, 25278544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2687, 2685, 3, '叠彩区', '0773', '450300', '450303', 110300783, 25301334, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2688, 2685, 3, '象山区', '0773', '450300', '450304', 110284882, 25261986, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2689, 2685, 3, '七星区', '0773', '450300', '450305', 110317577, 25254339, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2690, 2685, 3, '雁山区', '0773', '450300', '450311', 110305667, 25077646, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2691, 2685, 3, '临桂区', '0773', '450300', '450312', 110205487, 25246257, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2692, 2685, 3, '阳朔县', '0773', '450300', '450321', 110494699, 24775340, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2693, 2685, 3, '灵川县', '0773', '450300', '450323', 110325712, 25408541, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2694, 2685, 3, '全州县', '0773', '450300', '450324', 111072989, 25929897, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2695, 2685, 3, '兴安县', '0773', '450300', '450325', 110670783, 25609554, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2696, 2685, 3, '永福县', '0773', '450300', '450326', 109989208, 24986692, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2697, 2685, 3, '灌阳县', '0773', '450300', '450327', 111160248, 25489098, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2698, 2685, 3, '龙胜各族自治县', '0773', '450300', '450328', 110009423, 25796428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2699, 2685, 3, '资源县', '0773', '450300', '450329', 110642587, 26034200, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2700, 2685, 3, '平乐县', '0773', '450300', '450330', 110642821, 24632216, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2701, 2685, 3, '荔浦县', '0773', '450300', '450331', 110400149, 24497786, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2702, 2685, 3, '恭城瑶族自治县', '0773', '450300', '450332', 110829520, 24833612, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2703, 2660, 2, '梧州市', '0774', '450000', '450400', 111297604, 23474803, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2704, 2703, 3, '万秀区', '0774', '450400', '450403', 111315817, 23471318, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2705, 2703, 3, '长洲区', '0774', '450400', '450405', 111275678, 23477700, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2706, 2703, 3, '龙圩区', '0774', '450400', '450406', 111246035, 23409960, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2707, 2703, 3, '苍梧县', '0774', '450400', '450421', 111544008, 23845097, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2708, 2703, 3, '藤县', '0774', '450400', '450422', 110931826, 23373963, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2709, 2703, 3, '蒙山县', '0774', '450400', '450423', 110522600, 24199829, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2710, 2703, 3, '岑溪市', '0774', '450400', '450481', 110998114, 22918406, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2711, 2660, 2, '北海市', '0779', '450000', '450500', 109119254, 21473343, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2712, 2711, 3, '海城区', '0779', '450500', '450502', 109107529, 21468443, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2713, 2711, 3, '银海区', '0779', '450500', '450503', 109118707, 21444909, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2714, 2711, 3, '铁山港区', '0779', '450500', '450512', 109450573, 21592800, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2715, 2711, 3, '合浦县', '0779', '450500', '450521', 109200695, 21663554, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2716, 2660, 2, '防城港市', '0770', '450000', '450600', 108345478, 21614631, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2717, 2716, 3, '港口区', '0770', '450600', '450602', 108346281, 21614406, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2718, 2716, 3, '防城区', '0770', '450600', '450603', 108358426, 21764758, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2719, 2716, 3, '上思县', '0770', '450600', '450621', 107982139, 22151423, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2720, 2716, 3, '东兴市', '0770', '450600', '450681', 107970170, 21541172, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2721, 2660, 2, '钦州市', '0777', '450000', '450700', 108624175, 21967127, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2722, 2721, 3, '钦南区', '0777', '450700', '450702', 108626629, 21966808, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2723, 2721, 3, '钦北区', '0777', '450700', '450703', 108449110, 22132761, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2724, 2721, 3, '灵山县', '0777', '450700', '450721', 109293468, 22418041, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2725, 2721, 3, '浦北县', '0777', '450700', '450722', 109556341, 22268335, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2726, 2660, 2, '贵港市', '1755', '450000', '450800', 109602146, 23093600, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2727, 2726, 3, '港北区', '1755', '450800', '450802', 109594810, 23107677, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2728, 2726, 3, '港南区', '1755', '450800', '450803', 109604665, 23067516, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2729, 2726, 3, '覃塘区', '1755', '450800', '450804', 109415697, 23132815, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2730, 2726, 3, '平南县', '1755', '450800', '450821', 110397485, 23544546, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2731, 2726, 3, '桂平市', '1755', '450800', '450881', 110074668, 23382473, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2732, 2660, 2, '玉林市', '0775', '450000', '450900', 110154393, 22631360, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2733, 2732, 3, '玉州区', '0775', '450900', '450902', 110154912, 22632132, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2734, 2732, 3, '福绵区', '0775', '450900', '450903', 110054155, 22581630, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2735, 2732, 3, '容县', '0775', '450900', '450921', 110552467, 22856435, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2736, 2732, 3, '陆川县', '0775', '450900', '450922', 110264842, 22321054, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2737, 2732, 3, '博白县', '0775', '450900', '450923', 109980004, 22271285, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2738, 2732, 3, '兴业县', '0775', '450900', '450924', 109877768, 22741870, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2739, 2732, 3, '北流市', '0775', '450900', '450981', 110348052, 22701648, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2740, 2660, 2, '百色市', '0776', '450000', '451000', 106616285, 23897742, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2741, 2740, 3, '右江区', '0776', '451000', '451002', 106615727, 23897675, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2742, 2740, 3, '田阳县', '0776', '451000', '451021', 106904315, 23736079, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2743, 2740, 3, '田东县', '0776', '451000', '451022', 107124260, 23600444, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2744, 2740, 3, '平果县', '0776', '451000', '451023', 107580403, 23320479, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2745, 2740, 3, '德保县', '0776', '451000', '451024', 106618164, 23321464, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2746, 2740, 3, '靖西市', '0776', '451000', '451081', 106417549, 23134766, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2747, 2740, 3, '那坡县', '0776', '451000', '451026', 105833553, 23400785, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2748, 2740, 3, '凌云县', '0776', '451000', '451027', 106564870, 24345643, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2749, 2740, 3, '乐业县', '0776', '451000', '451028', 106559638, 24782204, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2750, 2740, 3, '田林县', '0776', '451000', '451029', 106235047, 24290262, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2751, 2740, 3, '西林县', '0776', '451000', '451030', 105095025, 24492041, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2752, 2740, 3, '隆林各族自治县', '0776', '451000', '451031', 105342363, 24774318, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2753, 2660, 2, '贺州市', '1774', '450000', '451100', 111552056, 24414141, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2754, 2753, 3, '八步区', '1774', '451100', '451102', 111551991, 24412446, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2755, 2753, 3, '昭平县', '1774', '451100', '451121', 110810865, 24172958, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2756, 2753, 3, '钟山县', '1774', '451100', '451122', 111303629, 24528566, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2757, 2753, 3, '富川瑶族自治县', '1774', '451100', '451123', 111277228, 24818960, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2758, 2660, 2, '河池市', '0778', '450000', '451200', 108062105, 24695899, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2759, 2758, 3, '金城江区', '0778', '451200', '451202', 108062131, 24695625, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2760, 2758, 3, '南丹县', '0778', '451200', '451221', 107546605, 24983192, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2761, 2758, 3, '天峨县', '0778', '451200', '451222', 107174939, 24985964, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2762, 2758, 3, '凤山县', '0778', '451200', '451223', 107044592, 24544561, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2763, 2758, 3, '东兰县', '0778', '451200', '451224', 107373696, 24509367, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2764, 2758, 3, '罗城仫佬族自治县', '0778', '451200', '451225', 108902453, 24779327, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2765, 2758, 3, '环江毛南族自治县', '0778', '451200', '451226', 108258669, 24827628, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2766, 2758, 3, '巴马瑶族自治县', '0778', '451200', '451227', 107253126, 24139538, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2767, 2758, 3, '都安瑶族自治县', '0778', '451200', '451228', 108102761, 23934964, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2768, 2758, 3, '大化瑶族自治县', '0778', '451200', '451229', 107994500, 23739596, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2769, 2758, 3, '宜州市', '0778', '451200', '451281', 108653965, 24492193, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2770, 2660, 2, '来宾市', '1772', '450000', '451300', 109229772, 23733766, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2771, 2770, 3, '兴宾区', '1772', '451300', '451302', 109230541, 23732926, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2772, 2770, 3, '忻城县', '1772', '451300', '451321', 108667361, 24064779, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2773, 2770, 3, '象州县', '1772', '451300', '451322', 109684555, 23959824, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2774, 2770, 3, '武宣县', '1772', '451300', '451323', 109662870, 23604162, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2775, 2770, 3, '金秀瑶族自治县', '1772', '451300', '451324', 110188556, 24134941, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2776, 2770, 3, '合山市', '1772', '451300', '451381', 108888580, 23813110, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2777, 2660, 2, '崇左市', '1771', '450000', '451400', 107353926, 22404108, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2778, 2777, 3, '江州区', '1771', '451400', '451402', 107354443, 22404690, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2779, 2777, 3, '扶绥县', '1771', '451400', '451421', 107911533, 22635821, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2780, 2777, 3, '宁明县', '1771', '451400', '451422', 107067616, 22131353, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2781, 2777, 3, '龙州县', '1771', '451400', '451423', 106857502, 22343716, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2782, 2777, 3, '大新县', '1771', '451400', '451424', 107200803, 22833369, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2783, 2777, 3, '天等县', '1771', '451400', '451425', 107142441, 23082484, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2784, 2777, 3, '凭祥市', '1771', '451400', '451481', 106759038, 22108882, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2785, 1, 1, '海南省', '', '100000', '460000', 110331190, 20031971, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2786, 2785, 2, '海口市', '0898', '460000', '460100', 110331190, 20031971, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2787, 2786, 3, '秀英区', '0898', '460100', '460105', 110282393, 20008145, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2788, 2786, 3, '龙华区', '0898', '460100', '460106', 110330373, 20031026, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2789, 2786, 3, '琼山区', '0898', '460100', '460107', 110354722, 20001051, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2790, 2786, 3, '美兰区', '0898', '460100', '460108', 110356566, 20030740, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2791, 2785, 2, '三亚市', '0899', '460000', '460200', 109508268, 18247872, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2792, 2802, 3, '海棠区', '0899', '460200', '460202', 109760778, 18407516, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2793, 2802, 3, '吉阳区', '0899', '460200', '460203', 109512081, 18247436, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2794, 2802, 3, '天涯区', '0899', '460200', '460204', 109506357, 18247340, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2795, 2802, 3, '崖州区', '0899', '460200', '460205', 109174306, 18352192, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2796, 2802, 3, '解放路', '0899', '460200', '460200', 109502708, 18252975, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2797, 2802, 3, '迎宾路', '0899', '460200', '460200', 109508522, 18271621, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2798, 2802, 3, '河西', '0899', '460200', '460200', 109506615, 18249369, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2799, 2802, 3, '河东', '0899', '460200', '460200', 109508325, 18254612, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2800, 2802, 3, '亚龙湾', '0899', '460200', '460200', 109633321, 18240776, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2801, 2802, 3, '大东海', '0899', '460200', '460200', 109522470, 18222966, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2802, 2802, 3, '三亚湾', '0899', '460200', '460200', 109461155, 18276978, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2803, 2785, 2, '三沙市', '2898', '460000', '460300', 112348820, 16831039, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2804, 2803, 3, '西沙群岛', '1895', '460300', '460321', 111792944, 16204546, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2805, 2803, 3, '南沙群岛', '1891', '460300', '460322', 116749998, 11471888, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2806, 2803, 3, '中沙群岛的岛礁及其海域', '2801', '460300', '460323', 117740071, 15112856, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2807, 2785, 2, '儋州市', '0805', '460000', '460400', 109576782, 19517486, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2808, 2785, 2, '五指山市', '1897', '460000', '469001', 109516662, 18776921, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2809, 2785, 2, '琼海市', '1894', '460000', '469002', 110466785, 19246011, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2810, 2785, 2, '文昌市', '1893', '460000', '469005', 110753975, 19612986, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2811, 2785, 2, '万宁市', '1898', '460000', '469006', 110388793, 18796216, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2812, 2785, 2, '东方市', '0807', '460000', '469007', 108653789, 19101980, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2813, 2785, 2, '定安县', '0806', '460000', '469021', 110349235, 19684966, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2814, 2785, 2, '屯昌县', '1892', '460000', '469022', 110102773, 19362916, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2815, 2785, 2, '澄迈县', '0804', '460000', '469023', 110007147, 19737095, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2816, 2785, 2, '临高县', '1896', '460000', '469024', 109687697, 19908293, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2817, 2785, 2, '白沙黎族自治县', '0802', '460000', '469025', 109452606, 19224584, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2818, 2785, 2, '昌江黎族自治县', '0803', '460000', '469026', 109053351, 19260968, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2819, 2785, 2, '乐东黎族自治县', '2802', '460000', '469027', 109175444, 18747580, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2820, 2785, 2, '陵水黎族自治县', '0809', '460000', '469028', 110037218, 18505006, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2821, 2785, 2, '保亭黎族苗族自治县', '0801', '460000', '469029', 109702450, 18636371, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2822, 2785, 2, '琼中黎族苗族自治县', '1899', '460000', '469030', 109839996, 19035570, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2823, 1, 1, '重庆市', '023', '100000', '500000', 106504962, 29533155, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2824, 2823, 2, '重庆市市辖区', '023', '500000', '500100', 106504962, 29533155, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2825, 2824, 3, '万州区', '023', '500100', '500101', 108380246, 30807807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2826, 2824, 3, '涪陵区', '023', '500100', '500102', 107394905, 29703652, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2827, 2824, 3, '渝中区', '023', '500100', '500103', 106562880, 29556742, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2828, 2824, 3, '大渡口区', '023', '500100', '500104', 106486130, 29481002, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2829, 2824, 3, '江北区', '023', '500100', '500105', 106532844, 29575352, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2830, 2824, 3, '沙坪坝区', '023', '500100', '500106', 106454200, 29541224, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2831, 2824, 3, '九龙坡区', '023', '500100', '500107', 106480989, 29523492, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2832, 2824, 3, '南岸区', '023', '500100', '500108', 106560813, 29523992, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2833, 2824, 3, '北碚区', '023', '500100', '500109', 106437868, 29825430, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2834, 2824, 3, '綦江区', '023', '500100', '500110', 106651417, 29028091, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2835, 2824, 3, '大足区', '023', '500100', '500111', 105715319, 29700498, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2836, 2824, 3, '渝北区', '023', '500100', '500112', 106512851, 29601451, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2837, 2824, 3, '巴南区', '023', '500100', '500113', 106519423, 29381919, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2838, 2824, 3, '黔江区', '023', '500100', '500114', 108782577, 29527548, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2839, 2824, 3, '长寿区', '023', '500100', '500115', 107074854, 29833671, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2840, 2824, 3, '江津区', '023', '500100', '500116', 106253156, 29283387, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2841, 2824, 3, '合川区', '023', '500100', '500117', 106265554, 29990993, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2842, 2824, 3, '永川区', '023', '500100', '500118', 105894714, 29348748, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2843, 2824, 3, '南川区', '023', '500100', '500119', 107098153, 29156646, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2844, 2824, 3, '璧山区', '023', '500100', '500120', 106231126, 29593581, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2845, 2824, 3, '铜梁区', '023', '500100', '500151', 106054948, 29839944, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2846, 2824, 3, '潼南区', '023', '500100', '500152', 105841818, 30189554, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2847, 2824, 3, '荣昌区', '023', '500100', '500153', 105594061, 29403627, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2848, 2824, 3, '梁平县', '023', '500100', '500228', 107800034, 30672168, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2849, 2824, 3, '城口县', '023', '500100', '500229', 108664900, 31946293, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2850, 2824, 3, '丰都县', '023', '500100', '500230', 107732480, 29866424, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2851, 2824, 3, '垫江县', '023', '500100', '500231', 107348692, 30330012, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2852, 2824, 3, '武隆县', '023', '500100', '500232', 107756550, 29323760, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2853, 2824, 3, '忠县', '023', '500100', '500233', 108037518, 30291537, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2854, 2824, 3, '开州区', '023', '500100', '500234', 108413317, 31167735, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2855, 2824, 3, '云阳县', '023', '500100', '500235', 108697698, 30930529, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2856, 2824, 3, '奉节县', '023', '500100', '500236', 109465774, 31019967, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2857, 2824, 3, '巫山县', '023', '500100', '500237', 109878928, 31074843, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2858, 2824, 3, '巫溪县', '023', '500100', '500238', 109628912, 31396600, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2859, 2824, 3, '石柱土家族自治县', '023', '500100', '500240', 108112448, 29998530, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2860, 2824, 3, '秀山土家族苗族自治县', '023', '500100', '500241', 108996043, 28444772, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2861, 2824, 3, '酉阳土家族苗族自治县', '023', '500100', '500242', 108767201, 28839828, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2862, 2824, 3, '彭水苗族土家族自治县', '023', '500100', '500243', 108166551, 29293856, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2863, 2823, 2, '重庆市郊县', '023', '500000', '500200', 108170255, 29291965, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2864, 1, 1, '四川省', '', '100000', '510000', 104065735, 30659462, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2865, 2864, 2, '成都市', '028', '510000', '510100', 104065735, 30659462, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2866, 2865, 3, '锦江区', '028', '510100', '510104', 104080989, 30657689, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2867, 2865, 3, '青羊区', '028', '510100', '510105', 104055731, 30667648, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2868, 2865, 3, '金牛区', '028', '510100', '510106', 104043487, 30692058, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2869, 2865, 3, '武侯区', '028', '510100', '510107', 104051670, 30630862, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2870, 2865, 3, '成华区', '028', '510100', '510108', 104103077, 30660275, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2871, 2865, 3, '龙泉驿区', '028', '510100', '510112', 104269181, 30560650, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2872, 2865, 3, '青白江区', '028', '510100', '510113', 104254940, 30883438, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2873, 2865, 3, '新都区', '028', '510100', '510114', 104160220, 30824223, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2874, 2865, 3, '温江区', '028', '510100', '510115', 103836776, 30697996, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2875, 2865, 3, '金堂县', '028', '510100', '510121', 104415604, 30858417, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2876, 2865, 3, '双流区', '028', '510100', '510116', 103922706, 30573243, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2877, 2865, 3, '郫县', '028', '510100', '510124', 103887842, 30808752, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2878, 2865, 3, '大邑县', '028', '510100', '510129', 103522397, 30586602, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2879, 2865, 3, '蒲江县', '028', '510100', '510131', 103511541, 30194359, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2880, 2865, 3, '新津县', '028', '510100', '510132', 103812449, 30414284, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2881, 2865, 3, '简阳市', '028', '510100', '510180', 104550339, 30390666, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2882, 2865, 3, '都江堰市', '028', '510100', '510181', 103627898, 30991140, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2883, 2865, 3, '彭州市', '028', '510100', '510182', 103941173, 30985161, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2884, 2865, 3, '邛崃市', '028', '510100', '510183', 103461430, 30413271, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2885, 2865, 3, '崇州市', '028', '510100', '510184', 103671049, 30631478, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2886, 2864, 2, '自贡市', '0813', '510000', '510300', 104773447, 29352765, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2887, 2886, 3, '自流井区', '0813', '510300', '510302', 104778188, 29343231, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2888, 2886, 3, '贡井区', '0813', '510300', '510303', 104714372, 29345675, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2889, 2886, 3, '大安区', '0813', '510300', '510304', 104783229, 29367136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2890, 2886, 3, '沿滩区', '0813', '510300', '510311', 104876417, 29272521, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2891, 2886, 3, '荣县', '0813', '510300', '510321', 104423932, 29454851, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2892, 2886, 3, '富顺县', '0813', '510300', '510322', 104984256, 29181282, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2893, 2864, 2, '攀枝花市', '0812', '510000', '510400', 101716007, 26580446, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2894, 2893, 3, '东区', '0812', '510400', '510402', 101715134, 26580887, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2895, 2893, 3, '西区', '0812', '510400', '510403', 101637969, 26596776, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2896, 2893, 3, '仁和区', '0812', '510400', '510411', 101737916, 26497185, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2897, 2893, 3, '米易县', '0812', '510400', '510421', 102109877, 26887474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2898, 2893, 3, '盐边县', '0812', '510400', '510422', 101851848, 26677619, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2899, 2864, 2, '泸州市', '0830', '510000', '510500', 105443348, 28889138, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2900, 2899, 3, '江阳区', '0830', '510500', '510502', 105445131, 28882889, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2901, 2899, 3, '纳溪区', '0830', '510500', '510503', 105377210, 28776310, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2902, 2899, 3, '龙马潭区', '0830', '510500', '510504', 105435228, 28897572, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2903, 2899, 3, '泸县', '0830', '510500', '510521', 105376335, 29151288, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2904, 2899, 3, '合江县', '0830', '510500', '510522', 105834098, 28810325, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2905, 2899, 3, '叙永县', '0830', '510500', '510524', 105437775, 28167919, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2906, 2899, 3, '古蔺县', '0830', '510500', '510525', 105813359, 28039480, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2907, 2864, 2, '德阳市', '0838', '510000', '510600', 104398651, 31127991, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2908, 2907, 3, '旌阳区', '0838', '510600', '510603', 104389648, 31130428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2909, 2907, 3, '中江县', '0838', '510600', '510623', 104677831, 31036810, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2910, 2907, 3, '罗江县', '0838', '510600', '510626', 104507126, 31303281, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2911, 2907, 3, '广汉市', '0838', '510600', '510681', 104281903, 30977150, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2912, 2907, 3, '什邡市', '0838', '510600', '510682', 104173653, 31126881, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2913, 2907, 3, '绵竹市', '0838', '510600', '510683', 104200162, 31343084, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2914, 2864, 2, '绵阳市', '0816', '510000', '510700', 104741722, 31464020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2915, 2914, 3, '涪城区', '0816', '510700', '510703', 104740971, 31463557, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2916, 2914, 3, '游仙区', '0816', '510700', '510704', 104770006, 31484772, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2917, 2914, 3, '三台县', '0816', '510700', '510722', 105090316, 31090909, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2918, 2914, 3, '盐亭县', '0816', '510700', '510723', 105391991, 31223180, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2919, 2914, 3, '安州区', '0816', '510700', '510724', 104560341, 31538940, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2920, 2914, 3, '梓潼县', '0816', '510700', '510725', 105163530, 31635225, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2921, 2914, 3, '北川羌族自治县', '0816', '510700', '510726', 104468069, 31615863, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2922, 2914, 3, '平武县', '0816', '510700', '510727', 104530555, 32407587, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2923, 2914, 3, '江油市', '0816', '510700', '510781', 104744431, 31776386, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2924, 2864, 2, '广元市', '0839', '510000', '510800', 105829757, 32433667, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2925, 2924, 3, '利州区', '0839', '510800', '510802', 105826194, 32432276, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2926, 2924, 3, '昭化区', '0839', '510800', '510811', 105964121, 32322788, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2927, 2924, 3, '朝天区', '0839', '510800', '510812', 105889170, 32642632, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2928, 2924, 3, '旺苍县', '0839', '510800', '510821', 106290426, 32228330, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2929, 2924, 3, '青川县', '0839', '510800', '510822', 105238847, 32585655, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2930, 2924, 3, '剑阁县', '0839', '510800', '510823', 105527035, 32286517, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2931, 2924, 3, '苍溪县', '0839', '510800', '510824', 105939706, 31732251, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2932, 2864, 2, '遂宁市', '0825', '510000', '510900', 105571331, 30513311, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2933, 2932, 3, '船山区', '0825', '510900', '510903', 105582215, 30502647, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2934, 2932, 3, '安居区', '0825', '510900', '510904', 105459383, 30346121, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2935, 2932, 3, '蓬溪县', '0825', '510900', '510921', 105713699, 30774883, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2936, 2932, 3, '射洪县', '0825', '510900', '510922', 105381849, 30868752, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2937, 2932, 3, '大英县', '0825', '510900', '510923', 105252187, 30581571, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2938, 2864, 2, '内江市', '1832', '510000', '511000', 105066138, 29587080, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2939, 2938, 3, '市中区', '1832', '511000', '511002', 105065467, 29585265, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2940, 2938, 3, '东兴区', '1832', '511000', '511011', 105067203, 29600107, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2941, 2938, 3, '威远县', '1832', '511000', '511024', 104668327, 29526860, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2942, 2938, 3, '资中县', '1832', '511000', '511025', 104852463, 29775295, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2943, 2938, 3, '隆昌县', '1832', '511000', '511028', 105288074, 29338162, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2944, 2864, 2, '乐山市', '0833', '510000', '511100', 103761263, 29582024, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2945, 2944, 3, '市中区', '0833', '511100', '511102', 103755390, 29588327, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2946, 2944, 3, '沙湾区', '0833', '511100', '511111', 103549961, 29416536, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2947, 2944, 3, '五通桥区', '0833', '511100', '511112', 103816837, 29406186, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2948, 2944, 3, '金口河区', '0833', '511100', '511113', 103077831, 29246020, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2949, 2944, 3, '犍为县', '0833', '511100', '511123', 103944266, 29209782, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2950, 2944, 3, '井研县', '0833', '511100', '511124', 104068850, 29651645, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2951, 2944, 3, '夹江县', '0833', '511100', '511126', 103578862, 29741019, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2952, 2944, 3, '沐川县', '0833', '511100', '511129', 103902110, 28956338, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2953, 2944, 3, '峨边彝族自治县', '0833', '511100', '511132', 103262148, 29230271, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2954, 2944, 3, '马边彝族自治县', '0833', '511100', '511133', 103546851, 28838933, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2955, 2944, 3, '峨眉山市', '0833', '511100', '511181', 103492488, 29597478, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2956, 2864, 2, '南充市', '0817', '510000', '511300', 106082974, 30795281, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2957, 2956, 3, '顺庆区', '0817', '511300', '511302', 106084091, 30795572, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2958, 2956, 3, '高坪区', '0817', '511300', '511303', 106108996, 30781809, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2959, 2956, 3, '嘉陵区', '0817', '511300', '511304', 106067027, 30762976, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2960, 2956, 3, '南部县', '0817', '511300', '511321', 106061138, 31349407, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2961, 2956, 3, '营山县', '0817', '511300', '511322', 106564893, 31075907, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2962, 2956, 3, '蓬安县', '0817', '511300', '511323', 106413488, 31027978, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2963, 2956, 3, '仪陇县', '0817', '511300', '511324', 106297083, 31271261, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2964, 2956, 3, '西充县', '0817', '511300', '511325', 105893021, 30994616, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2965, 2956, 3, '阆中市', '0817', '511300', '511381', 105975266, 31580466, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2966, 2864, 2, '眉山市', '1833', '510000', '511400', 103831788, 30048318, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2967, 2966, 3, '东坡区', '1833', '511400', '511402', 103831553, 30048128, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2968, 2966, 3, '彭山区', '1833', '511400', '511403', 103870100, 30192298, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2969, 2966, 3, '仁寿县', '1833', '511400', '511421', 104147646, 29996721, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2970, 2966, 3, '洪雅县', '1833', '511400', '511423', 103375006, 29904867, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2971, 2966, 3, '丹棱县', '1833', '511400', '511424', 103518333, 30012751, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2972, 2966, 3, '青神县', '1833', '511400', '511425', 103846131, 29831469, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2973, 2864, 2, '宜宾市', '0831', '510000', '511500', 104630825, 28760189, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2974, 2973, 3, '翠屏区', '0831', '511500', '511502', 104630231, 28760179, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2975, 2973, 3, '南溪区', '0831', '511500', '511503', 104981133, 28839806, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2976, 2973, 3, '宜宾县', '0831', '511500', '511521', 104541489, 28695678, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2977, 2973, 3, '江安县', '0831', '511500', '511523', 105068697, 28728102, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2978, 2973, 3, '长宁县', '0831', '511500', '511524', 104921116, 28577271, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2979, 2973, 3, '高县', '0831', '511500', '511525', 104519187, 28435676, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2980, 2973, 3, '珙县', '0831', '511500', '511526', 104712268, 28449041, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2981, 2973, 3, '筠连县', '0831', '511500', '511527', 104507848, 28162017, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2982, 2973, 3, '兴文县', '0831', '511500', '511528', 105236549, 28302988, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2983, 2973, 3, '屏山县', '0831', '511500', '511529', 104162617, 28642370, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2984, 2864, 2, '广安市', '0826', '510000', '511600', 106633369, 30456398, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2985, 2984, 3, '广安区', '0826', '511600', '511602', 106632907, 30456462, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2986, 2984, 3, '前锋区', '0826', '511600', '511603', 106893277, 30496300, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2987, 2984, 3, '岳池县', '0826', '511600', '511621', 106444451, 30533538, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2988, 2984, 3, '武胜县', '0826', '511600', '511622', 106292473, 30344291, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2989, 2984, 3, '邻水县', '0826', '511600', '511623', 106934968, 30334323, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2990, 2984, 3, '华蓥市', '0826', '511600', '511681', 106777882, 30380574, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2991, 2864, 2, '达州市', '0818', '510000', '511700', 107502262, 31209484, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2992, 2991, 3, '通川区', '0818', '511700', '511702', 107501062, 31213522, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2993, 2991, 3, '达川区', '0818', '511700', '511703', 107507926, 31199062, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2994, 2991, 3, '宣汉县', '0818', '511700', '511722', 107722254, 31355025, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2995, 2991, 3, '开江县', '0818', '511700', '511723', 107864135, 31085537, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2996, 2991, 3, '大竹县', '0818', '511700', '511724', 107207420, 30736289, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2997, 2991, 3, '渠县', '0818', '511700', '511725', 106970746, 30836348, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2998, 2991, 3, '万源市', '0818', '511700', '511781', 108037548, 32067770, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (2999, 2864, 2, '雅安市', '0835', '510000', '511800', 103001033, 29987722, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3000, 2999, 3, '雨城区', '0835', '511800', '511802', 103003398, 29981831, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3001, 2999, 3, '名山区', '0835', '511800', '511803', 103112214, 30084718, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3002, 2999, 3, '荥经县', '0835', '511800', '511822', 102844674, 29795529, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3003, 2999, 3, '汉源县', '0835', '511800', '511823', 102677145, 29349915, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3004, 2999, 3, '石棉县', '0835', '511800', '511824', 102359620, 29234063, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3005, 2999, 3, '天全县', '0835', '511800', '511825', 102763462, 30059955, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3006, 2999, 3, '芦山县', '0835', '511800', '511826', 102924016, 30152907, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3007, 2999, 3, '宝兴县', '0835', '511800', '511827', 102813377, 30369026, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3008, 2864, 2, '巴中市', '0827', '510000', '511900', 106753669, 31858809, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3009, 3008, 3, '巴州区', '0827', '511900', '511902', 106753671, 31858366, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3010, 3008, 3, '恩阳区', '0827', '511900', '511903', 106486515, 31816336, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3011, 3008, 3, '通江县', '0827', '511900', '511921', 107247621, 31912120, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3012, 3008, 3, '南江县', '0827', '511900', '511922', 106843418, 32353164, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3013, 3008, 3, '平昌县', '0827', '511900', '511923', 107101937, 31562814, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3014, 2864, 2, '资阳市', '0832', '510000', '512000', 104641917, 30122211, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3015, 3014, 3, '雁江区', '0832', '512000', '512002', 104642338, 30121686, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3016, 3014, 3, '安岳县', '0832', '512000', '512021', 105336764, 30099206, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3017, 3014, 3, '乐至县', '0832', '512000', '512022', 105031142, 30275619, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3018, 2864, 2, '阿坝藏族羌族自治州', '0837', '510000', '513200', 102221374, 31899792, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3019, 3018, 3, '汶川县', '0837', '513200', '513221', 103580675, 31474630, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3020, 3018, 3, '理县', '0837', '513200', '513222', 103165486, 31436764, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3021, 3018, 3, '茂县', '0837', '513200', '513223', 103850684, 31680407, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3022, 3018, 3, '松潘县', '0837', '513200', '513224', 103599177, 32638379, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3023, 3018, 3, '九寨沟县', '0837', '513200', '513225', 104236344, 33262096, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3024, 3018, 3, '金川县', '0837', '513200', '513226', 102064647, 31476356, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3025, 3018, 3, '小金县', '0837', '513200', '513227', 102363193, 30999016, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3026, 3018, 3, '黑水县', '0837', '513200', '513228', 102990805, 32061721, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3027, 3018, 3, '马尔康市', '0837', '513200', '513201', 102221187, 31899761, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3028, 3018, 3, '壤塘县', '0837', '513200', '513230', 100979136, 32264887, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3029, 3018, 3, '阿坝县', '0837', '513200', '513231', 101700985, 32904223, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3030, 3018, 3, '若尔盖县', '0837', '513200', '513232', 102963726, 33575934, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3031, 3018, 3, '红原县', '0837', '513200', '513233', 102544906, 32793902, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3032, 2864, 2, '甘孜藏族自治州', '0836', '510000', '513300', 101963815, 30050663, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3033, 3032, 3, '康定市', '0836', '513300', '513301', 101964057, 30050738, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3034, 3032, 3, '泸定县', '0836', '513300', '513322', 102233225, 29912482, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3035, 3032, 3, '丹巴县', '0836', '513300', '513323', 101886125, 30877083, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3036, 3032, 3, '九龙县', '0836', '513300', '513324', 101506942, 29001975, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3037, 3032, 3, '雅江县', '0836', '513300', '513325', 101015735, 30032250, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3038, 3032, 3, '道孚县', '0836', '513300', '513326', 101123327, 30978767, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3039, 3032, 3, '炉霍县', '0836', '513300', '513327', 100679495, 31392674, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3040, 3032, 3, '甘孜县', '0836', '513300', '513328', 99991753, 31619750, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3041, 3032, 3, '新龙县', '0836', '513300', '513329', 100312094, 30938960, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3042, 3032, 3, '德格县', '0836', '513300', '513330', 98579990, 31806729, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3043, 3032, 3, '白玉县', '0836', '513300', '513331', 98824343, 31208805, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3044, 3032, 3, '石渠县', '0836', '513300', '513332', 98100887, 32975302, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3045, 3032, 3, '色达县', '0836', '513300', '513333', 100331657, 32268777, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3046, 3032, 3, '理塘县', '0836', '513300', '513334', 100269862, 29991807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3047, 3032, 3, '巴塘县', '0836', '513300', '513335', 99109037, 30005723, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3048, 3032, 3, '乡城县', '0836', '513300', '513336', 99799943, 28930855, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3049, 3032, 3, '稻城县', '0836', '513300', '513337', 100296689, 29037544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3050, 3032, 3, '得荣县', '0836', '513300', '513338', 99288036, 28711340, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3051, 2864, 2, '凉山彝族自治州', '0834', '510000', '513400', 102258746, 27886762, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3052, 3051, 3, '西昌市', '0834', '513400', '513401', 102258758, 27885786, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3053, 3051, 3, '木里藏族自治县', '0834', '513400', '513422', 101280184, 27926859, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3054, 3051, 3, '盐源县', '0834', '513400', '513423', 101508909, 27423415, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3055, 3051, 3, '德昌县', '0834', '513400', '513424', 102178845, 27403827, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3056, 3051, 3, '会理县', '0834', '513400', '513425', 102249548, 26658702, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3057, 3051, 3, '会东县', '0834', '513400', '513426', 102578985, 26630713, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3058, 3051, 3, '宁南县', '0834', '513400', '513427', 102757374, 27065205, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3059, 3051, 3, '普格县', '0834', '513400', '513428', 102541082, 27376828, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3060, 3051, 3, '布拖县', '0834', '513400', '513429', 102808801, 27709062, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3061, 3051, 3, '金阳县', '0834', '513400', '513430', 103248704, 27695916, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3062, 3051, 3, '昭觉县', '0834', '513400', '513431', 102843991, 28010554, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3063, 3051, 3, '喜德县', '0834', '513400', '513432', 102412342, 28305486, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3064, 3051, 3, '冕宁县', '0834', '513400', '513433', 102170046, 28550844, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3065, 3051, 3, '越西县', '0834', '513400', '513434', 102508875, 28639632, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3066, 3051, 3, '甘洛县', '0834', '513400', '513435', 102775924, 28977094, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3067, 3051, 3, '美姑县', '0834', '513400', '513436', 103132007, 28327946, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3068, 3051, 3, '雷波县', '0834', '513400', '513437', 103571584, 28262946, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3069, 1, 1, '贵州省', '', '100000', '520000', 106713478, 26578343, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3070, 3069, 2, '贵阳市', '0851', '520000', '520100', 106713478, 26578343, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3071, 3070, 3, '南明区', '0851', '520100', '520102', 106715963, 26573743, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3072, 3070, 3, '云岩区', '0851', '520100', '520103', 106713397, 26583010, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3073, 3070, 3, '花溪区', '0851', '520100', '520111', 106670791, 26410464, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3074, 3070, 3, '乌当区', '0851', '520100', '520112', 106762123, 26630928, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3075, 3070, 3, '白云区', '0851', '520100', '520113', 106633037, 26676849, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3076, 3070, 3, '观山湖区', '0851', '520100', '520115', 106626323, 26646358, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3077, 3070, 3, '开阳县', '0851', '520100', '520121', 106969438, 27056793, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3078, 3070, 3, '息烽县', '0851', '520100', '520122', 106737693, 27092665, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3079, 3070, 3, '修文县', '0851', '520100', '520123', 106599218, 26840672, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3080, 3070, 3, '清镇市', '0851', '520100', '520181', 106470278, 26551289, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3081, 3069, 2, '六盘水市', '0858', '520000', '520200', 104846743, 26584643, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3082, 3081, 3, '钟山区', '0858', '520200', '520201', 104846244, 26584805, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3083, 3081, 3, '六枝特区', '0858', '520200', '520203', 105474235, 26210662, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3084, 3081, 3, '水城县', '0858', '520200', '520221', 104956850, 26540478, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3085, 3081, 3, '盘县', '0858', '520200', '520222', 104468367, 25706966, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3086, 3069, 2, '遵义市', '0852', '520000', '520300', 106937265, 27706626, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3087, 3086, 3, '红花岗区', '0852', '520300', '520302', 106943784, 27694395, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3088, 3086, 3, '汇川区', '0852', '520300', '520303', 106937265, 27706626, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3089, 3086, 3, '播州区', '0852', '520300', '520321', 106831668, 27535288, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3090, 3086, 3, '桐梓县', '0852', '520300', '520322', 106826591, 28131559, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3091, 3086, 3, '绥阳县', '0852', '520300', '520323', 107191024, 27951342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3092, 3086, 3, '正安县', '0852', '520300', '520324', 107441872, 28550337, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3093, 3086, 3, '道真仡佬族苗族自治县', '0852', '520300', '520325', 107605342, 28880088, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3094, 3086, 3, '务川仡佬族苗族自治县', '0852', '520300', '520326', 107887857, 28521567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3095, 3086, 3, '凤冈县', '0852', '520300', '520327', 107722021, 27960858, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3096, 3086, 3, '湄潭县', '0852', '520300', '520328', 107485723, 27765839, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3097, 3086, 3, '余庆县', '0852', '520300', '520329', 107892566, 27221552, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3098, 3086, 3, '习水县', '0852', '520300', '520330', 106200954, 28327826, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3099, 3086, 3, '赤水市', '0852', '520300', '520381', 105698116, 28587057, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3100, 3086, 3, '仁怀市', '0852', '520300', '520382', 106412476, 27803377, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3101, 3069, 2, '安顺市', '0853', '520000', '520400', 105932188, 26245544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3102, 3101, 3, '西秀区', '0853', '520400', '520402', 105946169, 26248323, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3103, 3101, 3, '平坝区', '0853', '520400', '520403', 106259942, 26406080, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3104, 3101, 3, '普定县', '0853', '520400', '520422', 105745609, 26305794, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3105, 3101, 3, '镇宁布依族苗族自治县', '0853', '520400', '520423', 105768656, 26056096, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3106, 3101, 3, '关岭布依族苗族自治县', '0853', '520400', '520424', 105618454, 25944248, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3107, 3101, 3, '紫云苗族布依族自治县', '0853', '520400', '520425', 106084515, 25751567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3108, 3069, 2, '毕节市', '0857', '520000', '520500', 105285010, 27301693, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3109, 3108, 3, '七星关区', '0857', '520500', '520502', 105284852, 27302085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3110, 3108, 3, '大方县', '0857', '520500', '520521', 105609254, 27143521, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3111, 3108, 3, '黔西县', '0857', '520500', '520522', 106038299, 27024923, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3112, 3108, 3, '金沙县', '0857', '520500', '520523', 106222103, 27459693, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3113, 3108, 3, '织金县', '0857', '520500', '520524', 105768997, 26668497, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3114, 3108, 3, '纳雍县', '0857', '520500', '520525', 105375322, 26769875, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3115, 3108, 3, '威宁彝族回族苗族自治县', '0857', '520500', '520526', 104286523, 26859099, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3116, 3108, 3, '赫章县', '0857', '520500', '520527', 104726438, 27119243, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3117, 3069, 2, '铜仁市', '0856', '520000', '520600', 109191555, 27718346, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3118, 3117, 3, '碧江区', '0856', '520600', '520602', 109192117, 27718745, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3119, 3117, 3, '万山区', '0856', '520600', '520603', 109211990, 27519030, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3120, 3117, 3, '江口县', '0856', '520600', '520621', 108848427, 27691904, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3121, 3117, 3, '玉屏侗族自治县', '0856', '520600', '520622', 108917882, 27238024, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3122, 3117, 3, '石阡县', '0856', '520600', '520623', 108229854, 27519386, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3123, 3117, 3, '思南县', '0856', '520600', '520624', 108255827, 27941331, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3124, 3117, 3, '印江土家族苗族自治县', '0856', '520600', '520625', 108405517, 27997976, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3125, 3117, 3, '德江县', '0856', '520600', '520626', 108117317, 28260940, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3126, 3117, 3, '沿河土家族自治县', '0856', '520600', '520627', 108495746, 28560487, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3127, 3117, 3, '松桃苗族自治县', '0856', '520600', '520628', 109202627, 28165419, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3128, 3069, 2, '黔西南布依族苗族自治州', '0859', '520000', '522300', 104897971, 25088120, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3129, 3128, 3, '兴义市', '0859', '522300', '522301', 104897982, 25088599, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3130, 3128, 3, '兴仁县', '0859', '522300', '522322', 105192778, 25431378, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3131, 3128, 3, '普安县', '0859', '522300', '522323', 104955347, 25786404, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3132, 3128, 3, '晴隆县', '0859', '522300', '522324', 105218773, 25832881, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3133, 3128, 3, '贞丰县', '0859', '522300', '522325', 105650133, 25385752, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3134, 3128, 3, '望谟县', '0859', '522300', '522326', 106091563, 25166667, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3135, 3128, 3, '册亨县', '0859', '522300', '522327', 105812410, 24983338, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3136, 3128, 3, '安龙县', '0859', '522300', '522328', 105471498, 25108959, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3137, 3069, 2, '黔东南苗族侗族自治州', '0855', '520000', '522600', 107977488, 26583352, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3138, 3137, 3, '凯里市', '0855', '522600', '522601', 107977541, 26582964, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3139, 3137, 3, '黄平县', '0855', '522600', '522622', 107901337, 26896973, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3140, 3137, 3, '施秉县', '0855', '522600', '522623', 108126780, 27034657, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3141, 3137, 3, '三穗县', '0855', '522600', '522624', 108681121, 26959884, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3142, 3137, 3, '镇远县', '0855', '522600', '522625', 108423656, 27050233, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3143, 3137, 3, '岑巩县', '0855', '522600', '522626', 108816459, 27173244, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3144, 3137, 3, '天柱县', '0855', '522600', '522627', 109212798, 26909684, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3145, 3137, 3, '锦屏县', '0855', '522600', '522628', 109202520, 26680625, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3146, 3137, 3, '剑河县', '0855', '522600', '522629', 108440499, 26727349, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3147, 3137, 3, '台江县', '0855', '522600', '522630', 108314637, 26669138, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3148, 3137, 3, '黎平县', '0855', '522600', '522631', 109136504, 26230636, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3149, 3137, 3, '榕江县', '0855', '522600', '522632', 108521026, 25931085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3150, 3137, 3, '从江县', '0855', '522600', '522633', 108912648, 25747058, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3151, 3137, 3, '雷山县', '0855', '522600', '522634', 108079613, 26381027, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3152, 3137, 3, '麻江县', '0855', '522600', '522635', 107593172, 26494803, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3153, 3137, 3, '丹寨县', '0855', '522600', '522636', 107794808, 26199497, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3154, 3069, 2, '黔南布依族苗族自治州', '0854', '520000', '522700', 107517156, 26258219, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3155, 3154, 3, '都匀市', '0854', '522700', '522701', 107517021, 26258205, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3156, 3154, 3, '福泉市', '0854', '522700', '522702', 107513508, 26702508, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3157, 3154, 3, '荔波县', '0854', '522700', '522722', 107883800, 25412239, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3158, 3154, 3, '贵定县', '0854', '522700', '522723', 107233588, 26580807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3159, 3154, 3, '瓮安县', '0854', '522700', '522725', 107478417, 27066339, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3160, 3154, 3, '独山县', '0854', '522700', '522726', 107542757, 25826283, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3161, 3154, 3, '平塘县', '0854', '522700', '522727', 107324050, 25831803, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3162, 3154, 3, '罗甸县', '0854', '522700', '522728', 106750006, 25429894, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3163, 3154, 3, '长顺县', '0854', '522700', '522729', 106447376, 26022116, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3164, 3154, 3, '龙里县', '0854', '522700', '522730', 106977733, 26448809, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3165, 3154, 3, '惠水县', '0854', '522700', '522731', 106657848, 26128637, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3166, 3154, 3, '三都水族自治县', '0854', '522700', '522732', 107877470, 25985183, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3167, 1, 1, '云南省', '', '100000', '530000', 102712251, 25040609, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3168, 3167, 2, '昆明市', '0871', '530000', '530100', 102712251, 25040609, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3169, 3168, 3, '五华区', '0871', '530100', '530102', 102704412, 25042165, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3170, 3168, 3, '盘龙区', '0871', '530100', '530103', 102729044, 25070239, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3171, 3168, 3, '官渡区', '0871', '530100', '530111', 102723437, 25021211, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3172, 3168, 3, '西山区', '0871', '530100', '530112', 102705904, 25024360, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3173, 3168, 3, '东川区', '0871', '530100', '530113', 103182000, 26083490, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3174, 3168, 3, '呈贡区', '0871', '530100', '530114', 102801382, 24889275, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3175, 3168, 3, '晋宁县', '0871', '530100', '530122', 102594987, 24666944, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3176, 3168, 3, '富民县', '0871', '530100', '530124', 102497888, 25219667, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3177, 3168, 3, '宜良县', '0871', '530100', '530125', 103145989, 24918215, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3178, 3168, 3, '石林彝族自治县', '0871', '530100', '530126', 103271962, 24754545, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3179, 3168, 3, '嵩明县', '0871', '530100', '530127', 103038777, 25335087, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3180, 3168, 3, '禄劝彝族苗族自治县', '0871', '530100', '530128', 102469050, 25556533, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3181, 3168, 3, '寻甸回族彝族自治县', '0871', '530100', '530129', 103257588, 25559474, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3182, 3168, 3, '安宁市', '0871', '530100', '530181', 102485544, 24921785, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3183, 3167, 2, '曲靖市', '0874', '530000', '530300', 103797851, 25501557, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3184, 3183, 3, '麒麟区', '0874', '530300', '530302', 103798054, 25501269, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3185, 3183, 3, '马龙县', '0874', '530300', '530321', 103578755, 25429451, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3186, 3183, 3, '陆良县', '0874', '530300', '530322', 103655233, 25022878, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3187, 3183, 3, '师宗县', '0874', '530300', '530323', 103993808, 24825681, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3188, 3183, 3, '罗平县', '0874', '530300', '530324', 104309263, 24885708, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3189, 3183, 3, '富源县', '0874', '530300', '530325', 104256920, 25670640, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3190, 3183, 3, '会泽县', '0874', '530300', '530326', 103300041, 26412861, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3191, 3183, 3, '沾益区', '0874', '530300', '530303', 103819262, 25600878, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3192, 3183, 3, '宣威市', '0874', '530300', '530381', 104095540, 26227777, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3193, 3167, 2, '玉溪市', '0877', '530000', '530400', 102543907, 24350461, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3194, 3193, 3, '红塔区', '0877', '530400', '530402', 102543468, 24350753, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3195, 3193, 3, '江川区', '0877', '530400', '530403', 102749839, 24291006, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3196, 3193, 3, '澄江县', '0877', '530400', '530422', 102916652, 24669679, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3197, 3193, 3, '通海县', '0877', '530400', '530423', 102760039, 24112205, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3198, 3193, 3, '华宁县', '0877', '530400', '530424', 102928982, 24189807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3199, 3193, 3, '易门县', '0877', '530400', '530425', 102162110, 24669598, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3200, 3193, 3, '峨山彝族自治县', '0877', '530400', '530426', 102404358, 24173256, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3201, 3193, 3, '新平彝族傣族自治县', '0877', '530400', '530427', 101990903, 24066400, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3202, 3193, 3, '元江哈尼族彝族傣族自治县', '0877', '530400', '530428', 101999658, 23597618, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3203, 3167, 2, '保山市', '0875', '530000', '530500', 99167133, 25111802, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3204, 3203, 3, '隆阳区', '0875', '530500', '530502', 99165825, 25112144, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3205, 3203, 3, '施甸县', '0875', '530500', '530521', 99183758, 24730847, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3206, 3203, 3, '腾冲市', '0875', '530500', '530581', 98497292, 25017570, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3207, 3203, 3, '龙陵县', '0875', '530500', '530523', 98693567, 24591912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3208, 3203, 3, '昌宁县', '0875', '530500', '530524', 99612344, 24823662, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3209, 3167, 2, '昭通市', '0870', '530000', '530600', 103717216, 27336999, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3210, 3209, 3, '昭阳区', '0870', '530600', '530602', 103717267, 27336636, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3211, 3209, 3, '鲁甸县', '0870', '530600', '530621', 103549333, 27191637, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3212, 3209, 3, '巧家县', '0870', '530600', '530622', 102929284, 26911700, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3213, 3209, 3, '盐津县', '0870', '530600', '530623', 104235060, 28106923, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3214, 3209, 3, '大关县', '0870', '530600', '530624', 103891608, 27747114, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3215, 3209, 3, '永善县', '0870', '530600', '530625', 103637320, 28231526, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3216, 3209, 3, '绥江县', '0870', '530600', '530626', 103961095, 28599953, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3217, 3209, 3, '镇雄县', '0870', '530600', '530627', 104873055, 27436267, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3218, 3209, 3, '彝良县', '0870', '530600', '530628', 104048492, 27627425, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3219, 3209, 3, '威信县', '0870', '530600', '530629', 105048690, 27843381, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3220, 3209, 3, '水富县', '0870', '530600', '530630', 104415376, 28629688, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3221, 3167, 2, '丽江市', '0888', '530000', '530700', 100233026, 26872108, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3222, 3221, 3, '古城区', '0888', '530700', '530702', 100234412, 26872229, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3223, 3221, 3, '玉龙纳西族自治县', '0888', '530700', '530721', 100238312, 26830593, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3224, 3221, 3, '永胜县', '0888', '530700', '530722', 100750901, 26685623, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3225, 3221, 3, '华坪县', '0888', '530700', '530723', 101267796, 26628834, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3226, 3221, 3, '宁蒗彝族自治县', '0888', '530700', '530724', 100852427, 27281109, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3227, 3167, 2, '普洱市', '0879', '530000', '530800', 100972344, 22777321, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3228, 3227, 3, '思茅区', '0879', '530800', '530802', 100973227, 22776595, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3229, 3227, 3, '宁洱哈尼族彝族自治县', '0879', '530800', '530821', 101045240, 23062507, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3230, 3227, 3, '墨江哈尼族自治县', '0879', '530800', '530822', 101687606, 23428165, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3231, 3227, 3, '景东彝族自治县', '0879', '530800', '530823', 100840011, 24448523, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3232, 3227, 3, '景谷傣族彝族自治县', '0879', '530800', '530824', 100701425, 23500278, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3233, 3227, 3, '镇沅彝族哈尼族拉祜族自治县', '0879', '530800', '530825', 101108512, 24005712, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3234, 3227, 3, '江城哈尼族彝族自治县', '0879', '530800', '530826', 101859144, 22583360, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3235, 3227, 3, '孟连傣族拉祜族佤族自治县', '0879', '530800', '530827', 99585406, 22325924, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3236, 3227, 3, '澜沧拉祜族自治县', '0879', '530800', '530828', 99931201, 22553083, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3237, 3227, 3, '西盟佤族自治县', '0879', '530800', '530829', 99594372, 22644423, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3238, 3167, 2, '临沧市', '0883', '530000', '530900', 100086970, 23886567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3239, 3238, 3, '临翔区', '0883', '530900', '530902', 100086486, 23886562, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3240, 3238, 3, '凤庆县', '0883', '530900', '530921', 99918710, 24592738, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3241, 3238, 3, '云县', '0883', '530900', '530922', 100125637, 24439026, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3242, 3238, 3, '永德县', '0883', '530900', '530923', 99253679, 24028159, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3243, 3238, 3, '镇康县', '0883', '530900', '530924', 98827430, 23761415, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3244, 3238, 3, '双江拉祜族佤族布朗族傣族自治县', '0883', '530900', '530925', 99824419, 23477476, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3245, 3238, 3, '耿马傣族佤族自治县', '0883', '530900', '530926', 99402495, 23534579, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3246, 3238, 3, '沧源佤族自治县', '0883', '530900', '530927', 99247400, 23146887, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3247, 3167, 2, '楚雄彝族自治州', '0878', '530000', '532300', 101546046, 25041988, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3248, 3247, 3, '楚雄市', '0878', '532300', '532301', 101546145, 25040912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3249, 3247, 3, '双柏县', '0878', '532300', '532322', 101638240, 24685094, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3250, 3247, 3, '牟定县', '0878', '532300', '532323', 101543044, 25312111, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3251, 3247, 3, '南华县', '0878', '532300', '532324', 101274991, 25192408, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3252, 3247, 3, '姚安县', '0878', '532300', '532325', 101238399, 25505403, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3253, 3247, 3, '大姚县', '0878', '532300', '532326', 101323602, 25722348, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3254, 3247, 3, '永仁县', '0878', '532300', '532327', 101671175, 26056316, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3255, 3247, 3, '元谋县', '0878', '532300', '532328', 101870837, 25703313, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3256, 3247, 3, '武定县', '0878', '532300', '532329', 102406785, 25530100, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3257, 3247, 3, '禄丰县', '0878', '532300', '532331', 102075694, 25143270, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3258, 3167, 2, '红河哈尼族彝族自治州', '0873', '530000', '532500', 103384182, 23366775, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3259, 3258, 3, '个旧市', '0873', '532500', '532501', 103154752, 23360383, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3260, 3258, 3, '开远市', '0873', '532500', '532502', 103258679, 23713832, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3261, 3258, 3, '蒙自市', '0873', '532500', '532503', 103385005, 23366843, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3262, 3258, 3, '弥勒市', '0873', '532500', '532504', 103436988, 24408370, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3263, 3258, 3, '屏边苗族自治县', '0873', '532500', '532523', 103687229, 22987013, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3264, 3258, 3, '建水县', '0873', '532500', '532524', 102820493, 23618387, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3265, 3258, 3, '石屏县', '0873', '532500', '532525', 102484469, 23712569, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3266, 3258, 3, '泸西县', '0873', '532500', '532527', 103759622, 24532368, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3267, 3258, 3, '元阳县', '0873', '532500', '532528', 102837056, 23219773, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3268, 3258, 3, '红河县', '0873', '532500', '532529', 102421210, 23369191, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3269, 3258, 3, '金平苗族瑶族傣族自治县', '0873', '532500', '532530', 103228359, 22779982, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3270, 3258, 3, '绿春县', '0873', '532500', '532531', 102392860, 22993520, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3271, 3258, 3, '河口瑶族自治县', '0873', '532500', '532532', 103961593, 22507563, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3272, 3167, 2, '文山壮族苗族自治州', '0876', '530000', '532600', 104244010, 23369510, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3273, 3272, 3, '文山市', '0876', '532600', '532601', 104244277, 23369216, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3274, 3272, 3, '砚山县', '0876', '532600', '532622', 104343989, 23612301, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3275, 3272, 3, '西畴县', '0876', '532600', '532623', 104675711, 23437439, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3276, 3272, 3, '麻栗坡县', '0876', '532600', '532624', 104701899, 23124202, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3277, 3272, 3, '马关县', '0876', '532600', '532625', 104398619, 23011723, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3278, 3272, 3, '丘北县', '0876', '532600', '532626', 104194366, 24040982, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3279, 3272, 3, '广南县', '0876', '532600', '532627', 105056684, 24050272, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3280, 3272, 3, '富宁县', '0876', '532600', '532628', 105628560, 23626494, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3281, 3167, 2, '西双版纳傣族自治州', '0691', '530000', '532800', 100797941, 22001724, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3282, 3281, 3, '景洪市', '0691', '532800', '532801', 100797947, 22002087, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3283, 3281, 3, '勐海县', '0691', '532800', '532822', 100448288, 21955866, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3284, 3281, 3, '勐腊县', '0691', '532800', '532823', 101567051, 21479449, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3285, 3167, 2, '大理白族自治州', '0872', '530000', '532900', 100225668, 25589449, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3286, 3285, 3, '大理市', '0872', '532900', '532901', 100241369, 25593067, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3287, 3285, 3, '漾濞彝族自治县', '0872', '532900', '532922', 99957970, 25669543, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3288, 3285, 3, '祥云县', '0872', '532900', '532923', 100554025, 25477072, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3289, 3285, 3, '宾川县', '0872', '532900', '532924', 100578957, 25825904, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3290, 3285, 3, '弥渡县', '0872', '532900', '532925', 100490669, 25342594, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3291, 3285, 3, '南涧彝族自治县', '0872', '532900', '532926', 100518683, 25041279, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3292, 3285, 3, '巍山彝族回族自治县', '0872', '532900', '532927', 100307930, 25230909, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3293, 3285, 3, '永平县', '0872', '532900', '532928', 99533536, 25461281, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3294, 3285, 3, '云龙县', '0872', '532900', '532929', 99369402, 25884955, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3295, 3285, 3, '洱源县', '0872', '532900', '532930', 99951708, 26111184, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3296, 3285, 3, '剑川县', '0872', '532900', '532931', 99905887, 26530066, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3297, 3285, 3, '鹤庆县', '0872', '532900', '532932', 100173375, 26558390, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3298, 3167, 2, '德宏傣族景颇族自治州', '0692', '530000', '533100', 98578363, 24436694, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3299, 3298, 3, '瑞丽市', '0692', '533100', '533102', 97855883, 24010734, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3300, 3298, 3, '芒市', '0692', '533100', '533103', 98577608, 24436699, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3301, 3298, 3, '梁河县', '0692', '533100', '533122', 98298196, 24807420, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3302, 3298, 3, '盈江县', '0692', '533100', '533123', 97933930, 24709541, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3303, 3298, 3, '陇川县', '0692', '533100', '533124', 97794441, 24184065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3304, 3167, 2, '怒江傈僳族自治州', '0886', '530000', '533300', 98854304, 25850949, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3305, 3304, 3, '泸水市', '0886', '533300', '533321', 98854063, 25851142, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3306, 3304, 3, '福贡县', '0886', '533300', '533323', 98867413, 26902738, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3307, 3304, 3, '贡山独龙族怒族自治县', '0886', '533300', '533324', 98666141, 27738054, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3308, 3304, 3, '兰坪白族普米族自治县', '0886', '533300', '533325', 99421378, 26453839, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3309, 3167, 2, '迪庆藏族自治州', '0887', '530000', '533400', 99706463, 27826853, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3310, 3309, 3, '香格里拉市', '0887', '533400', '533401', 99708667, 27825804, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3311, 3309, 3, '德钦县', '0887', '533400', '533422', 98915060, 28483272, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3312, 3309, 3, '维西傈僳族自治县', '0887', '533400', '533423', 99286355, 27180948, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3313, 1, 1, '西藏自治区', '', '100000', '540000', 91132212, 29660361, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3314, 3313, 2, '拉萨市', '0891', '540000', '540100', 91132212, 29660361, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3315, 3314, 3, '城关区', '0891', '540100', '540102', 91132911, 29659472, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3316, 3314, 3, '林周县', '0891', '540100', '540121', 91261842, 29895754, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3317, 3314, 3, '当雄县', '0891', '540100', '540122', 91103551, 30474819, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3318, 3314, 3, '尼木县', '0891', '540100', '540123', 90165545, 29431346, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3319, 3314, 3, '曲水县', '0891', '540100', '540124', 90738051, 29349895, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3320, 3314, 3, '堆龙德庆区', '0891', '540100', '540103', 91002823, 29647347, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3321, 3314, 3, '达孜县', '0891', '540100', '540126', 91350976, 29670314, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3322, 3314, 3, '墨竹工卡县', '0891', '540100', '540127', 91731158, 29834657, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3323, 3313, 2, '日喀则市', '0892', '540000', '540200', 88885148, 29267519, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3324, 3323, 3, '桑珠孜区', '0892', '540200', '540202', 88886670, 29267003, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3325, 3323, 3, '南木林县', '0892', '540200', '540221', 89099434, 29680459, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3326, 3323, 3, '江孜县', '0892', '540200', '540222', 89605044, 28908845, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3327, 3323, 3, '定日县', '0892', '540200', '540223', 87123887, 28656667, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3328, 3323, 3, '萨迦县', '0892', '540200', '540224', 88023007, 28901077, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3329, 3323, 3, '拉孜县', '0892', '540200', '540225', 87637430, 29085136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3330, 3323, 3, '昂仁县', '0892', '540200', '540226', 87235780, 29294758, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3331, 3323, 3, '谢通门县', '0892', '540200', '540227', 88260517, 29431597, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3332, 3323, 3, '白朗县', '0892', '540200', '540228', 89263618, 29106627, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3333, 3323, 3, '仁布县', '0892', '540200', '540229', 89843207, 29230299, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3334, 3323, 3, '康马县', '0892', '540200', '540230', 89683406, 28554719, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3335, 3323, 3, '定结县', '0892', '540200', '540231', 87767723, 28364090, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3336, 3323, 3, '仲巴县', '0892', '540200', '540232', 84032826, 29768336, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3337, 3323, 3, '亚东县', '0892', '540200', '540233', 88906806, 27482772, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3338, 3323, 3, '吉隆县', '0892', '540200', '540234', 85298349, 28852416, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3339, 3323, 3, '聂拉木县', '0892', '540200', '540235', 85981953, 28155950, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3340, 3323, 3, '萨嘎县', '0892', '540200', '540236', 85234622, 29328194, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3341, 3323, 3, '岗巴县', '0892', '540200', '540237', 88518903, 28274371, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3342, 3313, 2, '昌都市', '0895', '540000', '540300', 97178452, 31136875, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3343, 3342, 3, '卡若区', '0895', '540300', '540302', 97178255, 31137035, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3344, 3342, 3, '江达县', '0895', '540300', '540321', 98218351, 31499534, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3345, 3342, 3, '贡觉县', '0895', '540300', '540322', 98271191, 30859206, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3346, 3342, 3, '类乌齐县', '0895', '540300', '540323', 96601259, 31213048, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3347, 3342, 3, '丁青县', '0895', '540300', '540324', 95597748, 31410681, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3348, 3342, 3, '察雅县', '0895', '540300', '540325', 97565701, 30653038, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3349, 3342, 3, '八宿县', '0895', '540300', '540326', 96917893, 30053408, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3350, 3342, 3, '左贡县', '0895', '540300', '540327', 97840532, 29671335, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3351, 3342, 3, '芒康县', '0895', '540300', '540328', 98596444, 29686615, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3352, 3342, 3, '洛隆县', '0895', '540300', '540329', 95823418, 30741947, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3353, 3342, 3, '边坝县', '0895', '540300', '540330', 94707504, 30933849, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3354, 3313, 2, '山南市', '0893', '540000', '540500', 91766529, 29236023, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3355, 3354, 3, '乃东区', '0893', '540500', '540502', 91765250, 29236106, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3356, 3354, 3, '扎囊县', '0893', '540500', '540521', 91338000, 29246476, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3357, 3354, 3, '贡嘎县', '0893', '540500', '540522', 90985271, 29289078, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3358, 3354, 3, '桑日县', '0893', '540500', '540523', 92015732, 29259774, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3359, 3354, 3, '琼结县', '0893', '540500', '540524', 91683753, 29025242, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3360, 3354, 3, '曲松县', '0893', '540500', '540525', 92201066, 29063656, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3361, 3354, 3, '措美县', '0893', '540500', '540526', 91432347, 28437353, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3362, 3354, 3, '洛扎县', '0893', '540500', '540527', 90858243, 28385765, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3363, 3354, 3, '加查县', '0893', '540500', '540528', 92591043, 29140921, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3364, 3354, 3, '隆子县', '0893', '540500', '540529', 92463309, 28408548, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3365, 3354, 3, '错那县', '0893', '540500', '540530', 91960132, 27991707, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3366, 3354, 3, '浪卡子县', '0893', '540500', '540531', 90398747, 28968360, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3367, 3313, 2, '那曲地区', '0896', '540000', '542400', 92060214, 31476004, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3368, 3367, 3, '那曲县', '0896', '542400', '542421', 92061862, 31475756, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3369, 3367, 3, '嘉黎县', '0896', '542400', '542422', 93232907, 30640846, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3370, 3367, 3, '比如县', '0896', '542400', '542423', 93680440, 31479917, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3371, 3367, 3, '聂荣县', '0896', '542400', '542424', 92303659, 32107855, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3372, 3367, 3, '安多县', '0896', '542400', '542425', 91681879, 32260299, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3373, 3367, 3, '申扎县', '0896', '542400', '542426', 88709777, 30929056, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3374, 3367, 3, '索县', '0896', '542400', '542427', 93784964, 31886173, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3375, 3367, 3, '班戈县', '0896', '542400', '542428', 90011822, 31394578, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3376, 3367, 3, '巴青县', '0896', '542400', '542429', 94054049, 31918691, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3377, 3367, 3, '尼玛县', '0896', '542400', '542430', 87236646, 31784979, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3378, 3367, 3, '双湖县', '0896', '542400', '542431', 88838578, 33186980, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3379, 3313, 2, '阿里地区', '0897', '540000', '542500', 80105498, 32503186, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3380, 3379, 3, '普兰县', '0897', '542500', '542521', 81177588, 30291896, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3381, 3379, 3, '札达县', '0897', '542500', '542522', 79803191, 31478587, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3382, 3379, 3, '噶尔县', '0897', '542500', '542523', 80105005, 32503373, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3383, 3379, 3, '日土县', '0897', '542500', '542524', 79731937, 33382454, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3384, 3379, 3, '革吉县', '0897', '542500', '542525', 81142896, 32389192, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3385, 3379, 3, '改则县', '0897', '542500', '542526', 84062384, 32302076, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3386, 3379, 3, '措勤县', '0897', '542500', '542527', 85159254, 31016774, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3387, 3313, 2, '林芝市', '0894', '540000', '540400', 94362348, 29654693, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3388, 3387, 3, '巴宜区', '0894', '540400', '540402', 94360987, 29653732, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3389, 3387, 3, '工布江达县', '0894', '540400', '540421', 93246515, 29884470, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3390, 3387, 3, '米林县', '0894', '540400', '540422', 94213679, 29213811, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3391, 3387, 3, '墨脱县', '0894', '540400', '540423', 95332245, 29325730, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3392, 3387, 3, '波密县', '0894', '540400', '540424', 95768151, 29858771, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3393, 3387, 3, '察隅县', '0894', '540400', '540425', 97465002, 28660244, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3394, 3387, 3, '朗县', '0894', '540400', '540426', 93073429, 29044600, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3395, 1, 1, '陕西省', '', '100000', '610000', 108948024, 34263161, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3396, 3395, 2, '西安市', '029', '610000', '610100', 108948024, 34263161, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3397, 3396, 3, '新城区', '029', '610100', '610102', 108959903, 34269270, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3398, 3396, 3, '碑林区', '029', '610100', '610103', 108946994, 34251061, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3399, 3396, 3, '莲湖区', '029', '610100', '610104', 108933194, 34265600, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3400, 3396, 3, '灞桥区', '029', '610100', '610111', 109067261, 34267453, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3401, 3396, 3, '未央区', '029', '610100', '610112', 108946022, 34308230, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3402, 3396, 3, '雁塔区', '029', '610100', '610113', 108926593, 34213389, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3403, 3396, 3, '阎良区', '029', '610100', '610114', 109228020, 34662141, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3404, 3396, 3, '临潼区', '029', '610100', '610115', 109213986, 34372065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3405, 3396, 3, '长安区', '029', '610100', '610116', 108941579, 34157097, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3406, 3396, 3, '高陵区', '029', '610100', '610117', 109088896, 34535065, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3407, 3396, 3, '蓝田县', '029', '610100', '610122', 109317634, 34156189, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3408, 3396, 3, '周至县', '029', '610100', '610124', 108216465, 34161532, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3409, 3396, 3, '户县', '029', '610100', '610125', 108607385, 34108668, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3410, 3395, 2, '铜川市', '0919', '610000', '610200', 108979608, 34916582, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3411, 3410, 3, '王益区', '0919', '610200', '610202', 109075862, 35069098, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3412, 3410, 3, '印台区', '0919', '610200', '610203', 109100814, 35111927, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3413, 3410, 3, '耀州区', '0919', '610200', '610204', 108962538, 34910206, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3414, 3410, 3, '宜君县', '0919', '610200', '610222', 109118278, 35398766, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3415, 3395, 2, '宝鸡市', '0917', '610000', '610300', 107144870, 34369315, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3416, 3415, 3, '渭滨区', '0917', '610300', '610302', 107144467, 34371008, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3417, 3415, 3, '金台区', '0917', '610300', '610303', 107149943, 34375192, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3418, 3415, 3, '陈仓区', '0917', '610300', '610304', 107383645, 34352747, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3419, 3415, 3, '凤翔县', '0917', '610300', '610322', 107400577, 34521668, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3420, 3415, 3, '岐山县', '0917', '610300', '610323', 107624464, 34442960, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3421, 3415, 3, '扶风县', '0917', '610300', '610324', 107891419, 34375497, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3422, 3415, 3, '眉县', '0917', '610300', '610326', 107752371, 34272137, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3423, 3415, 3, '陇县', '0917', '610300', '610327', 106857066, 34893262, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3424, 3415, 3, '千阳县', '0917', '610300', '610328', 107132987, 34642584, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3425, 3415, 3, '麟游县', '0917', '610300', '610329', 107796608, 34677714, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3426, 3415, 3, '凤县', '0917', '610300', '610330', 106525212, 33912464, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3427, 3415, 3, '太白县', '0917', '610300', '610331', 107316533, 34059215, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3428, 3395, 2, '咸阳市', '0910', '610000', '610400', 108705117, 34333439, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3429, 3428, 3, '秦都区', '0910', '610400', '610402', 108698636, 34329801, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3430, 3428, 3, '杨陵区', '0910', '610400', '610403', 108086348, 34271350, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3431, 3428, 3, '渭城区', '0910', '610400', '610404', 108730957, 34336847, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3432, 3428, 3, '三原县', '0910', '610400', '610422', 108943481, 34613996, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3433, 3428, 3, '泾阳县', '0910', '610400', '610423', 108837840, 34528493, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3434, 3428, 3, '乾县', '0910', '610400', '610424', 108247406, 34527261, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3435, 3428, 3, '礼泉县', '0910', '610400', '610425', 108428317, 34482583, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3436, 3428, 3, '永寿县', '0910', '610400', '610426', 108143129, 34692619, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3437, 3428, 3, '彬县', '0910', '610400', '610427', 108083674, 35034233, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3438, 3428, 3, '长武县', '0910', '610400', '610428', 107795835, 35206122, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3439, 3428, 3, '旬邑县', '0910', '610400', '610429', 108337231, 35112234, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3440, 3428, 3, '淳化县', '0910', '610400', '610430', 108581173, 34797970, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3441, 3428, 3, '武功县', '0910', '610400', '610431', 108212857, 34259732, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3442, 3428, 3, '兴平市', '0910', '610400', '610481', 108488493, 34297134, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3443, 3395, 2, '渭南市', '0913', '610000', '610500', 109502882, 34499381, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3444, 3443, 3, '临渭区', '0913', '610500', '610502', 109503299, 34501271, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3445, 3443, 3, '华州区', '0913', '610500', '610503', 109761410, 34511958, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3446, 3443, 3, '潼关县', '0913', '610500', '610522', 110247260, 34544515, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3447, 3443, 3, '大荔县', '0913', '610500', '610523', 109943123, 34795011, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3448, 3443, 3, '合阳县', '0913', '610500', '610524', 110147979, 35237098, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3449, 3443, 3, '澄城县', '0913', '610500', '610525', 109937609, 35184000, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3450, 3443, 3, '蒲城县', '0913', '610500', '610526', 109589653, 34956034, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3451, 3443, 3, '白水县', '0913', '610500', '610527', 109594309, 35177291, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3452, 3443, 3, '富平县', '0913', '610500', '610528', 109187174, 34746679, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3453, 3443, 3, '韩城市', '0913', '610500', '610581', 110452391, 35475238, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3454, 3443, 3, '华阴市', '0913', '610500', '610582', 110089520, 34565359, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3455, 3395, 2, '延安市', '0911', '610000', '610600', 109490810, 36596537, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3456, 3455, 3, '宝塔区', '0911', '610600', '610602', 109490690, 36596291, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3457, 3455, 3, '延长县', '0911', '610600', '610621', 110012961, 36578306, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3458, 3455, 3, '延川县', '0911', '610600', '610622', 110190314, 36882066, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3459, 3455, 3, '子长县', '0911', '610600', '610623', 109675968, 37142070, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3460, 3455, 3, '安塞县', '0911', '610600', '610624', 109325341, 36864410, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3461, 3455, 3, '志丹县', '0911', '610600', '610625', 108768898, 36823031, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3462, 3455, 3, '吴起县', '0911', '610600', '610626', 108176976, 36924852, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3463, 3455, 3, '甘泉县', '0911', '610600', '610627', 109349610, 36277729, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3464, 3455, 3, '富县', '0911', '610600', '610628', 109384136, 35996495, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3465, 3455, 3, '洛川县', '0911', '610600', '610629', 109435712, 35762133, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3466, 3455, 3, '宜川县', '0911', '610600', '610630', 110175537, 36050391, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3467, 3455, 3, '黄龙县', '0911', '610600', '610631', 109835020, 35583276, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3468, 3455, 3, '黄陵县', '0911', '610600', '610632', 109262469, 35580165, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3469, 3395, 2, '汉中市', '0916', '610000', '610700', 107028621, 33077668, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3470, 3469, 3, '汉台区', '0916', '610700', '610702', 107028233, 33077674, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3471, 3469, 3, '南郑县', '0916', '610700', '610721', 106942393, 33003341, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3472, 3469, 3, '城固县', '0916', '610700', '610722', 107329887, 33153098, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3473, 3469, 3, '洋县', '0916', '610700', '610723', 107549962, 33223283, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3474, 3469, 3, '西乡县', '0916', '610700', '610724', 107765858, 32987961, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3475, 3469, 3, '勉县', '0916', '610700', '610725', 106680175, 33155617, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3476, 3469, 3, '宁强县', '0916', '610700', '610726', 106257390, 32830806, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3477, 3469, 3, '略阳县', '0916', '610700', '610727', 106153899, 33329638, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3478, 3469, 3, '镇巴县', '0916', '610700', '610728', 107895310, 32535854, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3479, 3469, 3, '留坝县', '0916', '610700', '610729', 106924377, 33613340, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3480, 3469, 3, '佛坪县', '0916', '610700', '610730', 107988582, 33520744, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3481, 3395, 2, '榆林市', '0912', '610000', '610800', 109741193, 38290162, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3482, 3481, 3, '榆阳区', '0912', '610800', '610802', 109747910, 38299267, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3483, 3481, 3, '神木县', '0912', '610800', '610821', 110497005, 38835641, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3484, 3481, 3, '府谷县', '0912', '610800', '610822', 111069645, 39029243, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3485, 3481, 3, '横山区', '0912', '610800', '610803', 109292596, 37964048, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3486, 3481, 3, '靖边县', '0912', '610800', '610824', 108805670, 37596084, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3487, 3481, 3, '定边县', '0912', '610800', '610825', 107601284, 37595230, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3488, 3481, 3, '绥德县', '0912', '610800', '610826', 110265377, 37507701, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3489, 3481, 3, '米脂县', '0912', '610800', '610827', 110178683, 37759081, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3490, 3481, 3, '佳县', '0912', '610800', '610828', 110493367, 38021597, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3491, 3481, 3, '吴堡县', '0912', '610800', '610829', 110739315, 37451925, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3492, 3481, 3, '清涧县', '0912', '610800', '610830', 110121460, 37087702, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3493, 3481, 3, '子洲县', '0912', '610800', '610831', 110034570, 37611573, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3494, 3395, 2, '安康市', '0915', '610000', '610900', 109029273, 32690300, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3495, 3494, 3, '汉滨区', '0915', '610900', '610902', 109029098, 32690817, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3496, 3494, 3, '汉阴县', '0915', '610900', '610921', 108510946, 32891121, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3497, 3494, 3, '石泉县', '0915', '610900', '610922', 108250512, 33038511, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3498, 3494, 3, '宁陕县', '0915', '610900', '610923', 108313714, 33312184, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3499, 3494, 3, '紫阳县', '0915', '610900', '610924', 108537788, 32520176, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3500, 3494, 3, '岚皋县', '0915', '610900', '610925', 108900663, 32310690, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3501, 3494, 3, '平利县', '0915', '610900', '610926', 109361865, 32387932, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3502, 3494, 3, '镇坪县', '0915', '610900', '610927', 109526437, 31883395, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3503, 3494, 3, '旬阳县', '0915', '610900', '610928', 109368149, 32833567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3504, 3494, 3, '白河县', '0915', '610900', '610929', 110114186, 32809483, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3505, 3395, 2, '商洛市', '0914', '610000', '611000', 109939776, 33868319, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3506, 3505, 3, '商州区', '0914', '611000', '611002', 109937685, 33869208, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3507, 3505, 3, '洛南县', '0914', '611000', '611021', 110145716, 34088502, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3508, 3505, 3, '丹凤县', '0914', '611000', '611022', 110331910, 33694711, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3509, 3505, 3, '商南县', '0914', '611000', '611023', 110885437, 33526367, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3510, 3505, 3, '山阳县', '0914', '611000', '611024', 109880435, 33530411, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3511, 3505, 3, '镇安县', '0914', '611000', '611025', 109151075, 33423980, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3512, 3505, 3, '柞水县', '0914', '611000', '611026', 109111249, 33682773, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3513, 1, 1, '甘肃省', '', '100000', '620000', 103823557, 36058039, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3514, 3513, 2, '兰州市', '0931', '620000', '620100', 103823557, 36058039, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3515, 3514, 3, '城关区', '0931', '620100', '620102', 103841032, 36049115, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3516, 3514, 3, '七里河区', '0931', '620100', '620103', 103784326, 36066730, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3517, 3514, 3, '西固区', '0931', '620100', '620104', 103622331, 36100369, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3518, 3514, 3, '安宁区', '0931', '620100', '620105', 103724038, 36103290, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3519, 3514, 3, '红古区', '0931', '620100', '620111', 102861814, 36344177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3520, 3514, 3, '永登县', '0931', '620100', '620121', 103262203, 36734428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3521, 3514, 3, '皋兰县', '0931', '620100', '620122', 103949330, 36331254, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3522, 3514, 3, '榆中县', '0931', '620100', '620123', 104114975, 35844430, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3523, 3513, 2, '嘉峪关市', '1937', '620000', '620200', 98277304, 39786529, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3524, 3513, 2, '金昌市', '0935', '620000', '620300', 102187888, 38514238, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3525, 3524, 3, '金川区', '0935', '620300', '620302', 102187683, 38513793, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3526, 3524, 3, '永昌县', '0935', '620300', '620321', 101971957, 38247354, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3527, 3513, 2, '白银市', '0943', '620000', '620400', 104173606, 36545680, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3528, 3527, 3, '白银区', '0943', '620400', '620402', 104174250, 36545649, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3529, 3527, 3, '平川区', '0943', '620400', '620403', 104819207, 36729210, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3530, 3527, 3, '靖远县', '0943', '620400', '620421', 104686972, 36561424, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3531, 3527, 3, '会宁县', '0943', '620400', '620422', 105054337, 35692486, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3532, 3527, 3, '景泰县', '0943', '620400', '620423', 104066394, 37193519, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3533, 3513, 2, '天水市', '0938', '620000', '620500', 105724998, 34578529, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3534, 3533, 3, '秦州区', '0938', '620500', '620502', 105724477, 34578645, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3535, 3533, 3, '麦积区', '0938', '620500', '620503', 105897631, 34563504, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3536, 3533, 3, '清水县', '0938', '620500', '620521', 106139878, 34752870, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3537, 3533, 3, '秦安县', '0938', '620500', '620522', 105673300, 34862354, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3538, 3533, 3, '甘谷县', '0938', '620500', '620523', 105332347, 34747327, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3539, 3533, 3, '武山县', '0938', '620500', '620524', 104891696, 34721955, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3540, 3533, 3, '张家川回族自治县', '0938', '620500', '620525', 106212416, 34993237, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3541, 3513, 2, '武威市', '1935', '620000', '620600', 102634697, 37929996, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3542, 3541, 3, '凉州区', '1935', '620600', '620602', 102634492, 37930250, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3543, 3541, 3, '民勤县', '1935', '620600', '620621', 103090654, 38624621, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3544, 3541, 3, '古浪县', '1935', '620600', '620622', 102898047, 37470571, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3545, 3541, 3, '天祝藏族自治县', '1935', '620600', '620623', 103142034, 36971678, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3546, 3513, 2, '张掖市', '0936', '620000', '620700', 100455472, 38932897, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3547, 3546, 3, '甘州区', '0936', '620700', '620702', 100454862, 38931774, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3548, 3546, 3, '肃南裕固族自治县', '0936', '620700', '620721', 99617086, 38837269, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3549, 3546, 3, '民乐县', '0936', '620700', '620722', 100816623, 38434454, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3550, 3546, 3, '临泽县', '0936', '620700', '620723', 100166333, 39152151, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3551, 3546, 3, '高台县', '0936', '620700', '620724', 99816650, 39376308, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3552, 3546, 3, '山丹县', '0936', '620700', '620725', 101088442, 38784839, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3553, 3513, 2, '平凉市', '0933', '620000', '620800', 106684691, 35542790, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3554, 3553, 3, '崆峒区', '0933', '620800', '620802', 106684223, 35541730, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3555, 3553, 3, '泾川县', '0933', '620800', '620821', 107365218, 35335283, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3556, 3553, 3, '灵台县', '0933', '620800', '620822', 107620587, 35064009, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3557, 3553, 3, '崇信县', '0933', '620800', '620823', 107031253, 35304533, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3558, 3553, 3, '华亭县', '0933', '620800', '620824', 106649308, 35215342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3559, 3553, 3, '庄浪县', '0933', '620800', '620825', 106041979, 35203428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3560, 3553, 3, '静宁县', '0933', '620800', '620826', 105733489, 35525243, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3561, 3513, 2, '酒泉市', '0937', '620000', '620900', 98510795, 39744023, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3562, 3561, 3, '肃州区', '0937', '620900', '620902', 98511155, 39743858, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3563, 3561, 3, '金塔县', '0937', '620900', '620921', 98902959, 39983036, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3564, 3561, 3, '瓜州县', '0937', '620900', '620922', 95780591, 40516525, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3565, 3561, 3, '肃北蒙古族自治县', '0937', '620900', '620923', 94877280, 39512240, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3566, 3561, 3, '阿克塞哈萨克族自治县', '0937', '620900', '620924', 94337642, 39631642, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3567, 3561, 3, '玉门市', '0937', '620900', '620981', 97037206, 40286820, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3568, 3561, 3, '敦煌市', '0937', '620900', '620982', 94664279, 40141119, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3569, 3513, 2, '庆阳市', '0934', '620000', '621000', 107638372, 35734218, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3570, 3569, 3, '西峰区', '0934', '621000', '621002', 107638824, 35733713, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3571, 3569, 3, '庆城县', '0934', '621000', '621021', 107885664, 36013504, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3572, 3569, 3, '环县', '0934', '621000', '621022', 107308754, 36569322, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3573, 3569, 3, '华池县', '0934', '621000', '621023', 107986288, 36457304, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3574, 3569, 3, '合水县', '0934', '621000', '621024', 108019865, 35819005, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3575, 3569, 3, '正宁县', '0934', '621000', '621025', 108361068, 35490642, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3576, 3569, 3, '宁县', '0934', '621000', '621026', 107921182, 35502010, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3577, 3569, 3, '镇原县', '0934', '621000', '621027', 107195706, 35677806, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3578, 3513, 2, '定西市', '0932', '620000', '621100', 104626294, 35579578, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3579, 3578, 3, '安定区', '0932', '621100', '621102', 104625770, 35579764, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3580, 3578, 3, '通渭县', '0932', '621100', '621121', 105250102, 35208922, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3581, 3578, 3, '陇西县', '0932', '621100', '621122', 104637554, 35003409, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3582, 3578, 3, '渭源县', '0932', '621100', '621123', 104211742, 35133023, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3583, 3578, 3, '临洮县', '0932', '621100', '621124', 103862186, 35376233, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3584, 3578, 3, '漳县', '0932', '621100', '621125', 104466756, 34848642, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3585, 3578, 3, '岷县', '0932', '621100', '621126', 104039882, 34439105, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3586, 3513, 2, '陇南市', '2935', '620000', '621200', 104929379, 33388598, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3587, 3586, 3, '武都区', '2935', '621200', '621202', 104929866, 33388154, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3588, 3586, 3, '成县', '2935', '621200', '621221', 105734434, 33739863, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3589, 3586, 3, '文县', '2935', '621200', '621222', 104682448, 32942171, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3590, 3586, 3, '宕昌县', '2935', '621200', '621223', 104394475, 34042655, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3591, 3586, 3, '康县', '2935', '621200', '621224', 105609534, 33328266, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3592, 3586, 3, '西和县', '2935', '621200', '621225', 105299737, 34013718, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3593, 3586, 3, '礼县', '2935', '621200', '621226', 105181616, 34189387, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3594, 3586, 3, '徽县', '2935', '621200', '621227', 106085632, 33767785, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3595, 3586, 3, '两当县', '2935', '621200', '621228', 106306959, 33910729, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3596, 3513, 2, '临夏回族自治州', '0930', '620000', '622900', 103212006, 35599446, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3597, 3596, 3, '临夏市', '0930', '622900', '622901', 103211634, 35599410, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3598, 3596, 3, '临夏县', '0930', '622900', '622921', 102993873, 35492360, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3599, 3596, 3, '康乐县', '0930', '622900', '622922', 103709852, 35371906, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3600, 3596, 3, '永靖县', '0930', '622900', '622923', 103319871, 35938933, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3601, 3596, 3, '广河县', '0930', '622900', '622924', 103576188, 35481688, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3602, 3596, 3, '和政县', '0930', '622900', '622925', 103350357, 35425971, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3603, 3596, 3, '东乡族自治县', '0930', '622900', '622926', 103389568, 35663830, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3604, 3596, 3, '积石山保安族东乡族撒拉族自治县', '0930', '622900', '622927', 102877473, 35712906, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3605, 3513, 2, '甘南藏族自治州', '0941', '620000', '623000', 102911008, 34986354, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3606, 3605, 3, '合作市', '0941', '623000', '623001', 102911490, 34985973, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3607, 3605, 3, '临潭县', '0941', '623000', '623021', 103353054, 34691640, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3608, 3605, 3, '卓尼县', '0941', '623000', '623022', 103508508, 34588165, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3609, 3605, 3, '舟曲县', '0941', '623000', '623023', 104370271, 33782964, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3610, 3605, 3, '迭部县', '0941', '623000', '623024', 103221009, 34055348, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3611, 3605, 3, '玛曲县', '0941', '623000', '623025', 102075767, 33998068, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3612, 3605, 3, '碌曲县', '0941', '623000', '623026', 102488495, 34589591, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3613, 3605, 3, '夏河县', '0941', '623000', '623027', 102520743, 35200853, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3614, 1, 1, '青海省', '', '100000', '630000', 101778916, 36623178, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3615, 3614, 2, '西宁市', '0971', '630000', '630100', 101778916, 36623178, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3616, 3615, 3, '城东区', '0971', '630100', '630102', 101796095, 36616043, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3617, 3615, 3, '城中区', '0971', '630100', '630103', 101784554, 36621181, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3618, 3615, 3, '城西区', '0971', '630100', '630104', 101763649, 36628323, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3619, 3615, 3, '城北区', '0971', '630100', '630105', 101761297, 36648448, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3620, 3615, 3, '大通回族土族自治县', '0971', '630100', '630121', 101684183, 36931343, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3621, 3615, 3, '湟中县', '0971', '630100', '630122', 101569475, 36500419, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3622, 3615, 3, '湟源县', '0971', '630100', '630123', 101263435, 36684818, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3623, 3614, 2, '海东市', '0972', '630000', '630200', 102103270, 36502916, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3624, 3623, 3, '乐都区', '0972', '630200', '630202', 102402431, 36480291, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3625, 3623, 3, '平安区', '0972', '630200', '630203', 102104295, 36502714, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3626, 3623, 3, '民和回族土族自治县', '0972', '630200', '630222', 102804209, 36329451, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3627, 3623, 3, '互助土族自治县', '0972', '630200', '630223', 101956734, 36839940, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3628, 3623, 3, '化隆回族自治县', '0972', '630200', '630224', 102262329, 36098322, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3629, 3623, 3, '循化撒拉族自治县', '0972', '630200', '630225', 102486534, 35847247, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3630, 3614, 2, '海北藏族自治州', '0970', '630000', '632200', 100901059, 36959435, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3631, 3630, 3, '门源回族自治县', '0970', '632200', '632221', 101618461, 37376627, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3632, 3630, 3, '祁连县', '0970', '632200', '632222', 100249778, 38175409, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3633, 3630, 3, '海晏县', '0970', '632200', '632223', 100900490, 36959542, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3634, 3630, 3, '刚察县', '0970', '632200', '632224', 100138417, 37326263, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3635, 3614, 2, '黄南藏族自治州', '0973', '630000', '632300', 102019988, 35517744, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3636, 3635, 3, '同仁县', '0973', '632300', '632321', 102017604, 35516337, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3637, 3635, 3, '尖扎县', '0973', '632300', '632322', 102031953, 35938205, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3638, 3635, 3, '泽库县', '0973', '632300', '632323', 101469343, 35036842, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3639, 3635, 3, '河南蒙古族自治县', '0973', '632300', '632324', 101611877, 34734522, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3640, 3614, 2, '海南藏族自治州', '0974', '630000', '632500', 100619542, 36280353, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3641, 3640, 3, '共和县', '0974', '632500', '632521', 100619597, 36280286, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3642, 3640, 3, '同德县', '0974', '632500', '632522', 100579465, 35254492, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3643, 3640, 3, '贵德县', '0974', '632500', '632523', 101431856, 36040456, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3644, 3640, 3, '兴海县', '0974', '632500', '632524', 99986963, 35589090, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3645, 3640, 3, '贵南县', '0974', '632500', '632525', 100747920, 35587085, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3646, 3614, 2, '果洛藏族自治州', '0975', '630000', '632600', 100242143, 34473600, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3647, 3646, 3, '玛沁县', '0975', '632600', '632621', 100243531, 34473386, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3648, 3646, 3, '班玛县', '0975', '632600', '632622', 100737955, 32931589, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3649, 3646, 3, '甘德县', '0975', '632600', '632623', 99902589, 33966987, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3650, 3646, 3, '达日县', '0975', '632600', '632624', 99651715, 33753259, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3651, 3646, 3, '久治县', '0975', '632600', '632625', 101484884, 33430217, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3652, 3646, 3, '玛多县', '0975', '632600', '632626', 98211343, 34915280, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3653, 3614, 2, '玉树藏族自治州', '0976', '630000', '632700', 97008522, 33004049, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3654, 3653, 3, '玉树市', '0976', '632700', '632701', 97008762, 33003929, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3655, 3653, 3, '杂多县', '0976', '632700', '632722', 95293423, 32891886, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3656, 3653, 3, '称多县', '0976', '632700', '632723', 97110893, 33367883, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3657, 3653, 3, '治多县', '0976', '632700', '632724', 95616843, 33852322, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3658, 3653, 3, '囊谦县', '0976', '632700', '632725', 96479797, 32203206, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3659, 3653, 3, '曲麻莱县', '0976', '632700', '632726', 95800674, 34126540, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3660, 3614, 2, '海西蒙古族藏族自治州', '0977', '630000', '632800', 97370785, 37374663, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3661, 3660, 3, '格尔木市', '0977', '632800', '632801', 94905777, 36401541, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3662, 3660, 3, '德令哈市', '0977', '632800', '632802', 97370143, 37374555, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3663, 3660, 3, '乌兰县', '0977', '632800', '632821', 98479852, 36930389, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3664, 3660, 3, '都兰县', '0977', '632800', '632822', 98089161, 36298553, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3665, 3660, 3, '天峻县', '0977', '632800', '632823', 99020780, 37299060, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3666, 3660, 3, '海西蒙古族藏族自治州直辖', '0977', '632800', '632825', 95357233, 37853631, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3667, 1, 1, '宁夏回族自治区', '', '100000', '640000', 106278179, 38466370, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3668, 3667, 2, '银川市', '0951', '640000', '640100', 106278179, 38466370, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3669, 3668, 3, '兴庆区', '0951', '640100', '640104', 106278393, 38467470, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3670, 3668, 3, '西夏区', '0951', '640100', '640105', 106132116, 38492424, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3671, 3668, 3, '金凤区', '0951', '640100', '640106', 106228486, 38477353, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3672, 3668, 3, '永宁县', '0951', '640100', '640121', 106253781, 38280430, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3673, 3668, 3, '贺兰县', '0951', '640100', '640122', 106345904, 38554563, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3674, 3668, 3, '灵武市', '0951', '640100', '640181', 106334701, 38094058, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3675, 3667, 2, '石嘴山市', '0952', '640000', '640200', 106376173, 39013330, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3676, 3675, 3, '大武口区', '0952', '640200', '640202', 106376651, 39014158, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3677, 3675, 3, '惠农区', '0952', '640200', '640205', 106775513, 39230094, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3678, 3675, 3, '平罗县', '0952', '640200', '640221', 106544890, 38906740, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3679, 3667, 2, '吴忠市', '0953', '640000', '640300', 106199409, 37986165, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3680, 3679, 3, '利通区', '0953', '640300', '640302', 106199419, 37985967, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3681, 3679, 3, '红寺堡区', '0953', '640300', '640303', 106067315, 37421616, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3682, 3679, 3, '盐池县', '0953', '640300', '640323', 107405410, 37784222, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3683, 3679, 3, '同心县', '0953', '640300', '640324', 105914764, 36982900, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3684, 3679, 3, '青铜峡市', '0953', '640300', '640381', 106075395, 38021509, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3685, 3667, 2, '固原市', '0954', '640000', '640400', 106285241, 36004561, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3686, 3685, 3, '原州区', '0954', '640400', '640402', 106284770, 36005337, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3687, 3685, 3, '西吉县', '0954', '640400', '640422', 105731801, 35965384, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3688, 3685, 3, '隆德县', '0954', '640400', '640423', 106123440, 35618234, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3689, 3685, 3, '泾源县', '0954', '640400', '640424', 106338674, 35493440, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3690, 3685, 3, '彭阳县', '0954', '640400', '640425', 106641512, 35849975, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3691, 3667, 2, '中卫市', '1953', '640000', '640500', 105189568, 37514951, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3692, 3691, 3, '沙坡头区', '1953', '640500', '640502', 105190536, 37514564, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3693, 3691, 3, '中宁县', '1953', '640500', '640521', 105675784, 37489736, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3694, 3691, 3, '海原县', '1953', '640500', '640522', 105647323, 36562007, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3695, 1, 1, '新疆维吾尔自治区', '', '100000', '650000', 87617733, 43792818, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3696, 3695, 2, '乌鲁木齐市', '0991', '650000', '650100', 87617733, 43792818, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3697, 3696, 3, '天山区', '0991', '650100', '650102', 87620116, 43796428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3698, 3696, 3, '沙依巴克区', '0991', '650100', '650103', 87596639, 43788872, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3699, 3696, 3, '新市区', '0991', '650100', '650104', 87560653, 43870882, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3700, 3696, 3, '水磨沟区', '0991', '650100', '650105', 87613093, 43816747, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3701, 3696, 3, '头屯河区', '0991', '650100', '650106', 87425823, 43876053, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3702, 3696, 3, '达坂城区', '0991', '650100', '650107', 88309940, 43361810, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3703, 3696, 3, '米东区', '0991', '650100', '650109', 87691801, 43960982, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3704, 3696, 3, '乌鲁木齐县', '0991', '650100', '650121', 87505603, 43982546, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3705, 3695, 2, '克拉玛依市', '0990', '650000', '650200', 84873946, 45595886, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3706, 3705, 3, '独山子区', '0990', '650200', '650202', 84882267, 44327207, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3707, 3705, 3, '克拉玛依区', '0990', '650200', '650203', 84868918, 45600477, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3708, 3705, 3, '白碱滩区', '0990', '650200', '650204', 85129882, 45689021, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3709, 3705, 3, '乌尔禾区', '0990', '650200', '650205', 85697767, 46087760, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3710, 3695, 2, '吐鲁番市', '0995', '650000', '650400', 89184078, 42947613, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3711, 3710, 3, '高昌区', '0995', '650400', '650402', 89182324, 42947627, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3712, 3710, 3, '鄯善县', '0995', '650400', '650421', 90212692, 42865503, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3713, 3710, 3, '托克逊县', '0995', '650400', '650422', 88655771, 42793536, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3714, 3695, 2, '哈密市', '0902', '650000', '652200', 93513160, 42833248, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3715, 3714, 3, '伊州区', '0902', '652200', '652201', 93509174, 42833888, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3716, 3714, 3, '巴里坤哈萨克自治县', '0902', '652200', '652222', 93021795, 43599032, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3717, 3714, 3, '伊吾县', '0902', '652200', '652223', 94692773, 43252012, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3718, 3695, 2, '昌吉回族自治州', '0994', '650000', '652300', 87304012, 44014577, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3719, 3718, 3, '昌吉市', '0994', '652300', '652301', 87304112, 44013183, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3720, 3718, 3, '阜康市', '0994', '652300', '652302', 87983840, 44152153, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3721, 3718, 3, '呼图壁县', '0994', '652300', '652323', 86888613, 44189342, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3722, 3718, 3, '玛纳斯县', '0994', '652300', '652324', 86217687, 44305625, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3723, 3718, 3, '奇台县', '0994', '652300', '652325', 89591437, 44021996, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3724, 3718, 3, '吉木萨尔县', '0994', '652300', '652327', 89181288, 43997162, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3725, 3718, 3, '木垒哈萨克自治县', '0994', '652300', '652328', 90282833, 43832442, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3726, 3695, 2, '博尔塔拉蒙古自治州', '0909', '650000', '652700', 82074778, 44903258, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3727, 3726, 3, '博乐市', '0909', '652700', '652701', 82072237, 44903087, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3728, 3726, 3, '阿拉山口市', '0909', '652700', '652702', 82569389, 45167770, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3729, 3726, 3, '精河县', '0909', '652700', '652722', 82892938, 44605645, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3730, 3726, 3, '温泉县', '0909', '652700', '652723', 81030990, 44973751, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3731, 3695, 2, '巴音郭楞蒙古自治州', '0996', '650000', '652800', 86150969, 41768552, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3732, 3731, 3, '库尔勒市', '0996', '652800', '652801', 86145948, 41763122, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3733, 3731, 3, '轮台县', '0996', '652800', '652822', 84248542, 41781266, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3734, 3731, 3, '尉犁县', '0996', '652800', '652823', 86263412, 41337428, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3735, 3731, 3, '若羌县', '0996', '652800', '652824', 88168807, 39023807, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3736, 3731, 3, '且末县', '0996', '652800', '652825', 85532629, 38138562, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3737, 3731, 3, '焉耆回族自治县', '0996', '652800', '652826', 86569800, 42064349, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3738, 3731, 3, '和静县', '0996', '652800', '652827', 86391067, 42317160, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3739, 3731, 3, '和硕县', '0996', '652800', '652828', 86864947, 42268863, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3740, 3731, 3, '博湖县', '0996', '652800', '652829', 86631576, 41980166, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3741, 3695, 2, '阿克苏地区', '0997', '650000', '652900', 80265068, 41170712, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3742, 3741, 3, '阿克苏市', '0997', '652900', '652901', 80262900, 41171272, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3743, 3741, 3, '温宿县', '0997', '652900', '652922', 80243273, 41272995, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3744, 3741, 3, '库车县', '0997', '652900', '652923', 82963040, 41717141, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3745, 3741, 3, '沙雅县', '0997', '652900', '652924', 82780770, 41226268, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3746, 3741, 3, '新和县', '0997', '652900', '652925', 82610828, 41551176, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3747, 3741, 3, '拜城县', '0997', '652900', '652926', 81869881, 41796101, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3748, 3741, 3, '乌什县', '0997', '652900', '652927', 79230805, 41215870, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3749, 3741, 3, '阿瓦提县', '0997', '652900', '652928', 80378426, 40638422, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3750, 3741, 3, '柯坪县', '0997', '652900', '652929', 79047850, 40506240, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3751, 3695, 2, '克孜勒苏柯尔克孜自治州', '0908', '650000', '653000', 76172825, 39713431, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3752, 3751, 3, '阿图什市', '0908', '653000', '653001', 76173939, 39712898, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3753, 3751, 3, '阿克陶县', '0908', '653000', '653022', 75945159, 39147079, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3754, 3751, 3, '阿合奇县', '0908', '653000', '653023', 78450164, 40937567, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3755, 3751, 3, '乌恰县', '0908', '653000', '653024', 75259690, 39716633, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3756, 3695, 2, '喀什地区', '0998', '650000', '653100', 75989138, 39467664, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3757, 3756, 3, '喀什市', '0998', '653100', '653101', 75988380, 39467861, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3758, 3756, 3, '疏附县', '0998', '653100', '653121', 75863075, 39378306, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3759, 3756, 3, '疏勒县', '0998', '653100', '653122', 76053653, 39399461, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3760, 3756, 3, '英吉沙县', '0998', '653100', '653123', 76174292, 38929839, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3761, 3756, 3, '泽普县', '0998', '653100', '653124', 77273593, 38191217, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3762, 3756, 3, '莎车县', '0998', '653100', '653125', 77248884, 38414499, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3763, 3756, 3, '叶城县', '0998', '653100', '653126', 77420353, 37884679, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3764, 3756, 3, '麦盖提县', '0998', '653100', '653127', 77651538, 38903384, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3765, 3756, 3, '岳普湖县', '0998', '653100', '653128', 76772400, 39235248, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3766, 3756, 3, '伽师县', '0998', '653100', '653129', 76741982, 39494325, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3767, 3756, 3, '巴楚县', '0998', '653100', '653130', 78550410, 39783479, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3768, 3756, 3, '塔什库尔干塔吉克自治县', '0998', '653100', '653131', 75228068, 37775437, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3769, 3695, 2, '和田地区', '0903', '650000', '653200', 79925330, 37110687, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3770, 3769, 3, '和田市', '0903', '653200', '653201', 79927542, 37108944, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3771, 3769, 3, '和田县', '0903', '653200', '653221', 79819070, 37120031, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3772, 3769, 3, '墨玉县', '0903', '653200', '653222', 79736629, 37271511, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3773, 3769, 3, '皮山县', '0903', '653200', '653223', 78282301, 37616332, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3774, 3769, 3, '洛浦县', '0903', '653200', '653224', 80184038, 37074377, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3775, 3769, 3, '策勒县', '0903', '653200', '653225', 80803572, 37001672, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3776, 3769, 3, '于田县', '0903', '653200', '653226', 81667845, 36854628, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3777, 3769, 3, '民丰县', '0903', '653200', '653227', 82692354, 37064909, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3778, 3695, 2, '伊犁哈萨克自治州', '0999', '650000', '654000', 81317946, 43921860, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3779, 3778, 3, '伊宁市', '0999', '654000', '654002', 81316343, 43922209, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3780, 3778, 3, '奎屯市', '0999', '654000', '654003', 84901602, 44423445, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3781, 3778, 3, '霍尔果斯市', '0999', '654000', '654004', 80420759, 44201669, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3782, 3778, 3, '伊宁县', '0999', '654000', '654021', 81524671, 43977876, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3783, 3778, 3, '察布查尔锡伯自治县', '0999', '654000', '654022', 81150874, 43838883, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3784, 3778, 3, '霍城县', '0999', '654000', '654023', 80872508, 44049912, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3785, 3778, 3, '巩留县', '0999', '654000', '654024', 82227044, 43481618, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3786, 3778, 3, '新源县', '0999', '654000', '654025', 83258493, 43434249, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3787, 3778, 3, '昭苏县', '0999', '654000', '654026', 81126029, 43157765, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3788, 3778, 3, '特克斯县', '0999', '654000', '654027', 81840058, 43214861, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3789, 3778, 3, '尼勒克县', '0999', '654000', '654028', 82504119, 43789737, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3790, 3695, 2, '塔城地区', '0901', '650000', '654200', 82985732, 46746301, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3791, 3790, 3, '塔城市', '0901', '654200', '654201', 82983988, 46746281, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3792, 3790, 3, '乌苏市', '0901', '654200', '654202', 84677624, 44430115, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3793, 3790, 3, '额敏县', '0901', '654200', '654221', 83622118, 46522555, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3794, 3790, 3, '沙湾县', '0901', '654200', '654223', 85622508, 44329544, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3795, 3790, 3, '托里县', '0901', '654200', '654224', 83604690, 45935863, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3796, 3790, 3, '裕民县', '0901', '654200', '654225', 82982157, 46202781, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3797, 3790, 3, '和布克赛尔蒙古自治县', '0901', '654200', '654226', 85733551, 46793001, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3798, 3695, 2, '阿勒泰地区', '0906', '650000', '654300', 88139630, 47848393, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3799, 3798, 3, '阿勒泰市', '0906', '654300', '654301', 88138743, 47848911, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3800, 3798, 3, '布尔津县', '0906', '654300', '654321', 86861860, 47704530, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3801, 3798, 3, '富蕴县', '0906', '654300', '654322', 89524993, 46993106, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3802, 3798, 3, '福海县', '0906', '654300', '654323', 87494569, 47113128, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3803, 3798, 3, '哈巴河县', '0906', '654300', '654324', 86418964, 48059284, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3804, 3798, 3, '青河县', '0906', '654300', '654325', 90381561, 46672446, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3805, 3798, 3, '吉木乃县', '0906', '654300', '654326', 85876064, 47434633, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3806, 3695, 2, '石河子市', '0993', '650000', '659001', 86041075, 44305886, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3807, 3695, 2, '阿拉尔市', '1997', '650000', '659002', 81285884, 40541914, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3808, 3695, 2, '图木舒克市', '1998', '650000', '659003', 79077978, 39867316, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3809, 3695, 2, '五家渠市', '1994', '650000', '659004', 87526884, 44167401, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3810, 3695, 2, '北屯市', '1906', '650000', '659005', 87824932, 47353177, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3811, 3695, 2, '铁门关市', '1996', '650000', '659006', 85501218, 41827251, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3812, 3695, 2, '双河市', '1909', '650000', '659007', 82353656, 44840524, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3813, 3695, 2, '可克达拉市', '1999', '650000', '659008', 80635790, 43683200, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3814, 3695, 2, '昆玉市', '1903', '650000', '659009', 79287372, 37207994, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3815, 1, 1, '台湾省', '1886', '100000', '710000', 121509062, 25044332, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3816, 1, 1, '香港特别行政区1', '1852', '100000', '810000', 114173355, 22320048, 125, 0, 0, 1, 1561382987, 1);
INSERT INTO `think_city` VALUES (3817, 3816, 2, '中西区', '1852', '810000', '810001', 114154334, 22281931, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3818, 3816, 2, '湾仔区', '1852', '810000', '810002', 114182990, 22276345, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3819, 3821, 3, '湾仔', '1852', '810002', '810002', 114177717, 22274663, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3820, 3821, 3, '湾仔峡', '1852', '810002', '810002', 114174821, 22263993, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3821, 3821, 3, '扫杆埔', '1852', '810002', '810002', 114194807, 22268306, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3822, 3816, 2, '东区', '1852', '810000', '810003', 114225965, 22279779, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3823, 3823, 3, '北角', '1852', '810003', '810003', 114213297, 22289517, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3824, 3816, 2, '南区', '1852', '810000', '810004', 114160023, 22245811, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3825, 3827, 3, '赤柱', '1852', '810004', '810004', 114217540, 22217648, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3826, 3827, 3, '黄竹坑', '1852', '810004', '810004', 114172464, 22246218, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3827, 3827, 3, '薄扶林', '1852', '810004', '810004', 114133400, 22266019, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3828, 3816, 2, '油尖旺区', '1852', '810000', '810005', 114173347, 22311632, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3829, 3816, 2, '深水埗区', '1852', '810000', '810006', 114163349, 22333775, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3830, 3831, 3, '荔枝角', '1852', '810006', '810006', 114145466, 22332734, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3831, 3831, 3, '深水埗', '1852', '810006', '810006', 114165570, 22329211, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3832, 3816, 2, '九龙城区', '1852', '810000', '810007', 114193047, 22312373, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3833, 3816, 2, '黄大仙区', '1852', '810000', '810008', 114203985, 22336112, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3834, 3834, 3, '钻石山', '1852', '810008', '810008', 114207027, 22339915, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3835, 3816, 2, '观塘区', '1852', '810000', '810009', 114214083, 22320679, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3836, 3837, 3, '九龙湾', '1852', '810009', '810009', 114214030, 22323400, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3837, 3837, 3, '秀茂平冻肉', '1852', '810009', '810009', 114236667, 22316076, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3838, 3816, 2, '荃湾区', '1852', '810000', '810010', 114121234, 22368458, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3839, 3840, 3, '欣澳', '1852', '810010', '810010', 114037483, 22328427, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3840, 3840, 3, '阴澳', '1852', '810010', '810010', 114037490, 22328430, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3841, 3816, 2, '屯门区', '1852', '810000', '810011', 113976308, 22393896, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3842, 3843, 3, '小榄烧烤乐园', '1852', '810011', '810011', 114019940, 22367140, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3843, 3843, 3, '龙鼓滩', '1852', '810011', '810011', 113931429, 22379027, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3844, 3816, 2, '元朗区', '1852', '810000', '810012', 114032528, 22441320, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3845, 3849, 3, '蓝地', '1852', '810012', '810012', 113994612, 22424394, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3846, 3849, 3, '屏山', '1852', '810012', '810012', 114016569, 22439798, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3847, 3849, 3, '八乡', '1852', '810012', '810012', 114098370, 22433136, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3848, 3849, 3, '大棠', '1852', '810012', '810012', 114029990, 22414593, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3849, 3849, 3, '逢吉乡', '1852', '810012', '810012', 114063044, 22454810, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3850, 3816, 2, '北区', '1852', '810000', '810013', 114147404, 22496143, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3851, 3852, 3, '粉岭', '1852', '810013', '810013', 114139830, 22493813, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3852, 3852, 3, '龍躍頭鄉', '1852', '810013', '810013', 114154061, 22500422, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3853, 3816, 2, '大埔区', '1852', '810000', '810014', 114171713, 22445730, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3854, 3855, 3, '大埔', '1852', '810014', '810014', 114169460, 22448000, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3855, 3855, 3, '船湾', '1852', '810014', '810014', 114212169, 22460484, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3856, 3816, 2, '西贡区', '1852', '810000', '810015', 114264813, 22314203, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3857, 3816, 2, '沙田区', '1852', '810000', '810016', 114195126, 22379715, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3858, 3858, 3, '马鞍山', '1852', '810016', '810016', 114233730, 22419839, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3859, 3816, 2, '葵青区', '1852', '810000', '810017', 114139180, 22363908, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3860, 3860, 3, '青衣', '1852', '810017', '810017', 114104330, 22332316, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3861, 3816, 2, '离岛区', '1852', '810000', '810018', 113946059, 22286371, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3862, 3864, 3, '昂坪', '1852', '810018', '810018', 113919481, 22252509, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3863, 3864, 3, '石壁', '1852', '810018', '810018', 113897450, 22224000, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3864, 3864, 3, '梅窝乡', '1852', '810018', '810018', 114000813, 22264829, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3865, 1, 1, '澳门特别行政区', '1853', '100000', '820000', 113549090, 22198951, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3866, 3865, 2, '花地玛堂区', '1853', '820000', '820001', 113552965, 22207882, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3867, 3865, 2, '花王堂区', '1853', '820000', '820002', 113549052, 22199175, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3868, 3865, 2, '望德堂区', '1853', '820000', '820003', 113550252, 22193791, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3869, 3865, 2, '大堂区', '1853', '820000', '820004', 113553740, 22188119, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3870, 3865, 2, '风顺堂区', '1853', '820000', '820005', 113541670, 22187778, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3871, 3865, 2, '嘉模堂区', '1853', '820000', '820006', 113558783, 22154124, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3872, 3865, 2, '路凼填海区', '1853', '820000', '820007', 113569250, 22136546, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3873, 3865, 2, '圣方济各堂区', '1853', '820000', '820008', 113559954, 22124049, 125, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3874, 0, 0, '广东', '001', '', '', 0, 0, 1, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3875, 0, 0, 'dfsgdsgds', 'dsgdsgdsg', '', '', 0, 0, 1, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3876, 0, 0, '26', '5656+', '', '', 0, 0, 2, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3877, 0, 0, '河南', '1', '', '', 0, 0, 1, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3878, 0, 0, '11111', '1111111111', '', '', 0, 0, 123, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3879, 0, 0, '12', '22', '', '', 0, 0, 11, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3880, 0, 0, '123', '123', '', '', 0, 0, 123, 0, 0, 0, 0, 1);
INSERT INTO `think_city` VALUES (3881, 0, 0, 'a', '323', '', '', 0, 0, 125, 1, 1561382871, 0, 0, 1);
INSERT INTO `think_city` VALUES (3882, 0, 0, 'aa', 'aa', '', '', 0, 0, 125, 1, 1561382913, 0, 0, 1);
INSERT INTO `think_city` VALUES (3883, 0, 0, 'aaa', '010', '', '', 0, 0, 125, 1, 1561382958, 0, 0, 1);

-- ----------------------------
-- Table structure for think_config
-- ----------------------------
DROP TABLE IF EXISTS `think_config`;
CREATE TABLE `think_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置标题',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置值',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置项',
  `group_id` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分组ID',
  `sub_group` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1正常 2停用',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置说明',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识：1正常 0删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_config
-- ----------------------------
INSERT INTO `think_config` VALUES (1, 'site_name', '网站名称', 'RXThinkCMF_TP5.1旗舰版', '', 1, 0, 'text', 1, 1, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (2, 'site_url', '网站网址', 'http://www.rxthink.cn', '', 1, 0, 'text', 1, 5, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (3, 'site_logo', '网站LOGO', '/config/20200714/2a8b21e299a5aee3525.png', '', 1, 0, 'image', 1, 10, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (4, 'site_contact_address', '联系地址', '江苏省南京市建邺区奥体大街168号', '', 1, 0, 'text', 1, 15, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (5, 'site_contact_mobile', '联系电话', '0517-84283179', '', 1, 0, 'text', 1, 20, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (6, 'site_post', '邮政编码', '221000', '', 1, 0, 'text', 1, 25, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (7, 'site_email', '电子邮件', '1175401194@qq.com', '', 1, 0, 'text', 1, 30, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (8, 'site_beian', '备案编号', '苏ICP备19005170号', '', 1, 0, 'text', 1, 35, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (9, 'site_album', '网站图册', 'a:4:{i:0;s:40:\"/config/20200714/ca3d998d5c4ca65f420.jpg\";i:1;s:40:\"/config/20200714/9bd38823df28ccf6434.jpg\";i:2;s:40:\"/config/20200714/4aa2af59c690e862407.jpg\";i:3;s:40:\"/config/20200714/db9d26753ed79d0b572.jpg\";}', '', 1, 0, 'images', 1, 40, '', 1, 0, 1, 1594709957, 1);
INSERT INTO `think_config` VALUES (10, 'smtp_host', 'SMTP地址', 'smtp.qq.com', '', 2, 0, 'text', 1, 1, '', 1, 0, 1, 1594710307, 1);
INSERT INTO `think_config` VALUES (11, 'smtp_port', 'SMTP端口', '8080', '', 2, 0, 'text', 1, 5, '', 1, 0, 1, 1594710307, 1);
INSERT INTO `think_config` VALUES (12, 'smtp_username', 'SMTP用户名', 'demo', '', 2, 0, 'text', 1, 10, '', 1, 0, 1, 1594710307, 1);
INSERT INTO `think_config` VALUES (13, 'smtp_password', 'SMTP密码', '123456', '', 2, 0, 'text', 1, 15, '', 1, 0, 1, 1594710307, 1);
INSERT INTO `think_config` VALUES (14, 'smtp_ssl', '启用SSL', '1', '1:启用\n2:停用', 2, 0, 'radio', 1, 20, '', 1, 0, 1, 1594710307, 1);
INSERT INTO `think_config` VALUES (15, 'smtp_from', '发件人', '1175401194@qq.com', '', 2, 0, 'text', 1, 25, '', 1, 0, 1, 1594710307, 1);
INSERT INTO `think_config` VALUES (16, 'wx_appkey', '微信AppKey', 'wx124231523543654', '', 3, 0, 'text', 1, 1, '', 1, 0, 1, 1594710397, 1);
INSERT INTO `think_config` VALUES (17, 'wx_appsecret', '微信AppSecret', '42b0e78dba6de7f631ab7d3c7ed7ac21', '', 3, 0, 'text', 1, 5, '', 1, 0, 1, 1594710397, 1);
INSERT INTO `think_config` VALUES (18, 'accessKeyId', '短信KeyId', 'LTAIiiZGTbjvJRFJKHMAE', '', 4, 0, 'text', 1, 1, '', 1, 0, 1, 1594710551, 1);
INSERT INTO `think_config` VALUES (19, 'accessKeySecret', '短信Secret', 'xkki8v10wV3uUx637mk4eNNykTaMzNFGH', '', 4, 0, 'text', 1, 5, '', 1, 0, 1, 1594710551, 1);
INSERT INTO `think_config` VALUES (20, 'signName', '短信签名', '研发中心', '', 4, 0, 'text', 1, 10, '', 1, 0, 1, 1594710551, 1);
INSERT INTO `think_config` VALUES (21, 'templateCode', '模板CODE', 'SMS_18122342354', '', 4, 0, 'text', 1, 15, '', 1, 0, 1, 1594710551, 1);
INSERT INTO `think_config` VALUES (22, 'templateParam', '模板参数', '{\"code\":\"123456\"}', '', 4, 0, 'text', 1, 20, '', 1, 0, 1, 1594710551, 1);

-- ----------------------------
-- Table structure for think_config_group
-- ----------------------------
DROP TABLE IF EXISTS `think_config_group`;
CREATE TABLE `think_config_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组名称',
  `sort` tinyint(2) NOT NULL,
  `create_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_config_group
-- ----------------------------
INSERT INTO `think_config_group` VALUES (1, '基本设置', 1, 1, 0, 1, 1594708796, 1);
INSERT INTO `think_config_group` VALUES (2, '邮件设置', 5, 1, 0, 1, 1594708799, 1);
INSERT INTO `think_config_group` VALUES (3, '微信设置', 10, 1, 0, 1, 1594708802, 1);
INSERT INTO `think_config_group` VALUES (4, '短信设置', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_config_group` VALUES (5, '阿里云存储', 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_crontab
-- ----------------------------
DROP TABLE IF EXISTS `think_crontab`;
CREATE TABLE `think_crontab`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '任务类型：1请求URL 2执行SQL 3执行Shell',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务内容',
  `schedule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'crontab格式',
  `sleep` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '延迟秒数执行',
  `maximums` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大执行次数 0为不限',
  `executes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已经执行的次数',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 4 COMMENT '状态：1完成 2过期 3隐藏 4正常',
  `start_time` int(10) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `execute_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后执行时间',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_crontab
-- ----------------------------
INSERT INTO `think_crontab` VALUES (1, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (2, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (3, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (4, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (5, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (6, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (7, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (8, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (9, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (10, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (11, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (12, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (13, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (14, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (15, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (16, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (17, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (18, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (19, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (20, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (21, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (22, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (23, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (24, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (25, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (26, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (27, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (28, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (29, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (30, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (31, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (32, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (33, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (34, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (35, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (36, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (37, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (38, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (39, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (40, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (41, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (42, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (43, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (44, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (45, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (46, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (47, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (48, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (49, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (50, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (51, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_crontab` VALUES (52, 3, '订单状态处理', '订单状态处理', '*/2 * * * * /bin/sh /www/shell/orderstatus.sh ', 0, 10, 0, 8, 1, 1594915200, 1595433600, 0, 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_demo
-- ----------------------------
DROP TABLE IF EXISTS `think_demo`;
CREATE TABLE `think_demo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职级名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态：1正常 2停用',
  `type` int(10) UNSIGNED NULL DEFAULT 1 COMMENT '类型：1京东 2淘宝 3拼多多 4唯品会',
  `is_vip` tinyint(1) UNSIGNED NULL DEFAULT 2 COMMENT '是否VIP：1是 2否',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '演示管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_demo
-- ----------------------------
INSERT INTO `think_demo` VALUES (1, '总经理', '/images/demo/20200717/9224aafffbd2ae4a538.png', 1, 1, 1, 125, 1, 1577942890, 1, 1594955919, 1);
INSERT INTO `think_demo` VALUES (2, '副总经理', '/images/demo/20200717/ef8d782686ce6d2e985.png', 1, 1, 2, 125, 1, 1577942895, 1, 1594955766, 1);
INSERT INTO `think_demo` VALUES (3, '总监', '/images/demo/20200717/4879737b55eeb547234.png', 1, 1, 1, 125, 1, 1577942912, 1, 1594955925, 1);
INSERT INTO `think_demo` VALUES (4, '经理', '/images/demo/20200715/05e54ba70713069e922.png', 1, 1, 2, 125, 1, 1577942916, 1, 1594955946, 1);
INSERT INTO `think_demo` VALUES (5, '主管', '/images/demo/20200715/fbc8c4c9d40d7a74382.png', 1, 1, 2, 125, 1, 1577942920, 1, 1594805838, 1);

-- ----------------------------
-- Table structure for think_dep
-- ----------------------------
DROP TABLE IF EXISTS `think_dep`;
CREATE TABLE `think_dep`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型：1公司 2部门',
  `has_child` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否有子级：1有 2无',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID',
  `auth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限的序列化信息',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '排序',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`pid`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_dep
-- ----------------------------
INSERT INTO `think_dep` VALUES (1, '南京研发中心', 1, 1, 0, '', 125, 1, 0, 1, 1594973349, 1);
INSERT INTO `think_dep` VALUES (2, '技术中心', 2, 1, 1, '', 125, 1, 0, 0, 0, 1);
INSERT INTO `think_dep` VALUES (3, '运维中心', 2, 1, 1, '', 125, 1, 0, 0, 0, 1);
INSERT INTO `think_dep` VALUES (4, '市场部', 2, 1, 1, '', 125, 1, 0, 0, 0, 1);
INSERT INTO `think_dep` VALUES (5, '后勤部', 2, 1, 1, '', 125, 1, 0, 0, 0, 1);
INSERT INTO `think_dep` VALUES (6, '推广中心', 2, 1, 1, '', 125, 1, 0, 0, 0, 1);
INSERT INTO `think_dep` VALUES (7, '售后服务部', 2, 1, 1, '', 125, 1, 0, 0, 0, 1);
INSERT INTO `think_dep` VALUES (8, '测试中心', 2, 2, 1, '', 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_dic
-- ----------------------------
DROP TABLE IF EXISTS `think_dic`;
CREATE TABLE `think_dic`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `tag` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内部标签',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `type_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字典类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1在用 2停用',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标记',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `mark`(`mark`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_dic
-- ----------------------------
INSERT INTO `think_dic` VALUES (1, '字典类型', 'DIC_SYSTEM_TYPE', '1:系统设置\n2:其他', 1, 1, '暂无', 125, 0, 1520393118, 1, 1593654286, 1);
INSERT INTO `think_dic` VALUES (2, '性别', 'DIC_SYSTEM_GENDER', '1:男\n2:女\n3:未知', 1, 1, '', 125, 0, 1520393270, 0, 1520393391, 1);
INSERT INTO `think_dic` VALUES (3, '职位【管理人员】', 'DIC_ADMIN_POSITION', '1:技术总监\n2:PHP工程师\n3:IOS工程师\n4:安卓工程师\n5:前端工程师\n6:UI设计师\n7:测试工程师\n8:产品专员', 1, 1, '', 125, 0, 1520393332, 1, 1520566165, 1);
INSERT INTO `think_dic` VALUES (4, '应用类别', 'DIC_APP_TYPE', '1:应用\n2:预览\n3:写入', 1, 1, '', 125, 0, 1520393457, 0, 0, 1);
INSERT INTO `think_dic` VALUES (5, '文章发布状态', 'DIC_ARTICLE_STATUS', '1:保存草稿\n2:等待审核\n3:即时发布', 1, 1, '', 125, 1, 1520912326, 1, 1520912333, 1);
INSERT INTO `think_dic` VALUES (6, '友链分类', 'DIC_LINK_CATEGORY', '1:友情链接\n2:合作伙伴', 1, 1, '', 125, 1, 1521803681, 1, 1521803698, 1);
INSERT INTO `think_dic` VALUES (7, '使用平台', 'DIC_SYSTEM_USE_PLATFORM', '1:PC站\n2:WAP站\n3:APP端', 1, 1, '', 125, 1, 1521813122, 1, 1582623286, 1);
INSERT INTO `think_dic` VALUES (8, '友链数据类型', 'DIC_LINK_T_TYPE', '1:文字\n2:图片', 1, 1, '', 125, 1, 1521813279, 0, 0, 1);
INSERT INTO `think_dic` VALUES (9, '广告格式类型', 'DIC_AD_T_TYPE', '1:图片\n2:文字\n3:视频\n4:推荐', 1, 1, '', 125, 1, 1523693421, 0, 0, 1);
INSERT INTO `think_dic` VALUES (10, '广告推荐类型', 'DIC_AD_RECOMM_TYPE', '1:CMS文章\n2:其他', 1, 1, '', 125, 1, 1523693676, 1, 1527047120, 1);
INSERT INTO `think_dic` VALUES (11, '系统短信类型', 'DIC_SETTING_SMS_TYPE', '1:NORMAL\n2:其他', 1, 1, '', 125, 1, 1523863409, 1, 1594974410, 1);

-- ----------------------------
-- Table structure for think_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `think_dic_type`;
CREATE TABLE `think_dic_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_dic_type
-- ----------------------------
INSERT INTO `think_dic_type` VALUES (1, '基础配置', 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_item
-- ----------------------------
DROP TABLE IF EXISTS `think_item`;
CREATE TABLE `think_item`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '站点类型:1普通站点 2其他',
  `url` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点地址',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点图片地址',
  `is_domain` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否二级域名1是 2非',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1可用 2不可用',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点备注',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标志',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站点配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_item
-- ----------------------------
INSERT INTO `think_item` VALUES (1, '系统网站', 1, 'http://www.rxthink.cn', '/images/item/20200717/e000cdfc8f4cd91d474.png', 2, 1, '系统网站', 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_item_cate
-- ----------------------------
DROP TABLE IF EXISTS `think_item_cate`;
CREATE TABLE `think_item_cate`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '站点编号',
  `pid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '父级分类ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `pinyin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音(全)',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音(简)',
  `is_cover` tinyint(1) UNSIGNED NULL DEFAULT 2 COMMENT '有无封面:1有 2无',
  `cover` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态：1启用 2停用',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 125 COMMENT '排序',
  `create_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加用户',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新用户',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标志',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`item_id`, `mark`) USING BTREE,
  INDEX `parent_id`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_item_cate
-- ----------------------------
INSERT INTO `think_item_cate` VALUES (1, 1, 0, '网站首页', '网站首页', 'wangzhanshouye', 'wzsy', 1, '/images/itemcate/20200717/a47d84e50611d123434.png', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_item_cate` VALUES (2, 1, 1, '广告推荐', '广告推荐', 'guanggaotuijian', 'ggtj', 1, '/images/itemcate/20200717/bdf6dee88d064d39981.png', 1, 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_layout
-- ----------------------------
DROP TABLE IF EXISTS `think_layout`;
CREATE TABLE `think_layout`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推荐标题',
  `image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `item_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '页面编号',
  `loc_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '页面的位置',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型：1新闻资讯 2其他',
  `type_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对应的类型编号',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加用户',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新用户',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面布局管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_layout
-- ----------------------------
INSERT INTO `think_layout` VALUES (1, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (2, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (3, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (4, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (5, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (6, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (7, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (8, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (9, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (10, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (11, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (12, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (13, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (14, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (15, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (16, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (17, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (18, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (19, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (20, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (21, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (22, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (23, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (24, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (25, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (26, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (27, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (28, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (29, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (30, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (31, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (32, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (33, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (34, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (35, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (36, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (37, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (38, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (39, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (40, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (41, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (42, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (43, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (44, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (45, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (46, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (47, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (48, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (49, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_layout` VALUES (50, '2020年国庆狂欢节平台大促销', '/images/layout/20200717/4d2f957d3e2f4680215.png', 0, 1, 1, 0, 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_layout_desc
-- ----------------------------
DROP TABLE IF EXISTS `think_layout_desc`;
CREATE TABLE `think_layout_desc`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `item_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '页面编号',
  `loc_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '位置编号',
  `loc_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面位置描述',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 125 COMMENT '排序',
  `create_user` mediumint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新用户',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '布局描述管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_layout_desc
-- ----------------------------
INSERT INTO `think_layout_desc` VALUES (1, 1, 1, '网站首页右上角新闻推荐', 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_level
-- ----------------------------
DROP TABLE IF EXISTS `think_level`;
CREATE TABLE `think_level`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职级名称',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态：1正常 2停用',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '职级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_level
-- ----------------------------
INSERT INTO `think_level` VALUES (1, '总经理', 1, 125, 1, 1577942890, 1, 1593580289, 1);
INSERT INTO `think_level` VALUES (2, '副总经理', 1, 125, 1, 1577942895, 0, 0, 1);
INSERT INTO `think_level` VALUES (3, '总监', 1, 125, 1, 1577942912, 0, 0, 1);
INSERT INTO `think_level` VALUES (4, '经理', 1, 125, 1, 1577942916, 0, 0, 1);
INSERT INTO `think_level` VALUES (5, '主管', 1, 125, 1, 1577942920, 1, 1593775439, 1);

-- ----------------------------
-- Table structure for think_link
-- ----------------------------
DROP TABLE IF EXISTS `think_link`;
CREATE TABLE `think_link`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '站点ID',
  `cate_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目ID',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型：1友情链接 2合作伙伴',
  `platform` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '平台：1PC站 2WAP站 3小程序 4APP应用',
  `form` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '友链形式：1文字链接 2图片链接',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友链名称',
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友链图片',
  `url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友链地址',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1在用 2停用',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加用户',
  `update_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新用户',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mark`(`mark`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友链管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_link
-- ----------------------------
INSERT INTO `think_link` VALUES (1, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (2, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (3, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (4, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (5, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (6, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (7, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (8, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (9, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (10, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (11, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (12, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (13, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (14, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (15, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (16, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (17, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (18, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (19, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (20, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (21, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (22, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (23, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (24, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (25, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (26, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (27, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (28, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (29, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (30, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (31, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (32, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (33, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (34, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (35, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (36, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (37, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (38, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (39, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (40, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (41, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (42, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (43, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (44, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (45, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (46, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (47, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (48, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (49, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (50, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);
INSERT INTO `think_link` VALUES (51, 0, 0, 1, 1, 2, '百度官网', '/images/link/20200717/6eeb8f8f955b6108223.png', 'https://www.baidu.com/', 1, 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_menu
-- ----------------------------
DROP TABLE IF EXISTS `think_menu`;
CREATE TABLE `think_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `param` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型：1模块 2导航 3菜单 4节点',
  `permission` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示：1显示 2不显示',
  `is_public` tinyint(1) UNSIGNED NULL DEFAULT 2 COMMENT '是否公共：1是 2否',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单备注',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`pid`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_menu
-- ----------------------------
INSERT INTO `think_menu` VALUES (1, '系统管理', 'layui-icon-component', '#', '', 0, 1, '', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (2, '内容管理', 'layui-icon-component', '#', '', 0, 1, '', 1, 2, '', 5, 0, 0, 1, 1593845911, 1);
INSERT INTO `think_menu` VALUES (3, '物流中心', 'layui-icon-component', '#', '', 0, 1, '', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (4, '用户管理', 'layui-icon-component', '#', '', 0, 1, '', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (5, '权限管理', 'layui-icon-component', '#', '', 1, 2, '', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (6, '人员管理', 'layui-icon-component', '/admin/index', '', 5, 3, 'sys:admin:index', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (7, '列表', '', '/admin/list', '', 6, 4, 'sys:admin:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (8, '添加', '', '/admin/edit', '', 6, 4, 'sys:admin:add', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (9, '修改', '', '/admin/edit', '', 6, 4, 'sys:admin:edit', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (10, '删除', '', '/admin/drop', '', 6, 4, 'sys:admin:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (11, '状态', '', '/admin/setStatus', '', 6, 4, 'sys:admin:status', 1, 2, '', 20, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (12, '角色管理', 'layui-icon-component', '/role/index', '', 5, 3, 'sys:role:index', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (13, '列表', '', '/role/list', '', 12, 4, 'sys:role:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (14, '添加', '', '/role/edit', '', 12, 4, 'sys:role:add', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (15, '修改', '', '/role/edit', '', 12, 4, 'sys:role:edit', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (16, '删除', '', '/role/drop', '', 12, 4, 'sys:role:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (17, '职级管理', 'layui-icon-component', '/level/index', '', 5, 3, 'sys:level:index', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (18, '列表', '', '/level/list', '', 17, 4, 'sys:level:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (19, '添加', '', '/level/edit', '', 17, 4, 'sys:level:add', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (20, '修改', '', '/level/edit', '', 17, 4, 'sys:level:edit', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (21, '删除', '', '/level/drop', '', 17, 4, 'sys:level:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (22, '状态', '', '/level/setStatus', '', 17, 4, 'sys:level:status', 1, 2, '', 25, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (23, '岗位管理', 'layui-icon-component', '/position/index', '', 5, 3, 'sys:position:index', 1, 2, '', 20, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (24, '列表', '', '/position/list', '', 23, 4, 'sys:position:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (25, '添加', '', '/position/edit', '', 23, 4, 'sys:position:add', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (26, '修改', '', '/position/edit', '', 23, 4, 'sys:position:edit', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (27, '删除', '', '/position/drop', '', 23, 4, 'sys:position:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (28, '状态', '', '/position/setStatus', '', 23, 4, 'sys:position:status', 1, 2, '', 25, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (29, '部门管理', 'layui-icon-component', '/dep/index', '', 5, 3, 'sys:dep:index', 1, 2, '', 25, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (30, '列表', '', '/dep/list', '', 29, 4, 'sys:dep:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (31, '添加', '', '/dep/edit', '', 29, 4, 'sys:dep:add', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (32, '修改', '', '/dep/edit', '', 29, 4, 'sys:dep:edit', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (33, '删除', '', '/dep/drop', '', 29, 4, 'sys:dep:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (34, '菜单管理', 'layui-icon-component', '/menu/index', '', 5, 3, 'sys:menu:index', 1, 2, '', 30, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (35, '列表', '', '/menu/list', '', 34, 4, 'sys:menu:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (36, '添加', '', '/menu/edit', '', 34, 4, 'sys:menu:add', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (37, '修改', '', '/menu/edit', '', 34, 4, 'sys:menu:edit', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (38, '删除', '', '/menu/drop', '', 34, 4, 'sys:menu:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (39, '行为日志', 'layui-icon-component', '/actionlog/index', '', 5, 3, 'sys:actionlog:index', 1, 2, '', 35, 0, 0, 0, 1593768387, 1);
INSERT INTO `think_menu` VALUES (40, '列表', '', '/actionlog/list', '', 39, 4, 'sys:actionlog:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (41, '删除', '', '/actionlog/drop', '', 39, 4, 'sys:actionlog:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (42, '站点管理', 'layui-icon-component', '#', '', 2, 2, '', 1, 2, '', 1, 0, 0, 1, 1594976657, 1);
INSERT INTO `think_menu` VALUES (43, '站点管理', 'layui-icon-component', '/item/index', '', 42, 3, 'sys:item:index', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (44, '列表', '', '/item/list', '', 43, 4, 'sys:item:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (45, '添加', '', '/item/edit', '', 43, 4, 'sys:item:add', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (46, '修改', '', '/item/edit', '', 43, 4, 'sys:item:edit', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (47, '删除', '', '/item/drop', '', 43, 4, 'sys:item:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (48, '状态', '', '/item/setStatus', '', 43, 4, 'sys:item:status', 1, 2, '', 25, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (49, '栏目管理', 'layui-icon-component', '/itemcate/index', '', 42, 3, 'sys:itemcate:index', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (50, '列表', '', '/itemcate/list', '', 49, 4, 'sys:itemcate:list', 1, 2, '', 1, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (51, '添加', '', '/itemcate/edit', '', 49, 4, 'sys:itemcate:add', 1, 2, '', 5, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (52, '修改', '', '/itemcate/edit', '', 49, 4, 'sys:itemcate:edit', 1, 2, '', 10, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (53, '删除', '', '/itemcate/drop', '', 49, 4, 'sys:itemcate:drop', 1, 2, '', 15, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (54, '状态', '', '/itemcate/setStatus', '', 49, 4, 'sys:itemcate:status', 1, 2, '', 25, 0, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (55, '广告管理', 'layui-icon-component', '#', '', 1, 2, '', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (56, '广告位管理', 'layui-icon-component', '/adsort/index', '', 55, 3, 'sys:adsort:index', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (57, '列表', '', '/adsort/list', '', 56, 4, 'sys:adsort:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (58, '添加', '', '/adsort/edit', '', 56, 4, 'sys:adsort:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (59, '修改', '', '/adsort/edit', '', 56, 4, 'sys:adsort:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (60, '删除', '', '/adsort/drop', '', 56, 4, 'sys:adsort:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (61, '状态', '', '/adsort/setStatus', '', 56, 4, 'sys:adsort:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (62, '广告管理', 'layui-icon-component', '/ad/index', '', 55, 3, 'sys:ad:index', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (63, '列表', '', '/ad/list', '', 62, 4, 'sys:ad:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (64, '添加', '', '/ad/edit', '', 62, 4, 'sys:ad:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (65, '修改', '', '/ad/edit', '', 62, 4, 'sys:ad:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (66, '删除', '', '/ad/drop', '', 62, 4, 'sys:ad:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (67, '状态', '', '/ad/setStatus', '', 62, 4, 'sys:ad:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (68, '布局管理', 'layui-icon-component', '#', '', 1, 2, '', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (69, '布局描述', 'layui-icon-component', '/layoutdesc/index', '', 68, 3, 'sys:layoutdesc:index', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (70, '列表', '', '/layoutdesc/list', '', 69, 4, 'sys:layoutdesc:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (71, '添加', '', '/layoutdesc/edit', '', 69, 4, 'sys:layoutdesc:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (72, '修改', '', '/layoutdesc/edit', '', 69, 4, 'sys:layoutdesc:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (73, '删除', '', '/layoutdesc/drop', '', 69, 4, 'sys:layoutdesc:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (74, '状态', '', '/layoutdesc/setStatus', '', 69, 4, 'sys:layoutdesc:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (75, '布局管理', 'layui-icon-component', '/layout/index', '', 68, 3, 'sys:layout:index', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (76, '列表', '', '/layout/list', '', 75, 4, 'sys:layout:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (77, '添加', '', '/layout/edit', '', 75, 4, 'sys:layout:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (78, '修改', '', '/layout/edit', '', 75, 4, 'sys:layout:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (79, '删除', '', '/layout/drop', '', 75, 4, 'sys:layout:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (80, '配置管理', 'layui-icon-component', '#', '', 1, 2, '', 1, 2, '', 20, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (81, '配置分组', 'layui-icon-component', '/configgroup/index', '', 80, 3, 'sys:configgroup:index', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (82, '列表', '', '/configgroup/list', '', 81, 4, 'sys:configgroup:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (83, '添加', '', '/configgroup/edit', '', 81, 4, 'sys:configgroup:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (84, '修改', '', '/configgroup/edit', '', 81, 4, 'sys:configgroup:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (85, '删除', '', '/configgroup/drop', '', 81, 4, 'sys:configgroup:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (86, '状态', '', '/configgroup/setStatus', '', 81, 4, 'sys:configgroup:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (87, '配置管理', 'layui-icon-component', '/config/index', '', 80, 3, 'sys:config:index', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (88, '列表', '', '/config/list', '', 87, 4, 'sys:config:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (89, '添加', '', '/config/edit', '', 87, 4, 'sys:config:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (90, '修改', '', '/config/edit', '', 87, 4, 'sys:config:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (91, '删除', '', '/config/drop', '', 87, 4, 'sys:config:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (92, '状态', '', '/config/setStatus', '', 87, 4, 'sys:config:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (93, '字典管理', 'layui-icon-component', '#', '', 1, 2, '', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (94, '字典类型', 'layui-icon-component', '/dictype/index', '', 93, 3, 'sys:dictype:index', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (95, '列表', '', '/dictype/list', '', 94, 4, 'sys:dictype:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (96, '添加', '', '/dictype/edit', '', 94, 4, 'sys:dictype:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (97, '修改', '', '/dictype/edit', '', 94, 4, 'sys:dictype:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (98, '删除', '', '/dictype/drop', '', 94, 4, 'sys:dictype:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (99, '状态', '', '/dictype/setStatus', '', 94, 4, 'sys:dictype:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (100, '字典管理', 'layui-icon-component', '/dic/index', '', 93, 3, 'sys:dic:index', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (101, '列表', '', '/dic/list', '', 100, 4, 'sys:dic:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (102, '添加', '', '/dic/edit', '', 100, 4, 'sys:dic:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (103, '修改', '', '/dic/edit', '', 100, 4, 'sys:dic:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (104, '删除', '', '/dic/drop', '', 100, 4, 'sys:dic:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (105, '应用中心', 'layui-icon-component', '#', '', 1, 2, '', 1, 2, '', 30, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (106, '友链管理', 'layui-icon-component', '/link/index', '', 105, 3, 'sys:link:index', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (107, '列表', '', '/link/list', '', 106, 4, 'sys:link:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (108, '添加', '', '/link/edit', '', 106, 4, 'sys:link:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (109, '修改', '', '/link/edit', '', 106, 4, 'sys:link:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (110, '删除', '', '/link/drop', '', 106, 4, 'sys:link:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (111, '状态', '', '/link/setStatus', '', 106, 4, 'sys:link:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (112, '行政区域', 'layui-icon-component', '/city/index', '', 105, 3, 'sys:city:index', 1, 2, '', 5, 1, 0, 1, 1593846124, 1);
INSERT INTO `think_menu` VALUES (113, '列表', '', '/city/list', '', 112, 4, 'sys:city:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (114, '添加', '', '/city/edit', '', 112, 4, 'sys:city:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (115, '修改', '', '/city/edit', '', 112, 4, 'sys:city:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (116, '删除', '', '/city/drop', '', 112, 4, 'sys:city:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (117, '状态', '', '/city/setStatus', '', 112, 4, 'sys:city:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (118, '定时任务', 'layui-icon-component', '/crontab/index', '', 105, 3, 'sys:crontab:index', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (119, '列表', '', '/crontab/list', '', 118, 4, 'sys:crontab:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (120, '添加', '', '/crontab/edit', '', 118, 4, 'sys:crontab:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (121, '修改', '', '/crontab/edit', '', 118, 4, 'sys:crontab:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (122, '删除', '', '/crontab/drop', '', 118, 4, 'sys:crontab:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (123, '状态', '', '/crontab/setStatus', '', 118, 4, 'sys:crontab:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (124, '通知公告', 'layui-icon-component', '/notice/index', '', 105, 3, 'sys:notice:index', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (125, '列表', '', '/notice/list', '', 124, 4, 'sys:notice:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (126, '添加', '', '/notice/edit', '', 124, 4, 'sys:notice:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (127, '修改', '', '/notice/edit', '', 124, 4, 'sys:notice:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (128, '删除', '', '/notice/drop', '', 124, 4, 'sys:notice:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (129, '状态', '', '/notice/setStatus', '', 124, 4, 'sys:notice:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (130, '网站设置', 'layui-icon-component', '/configweb/index', '', 105, 3, 'sys:configweb:index', 1, 2, '', 20, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (131, '系统工具', 'layui-icon-component', '#', '', 1, 2, '', 1, 2, '', 35, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (132, '代码生成', 'layui-icon-component', '/generate/index', '', 131, 3, 'sys:generate:index', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (133, '列表', '', '/generate/list', '', 132, 4, 'sys:generate:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (134, '添加', '', '/generate/edit', '', 132, 4, 'sys:generate:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (135, '修改', '', '/generate/edit', '', 132, 4, 'sys:generate:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (136, '删除', '', '/generate/drop', '', 132, 4, 'sys:generate:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (137, '用户中心', 'layui-icon-component', '#', '', 4, 2, '', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (138, '用户等级', 'layui-icon-component', '/userlevel/index', '', 137, 3, 'sys:userlevel:index', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (139, '列表', '', '/userlevel/list', '', 138, 4, 'sys:userlevel:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (140, '添加', '', '/userlevel/edit', '', 138, 4, 'sys:userlevel:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (141, '修改', '', '/userlevel/edit', '', 138, 4, 'sys:userlevel:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (142, '删除', '', '/userlevel/drop', '', 138, 4, 'sys:userlevel:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (143, '状态', '', '/userlevel/setStatus', '', 138, 4, 'sys:userlevel:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (144, '用户管理', 'layui-icon-component', '/user/index', '', 137, 3, 'sys:user:index', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (145, '列表', '', '/user/list', '', 144, 4, 'sys:user:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (146, '添加', '', '/user/edit', '', 144, 4, 'sys:user:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (147, '修改', '', '/user/edit', '', 144, 4, 'sys:user:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (148, '删除', '', '/user/drop', '', 144, 4, 'sys:user:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (149, '状态', '', '/user/setStatus', '', 144, 4, 'sys:user:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (150, '文章管理', 'layui-icon-component', '#', '', 2, 2, '', 1, 2, '', 5, 1, 0, 1, 1593846214, 1);
INSERT INTO `think_menu` VALUES (151, '文章管理', 'layui-icon-component', '/article/index', '', 150, 3, 'sys:article:index', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (152, '列表', '', '/article/list', '', 151, 4, 'sys:article:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (153, '添加', '', '/article/edit', '', 151, 4, 'sys:article:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (154, '修改', '', '/article/edit', '', 151, 4, 'sys:article:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (155, '删除', '', '/article/drop', '', 151, 4, 'sys:article:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (156, '状态', '', '/article/setStatus', '', 151, 4, 'sys:article:status', 1, 2, '', 25, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (157, '运维管理', 'layui-icon-component', '#', '', 1, 2, '', 1, 2, '', 40, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (158, '数据库管理', 'layui-icon-component', '/database/index', '', 157, 3, 'sys:database:index', 1, 2, '', 5, 1, 0, 1, 1593848591, 1);
INSERT INTO `think_menu` VALUES (159, '列表', '', '/database/list', '', 158, 4, 'sys:database:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (160, '添加', '', '/database/edit', '', 158, 4, 'sys:database:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (161, '修改', '', '/database/edit', '', 158, 4, 'sys:database:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (162, '删除', '', '/database/drop', '', 158, 4, 'sys:database:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (163, '定时任务', 'layui-icon-component', '/crontab/index', '', 157, 3, 'sys:crontab:index', 1, 2, '', 1, 1, 0, 1, 1593848577, 1);
INSERT INTO `think_menu` VALUES (164, '列表', '', '/crontab/list', '', 163, 4, 'sys:crontab:list', 1, 2, '', 1, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (165, '添加', '', '/crontab/edit', '', 163, 4, 'sys:crontab:add', 1, 2, '', 5, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (166, '修改', '', '/crontab/edit', '', 163, 4, 'sys:crontab:edit', 1, 2, '', 10, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (167, '删除', '', '/crontab/drop', '', 163, 4, 'sys:crontab:drop', 1, 2, '', 15, 1, 0, 0, 0, 1);
INSERT INTO `think_menu` VALUES (168, '状态', '', '/crontab/setStatus', '', 163, 4, 'sys:crontab:status', 1, 2, '', 25, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_notice
-- ----------------------------
DROP TABLE IF EXISTS `think_notice`;
CREATE TABLE `think_notice`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据编号',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '通知内容',
  `source` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '通知来源：1云平台',
  `is_top` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否置顶：1已置顶 2未置顶',
  `view_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读量',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '发布状态：1草稿箱 2立即发布 3定时发布',
  `publish_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布时间',
  `is_send` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '推送状态：1已推送 2未推送',
  `send_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推送时间',
  `create_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识(1正常 0删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_notice
-- ----------------------------
INSERT INTO `think_notice` VALUES (1, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (2, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (3, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (4, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (5, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (6, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (7, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (8, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (9, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (10, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (11, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (12, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (13, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (14, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (15, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (16, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (17, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (18, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (19, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (20, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (21, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (22, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (23, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (24, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (25, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (26, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (27, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (28, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (29, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (30, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (31, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (32, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (33, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (34, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (35, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (36, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (37, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (38, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (39, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (40, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (41, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (42, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (43, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (44, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (45, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (46, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (47, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (48, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (49, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (50, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (51, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);
INSERT INTO `think_notice` VALUES (52, '2020年国庆节放假通知及安排', '2020年国庆节放假通知及安排', 1, 1, 1000, 2, 0, 2, 0, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_position
-- ----------------------------
DROP TABLE IF EXISTS `think_position`;
CREATE TABLE `think_position`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态：1正常 2停用',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_position
-- ----------------------------
INSERT INTO `think_position` VALUES (11, '总经理', 1, 125, 1, 1577942771, 0, 0, 1);
INSERT INTO `think_position` VALUES (12, '技术总监', 1, 125, 1, 1577942779, 0, 0, 1);
INSERT INTO `think_position` VALUES (13, '产品总监', 1, 125, 1, 1577942787, 0, 0, 1);
INSERT INTO `think_position` VALUES (14, '市场总监', 1, 125, 1, 1577942793, 0, 0, 1);
INSERT INTO `think_position` VALUES (15, '人事总监', 1, 125, 1, 1577942798, 0, 0, 1);
INSERT INTO `think_position` VALUES (16, '财务总监', 1, 125, 1, 1577942803, 0, 0, 1);
INSERT INTO `think_position` VALUES (17, '技术经理', 1, 125, 1, 1577942812, 0, 0, 1);
INSERT INTO `think_position` VALUES (18, '技术主管', 1, 125, 1, 1577942818, 1, 1593580576, 1);
INSERT INTO `think_position` VALUES (19, '技术助理', 2, 125, 0, 0, 1, 1593775450, 1);

-- ----------------------------
-- Table structure for think_role
-- ----------------------------
DROP TABLE IF EXISTS `think_role`;
CREATE TABLE `think_role`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `auth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '角色权限的序列化信息',
  `sort` smallint(5) UNSIGNED NULL DEFAULT 125 COMMENT '排序',
  `create_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加人',
  `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识：1有效 0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_role
-- ----------------------------
INSERT INTO `think_role` VALUES (1, '管理员', '', 125, 1, 0, 0, 0, 1);
INSERT INTO `think_role` VALUES (2, '运营中心', '', 125, 1, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '真实姓名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 3 COMMENT '性别：1男 2女 3未知',
  `avatar` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `birthday` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '出生日期',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `province_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '户籍省份编号',
  `city_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '户籍城市编号',
  `district_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '户籍区/县编号',
  `city_area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人简介',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `device` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备类型：1苹果 2安卓 3WAP站 4PC站 5微信小程序 6后台添加',
  `device_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `login_status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '用户状态：1登录 2登出',
  `push_alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '推送的别名',
  `source` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户来源：1注册会员 2马甲会员',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用：1启用  2停用',
  `app_version` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '客户端版本号',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '我的推广码',
  `qrcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推广二维码路径',
  `login_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近登录IP',
  `login_region` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上次登录地点',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近登录时间',
  `login_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录总次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标识(1正常 0删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `index_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES (1, '习大大', '习大大', 1, '/images/user/20200704/655361dbb26a205e718.png', '15295504151', 1593792000, '', 0, 0, 0, '内蒙古自治区 呼和浩特市 土默特左旗', '22222', '333333', 6, NULL, 2, '', 2, 1, '', 'k1j9wg647fhvckgxesmi', 'images/qrcode/20200505/2020050535327673.jpg', NULL, NULL, '2020-03-02 07:21:21', 0, 0, 1593928227, 1);
INSERT INTO `think_user` VALUES (2, '彭麻麻', '彭麻麻', 3, '/images/user/20200704/934d88f2eb07228c209.png', '15295504153', 1593792000, '', 0, 0, 0, '辽宁省 丹东市 宽甸满族自治县', '暂无', '暂无', 6, NULL, 2, '', 2, 1, '', '6iv40xxdra20t7q3hc97', 'images/qrcode/20200505/2020050567997066.jpg', NULL, NULL, NULL, 0, 0, 1593928223, 1);
INSERT INTO `think_user` VALUES (4, '特朗普', '特朗普是二货', 1, '/images/user/20200704/3d9084da28ab7988107.png', '15295504159', 1593792000, '', 0, 0, 0, '江苏省 南京市 建邺区', '暂无', '暂无', 6, NULL, 2, '', 1, 1, '', '1zhwfrxsjm913w5wzqg4', 'images/qrcode/20200504/2020050487577821.jpg', NULL, NULL, NULL, 0, 0, 1593851520, 1);

-- ----------------------------
-- Table structure for think_user_level
-- ----------------------------
DROP TABLE IF EXISTS `think_user_level`;
CREATE TABLE `think_user_level`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一性标识',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员等级',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 125 COMMENT '显示顺序',
  `create_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加用户',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_user` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新用户',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `mark` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '有效标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统登录背景表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of think_user_level
-- ----------------------------
INSERT INTO `think_user_level` VALUES (1, '普通会员', 125, 1, 1534495098, 1, 1534573962, 0);
INSERT INTO `think_user_level` VALUES (2, '钻石会员', 125, 1, 1534495114, 1, 1557322164, 0);
INSERT INTO `think_user_level` VALUES (3, '黄金会员', 125, 1, 1534495132, 1, 1546692204, 0);
INSERT INTO `think_user_level` VALUES (4, '黄金会员2', 125, 1, 1557390423, 0, 0, 0);
INSERT INTO `think_user_level` VALUES (5, '黄金会员2', 125, 1, 1557390427, 0, 0, 0);
INSERT INTO `think_user_level` VALUES (6, '黄金会员2', 125, 1, 1557390526, 0, 0, 0);
INSERT INTO `think_user_level` VALUES (7, '黄金会员2', 125, 1, 1564738986, 0, 0, 0);
INSERT INTO `think_user_level` VALUES (8, '黄金会员2', 125, 1, 1564738988, 0, 0, 0);
INSERT INTO `think_user_level` VALUES (9, '黄金会员2', 125, 1, 1565163969, 0, 0, 0);
INSERT INTO `think_user_level` VALUES (10, '黄金会员2', 125, 1, 1565163975, 0, 0, 0);
INSERT INTO `think_user_level` VALUES (11, '白金会员', 125, 1, 1582282222, 1, 1593776125, 1);
INSERT INTO `think_user_level` VALUES (12, 'ddd', 125, 1, 1585705876, 0, 0, 0);
INSERT INTO `think_user_level` VALUES (13, '黄金会员', 125, 1, 1588425521, 0, 0, 1);
INSERT INTO `think_user_level` VALUES (14, '钻石会员', 125, 1, 1588425529, 0, 0, 1);
INSERT INTO `think_user_level` VALUES (15, '黑金会员', 125, 1, 1588425537, 0, 0, 1);
INSERT INTO `think_user_level` VALUES (16, 'dsad99', 125, 1, 1589957352, 1, 1593440168, 1);

SET FOREIGN_KEY_CHECKS = 1;
