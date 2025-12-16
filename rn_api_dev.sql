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

 Date: 17/12/2025 00:21:52
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
  `isDefault` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories_user_id`(`userId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Categories
-- ----------------------------
INSERT INTO `Categories` VALUES ('a268dbf5-464f-4f21-a121-49f9dea2ea66', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '社交媒体', 'users', 0, '2025-12-14 14:55:49', '2025-12-14 14:55:49');
INSERT INTO `Categories` VALUES ('c69c0f9d-c38b-4925-b897-8889beb0182c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '默认分类', 'hashtag', 1, '2025-12-14 11:20:26', '2025-12-14 14:42:28');

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
INSERT INTO `Passwords` VALUES ('07000be1-41ad-453e-bff9-61f192bcb7c4', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'c69c0f9d-c38b-4925-b897-8889beb0182c', 'X', NULL, NULL, '2025-12-16 23:23:50', '2025-12-16 23:23:50', 'test003', 'eyJzYWx0IjoiNmQ4NzU1MDllOTNiZGQ0MTM1ZjA3NzM3ZTRkYTZjNTQiLCJpdiI6IjE3ZjIzZTRjYzRiMmZiMzQ2ZjdkMTQxMjFjMjdkMmU3IiwiYXV0aFRhZyI6Ijk0NWVhMGYwMTk1YTY0OWY2ODA5Mzk0Y2VmZjA3ZjY5IiwiZW5jcnlwdGVkRGF0YSI6Ijc1OTZkNGU0MGQ2MjQ1ZjMifQ==', '666');
INSERT INTO `Passwords` VALUES ('8c7c5627-cf5e-4534-a832-41d23686184f', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'c69c0f9d-c38b-4925-b897-8889beb0182c', 'Google', NULL, NULL, '2025-12-16 23:18:38', '2025-12-16 23:18:38', 'test001', 'eyJzYWx0IjoiMTcxOTU0NTFiZTE5MTQxYzI5MTg3YTdhOWI0MGJjZjIiLCJpdiI6ImQ1YzNhNGIwNmUyYzQ1YWRjYmFlYmExYTMzNTJiMDRhIiwiYXV0aFRhZyI6IjZmYzkwNzE2ZjNmMjEwMzVkZWU5YjcyNzU3NTFkYThiIiwiZW5jcnlwdGVkRGF0YSI6ImM5YjUwMTRkYzQzZWE1N2QifQ==', NULL);
INSERT INTO `Passwords` VALUES ('9ea99e8f-b5f3-487c-8880-3fc297500980', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'a268dbf5-464f-4f21-a121-49f9dea2ea66', 'Instagram', NULL, NULL, '2025-12-17 00:06:00', '2025-12-17 00:06:00', 'test000', 'eyJzYWx0IjoiYjM3ZTQxM2MxODkxZDkyMWQ2YzVhNjVlNWNlMDgwMWYiLCJpdiI6IjQ4NzhkNmNmMzg5OGE4YzhlMjY5YTRkNjk1OGM5MDBmIiwiYXV0aFRhZyI6ImNiNjkyMTcwZWQ2NDI2M2E4Y2FmYWRlZThkMjVkMzNiIiwiZW5jcnlwdGVkRGF0YSI6IjFjZmQwMDRmMWYzZTAyZmUifQ==', '777');
INSERT INTO `Passwords` VALUES ('cee56b66-f9a0-47b9-a2cb-21026727237b', '967f7842-2a09-449f-9952-d6e5c9d2cb47', 'c69c0f9d-c38b-4925-b897-8889beb0182c', 'Facebook', NULL, NULL, '2025-12-16 22:48:59', '2025-12-16 22:48:59', 'test004', 'eyJzYWx0IjoiNDFkMTYyM2YxYzc5ZjNkZWY5ZDAyZjdiOGM1NmI1OTciLCJpdiI6IjM4NTVmNDUyYTYxOGE4MzQ5YjZmNzQxMjU5OWRhYTM3IiwiYXV0aFRhZyI6ImEwNDI4ZjI5MDY3NWFkYjhiZDM3YmIwM2FjYWFiNzc0IiwiZW5jcnlwdGVkRGF0YSI6Ijc5ODg4YWM4ODhjMzMyYjgifQ==', NULL);

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
INSERT INTO `Users` VALUES ('967f7842-2a09-449f-9952-d6e5c9d2cb47', 'test004', NULL, '1563454160@qq.com', '$2b$10$ubBlVb8WG5kZxzjVSfW6z.Wi01GzYCJ9p.gaxRPhso9AmyEThWKu6', 1, 0, 0, '2025-12-14 11:20:26', '2025-12-14 13:26:57');

SET FOREIGN_KEY_CHECKS = 1;
