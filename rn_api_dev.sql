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

 Date: 12/01/2026 22:13:37
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
INSERT INTO `Categories` VALUES ('163b87eb-18e8-422d-b696-321956d4a801', '9bf71dd1-003e-4ec6-b9fd-e6db2ecc4e7e', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 23:12:45', '2026-01-07 23:12:45');
INSERT INTO `Categories` VALUES ('1be052a1-ec22-4d2d-93c0-ba2a59bef881', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '数字娱乐', 'gamepad', '#8A7386', 0, '2025-12-18 16:39:35', '2025-12-27 23:54:41');
INSERT INTO `Categories` VALUES ('25fc0a63-9cc4-414b-81bc-602508738f5c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '个人邮箱', 'envelope', '#2E4B66', 0, '2025-12-19 22:09:20', '2025-12-27 23:56:24');
INSERT INTO `Categories` VALUES ('288e319c-4391-4e70-af84-618a43792ea3', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '银行卡', 'credit-card', '#3E506C', 0, '2025-12-18 18:24:09', '2025-12-28 00:51:00');
INSERT INTO `Categories` VALUES ('3d7f3900-ded3-48ff-9568-f132a83575ad', 'bc3fc20a-56fa-4aae-88d4-0f1b9335dd3e', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 22:10:43', '2026-01-07 22:10:43');
INSERT INTO `Categories` VALUES ('704b0958-9618-474c-9b90-43ff76dd9d19', '77800f2c-031e-45b8-b38b-fe15fe735ff2', '默认分类', 'hashtag', '#3b82f6', 1, '2025-12-27 14:58:06', '2025-12-27 14:58:06');
INSERT INTO `Categories` VALUES ('74ac18dd-1a77-4b82-9350-36758e57f7d1', '21ed123d-c212-4852-ae09-885b8df39796', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 22:19:14', '2026-01-07 22:19:14');
INSERT INTO `Categories` VALUES ('7510a0d4-fa14-4b02-a894-9cad6d3c4a0c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '办公工作', 'building', '#A86A5A', 0, '2025-12-18 23:55:20', '2025-12-27 23:58:53');
INSERT INTO `Categories` VALUES ('8f50edc3-2b30-4d00-a4d6-12f8e154c165', '12231a2d-78a4-4a98-98b0-bf38ab2fe95b', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 23:17:19', '2026-01-07 23:17:19');
INSERT INTO `Categories` VALUES ('a268dbf5-464f-4f21-a121-49f9dea2ea66', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '社交媒体', 'comments', '#9B6B64', 0, '2025-12-14 14:55:49', '2025-12-27 23:54:19');
INSERT INTO `Categories` VALUES ('ae7703c0-a5d9-424f-a86c-48635ce8a4b2', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '网站媒介', 'globe', '#587B7A', 0, '2025-12-18 18:12:58', '2025-12-27 23:55:26');
INSERT INTO `Categories` VALUES ('c69c0f9d-c38b-4925-b897-8889beb0182c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '默认分类', 'hashtag', '#6D7A7C', 1, '2025-12-14 11:20:26', '2026-01-05 23:19:18');
INSERT INTO `Categories` VALUES ('d025274c-f361-49ab-acc7-537fc63d0baa', 'f0f07cac-d4d6-4319-aba3-75f8455ad75d', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 22:27:59', '2026-01-07 22:27:59');
INSERT INTO `Categories` VALUES ('e1dd6abe-89a9-4782-8019-4cf2cad686bc', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '金融理财', 'line-chart', '#8A7B5A', 0, '2025-12-18 23:55:46', '2025-12-28 00:26:54');
INSERT INTO `Categories` VALUES ('e34343ad-6c9c-4ab7-9adc-4a445e816f90', '5fe564e4-5eb3-4b6c-ae83-99f4265df6d0', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 22:22:31', '2026-01-07 22:22:31');
INSERT INTO `Categories` VALUES ('e34e2426-dd3f-457d-a54f-5b10a3898c74', '333b8c89-03d6-4f26-bf65-dc17531ef500', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 22:29:32', '2026-01-07 22:29:32');
INSERT INTO `Categories` VALUES ('e7852258-9a36-4051-a53e-145ff1b8455d', '9b84f925-7c5e-4b07-a728-bd43b297347a', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 23:14:23', '2026-01-07 23:14:23');
INSERT INTO `Categories` VALUES ('fc0510ae-e474-4329-be9d-a7fa2fa7e82c', '26a4ec7c-67df-4037-abd1-5071bea8e783', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 22:49:55', '2026-01-07 22:49:55');

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
INSERT INTO `Notices` VALUES ('0ebcf45f-3ed5-40c9-a377-a297f7bbb11e', '功能更新：支持导入第三方 Chrome 密码库 内容', '好消息！\\n\\n现在您可以更方便地迁移数据了。新版本支持直接导入 Chrome 浏览器导出的 CSV 格式密码文件。\\n\\n操作路径：设置 > 数据管理 > 导入数据。我们将引导您完成加密转换。', 2, '2026-01-11 23:48:02');
INSERT INTO `Notices` VALUES ('12de2a9c-4598-4044-ba5e-0ae554cd73ff', '关于系统例行维护及安全升级的公告', '尊敬的用户：\\n\\n为了持续提升系统的稳定性和加密算法的安全强度，我们将于 2023年10月29日（周日）凌晨 02:00 - 04:00 进行例行服务器维护及数据库架构优化。\\n\\n受影响范围：\\n• 维护期间，APP 将暂时无法使用同步及云端备份功能。\\n• 已开启“离线模式”的用户仍可正常查看已缓存的密码条目。\\n\\n请您提前做好相关准备。感谢您的理解与支持，我们将竭诚为您保护每一份数据安全。', 1, '2026-01-10 21:37:45');
INSERT INTO `Notices` VALUES ('25a7235f-9c2c-434f-a739-5d6b27ff0075', '系统优化与稳定性修复处理报告', '感谢广大用户近期向我们反馈的使用问题。经过技术团队的紧急排查与修复，我们在本次更新中解决了以下已知问题：\\n\\n修复与优化项：\\n• 登录异常：修复了在部分高版本系统下，生物识别（指纹/面容）偶尔失效的问题。\\n• 重置流程：解决了部分地区用户在重置主密码时无法及时接收验证邮件的延迟问题。\\n• 性能提升：优化了本地加密库的运算效率，大幅缩短了解密加载时间。\\n\\n我们建议您保持应用为最新版本，以获得最稳健的安全防护体验。', 1, '2026-01-09 20:04:16');
INSERT INTO `Notices` VALUES ('40630ea1-a21c-46ca-9c88-b3ab8a8a613e', '关于旧版本 App 停止维护的通知', '为了保证加密算法的最新安全性，我们将于下月起停止对 V0.9 以下版本的服务器支持。\\n\\n请您务必尽快在应用商店更新至最新版本，以免影响云端同步和生物识别功能的正常使用。', 1, '2026-01-09 23:48:59');
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
INSERT INTO `Passwords` VALUES ('23d474f2-3ac6-41ab-84e1-6190d3a77b40', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'ae7703c0-a5d9-424f-a86c-48635ce8a4b2', 'ed7966615abd2f30c7269353:35167d825ed8f0652fd5757f5658c642:ff7c5e7afa7cb7b4ca562ec7', NULL, NULL, '2026-01-12 17:02:02', '2026-01-12 18:31:02', '0433870844d4c1ffa72e3d57:8bc5dde3a98a93c26f4c206ebb4708b3:b8f3c9c498b0', 'c9583cbaeed71aaad5911ec2:448437532c8d72752f18d891b866c246:dff0c756f2110e9903', NULL);
INSERT INTO `Passwords` VALUES ('259aeb98-76d3-414b-960b-39d6bf3425ac', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'ae7703c0-a5d9-424f-a86c-48635ce8a4b2', '01aa83762e25c9fdbc5705c3:a73325b948605537b742b35ce7fb7f77:d6a21a5ceb63', NULL, '2026-01-11 11:00:39', '2026-01-08 00:57:52', '2026-01-12 18:31:02', 'cff310667fdd3b27014428e9:bd156af074b82c348b48252619cfbcf4:003d0725979c17068a77e7232d475d799c', '1193cec16026b7239564d5a7:9ec5e8606a1122c8d8bfa665a0fbd35b:8e7ad6056636583956', NULL);
INSERT INTO `Passwords` VALUES ('4193dbe5-bc85-4ad3-b7ac-7c27cd1ca631', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '288e319c-4391-4e70-af84-618a43792ea3', 'b63f1a024f1ba39c40f06028:092cf4b4d22e25b15eaf794bdacf5c85:bf604ffb122eac1c106fa59021e5cb7ee80e', NULL, NULL, '2026-01-08 01:52:59', '2026-01-12 18:31:02', '6de06081562a9d1ca0548d30:aa8b87bd2e0b35669c8e51afae27e74b:d0bf3a7477011ea45f524daf4e575684', '5b8be28b0268b627df8eb182:022f9bc03959cd576db9c7d86b1d412e:8ec70e13084db62c', NULL);
INSERT INTO `Passwords` VALUES ('4c2cb5cc-1d8a-45af-b255-158cf218abd2', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '25fc0a63-9cc4-414b-81bc-602508738f5c', '91447dd707ac4f38857e7acf:beb749446b1e27db37eaaa2e23052c03:e26ea19931f5', NULL, '2026-01-11 11:00:41', '2026-01-08 01:50:08', '2026-01-12 18:31:02', 'dc91ac3a9c8506c44a5b1bb1:3eeae5b322eff62f16ee0cf1f0c76feb:e37f4fe0ec2a', 'e56b1f12ca63f31339e65d58:a5804c1c19b62ad009bef12eefe1a8e6:89bb2185a25730a307', NULL);
INSERT INTO `Passwords` VALUES ('52d029c4-93e2-4a6a-87d5-1b39312bf16a', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', 'c2b22293634951d25642d74a:5d0603a994f938cd398dde61e692bbd9:7de1b9cc63e4675b83', NULL, NULL, '2026-01-08 01:52:21', '2026-01-12 18:31:02', '1dac2ac8aaeb133b58dbba5c:e1f6553f6e3f573dd5ec65c3aa5ac341:67feef7200c5865b9a687bfec962abf6c498c18a', '3867df381deafaa24a14d070:2c062583c23e917b638339933553a559:ced690a5248c4241', NULL);
INSERT INTO `Passwords` VALUES ('7a6c4cbc-78e1-400b-8871-65e87d55791b', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', 'e6c153e6ee0bf75e9a87bab9:9a5724bc7c5ad410716345f86cdf6e41:7f6bf64dd557', NULL, NULL, '2026-01-08 02:20:48', '2026-01-12 18:31:02', '72a743b37981cce5b11dfb5d:6c485002796c601c5fd2346e4178f93f:0d38967c0f2c', '42dfdfa76751287e5872ad6b:c56d007f41a5f53c312e412af748912c:bc4bf6b5bf60e07d', NULL);
INSERT INTO `Passwords` VALUES ('fca3eef2-5d0e-4b93-abe3-830a783edd19', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '288e319c-4391-4e70-af84-618a43792ea3', 'cb17e9d5c63735bb1bcff726:6b791b2531565676be70059e617ad131:2e9d3a8ca7d95cb013213cecf837a678a1bb', NULL, NULL, '2026-01-08 01:53:30', '2026-01-12 18:31:02', '13aaba630635335396ea6e02:f15f8dfd198bf3b5d00e2258750b3f84:b7dc1926ad794a469693805a1f449e', 'd4aa358b3587d47014854d1a:2019652321b06c3679639102fc3ec0d6:fe17744a179a2a19', NULL);
INSERT INTO `Passwords` VALUES ('fca537ab-5d86-490a-be0b-7fd0c6f20592', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', 'bb9005411d032c8d84354749:bff36247c104b7fc5ba05a1bdbafe4a6:f04e8b93dedb', NULL, NULL, '2026-01-08 02:13:04', '2026-01-12 18:31:02', '7e1e11057420d6c83bdce2f1:424b1ccf912ed60a23bf63763a84a164:5e3d07aa6b41', 'a658dc8f5215b260ccf7a124:425f4234bbd7c68a1b2ffd90112cc7f1:ea28acdfcbd6e13a14', NULL);

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
INSERT INTO `Users` VALUES ('12231a2d-78a4-4a98-98b0-bf38ab2fe95b', 'test14', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '456123789@gmail.com', '$2b$10$qK9iic5P.cRrJ5gVPQFI9OlimUzX6ght8MrqzjjS5t3tkmttMWwZ6', 2, 0, NULL, 0, '2026-01-07 23:17:19', '2026-01-07 23:17:19');
INSERT INTO `Users` VALUES ('21ed123d-c212-4852-ae09-885b8df39796', 'test006', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '18536024388@gmail.com', '$2b$10$D3wRZwZgwzInMUhl6i02ZebaX5F.sQZfiuw66DSaXvpwA3LyS0vHG', 2, 0, NULL, 0, '2026-01-07 22:19:14', '2026-01-07 22:19:14');
INSERT INTO `Users` VALUES ('26a4ec7c-67df-4037-abd1-5071bea8e783', 'test11', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '8825367412@sina.com', '$2b$10$Na6HLZ/df6LpNP8mAEil7u6JKgdKPNt9YpbCR4emfJan0YbTwIX26', 2, 0, NULL, 0, '2026-01-07 22:49:55', '2026-01-07 22:49:55');
INSERT INTO `Users` VALUES ('333b8c89-03d6-4f26-bf65-dc17531ef500', 'test10', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '91521666@hotmail.com', '$2b$10$GT5CNhH/L7.96oEVh8zmUOswQWLTraRdSQyhyuTom7fvKYK4qJDIO', 2, 0, NULL, 0, '2026-01-07 22:29:32', '2026-01-11 11:40:21');
INSERT INTO `Users` VALUES ('5fe564e4-5eb3-4b6c-ae83-99f4265df6d0', 'test009', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '1329963578@163.com', '$2b$10$gEiZGOuoPKTr3tnmFrTqAeWFt6asu/T.xvC.GDbiD6MJ2TfSI66oa', 2, 0, NULL, 0, '2026-01-07 22:22:31', '2026-01-07 22:22:31');
INSERT INTO `Users` VALUES ('77800f2c-031e-45b8-b38b-fe15fe735ff2', 'yuhuo1', 'http://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/3bf5b78dd9658195e60c20f02a2f102d.png', '1872848105@gmail.com', '$2b$10$29FGyR5fR00zZdbHxpmWG.aoULUtcj1CqkpcvZp0JgDm8srbXAzpW', 1, 0, NULL, 0, '2025-12-27 14:58:06', '2025-12-27 14:58:59');
INSERT INTO `Users` VALUES ('967f7842-2a09-449f-9952-d6e5c9d2cb47', 'test005', 'http://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/7fb53f67b4be7338743b6c95fa83ea81.jpeg', '1872848105@qq.com', '$2b$10$wBlVaWhNbDg8B4MjuDFcoO0F5RlGZxMGkTF2GCyH/D0i3em.s80Ji', 1, 0, '2026-01-12 21:26:58', 0, '2025-12-14 11:20:26', '2026-01-12 21:26:58');
INSERT INTO `Users` VALUES ('9b84f925-7c5e-4b07-a728-bd43b297347a', 'test13', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '987654321@me.com', '$2b$10$0yBYWUkVXYYhDtFLXlGoce01vI/41sRmCIZXq.1NBVc5KljoJ6wCC', 2, 0, NULL, 0, '2026-01-07 23:14:22', '2026-01-07 23:14:22');
INSERT INTO `Users` VALUES ('9bf71dd1-003e-4ec6-b9fd-e6db2ecc4e7e', 'test12', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '123456799@sina.com', '$2b$10$2lygUqjVsbdK9B03mVsKMOWxmhceiAfPsX9fx4ROARMCPy/0up8M2', 2, 0, NULL, 0, '2026-01-07 23:12:45', '2026-01-07 23:12:45');
INSERT INTO `Users` VALUES ('bc3fc20a-56fa-4aae-88d4-0f1b9335dd3e', 'test007', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '1856024387@qq.com', '$2b$10$JGstj1eXDu2bNZjAGNu1qehzYkPJ2D48m2oVXrwz6Z7ST5d2uKSwy', 2, 0, NULL, 0, '2026-01-07 22:10:43', '2026-01-07 22:10:43');
INSERT INTO `Users` VALUES ('f0f07cac-d4d6-4319-aba3-75f8455ad75d', 'test008', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '4545688@139.com', '$2b$10$HKkY1WfHtj77pgkFy.ohH.2eLxG1yVH7G/tYb2ByyS111uMWskVt6', 2, 0, NULL, 0, '2026-01-07 22:27:59', '2026-01-07 22:27:59');

SET FOREIGN_KEY_CHECKS = 1;
