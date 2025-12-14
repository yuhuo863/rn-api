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

 Date: 15/12/2025 23:51:13
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
INSERT INTO `Categories` VALUES ('a268dbf5-464f-4f21-a121-49f9dea2ea66', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '社交媒体', 'fa-social', 0, '2025-12-14 14:55:49', '2025-12-14 14:55:49');
INSERT INTO `Categories` VALUES ('c69c0f9d-c38b-4925-b897-8889beb0182c', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '默认分类', 'fa-default', 1, '2025-12-14 11:20:26', '2025-12-14 14:42:28');

-- ----------------------------
-- Table structure for Passwords
-- ----------------------------
DROP TABLE IF EXISTS `Passwords`;
CREATE TABLE `Passwords`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `encrypted_blob` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `iv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `site_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deletedAt` datetime NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `passwords_user_id`(`userId` ASC) USING BTREE,
  INDEX `passwords_category_id`(`categoryId` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Passwords
-- ----------------------------
INSERT INTO `Passwords` VALUES ('1', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob1', 'iv1', 'Facebook 1', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('10', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob10', 'iv10', 'Facebook 10', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('100', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob100', 'iv100', 'Facebook 100', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('11', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob11', 'iv11', 'Facebook 11', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('12', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob12', 'iv12', 'Facebook 12', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('13', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob13', 'iv13', 'Facebook 13', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('14', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob14', 'iv14', 'Facebook 14', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('15', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob15', 'iv15', 'Facebook 15', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('16', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob16', 'iv16', 'Facebook 16', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('17', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob17', 'iv17', 'Facebook 17', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('18', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob18', 'iv18', 'Facebook 18', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('19', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob19', 'iv19', 'Facebook 19', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('2', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob2', 'iv2', 'Facebook 2', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('20', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob20', 'iv20', 'Facebook 20', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('21', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob21', 'iv21', 'Facebook 21', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('22', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob22', 'iv22', 'Facebook 22', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('23', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob23', 'iv23', 'Facebook 23', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('24', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob24', 'iv24', 'Facebook 24', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('25', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob25', 'iv25', 'Facebook 25', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('26', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob26', 'iv26', 'Facebook 26', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('27', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob27', 'iv27', 'Facebook 27', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('28', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob28', 'iv28', 'Facebook 28', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('29', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob29', 'iv29', 'Facebook 29', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('3', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob3', 'iv3', 'Facebook 3', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('30', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob30', 'iv30', 'Facebook 30', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('31', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob31', 'iv31', 'Facebook 31', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('32', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob32', 'iv32', 'Facebook 32', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('33', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob33', 'iv33', 'Facebook 33', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('34', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob34', 'iv34', 'Facebook 34', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('35', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob35', 'iv35', 'Facebook 35', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('36', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob36', 'iv36', 'Facebook 36', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('37', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob37', 'iv37', 'Facebook 37', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('38', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob38', 'iv38', 'Facebook 38', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('39', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob39', 'iv39', 'Facebook 39', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('4', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob4', 'iv4', 'Facebook 4', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('40', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob40', 'iv40', 'Facebook 40', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('41', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob41', 'iv41', 'Facebook 41', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('42', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob42', 'iv42', 'Facebook 42', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('43', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob43', 'iv43', 'Facebook 43', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('44', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob44', 'iv44', 'Facebook 44', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('45', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob45', 'iv45', 'Facebook 45', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('46', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob46', 'iv46', 'Facebook 46', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('47', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob47', 'iv47', 'Facebook 47', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('48', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob48', 'iv48', 'Facebook 48', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('49', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob49', 'iv49', 'Facebook 49', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('5', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob5', 'iv5', 'Facebook 5', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('50', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob50', 'iv50', 'Facebook 50', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('51', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob51', 'iv51', 'Facebook 51', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('52', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob52', 'iv52', 'Facebook 52', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('53', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob53', 'iv53', 'Facebook 53', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('54', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob54', 'iv54', 'Facebook 54', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('55', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob55', 'iv55', 'Facebook 55', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('56', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob56', 'iv56', 'Facebook 56', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('57', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob57', 'iv57', 'Facebook 57', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('58', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob58', 'iv58', 'Facebook 58', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('59', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob59', 'iv59', 'Facebook 59', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('6', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob6', 'iv6', 'Facebook 6', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('60', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob60', 'iv60', 'Facebook 60', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('61', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob61', 'iv61', 'Facebook 61', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('62', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob62', 'iv62', 'Facebook 62', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('63', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob63', 'iv63', 'Facebook 63', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('64', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob64', 'iv64', 'Facebook 64', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('65', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob65', 'iv65', 'Facebook 65', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('66', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob66', 'iv66', 'Facebook 66', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('67', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob67', 'iv67', 'Facebook 67', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('68', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob68', 'iv68', 'Facebook 68', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('69', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob69', 'iv69', 'Facebook 69', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('7', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob7', 'iv7', 'Facebook 7', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('70', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob70', 'iv70', 'Facebook 70', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('71', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob71', 'iv71', 'Facebook 71', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('72', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob72', 'iv72', 'Facebook 72', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('73', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob73', 'iv73', 'Facebook 73', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('74', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob74', 'iv74', 'Facebook 74', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('75', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob75', 'iv75', 'Facebook 75', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('76', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob76', 'iv76', 'Facebook 76', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('77', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob77', 'iv77', 'Facebook 77', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('78', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob78', 'iv78', 'Facebook 78', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('79', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob79', 'iv79', 'Facebook 79', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('8', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob8', 'iv8', 'Facebook 8', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('80', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob80', 'iv80', 'Facebook 80', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('81', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob81', 'iv81', 'Facebook 81', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('82', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob82', 'iv82', 'Facebook 82', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('83', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob83', 'iv83', 'Facebook 83', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('84', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob84', 'iv84', 'Facebook 84', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('85', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob85', 'iv85', 'Facebook 85', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('86', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob86', 'iv86', 'Facebook 86', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('87', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob87', 'iv87', 'Facebook 87', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('88', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob88', 'iv88', 'Facebook 88', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('89', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob89', 'iv89', 'Facebook 89', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('9', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob9', 'iv9', 'Facebook 9', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('90', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob90', 'iv90', 'Facebook 90', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('91', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob91', 'iv91', 'Facebook 91', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('92', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob92', 'iv92', 'Facebook 92', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('93', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob93', 'iv93', 'Facebook 93', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('94', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob94', 'iv94', 'Facebook 94', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('95', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob95', 'iv95', 'Facebook 95', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('96', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob96', 'iv96', 'Facebook 96', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('97', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob97', 'iv97', 'Facebook 97', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('98', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob98', 'iv98', 'Facebook 98', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');
INSERT INTO `Passwords` VALUES ('99', '967f7842-2a09-449f-9952-d6e5c9d2cb47', '4a0e1d5e-271a-4a96-8f1d-1ecf06f7d867', 'encrypted_blob99', 'iv99', 'Facebook 99', NULL, NULL, '2025-12-15 22:47:31', '2025-12-15 22:47:31');

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
