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

 Date: 28/01/2026 23:13:47
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
  INDEX `categories_user_id`(`userId` ASC) USING BTREE,
  CONSTRAINT `fkey_categories_user_cascade` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Categories
-- ----------------------------
INSERT INTO `Categories` VALUES ('09792d76-1342-4fe4-b45a-522342ee81c1', '0e69f52d-49e3-4f00-a8a8-ac8ac28f8ff6', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-28 22:41:52', '2026-01-28 22:41:52');
INSERT INTO `Categories` VALUES ('163b87eb-18e8-422d-b696-321956d4a801', '9bf71dd1-003e-4ec6-b9fd-e6db2ecc4e7e', '默认分类', 'hashtag', '#3b82f6', 1, '2026-01-07 23:12:45', '2026-01-07 23:12:45');
INSERT INTO `Categories` VALUES ('1b7e9ba2-249a-4ef7-8651-89fd96c8e408', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '金融理财', 'line-chart', '#9B6B64', 0, '2026-01-27 21:28:05', '2026-01-27 21:28:05');
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
  INDEX `passwords_category_id`(`categoryId` ASC) USING BTREE,
  CONSTRAINT `fkey_passwords_category_cascade` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Passwords
-- ----------------------------
INSERT INTO `Passwords` VALUES ('23d474f2-3ac6-41ab-84e1-6190d3a77b40', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'ae7703c0-a5d9-424f-a86c-48635ce8a4b2', '724a55f5ef35c14bc2098289:67d1c51650574a33bc54057313318155:a878ab76cf2878683fdb1cd1', NULL, NULL, '2026-01-12 17:02:02', '2026-01-28 23:09:22', '1d95bfaf943f5c7b2ddc4c52:bd039195e910427c6d71bafd256efc64:991268176aff', '4e62fa44c838e80f87ace640:84f36c71a26fe18a58332c202b27670d:bf2ef87917cd6b9034', NULL);
INSERT INTO `Passwords` VALUES ('259aeb98-76d3-414b-960b-39d6bf3425ac', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'ae7703c0-a5d9-424f-a86c-48635ce8a4b2', '106dfdac6ebb19bc176d6ac5:6bd57b4cd107e4e31b7ed31f128c4ef9:34fd9bc67b5a', '1922f91ba43a1d41e9971413:21e147ed67a975c8c4db27f00de13a3c:f4ec37433a5060ef2c6365c158bda87909ab1561a9a89c', '2026-01-28 23:10:51', '2026-01-08 00:57:52', '2026-01-28 23:10:51', '4cbc37099b616d8da3813162:2598dc29bdce302b593fd0305e24e7ba:75ab60d1862c7edf943cc17b93a7f96cea', '682a13994b5f3bd5b60d1ed6:86452b8daed4b1e1a62951da972b1e12:41ff89cd5bb5b1d46d', '792509b66b834411e02e6311:ff0ed3f2aefe0a52141792bf8c09f56d:9342cd');
INSERT INTO `Passwords` VALUES ('4193dbe5-bc85-4ad3-b7ac-7c27cd1ca631', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '288e319c-4391-4e70-af84-618a43792ea3', 'c9e5edb9d4b062e44ca5cee3:4c4c1312ec08b1719193bd381aea35c8:10978ca7c027bf26cac9881b435fd5f9aaeb', NULL, NULL, '2026-01-08 01:52:59', '2026-01-28 23:10:09', '420d7ff7a677fba77cb1914d:d83cc07b2d3a8f29599b416e830b93f1:61f459a8e669b5fb3bb2fc345cf60039', '524b40f254b5ca8a630dcb7d:5be26de5a432d9dc55231c76b81807de:3e0db96c9a942cbb', NULL);
INSERT INTO `Passwords` VALUES ('4c2cb5cc-1d8a-45af-b255-158cf218abd2', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '25fc0a63-9cc4-414b-81bc-602508738f5c', '544abca9ffc34a7c187ac041:02c25fd58699348da77eb5e563b5c518:77641641e033', NULL, NULL, '2026-01-08 01:50:08', '2026-01-28 23:10:49', '7a9a8ed8d5a46ed4007062e2:f58f8a23b0b7d3d8fee190e8abdfc751:bf3355edafa9', 'b302998bc7909dc408cf9723:75ace1de41507a938ef878867514b7bd:e50b0374d95aebb00d', NULL);
INSERT INTO `Passwords` VALUES ('52d029c4-93e2-4a6a-87d5-1b39312bf16a', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', '81419eb1931c499f2b6270d1:9c47c66ab28ba2cc1e1dc5e57c79c556:e32c473a30485ef845', NULL, NULL, '2026-01-08 01:52:21', '2026-01-28 23:09:19', '5b910be0ec035fdb8122f7e2:8f985ea8fc6d0263af1493dea8d4a208:3ebebf4dc1f7558ccd1119b2b80e1213971c2183', 'c25a4b37f053a049d6559c93:2f25b730e4f3a0e700b9ce46dbad92c2:3cd59534261dfe1b', '9525d3f186c88388bc89ef6e:bbf9d478806a487284e9db51597afff9:517bd9');
INSERT INTO `Passwords` VALUES ('7a6c4cbc-78e1-400b-8871-65e87d55791b', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', 'f1781b20cc9965ea62b3923b:5d33554fa9158853d8cf79e4189be84e:e633ee3234cc', NULL, '2026-01-28 23:09:31', '2026-01-08 02:20:48', '2026-01-28 23:09:31', '496157e789055ebf06952daa:e3d43937b5f382ab415ed3bef010b02d:ce348a01b6e6', '5326cbeaa6f173b3cb18f143:0d306b0fea21879eec05bc5c9c4c0ece:9e5787f4483df4e8', NULL);
INSERT INTO `Passwords` VALUES ('fca3eef2-5d0e-4b93-abe3-830a783edd19', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '288e319c-4391-4e70-af84-618a43792ea3', '0805324725c54fc0ddec8bdd:11c63812efd6c1e2a829d9b1e97a8647:d218f3b248b85e4d4eceb97b4db8167cf4e8', NULL, NULL, '2026-01-08 01:53:30', '2026-01-28 23:09:14', '50b86dd3bece7f45267a924f:04b40ad63a24d6d9b405e58a3bbcba5c:c4fb73c73308d733c02b113cf57965', 'a12d4aa5ad883d315d6fe7fd:8242352ffe0ed03a7b3fec7df046b90b:a1fa2d84b6bde199', NULL);
INSERT INTO `Passwords` VALUES ('fca537ab-5d86-490a-be0b-7fd0c6f20592', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', '9e4178583b40372fa794432e:6693fed46759d7cf98f04dd25656a385:a04fe38231b3', NULL, '2026-01-27 22:06:57', '2026-01-08 02:13:04', '2026-01-28 22:45:55', '8429e9fda65d3cb257e6c8aa:4e03ec6c8e5daff2c80a63f8abd7cdcc:8bd4bded51e4', '2eae24e70e7111708ed47422:47f72a1d93098ece82d88952bc932c99:770d1e9cb0d4d78aa6', NULL);

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
INSERT INTO `SequelizeMeta` VALUES ('20260128141023-add-cascade-delete-constraints.js');

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
INSERT INTO `Users` VALUES ('0e69f52d-49e3-4f00-a8a8-ac8ac28f8ff6', 'test001', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '377437076@qq.com', '$2b$10$QbuxqgtTs4dJJPfSvOL5EuM.tp3wARD79/geQ21cyIZ9w4n.aVQoC', 2, 0, NULL, 0, '2026-01-28 22:41:52', '2026-01-28 22:41:52');
INSERT INTO `Users` VALUES ('12231a2d-78a4-4a98-98b0-bf38ab2fe95b', 'test14', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '456123789@gmail.com', '$2b$10$qK9iic5P.cRrJ5gVPQFI9OlimUzX6ght8MrqzjjS5t3tkmttMWwZ6', 2, 0, NULL, 0, '2026-01-07 23:17:19', '2026-01-07 23:17:19');
INSERT INTO `Users` VALUES ('21ed123d-c212-4852-ae09-885b8df39796', 'test006', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '18536024388@gmail.com', '$2b$10$D3wRZwZgwzInMUhl6i02ZebaX5F.sQZfiuw66DSaXvpwA3LyS0vHG', 2, 0, NULL, 0, '2026-01-07 22:19:14', '2026-01-07 22:19:14');
INSERT INTO `Users` VALUES ('26a4ec7c-67df-4037-abd1-5071bea8e783', 'test11', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '8825367412@sina.com', '$2b$10$Na6HLZ/df6LpNP8mAEil7u6JKgdKPNt9YpbCR4emfJan0YbTwIX26', 2, 0, NULL, 0, '2026-01-07 22:49:55', '2026-01-07 22:49:55');
INSERT INTO `Users` VALUES ('333b8c89-03d6-4f26-bf65-dc17531ef500', 'test10', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '91521666@hotmail.com', '$2b$10$GT5CNhH/L7.96oEVh8zmUOswQWLTraRdSQyhyuTom7fvKYK4qJDIO', 2, 0, NULL, 0, '2026-01-07 22:29:32', '2026-01-11 11:40:21');
INSERT INTO `Users` VALUES ('5fe564e4-5eb3-4b6c-ae83-99f4265df6d0', 'test009', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '1329963578@163.com', '$2b$10$gEiZGOuoPKTr3tnmFrTqAeWFt6asu/T.xvC.GDbiD6MJ2TfSI66oa', 2, 0, NULL, 0, '2026-01-07 22:22:31', '2026-01-07 22:22:31');
INSERT INTO `Users` VALUES ('77800f2c-031e-45b8-b38b-fe15fe735ff2', 'yuhuo1', 'http://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/3bf5b78dd9658195e60c20f02a2f102d.png', '1872848105@gmail.com', '$2b$10$29FGyR5fR00zZdbHxpmWG.aoULUtcj1CqkpcvZp0JgDm8srbXAzpW', 1, 0, NULL, 0, '2025-12-27 14:58:06', '2025-12-27 14:58:59');
INSERT INTO `Users` VALUES ('967f7842-2a09-449f-9952-d6e5c9d2cb47', 'test005', 'http://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/7fb53f67b4be7338743b6c95fa83ea81.jpeg', '1872848105@qq.com', '$2b$10$E2ROulcrFotIh89RaFCmQe8zrwG4N26aPul9tLt5O8jNHZj3FLfkC', 1, 0, '2026-01-12 21:26:58', 0, '2025-12-14 11:20:26', '2026-01-28 22:45:55');
INSERT INTO `Users` VALUES ('9b84f925-7c5e-4b07-a728-bd43b297347a', 'test13', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '987654321@me.com', '$2b$10$0yBYWUkVXYYhDtFLXlGoce01vI/41sRmCIZXq.1NBVc5KljoJ6wCC', 2, 0, NULL, 0, '2026-01-07 23:14:22', '2026-01-07 23:14:22');
INSERT INTO `Users` VALUES ('9bf71dd1-003e-4ec6-b9fd-e6db2ecc4e7e', 'test12', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '123456799@sina.com', '$2b$10$2lygUqjVsbdK9B03mVsKMOWxmhceiAfPsX9fx4ROARMCPy/0up8M2', 2, 0, NULL, 0, '2026-01-07 23:12:45', '2026-01-07 23:12:45');
INSERT INTO `Users` VALUES ('bc3fc20a-56fa-4aae-88d4-0f1b9335dd3e', 'test007', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '1856024387@qq.com', '$2b$10$JGstj1eXDu2bNZjAGNu1qehzYkPJ2D48m2oVXrwz6Z7ST5d2uKSwy', 2, 0, NULL, 0, '2026-01-07 22:10:43', '2026-01-07 22:10:43');
INSERT INTO `Users` VALUES ('f0f07cac-d4d6-4319-aba3-75f8455ad75d', 'test008', 'https://xnbjb-oss.oss-cn-wuhan-lr.aliyuncs.com/uploads/f8deb22fa157ef45902b51cbd63a622a.png', '4545688@139.com', '$2b$10$HKkY1WfHtj77pgkFy.ohH.2eLxG1yVH7G/tYb2ByyS111uMWskVt6', 2, 0, NULL, 0, '2026-01-07 22:27:59', '2026-01-07 22:27:59');

SET FOREIGN_KEY_CHECKS = 1;
