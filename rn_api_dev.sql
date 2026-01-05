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

 Date: 06/01/2026 00:10:59
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
INSERT INTO `Categories` VALUES ('c69c0f9d-c38b-4925-b897-8889beb0182c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '默认分类', 'hashtag', '#6D7A7C', 1, '2025-12-14 11:20:26', '2026-01-05 23:19:18');
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
INSERT INTO `Notices` VALUES ('0ebcf45f-3ed5-40c9-a377-a297f7bbb11e', '功能更新：支持导入第三方 Chrome 密码库 内容', '好消息！\\n\\n现在您可以更方便地迁移数据了。新版本支持直接导入 Chrome 浏览器导出的 CSV 格式密码文件。\\n\\n操作路径：设置 > 数据管理 > 导入数据。我们将引导您完成加密转换。', 2, '2025-12-28 23:48:02');
INSERT INTO `Notices` VALUES ('12de2a9c-4598-4044-ba5e-0ae554cd73ff', '关于系统例行维护及安全升级的公告', '尊敬的用户：\\n\\n为了持续提升系统的稳定性和加密算法的安全强度，我们将于 2023年10月29日（周日）凌晨 02:00 - 04:00 进行例行服务器维护及数据库架构优化。\\n\\n受影响范围：\\n• 维护期间，APP 将暂时无法使用同步及云端备份功能。\\n• 已开启“离线模式”的用户仍可正常查看已缓存的密码条目。\\n\\n请您提前做好相关准备。感谢您的理解与支持，我们将竭诚为您保护每一份数据安全。', 1, '2025-12-24 21:37:45');
INSERT INTO `Notices` VALUES ('25a7235f-9c2c-434f-a739-5d6b27ff0075', '系统优化与稳定性修复处理报告', '感谢广大用户近期向我们反馈的使用问题。经过技术团队的紧急排查与修复，我们在本次更新中解决了以下已知问题：\\n\\n修复与优化项：\\n• 登录异常：修复了在部分高版本系统下，生物识别（指纹/面容）偶尔失效的问题。\\n• 重置流程：解决了部分地区用户在重置主密码时无法及时接收验证邮件的延迟问题。\\n• 性能提升：优化了本地加密库的运算效率，大幅缩短了解密加载时间。\\n\\n我们建议您保持应用为最新版本，以获得最稳健的安全防护体验。', 1, '2025-12-24 20:04:16');
INSERT INTO `Notices` VALUES ('40630ea1-a21c-46ca-9c88-b3ab8a8a613e', '关于旧版本 App 停止维护的通知', '为了保证加密算法的最新安全性，我们将于下月起停止对 V0.9 以下版本的服务器支持。\\n\\n请您务必尽快在应用商店更新至最新版本，以免影响云端同步和生物识别功能的正常使用。', 1, '2025-12-28 23:48:59');
INSERT INTO `Notices` VALUES ('4e11b561-a0a8-43f9-960c-9166e2923e20', '交互优化：生物识别（FaceID/指纹）逻辑重构', '更新日志：\\n\\n我们优化了生物识别的唤醒速度。现在当应用进入后台 10 秒后重新切回时，将自动弹出验证请求，无需手动点击。\\n\\n同时修复了部分安卓机型指纹识别后黑屏的偶发问题。', 2, '2025-12-28 23:49:48');
INSERT INTO `Notices` VALUES ('66390d0b-fe9d-4cd2-8b6c-e73ea0fb1325', 'V1.0.2 版本发布：新增“安全剪贴板”功能', '新功能上线：\\n\\n本次更新新增了“安全剪贴板”保护机制。当您复制密码后，系统将在 60 秒后自动清除剪贴板内容，有效防止恶意软件读取您的隐私。\\n\\n您可以在“设置 > 偏好”中自定义清除时间。', 2, '2025-12-28 23:46:41');
INSERT INTO `Notices` VALUES ('98f00b12-9e2d-4e0e-9212-a898a3036590', '账户安全中心：强制开启双重认证 (2FA) 建议', '安全预警：\\n\\n近期监测到多起针对第三方平台的撞库攻击。为了您的密码库安全，我们强烈建议您前往“设置 > 安全中心”开启双重认证。\\n\\n开启后，即便密码泄露，没有您的授权码也无法访问数据。安全无小事，请务必重视。', 1, '2025-12-28 23:44:20');
INSERT INTO `Notices` VALUES ('9f3d93ef-5647-4ad5-87c1-1ffa69b3b842', '功能升级：支持附件加密存储（预览版）', '重大更新：\\n\\n除了文本密码，您现在可以为每个条目添加少量的附件（如备份码截图、身份证正反面图片）。所有附件均经过 AES-256 同等级别加密存储。\\n\\n当前版本仅支持图片及 PDF 格式。', 2, '2025-12-28 23:48:40');
INSERT INTO `Notices` VALUES ('ba701ff4-aba3-4551-9eb9-d21f5f16f90c', '隐私协议与数据处理规则更新公告', '重要更新：\\n\\n我们更新了《用户隐私协议》，详细说明了零知识加密（Zero-Knowledge）在本地存储中的应用逻辑。本次更新不涉及数据共享，仅为技术透明化展示。\\n\\n您可以点击详情查看最新的协议全文。', 1, '2025-12-28 23:49:28');
INSERT INTO `Notices` VALUES ('d3c1fbd6-c10b-4959-8053-b35513d88403', '关于服务器接入商骨干网络升级的通知', '尊敬的用户：\\n\\n接到服务商通知，其计划于本周五凌晨 03:00 对骨干网络设备进行升级。届时应用可能会出现短暂的连接中断（预计持续 5 分钟）。\\n\\n请在相关时段避免执行重要的数据同步操作。感谢您的配合。', 1, '2025-12-28 23:43:56');
INSERT INTO `Notices` VALUES ('d933e0bd-bed3-4d53-87e0-13242e7d6c67', '界面优化：全新侧边栏导航与主题色切换', '视觉体验升级：\\n\\n我们重构了导航布局，现在通过左侧边栏即可快速触达所有分类。同时新增了 3 款深色模式下的主题配色方案，满足您的个性化视觉需求。\\n\\n快去“设置 > 界面”中体验吧！', 2, '2025-12-28 23:48:24');
INSERT INTO `Notices` VALUES ('ea5f24de-232c-468d-b6b1-bb5edf3826b8', 'V1.0.1 正式版发布：全新安全组件上线', '我们很高兴地宣布 V1.0.1 版本正式发布。本次更新不仅是版本号的跳跃，更是核心功能的全面升级：\\n\\n新功能特性：\\n• 智能密码生成器：新增符合 NIST 标准的高强度随机算法，支持自定义特殊字符排斥规则。\\n• 安全审计报告：现在您可以一键检测库中存在的重复密码、弱密码及已泄露密码。\\n• UI 交互重构：采用了更符合人体工程学的深色模式布局，为您带来沉浸且专业的管理体验。\\n\\n密码管理，稳如泰山。立即更新，开启您的安全数字生活新篇章。', 2, '2025-12-24 21:37:13');

-- ----------------------------
-- Table structure for Passwords
-- ----------------------------
DROP TABLE IF EXISTS `Passwords`;
CREATE TABLE `Passwords`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `site_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `deletedAt` datetime NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `passwords_user_id`(`userId` ASC) USING BTREE,
  INDEX `passwords_category_id`(`categoryId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Passwords
-- ----------------------------
INSERT INTO `Passwords` VALUES ('076ff84f-e2aa-4b51-b170-3180c6d61f17', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'ae7703c0-a5d9-424f-a86c-48635ce8a4b2', '3cef17e97d18f5b49b7fdf20:95d48dbab3c4024566ec7f3b1259dd5e:6c3cd267308b', NULL, NULL, '2026-01-06 00:09:34', '2026-01-06 00:09:34', '92bc55bcb92b57f34148dfa8:ac17b0ad6aaf88ebc95d34d5289d8552:7efd2d8f33bca16ad76ccb1963e2482a9e', '1844ea15449132522dd2ebb6:b8e99610f84b1fe587145a702d67fcc1:25d5e03e1e8b1d05', '6aec559d897c6cd188a280c1:5ada09e6c69698bf7b15f2517e8ec12a:9bbe59');
INSERT INTO `Passwords` VALUES ('7ded16b8-018e-4fe6-b7b9-ac5a7df2c924', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '25fc0a63-9cc4-414b-81bc-602508738f5c', '668fd435076c65a0a81d65bc:8bfdeacd86810ba383db1acaf096d8d3:5a014bd94a65', NULL, NULL, '2026-01-06 00:05:00', '2026-01-06 00:05:00', '6ee4ca50bba20207bbf90183:c3aea3baa7798d3d2c072e4d050885d6:932cd2ca97ab5b4329646a1b8d6271d3', '77610c5f700fe4bb17a00d0b:3d7b87459275ff7153255bbd8a4c12bc:b5e5193be38f4612', NULL);
INSERT INTO `Passwords` VALUES ('a4239171-86f2-4200-9218-81312cb2e461', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'c69c0f9d-c38b-4925-b897-8889beb0182c', '0cb9cd891b80a2bd507acb04:43774f47ad42898b560c2d8a37e54a79:6613b87ab539', NULL, NULL, '2026-01-05 21:46:00', '2026-01-05 23:19:06', '8e2bc7a3281c489774a4da6b:d41f81e3b795a1e7d6612d12922fcd7c:7dbeeab4b3e86622a9a6', '0a26c30d90a99131bbf14a42:6f6676ab70697a40a851a39c40f848d2:3aa69223927d7f22', NULL);
INSERT INTO `Passwords` VALUES ('cd6d7c41-af64-4c39-8123-dec768a371a7', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', '4177189d93c51388367fde7f:95cd81b11e1c0eb893d2d27637e813bb:8bde862b8d6b5c4e5c', NULL, NULL, '2026-01-06 00:10:34', '2026-01-06 00:10:34', '9bfd97426ba4e5cd051fc146:2d4041f7e11a9a75c695423387fd739e:f9b1198a216315ee4c2098911dad81fa0a', '198cded45d6586b2f6106969:ff4010d376099e7b8afafb33992c6d8a:dca63d7596c6f17b', '2a90259d423e8a2eff108fdc:5a057fddd0342e304ded94434bb11380:9f880a');

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
INSERT INTO `Users` VALUES ('967f7842-2a09-449f-9952-d6e5c9d2cb47', 'test005', 'http://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/94eea43504856f8c716e604fef3123c2.jpeg', '1872848105@qq.com', '$2b$10$RTn6Is0uWvOM2yAr9.qrzewg.Uiu8CacTu2g6gtHMqpstZrttxb8C', 1, 0, '2026-01-05 23:56:18', 0, '2025-12-14 11:20:26', '2026-01-05 23:56:18');

SET FOREIGN_KEY_CHECKS = 1;
