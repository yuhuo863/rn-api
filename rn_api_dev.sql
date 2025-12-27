/*
 Navicat Premium Dump SQL

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80405 (8.4.5)
 Source Host           : localhost:3306
 Source Schema         : rn_api_dev

 Target Server Type    : MySQL
 Target Server Version : 80405 (8.4.5)
 File Encoding         : 65001

 Date: 28/12/2025 01:16:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Categories
-- ----------------------------
DROP TABLE IF EXISTS `Categories`;
CREATE TABLE `Categories`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories_user_id`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Categories
-- ----------------------------
INSERT INTO `Categories` VALUES ('1be052a1-ec22-4d2d-93c0-ba2a59bef881', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '数字娱乐', 'gamepad', '#8A7386', 0, '2025-12-18 16:39:35', '2025-12-27 23:54:41');
INSERT INTO `Categories` VALUES ('25fc0a63-9cc4-414b-81bc-602508738f5c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '个人邮箱', 'envelope', '#2E4B66', 0, '2025-12-19 22:09:20', '2025-12-27 23:56:24');
INSERT INTO `Categories` VALUES ('288e319c-4391-4e70-af84-618a43792ea3', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '银行卡', 'credit-card', '#3E506C', 0, '2025-12-18 18:24:09', '2025-12-28 00:51:00');
INSERT INTO `Categories` VALUES ('704b0958-9618-474c-9b90-43ff76dd9d19', '77800f2c-031e-45b8-b38b-fe15fe735ff2', '默认分类', 'hashtag', '#3b82f6', 1, '2025-12-27 14:58:06', '2025-12-27 14:58:06');
INSERT INTO `Categories` VALUES ('7510a0d4-fa14-4b02-a894-9cad6d3c4a0c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '办公工作', 'building', '#A86A5A', 0, '2025-12-18 23:55:20', '2025-12-27 23:58:53');
INSERT INTO `Categories` VALUES ('a268dbf5-464f-4f21-a121-49f9dea2ea66', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '社交媒体', 'comments', '#9B6B64', 0, '2025-12-14 14:55:49', '2025-12-27 23:54:19');
INSERT INTO `Categories` VALUES ('a7bfd31f-59bb-4d16-b65c-b73e7535e78f', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '身份证件', 'id-card', '#6B4E57', 0, '2025-12-18 17:22:08', '2025-12-27 23:54:59');
INSERT INTO `Categories` VALUES ('ae7703c0-a5d9-424f-a86c-48635ce8a4b2', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '网站媒介', 'globe', '#587B7A', 0, '2025-12-18 18:12:58', '2025-12-27 23:55:26');
INSERT INTO `Categories` VALUES ('c69c0f9d-c38b-4925-b897-8889beb0182c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '默认分类', 'hashtag', '#6D7A7C', 1, '2025-12-14 11:20:26', '2025-12-27 23:53:44');
INSERT INTO `Categories` VALUES ('e1dd6abe-89a9-4782-8019-4cf2cad686bc', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '金融理财', 'line-chart', '#8A7B5A', 0, '2025-12-18 23:55:46', '2025-12-28 00:26:54');

-- ----------------------------
-- Table structure for Notices
-- ----------------------------
DROP TABLE IF EXISTS `Notices`;
CREATE TABLE `Notices`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint NULL DEFAULT 1 COMMENT '1: 系统公告, 2: 功能更新',
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notices_created_at`(`createdAt` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Notices
-- ----------------------------
INSERT INTO `Notices` VALUES ('12de2a9c-4598-4044-ba5e-0ae554cd73ff', '服务维护通知', '我们将于本周日凌晨进行服务器维护，预计耗时2小时。', 1, '2025-12-24 21:37:45');
INSERT INTO `Notices` VALUES ('25a7235f-9c2c-434f-a739-5d6b27ff0075', '修复了若干bug', '我们修复了导致部分用户无法重置密码的问题，并优化了启动速度。', 1, '2025-12-24 20:04:16');
INSERT INTO `Notices` VALUES ('ea5f24de-232c-468d-b6b1-bb5edf3826b8', 'V1.0.1 版本已发布', '全新密码生成器上线！支持自定义长度、特殊字符混淆，快来体验吧。', 2, '2025-12-24 21:37:13');

-- ----------------------------
-- Table structure for Passwords
-- ----------------------------
DROP TABLE IF EXISTS `Passwords`;
CREATE TABLE `Passwords`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `site_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deletedAt` datetime NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encrypted_password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `passwords_user_id`(`userId` ASC) USING BTREE,
  INDEX `passwords_category_id`(`categoryId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Passwords
-- ----------------------------
INSERT INTO `Passwords` VALUES ('07000be1-41ad-453e-bff9-61f192bcb7c4', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'c69c0f9d-c38b-4925-b897-8889beb0182c', 'X', NULL, NULL, '2025-12-16 23:23:50', '2025-12-22 15:48:52', 'test003', 'eyJzYWx0IjoiN2IyOGY1YzViODcwM2RkYzZmMjIxMjlhZjUyNDkxMjYiLCJpdiI6IjE3NzNhNGMyYzhhNDYyM2FiYWMyNGI0ZjJiZmM4YmY2IiwiYXV0aFRhZyI6ImExZTUxNjFjODA0NGQyNGRiZWMyZGUyMDQ3M2Y1NTc3IiwiZW5jcnlwdGVkRGF0YSI6IjJhNWU2ZjcyMzJlZTUxMzAifQ==', '666');
INSERT INTO `Passwords` VALUES ('0cf6f237-0acc-40aa-b543-22a723fa2259', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '288e319c-4391-4e70-af84-618a43792ea3', '中国交通银行', NULL, '2025-12-27 22:15:22', '2025-12-27 22:14:17', '2025-12-27 22:15:22', '41241113694523211', 'eyJzYWx0IjoiNDUxZjhlMDMzNDhmMGUwZjIwNmVjYTNkYzU1OTMwMjUiLCJpdiI6IjBmMzNlOGU0OThkNDUzODAzZDM0M2JhMTkzODgxYzc3IiwiYXV0aFRhZyI6IjZkMGE4YTk1Y2Y5MTkzYThlNjllNzQxNWQ2YzM2Nzc1IiwiZW5jcnlwdGVkRGF0YSI6ImM4YTM0YzNjMmM4OWZmOTUifQ==', NULL);
INSERT INTO `Passwords` VALUES ('10d52d08-f134-4208-893f-e1211c4b49ab', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'ae7703c0-a5d9-424f-a86c-48635ce8a4b2', 'Github', NULL, NULL, '2025-12-18 18:23:04', '2025-12-27 22:13:17', 'whatare@qq.com', 'eyJzYWx0IjoiZjZkYTFjYjVhYjBiMGQ0NWYzMGFiOTJlNTc3OTc5YzUiLCJpdiI6ImU5MjkwMDY5NmU2MjZkZjQ3MDk2ODdhYWM0MmVmNjQ4IiwiYXV0aFRhZyI6IjBhMjMyNDlmNDNmMjE3NGUxZGViNWYwYzM4YzVkMzcwIiwiZW5jcnlwdGVkRGF0YSI6IjczMTI0M2FmMGUwY2QxOTQifQ==', '123');
INSERT INTO `Passwords` VALUES ('1a09d339-8d6c-4032-8372-662185892c24', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '25fc0a63-9cc4-414b-81bc-602508738f5c', 'Gmail', NULL, NULL, '2025-12-18 17:52:55', '2025-12-27 15:27:14', 'yuhuo@gmail.com', 'eyJzYWx0IjoiMDlkMGFjYjQxOGEyZjgxZDZiZTVlYjJjODM3ZDc3M2IiLCJpdiI6IjFmYmRjMjA0N2FlZmIzNTBlYTJmOTBiMzIwMGM3YmE4IiwiYXV0aFRhZyI6IjMxMTVhOWVhNTQ0NDhiMWMxZmEzNDBiZTQ1N2ZiZDljIiwiZW5jcnlwdGVkRGF0YSI6IjA4ZGY2NmFhNjEwMDU2M2YifQ==', NULL);
INSERT INTO `Passwords` VALUES ('3307fcd2-7e00-410d-9c6e-925f8b982b27', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '1be052a1-ec22-4d2d-93c0-ba2a59bef881', 'Steam', NULL, NULL, '2025-12-19 21:36:47', '2025-12-27 22:10:02', 'steam', 'eyJzYWx0IjoiN2Q0NTk1YjJmNGYwODNjODAzMDEzOWJmYTUwODdkZTgiLCJpdiI6IjQ4MGJiZWJmMjEyZjJkOTU5MTNjZjUxZDhiOTJiNjJjIiwiYXV0aFRhZyI6ImY5YTE4YjQ3ZTkyMTc4YzkzNzVmNTM0NjAwNTEwODY1IiwiZW5jcnlwdGVkRGF0YSI6ImJlYWMzODA1MjFlZjQ1OTMifQ==', NULL);
INSERT INTO `Passwords` VALUES ('48e96f34-2b2d-4044-8302-29574f3dd812', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '288e319c-4391-4e70-af84-618a43792ea3', '中国农业银行', NULL, NULL, '2025-12-19 22:17:21', '2025-12-24 13:54:59', '61124122478567412', 'eyJzYWx0IjoiNmU3M2YyYzJmZWQ4MDg4MjQ5YTY4NTY2OWY1ZTVkNWUiLCJpdiI6IjQ5YjMxYzhmMGI1YThiMGY4YWVjNzVmNTRlOWI0NGE2IiwiYXV0aFRhZyI6ImU2ZTlmNDIxM2U0YjhjMWEzNWY1MjZlMjk4ODE3ODEwIiwiZW5jcnlwdGVkRGF0YSI6ImUzMTk2YjhkMjcwZmFkZTYifQ==', NULL);
INSERT INTO `Passwords` VALUES ('54330247-779e-447f-b3a8-87b2caa49935', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', 'WeChat', NULL, '2025-12-19 22:03:46', '2025-12-17 20:57:22', '2025-12-19 22:03:46', 'test005', 'eyJzYWx0IjoiYjhlZjExMGIzOGJmMDA1Zjg4Zjk1ODQ3NTZmNmU5MGUiLCJpdiI6ImVjMjI0Y2I0MmY0NDU1YmYzYzViOTZlNjk0OTgyODY5IiwiYXV0aFRhZyI6Ijk0N2RhMTg3OTUyYjk4OTM4NGFiOTI4YjI4MjdjNjA4IiwiZW5jcnlwdGVkRGF0YSI6IjMxNWM5MmFkZmRmYzQ2MzQifQ==', NULL);
INSERT INTO `Passwords` VALUES ('6e4a80b5-a3a0-40ce-8f5f-ce69023b8015', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '288e319c-4391-4e70-af84-618a43792ea3', '中国建设银行', NULL, NULL, '2025-12-19 21:32:42', '2025-12-24 12:19:35', '4122141532214521', 'eyJzYWx0IjoiOGE5MTRjMTRkYTk5YWYyNTU3OWNlMmJlZWU3NDBiY2EiLCJpdiI6IjcyYmQyZWFjZGNhODVmY2M0NDcyMDUxM2YxZTY1YmViIiwiYXV0aFRhZyI6Ijk1NGNlNzBiODQwZDQ1ZjUxZGJmYjc1YWRiMGY2NGQ4IiwiZW5jcnlwdGVkRGF0YSI6ImE4NGMyMDFmZjQxNGUzNDkifQ==', NULL);
INSERT INTO `Passwords` VALUES ('8c7c5627-cf5e-4534-a832-41d23686184f', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'ae7703c0-a5d9-424f-a86c-48635ce8a4b2', 'Google', NULL, NULL, '2025-12-16 23:18:38', '2025-12-19 22:12:28', 'test001', 'eyJzYWx0IjoiMGEzM2NmMTgyNzk5NDFhZjE3OGJmYTEzNjExMjk5YTYiLCJpdiI6IjhkNzc0NzM1ZGY0OWZiMGVmMzM2NDYwM2FiMTU4ZDhmIiwiYXV0aFRhZyI6IjdiOTljNDA1ZjljYjE3MmM5NjliZDQ1Y2YwZGIxMTcwIiwiZW5jcnlwdGVkRGF0YSI6IjNhYjkwMDlkNWYzNGNmMmUifQ==', NULL);
INSERT INTO `Passwords` VALUES ('cee56b66-f9a0-47b9-a2cb-21026727237b', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'c69c0f9d-c38b-4925-b897-8889beb0182c', 'Facebook', NULL, NULL, '2025-12-16 22:48:59', '2025-12-22 15:50:44', 'test004', 'eyJzYWx0IjoiNDFkMTYyM2YxYzc5ZjNkZWY5ZDAyZjdiOGM1NmI1OTciLCJpdiI6IjM4NTVmNDUyYTYxOGE4MzQ5YjZmNzQxMjU5OWRhYTM3IiwiYXV0aFRhZyI6ImEwNDI4ZjI5MDY3NWFkYjhiZDM3YmIwM2FjYWFiNzc0IiwiZW5jcnlwdGVkRGF0YSI6Ijc5ODg4YWM4ODhjMzMyYjgifQ==', NULL);
INSERT INTO `Passwords` VALUES ('e0667f01-1034-45d3-a37b-647e4def6f02', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', 'QQ', NULL, '2025-12-24 13:38:25', '2025-12-20 01:10:47', '2025-12-24 13:38:25', '1872848105', 'eyJzYWx0IjoiMGI2Mzk2Nzg4MDc1ZDk2MmE5MTc5YWMyMzZlZGY2Y2QiLCJpdiI6ImU0YTAzYzY2YjM3YTUwZWYxY2JmZmIzYmE2NjQwMmMxIiwiYXV0aFRhZyI6IjFhMWQ4OTZkZWZlODA4Y2ZlZWFkZWZkNWRlYmJmM2E2IiwiZW5jcnlwdGVkRGF0YSI6IjU0MjAxZmM1ZmY0YWMyZGMifQ==', NULL);
INSERT INTO `Passwords` VALUES ('edb3eaa3-e5be-4f19-bac4-1955deb7474f', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', 'Instagram', 'https://www.instagram.com/', NULL, '2025-12-18 01:26:21', '2025-12-20 03:10:37', 'test1', 'eyJzYWx0IjoiOTQzNWZhM2Q1Y2Q1MDM3NTlhNjNiZGY3YTUyZWIyZjAiLCJpdiI6IjAyYTIxMzVkYTA1YzNiYjg2NmY4ZTEzZjNjMjljMWM4IiwiYXV0aFRhZyI6IjRjZWJmMzY5MjVhYTQ4NzM5NTY3NjM4MGM4ZDQyNDQ5IiwiZW5jcnlwdGVkRGF0YSI6IjBmNGZmZTM4M2Y5MzkyYzcifQ==', '个人 ins 主号（仅移动端登录）');

-- ----------------------------
-- Table structure for SequelizeMeta
-- ----------------------------
DROP TABLE IF EXISTS `SequelizeMeta`;
CREATE TABLE `SequelizeMeta`  (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SequelizeMeta
-- ----------------------------
INSERT INTO `SequelizeMeta` VALUES ('20251213153200-create-user.js');
INSERT INTO `SequelizeMeta` VALUES ('20251214002113-create-password.js');
INSERT INTO `SequelizeMeta` VALUES ('20251214010251-create-category.js');
INSERT INTO `SequelizeMeta` VALUES ('20251214055206-add-avatar-to-user.js');
INSERT INTO `SequelizeMeta` VALUES ('20251216140855-update-fields-for-user.js');
INSERT INTO `SequelizeMeta` VALUES ('20251218034151-add-color-to-category.js');
INSERT INTO `SequelizeMeta` VALUES ('20251224112358-create-notice.js');
INSERT INTO `SequelizeMeta` VALUES ('20251224113208-add-last-read-notice-at-to-user.js');

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` tinyint UNSIGNED NOT NULL DEFAULT 2,
  `role` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `lastReadNoticeAt` datetime NULL DEFAULT NULL COMMENT '用户最后一次阅读通知的时间',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `users_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES ('77800f2c-031e-45b8-b38b-fe15fe735ff2', 'yuhuo1', 'http://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/3bf5b78dd9658195e60c20f02a2f102d.png', '1872848105@gmail.com', '$2b$10$29FGyR5fR00zZdbHxpmWG.aoULUtcj1CqkpcvZp0JgDm8srbXAzpW', 1, 0, NULL, 0, '2025-12-27 14:58:06', '2025-12-27 14:58:59');
INSERT INTO `Users` VALUES ('967f7842-2a09-449f-9952-d6e5c9d2cb47', 'test005', 'http://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/48e96c9feb163c25bb6ff3f1856179f2.jpeg', '1872848105@qq.com', '$2b$10$424plkxpAfUO987tZBHcPenuyMrcDxAgiFKXzUY7D5tmexr3I3PXq', 1, 0, NULL, 0, '2025-12-14 11:20:26', '2025-12-24 23:51:21');

SET FOREIGN_KEY_CHECKS = 1;
