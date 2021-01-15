/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : qlkh

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 04/01/2021 14:08:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `AdID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`AdID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'Administrator', 'admin@gmai.com', 'Ad1');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `CatID` int NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`CatID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Lập trình Web');
INSERT INTO `categories` VALUES (2, 'Lập trình thiết bị di động');

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `CoID` int NOT NULL AUTO_INCREMENT,
  `CoName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TinyDes` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `FullDes` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` int NOT NULL,
  `CatID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`CoID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses
-- ----------------------------

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `StuID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gender` int NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`StuID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, 'Giang hồ cỏ', '2020-12-11', 'gianghoco@gmail.com', 1, 'St1');
INSERT INTO `students` VALUES (9, 'Hoàng Xuân Kiệt', '2004-11-09', 'kiethoang611@gmail.com', 1, 'St2');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `TeaID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gender` int NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TeaID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES (1, 'Giang hồ xịn', '2020-10-11', 'gianghoxin@gmail.com', 1, 'Tea1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `permission` int NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2y$12$q/zqcTzejfcVC4bm2Vfj1eNdqhZhVyS3dm.18nLbep9UAIwDGX61S', 3, 'Ad1');
INSERT INTO `users` VALUES (2, 'gianghoco', '$2y$12$xDdlRdGo.o6O071bmkjvNe97TgFDDCEXKBtVKZBbfEgceJbXrvx2u ', 1, 'St1');
INSERT INTO `users` VALUES (3, 'gianghoxin', '$2y$12$kbzL8Gjfiqo8eyF1TzC2Ve.Khe/9PuGBLhCL.91DpGfLovW9LtKhm ', 2, 'Tea1');
INSERT INTO `users` VALUES (8, 'hxkiet', '$2a$10$fR9xE3OI5eaUrM18ZiQWeOHK6psXQ3YMlmOWT0HkfsiFzAYDHOf2u', 1, 'St2');

SET FOREIGN_KEY_CHECKS = 1;
