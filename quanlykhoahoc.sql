/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : quanlykhoahoc

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 13/01/2021 15:51:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `AdminID` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`AdminID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CategoryID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'IT');

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `CouponID` int NOT NULL AUTO_INCREMENT,
  `NewPrice` float NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`CouponID`) USING BTREE,
  INDEX `Promotion_Course_FK_idx`(`CourseID`) USING BTREE,
  CONSTRAINT `Promotion_Course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon
-- ----------------------------

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `CoursesID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TinyDes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `FullDes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Price` float NOT NULL DEFAULT 0,
  `IsFinished` tinyint NOT NULL DEFAULT 0,
  `TeaID` int NOT NULL,
  `SubCategoryID` int NOT NULL,
  `LastUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AccessNumber` int NOT NULL DEFAULT 0,
  `nRegister` int NOT NULL DEFAULT 0,
  `Sale` int NULL DEFAULT NULL COMMENT 'Giá đã giảm',
  PRIMARY KEY (`CoursesID`) USING BTREE,
  UNIQUE INDEX `Name_UNIQUE`(`Name`) USING BTREE,
  INDEX `TedID_idx`(`TeaID`) USING BTREE,
  INDEX `Course_SubCategory_FK_idx`(`SubCategoryID`) USING BTREE,
  CONSTRAINT `Course_SubCategory_FK` FOREIGN KEY (`SubCategoryID`) REFERENCES `subcategories` (`SubCategoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `TedID` FOREIGN KEY (`TeaID`) REFERENCES `teachers` (`TeaID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES (1, 'Full Stack Web Development ', 'Learn Full Stack Web Development Building Over 40+ Projects', '<p>This <span style=\"color: #3598db;\"><strong>#fullstackwebdevelopment </strong></span>tutorial course will take us from beginner level developer to an expert level full stack developer.</p>\r\n<p>It includes a tutorial on:&nbsp;</p>\r\n<p>1. <span style=\"color: #3598db;\"><strong>#WebDevelopment,&nbsp;</strong></span></p>\r\n<p>2. React Js,</p>\r\n<p>3. NodeJS,</p>\r\n<p>4. ExpressJS, and&nbsp;</p>\r\n<p>5. MongoDB.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Let\'s begin.</p>\r\n<p>&nbsp;</p>\r\n<p>This video is an overview of what we will be learning in this course.&nbsp; This course teaches us from the very basic fundamental level to the very end.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>A) It starts with HTML and how to work with elements and tags and use them on the website accordingly.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>B) Next comes the styling part with CSS, its concepts, how it works and what it does. At the end of HTML and CSS, we will be able to make static websites on our own.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>C) To add functionalities to our websites we will be learning Javascript next. Next, we will be learning version control using Git.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>D) The next part of the course will be about Bootstrap and how to use its classes and make responsive websites using bootstrap row and column properties.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>E) Lastly, we will be entering into backend using node, MongoDB and finally learning a very powerful frontend framework, React.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>F) We will be learning to work with databases and will be developing APIs of our own.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash; Do subscribe and hit Bell Icon &mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</p>\r\n<p>&nbsp;</p>\r\n<p>Follow us in social media handles for opportunities and code related queries.</p>\r\n<p>&nbsp;</p>\r\n<p>GitHub : https://github.com/wbweb</p>\r\n<p>Instagram: https://www.instagram.com/wb.web/</p>\r\n<p>Facebook: https://www.facebook.com/wbweb/</p>\r\n<p>Twitter: https://twitter.com/wbweb_in/</p>\r\n<p>LinkedIn: https://www.linkedin.com/company/wbweb/</p>\r\n<p>&nbsp;</p>\r\n<p>&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</p>\r\n<p>&nbsp;</p>\r\n<p>Source code repository: https://github.com/WBWeb/FullStackWeb...</p>\r\n<p>&nbsp;</p>\r\n<p>&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</p>\r\n<p>&nbsp;</p>\r\n<p>Got a question on the topic? Please share it in the comment section below and our experts will answer it for you.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>For more information, please write back to us at hi@wbweb.co.in or call us at IND: 7077568998</p>\r\n<p>&nbsp;</p>\r\n<p>After completing the course, write to biswabijaya@wbweb.co.in for an internship or freelancing opportunities.</p>\r\n<p>&nbsp;</p>\r\n<p>For consultation or partnership, related queries drop a mail to hi@wbweb.co.in.</p>', 1.4, 0, 1, 1, '2021-01-09 02:35:33', '2021-01-13 15:03:55', 10, 3, NULL);
INSERT INTO `courses` VALUES (2, 'Flutter Tutorials', 'Learn the dart and flutter basics', '<p>&nbsp;</p>\r\n<p><span style=\"background-color: #ecf0f1; color: #000000;\"><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Flutter studio: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=http%3A%2F%2Fmutisya.com%2F&amp;redir_token=QUFFLUhqbU53aXhqY1llaHFvdjhGbEFVdUdESmRKUTUwd3xBQ3Jtc0tsR2l6d2dKZW13bGxjbDJfS09TZmp3SFpQQmIwcW13UFNwM0pxOHA4ZjctR2plTWxVLWZLcUFVRGxXR1NtenFnZzdSMXM0dDJ6NE5UTkJEczc5WnM0c01ZV2ktM0RDa20zTU5FZVY5WmhoSkc2cGtEOA%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">http://mutisya.com/</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Information on Dart 2.0 and Flutter 2.0: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Fgithub.com%2Fflutter%2Fflutter%2Fwiki%2FTrying-the-preview-of-Dart-2-in-Flutter&amp;redir_token=QUFFLUhqbDZMOXdEaWZaWVd5N3NPbUdQYmdlaGhqaUxaQXxBQ3Jtc0tuZE5kZHdubmd6LUVIUEdRLVV1WHhNbTFWNmV1T21ZX1BhU2xkcmtmZGlMbV9Cbk0xNmNzd3FxcldKcmpSVHZwNkNfeGs0ZG9rdHlQMnNiNXpmMmtjdV9RMjRORzd1ODByeTNrR2dsOGh4YkJ4M29ITQ%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://github.com/flutter/flutter/wi...</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Source Code: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Fgithub.com%2Ftensor-programming%2Fdart_flutter_multi_page_app&amp;redir_token=QUFFLUhqbjhJWjR5c0Zoc3NBTmRETWR3aDU2YmxIVjQwUXxBQ3Jtc0trN1d4a2tvcGM2QnRHR05zc0lYOGQ2aVdueFJvN0xTNGl0NEdJekU2SWt4Rm9WSjFPdzNSVy1tb1ExemdWb0wwOFRJSEwxTHZkT2ZrdVQwNUR0YnRTR3EyMVpJdHhmaUtZTVJCU2hkSkhiQUdxQ1NFRQ%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://github.com/tensor-programming...</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Feel free to donate: BTC: 1ExBSiaEa3pceW98eptJwzR9QHrYZ71Xit ETH: 0xD210Ea51F1615794A16080A108d2BC5471F60166 ADA: DdzFFzCqrhsqPcLbpt3C9nkSW2HvMJJCER5c9ijxKwXDet3GT5KchnUp458zN9uVmCzRjzwyy8usFUEhwBQ63h2ZjvyAXHYnHRG8MZpv Check out our Blog: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=http%3A%2F%2Fwww.tensor-programming.com%2F&amp;redir_token=QUFFLUhqa1lCMGhLVmUtNFZDT3JJNmpWSnJwT1EtZmpFd3xBQ3Jtc0tsYUFUQWVHOTh4UHZSbHQyM05lTkMzdE1fYktTUnl6czJmZkpkN045RVltQUllbWlkVlNOWFIwUEdYNjM2U1pFRXlUT0tFOWFuNlZFeW53V19tVnN5MVBZbWlfMWZNeWN2THA5N21NSXh5M2JVZXhTbw%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">http://www.tensor-programming.com/</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Check out our Twitter: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Ftwitter.com%2FTensorProgram&amp;redir_token=QUFFLUhqbUtMUWxXN0cwSkRtSldlVXFXcWk2cUoxWW4xd3xBQ3Jtc0tudHBza1ZxRHBad3pqeVNzcXBhRGViX2hjNXBBTkxWODFOQXdDNWd3RlRnaFNWdUxFUGh0Uy1ZWlhJVWNIWUFLa09MWWFDdkZndy15eFNTU3hwbnNLM0RNdHVBcVNvWUppWjQ3ZG8ySGJQTVd0ZzRWUQ%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://twitter.com/TensorProgram</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Check out our Facebook: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Fwww.facebook.com%2FTensor-Programming-1197847143611799%2F&amp;redir_token=QUFFLUhqbFJNa0x3MU9MTHUtZXNUMWFNSmRoWElGc2hSUXxBQ3Jtc0ttSVhtRFJkVW1FbUd5LUpYVzVzNU1MaHhuOFZha1pTZ1NPSkwtUDdyRUNCRmF1TlVsX3RZNHFMaEZYS0RGeUhXZWFIelV4LXdfY0R2STl4bURvZEc2aUNfc0xWRkczWnY2LWRzWjVsbmdaRGhSdndDWQ%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://www.facebook.com/Tensor-Progr...</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Check out our Steemit: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Fsteemit.com%2F%40tensor&amp;redir_token=QUFFLUhqbERLVkFYdmVGNHRfbk1FS1diS2JqLWV5VTFwQXxBQ3Jtc0tuOWRwdnRKTTFaNXFHbmFJcDdrZXZpU3c5eDltaF9KUzNYYmx0ZDhpNWhHdk8tSm4yZ3BkYVduVDFRakFPakx6aVhSLVF4VmFvbElRNnQwQkpsTFoxOTFiczBEdlY4eGhhemx4Uk1kQjY3STlHa1F4Zw%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://steemit.com/@tensor</a></span></p>', 99.2, 0, 1, 2, '2021-01-09 02:48:50', '2021-01-13 14:52:31', 10, 0, NULL);
INSERT INTO `courses` VALUES (3, 'React js all in one', 'React Tutorial - Learn to build fast web apps with React (React js) from scratch.', '<p>One shot video will help you to understand the foundation of React<br /><span style=\"font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Fira Sans\', \'Droid Sans\', \'Helvetica Neue\', sans-serif; font-size: 17px;\">We will build a small game during this tutorial.&nbsp;</span><span style=\"margin: 0px; padding: 0px; box-sizing: inherit; font-weight: bolder; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Fira Sans\', \'Droid Sans\', \'Helvetica Neue\', sans-serif; font-size: 17px;\">You might be tempted to skip it because you&rsquo;re not building games &mdash; but give it a chance.</span><span style=\"font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Fira Sans\', \'Droid Sans\', \'Helvetica Neue\', sans-serif; font-size: 17px;\">&nbsp;The techniques you&rsquo;ll learn in the tutorial are fundamental to building any React app, and mastering it will give you a deep understanding of React.</span></p>', 99.9, 1, 1, 1, '2021-01-09 07:55:08', '2021-01-13 14:05:00', 6, 4, NULL);
INSERT INTO `courses` VALUES (4, 'iOS 13 App Development', 'Learn iOS 14 development with Swift 5 + Xcode 12. Build apps, games (Instagram, Foursquare etc) + also discover SwiftUI!', '<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">Welcome to the&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Complete iOS App Development Bootcamp</strong>. With over 39,000 5 star ratings and a 4.8 average my iOS course is the HIGHEST RATED iOS Course in the history of Udemy!</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">At 55+ hours, this iOS 13 course is the&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">most comprehensive</strong>&nbsp;iOS development course online!</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">This Swift 5.1 course is based on our<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;in-person</strong>&nbsp;app development bootcamp in London, where we\'ve perfected the curriculum over 4 years of in-person teaching.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">Our complete app development bootcamp teaches you how to code using Swift 5.1 and build&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">beautiful</em>&nbsp;iOS 13 apps for iPhone and iPad. Even if you have&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">ZERO</strong>&nbsp;programming experience.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">I\'ll take you step-by-step through engaging and fun video tutorials and teach you everything you need to know to succeed as an iOS app developer.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">The course includes 55+<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;hours</strong>&nbsp;of HD video tutorials and builds your programming knowledge while making real world apps. e.g. Pokemon Go, Whatsapp, QuizUp and Yahoo Weather.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">The curriculum has been completely revamped for iOS 13 and Xcode 11. Including comprehensive modules on Apple\'s latest technology -&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">SwiftUI</strong>&nbsp;iOS, iPadOS and macOS app interface design,&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">ARKit</strong>&nbsp;for making&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Augmented Reality</strong>&nbsp;apps as well as&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">CoreML &amp; CreateML</strong>&nbsp;for making intelligent apps with&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Machine Learning</strong>. You\'ll be building 3D augmented reality apps that look like Pokemon Go and Harry Potter\'s magical newspapers!</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">By the end of this course, you will be&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">fluently</strong>&nbsp;programming in&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Swift 5.1</strong>&nbsp;and be ready to make your own apps or start a freelancing job as an iOS 13 developer.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">You\'ll also have a portfolio of over 25 apps that you can show off to any potential employer.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Sign up today, and look forwards to:</strong></p>\r\n<ul style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px 0px 0px 2.4rem; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Over 55 hours of HD 1080p video content, everything you\'ll ever need to succeed as a iOS developer.</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Building over 25 fully-fledged apps including ones that use machine learning and augmented reality</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">All the knowledge you need to start building any app you want</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">A giant bundle of design assets</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Our best selling 12 Rules to Learn to Code eBook</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">$8000+ app development bootcamp course materials and curriculum</p>\r\n</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">From Beginner to iOS 13 App Developer with Just One Course</strong></p>', 12.9, 0, 1, 1, '2021-01-09 08:01:43', '2021-01-13 10:59:08', 1, 0, NULL);
INSERT INTO `courses` VALUES (5, 'iOS & Swift', 'From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!', NULL, 45.2, 0, 1, 2, '2021-01-11 11:00:40', '2021-01-13 15:04:06', 8, 5, NULL);
INSERT INTO `courses` VALUES (6, 'The Web Developer Bootcamp 2021', 'COMPLETELY REDONE - The only course you need to learn web development - HTML, CSS, JS, Node, and More!', NULL, 50.99, 0, 1, 1, '2021-01-12 15:43:26', '2021-01-13 14:25:49', 6, 0, NULL);
INSERT INTO `courses` VALUES (7, 'Angular - The Complete Guide', 'Master Angular 10 (formerly \"Angular 2\") and build awesome, reactive web apps with the successor of Angular.js', NULL, 11.99, 0, 1, 1, '2021-01-12 15:44:51', '2021-01-12 15:55:35', 1, 0, NULL);
INSERT INTO `courses` VALUES (8, 'The Complete React Native + Hooks Course', 'Understand React Native v0.62.2 with Hooks, Context, and React Navigation.\r\n', NULL, 25.99, 0, 1, 2, '2021-01-12 15:52:50', '2021-01-12 15:55:42', 1, 0, NULL);
INSERT INTO `courses` VALUES (9, 'The Complete Android N Developer Course', 'Learn Android App Development with Android 7 Nougat by building real apps including Uber, Whatsapp and Instagram!', NULL, 36.99, 0, 1, 2, '2021-01-12 15:54:21', '2021-01-13 02:22:34', 1, 2, NULL);
INSERT INTO `courses` VALUES (10, 'Android Java Masterclass - Become an App Developer', 'Improve your career options by learning Android app Development. Master Android Studio and build your first app today', NULL, 79.99, 0, 1, 2, '2021-01-12 15:55:27', '2021-01-12 15:55:50', 1, 0, NULL);
INSERT INTO `courses` VALUES (11, 'The Complete Android Kotlin Developer Course', 'Learn how to build 17 online games, and apps for Android Q, like Pokémon , twitter,Tic Tac Toe, and notepad using Kotlin', NULL, 11.99, 0, 1, 2, '2021-01-12 16:33:29', '2021-01-12 16:33:29', 1, 0, NULL);
INSERT INTO `courses` VALUES (12, 'Modern Android app', 'Learn the latest Android technologies including Dagger2, MVVM, Kotlin, RxJava, Retrofit, Mockito and Glide', NULL, 12.99, 0, 1, 2, '2021-01-12 23:03:56', '2021-01-13 02:22:36', 0, 1, NULL);
INSERT INTO `courses` VALUES (13, 'The Complete iOS 14 / iOS 13 Developer', 'Learn iOS 14 development with Swift 5 + Xcode 12. Build apps, games (Instagram, Foursquare etc) + also discover SwiftUI!', NULL, 11.99, 0, 1, 2, '2021-01-13 01:49:26', '2021-01-13 01:49:36', 5, 0, NULL);
INSERT INTO `courses` VALUES (14, 'Python and Django Full Stack Web Developer Bootcamp', 'Learn to build websites with HTML , CSS , Bootstrap , Javascript , jQuery , Python 3 , and Django!', NULL, 11.99, 0, 1, 1, '2021-01-13 01:52:50', '2021-01-13 10:59:46', 4, 0, NULL);
INSERT INTO `courses` VALUES (15, 'PHP for Beginners - Become a PHP Master - CMS Project', 'PHP for Beginners: learn everything you need to become a professional PHP developer with practical exercises & projects.', NULL, 11.99, 0, 1, 1, '2021-01-13 01:53:11', '2021-01-13 01:53:11', 2, 0, NULL);

-- ----------------------------
-- Table structure for coursesection
-- ----------------------------
DROP TABLE IF EXISTS `coursesection`;
CREATE TABLE `coursesection`  (
  `CourseSectionID` int NOT NULL AUTO_INCREMENT,
  `CourseID` int NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsPreview` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`CourseSectionID`) USING BTREE,
  UNIQUE INDEX `CourseSectionID_UNIQUE`(`CourseSectionID`) USING BTREE,
  INDEX `CourseSection_Course_FK_idx`(`CourseID`) USING BTREE,
  CONSTRAINT `CourseSection_Course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coursesection
-- ----------------------------
INSERT INTO `coursesection` VALUES (1, 1, 'Chapter 1: Introdution', 0);
INSERT INTO `coursesection` VALUES (2, 1, 'Chapter 2: HTML - CSS tutorial', 0);
INSERT INTO `coursesection` VALUES (3, 1, 'Chapter 3: Introduction to Javascript', 0);
INSERT INTO `coursesection` VALUES (4, 2, 'Chapter 1: Introduction', 0);
INSERT INTO `coursesection` VALUES (5, 3, 'All course', 0);
INSERT INTO `coursesection` VALUES (6, 4, 'Chapter 1: Introdution', 0);
INSERT INTO `coursesection` VALUES (7, 4, 'Chapter 2: Application ', 0);
INSERT INTO `coursesection` VALUES (8, 2, 'Chapter 2: A brief about Flutter ', 0);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `StuID` int NOT NULL,
  `CourseID` int NOT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `Rating` int NOT NULL,
  PRIMARY KEY (`FeedbackID`) USING BTREE,
  UNIQUE INDEX `FeedbackID_UNIQUE`(`FeedbackID`) USING BTREE,
  INDEX `Feedback_Course_FK_idx`(`CourseID`) USING BTREE,
  INDEX `Feedback_Student_FK_idx`(`StuID`) USING BTREE,
  CONSTRAINT `Feedback_Course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Feedback_Student_FK` FOREIGN KEY (`StuID`) REFERENCES `students` (`StuID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `CoursesID` int NOT NULL,
  `Price` float(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES (1, 2, 1, 1.40);
INSERT INTO `orderdetails` VALUES (2, 2, 7, 11.99);
INSERT INTO `orderdetails` VALUES (3, 2, 14, 11.99);
INSERT INTO `orderdetails` VALUES (4, 3, 6, 50.99);
INSERT INTO `orderdetails` VALUES (5, 3, 1, 1.40);
INSERT INTO `orderdetails` VALUES (6, 3, 3, 99.90);
INSERT INTO `orderdetails` VALUES (7, 3, 4, 12.90);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `OrderID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Total` bigint NOT NULL,
  PRIMARY KEY (`OrderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2021-01-13 15:33:04', '1', 25);
INSERT INTO `orders` VALUES (2, '2021-01-13 15:33:53', '1', 25);
INSERT INTO `orders` VALUES (3, '2021-01-13 15:47:34', '1', 165);

-- ----------------------------
-- Table structure for participant
-- ----------------------------
DROP TABLE IF EXISTS `participant`;
CREATE TABLE `participant`  (
  `StuID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`StuID`, `CourseID`) USING BTREE,
  INDEX `par_course_FK_idx`(`CourseID`) USING BTREE,
  CONSTRAINT `par_course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `par_student_FK` FOREIGN KEY (`StuID`) REFERENCES `students` (`StuID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of participant
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`session_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('-ByUmCRmF1E3D8o0RLQ4qhhRvvWnK-ha', 1610580074, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('-Ijb8mW_iyjVKOkMCwgC-maX86I7IBV0', 1610560073, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('-SjipEpoJZf6OBkGra5yFqinJw7ZzyhN', 1610592450, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('-bSTVYdphuolnZLjdEO0Tw7uTmXUtrO9', 1610565637, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('-oOd5CLzAru3ubnvExr1WZX-o5zYusc_', 1610553216, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('-svYencOglr3BRFys2ifp4xd28dwZeII', 1610575157, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('00UDYWx98rvazbX_4ijLv7KNGzrkyJuR', 1610562378, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('02u3XFsFiI4CznrCh6CIzwRFe7lGqyBJ', 1610591496, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('0_-XIVu5GWkiZ4EY5AkG2wfrCeDK5Q_U', 1610547247, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('0fk-1GX3dF4bO8NNwrbszOG2FCiFrI7J', 1610556008, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('0iH_qhQ5yC8jWaRleGP6eFZQHXTUSV_Y', 1610556060, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('0l5BNlvcOYKkk-EsLV8IccvJj6XDWlPi', 1610559703, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('0m5fCWfXtVY370GOmSp1OEUfdUvNQbGt', 1610574857, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('11TivXKLsGE0ImuhFG7X_yowshocagBI', 1610561179, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('1DPsycBvjIVXbcdJwQjr1YQ61icwWrE1', 1610577155, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('1is2MOPgd5Xln3Q25_IVFE8Xg9MCXAfZ', 1610548060, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('1uSFhqievDIrToT3O9kydORy8TXqrUFg', 1610563401, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2Ko-Zfz7wR5Hq8Kfs6tIstqTmVlQY7si', 1610541920, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2NRlD4xJd6N2F5s2SNOaqo1SOGAhMXuR', 1610550654, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2SRdtsJwB79hJzKdSmSG2qwLEhBkIkzM', 1610579918, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2TK-rdt1dQV8aDREo5YUUswb1bbHhDo1', 1610549928, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2ZSRZL4gLQVZCgX47IKAa2DI82g9rHjO', 1610580810, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2drgqBHrxQJXgSckUUqwKZaWAwTgHgYk', 1610562853, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2fKOP8jvnDC92L1Ur0n4M7WQcc7iu_z9', 1610547636, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2gob7uP7CdI-jo8y3I17leK-JmSfXb9y', 1610561178, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('2tYCkTpOoLkTb4R1b-qwgABNQg-A8h34', 1610562572, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('31p8jWiKp6XVWU_qDQToeJ2x3k5ljU9-', 1610547247, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('3Y_1M8uW8wxyw4r6UtX2Gv83NrsIrtW8', 1610563296, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('3bC08sW816TjCTJHC4960p-K1XtD__D1', 1610530283, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('3chRKIJingZFVL8wEDsZ0tMHcw2s68U9', 1610556557, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('3xUj0TcDy8jQxuGx896zTXRglhBnof8B', 1610614120, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"cart\":[],\"retUrl\":null,\"authUser\":{\"username\":\"hxk\",\"ID\":1,\"permission\":2}}');
INSERT INTO `sessions` VALUES ('4VvLsBzscvt0s1Z4DZnMjK3BwVB9cVHs', 1610577089, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('58iGBzFG9SpLfaqdhCguLmlMOJtBOfyD', 1610592641, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('5CN9BBqLOhApa0cspqJpR5TVyh_axMyV', 1610565376, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('5CzfJLoYGo50GD3o6xxLYkLQJAdqAGbe', 1610580417, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('5FzUU-3_S3Z_jFxFUMaYSu91uVMtua0L', 1610575147, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('5I4TAIa7G_v_OcDLu4MhZ3HAtc6_sE1q', 1610560468, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('5PIlFPRH2wB2y8GXZDutrbLyrN_tJ2b9', 1610553174, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('64lLX1W0Qa3n37ANB5yGmxojERTNrl5K', 1610542454, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('6FN6tL19a-hcbejXkxITtBtacCK_0lvC', 1610562658, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('6OSL637lWDg5Ae4URo5owcHIT0dxEEvy', 1610551879, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('6ZSUwHRx6IZRpJ056dL5s8A5FALeWnkr', 1610574799, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('6iT_qhJfDlZjGu3mt6TzwoQVVHLQhPoT', 1610574942, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('72p7sk7GSgIzIJ6SZAiIAim9exVa67Xn', 1610562005, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('77itJ2JdrwtRmhvI1S1WZ0hTxeGP1hVh', 1610605508, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"cart\":[],\"authUser\":{\"username\":\"hxk\",\"ID\":1,\"permission\":2}}');
INSERT INTO `sessions` VALUES ('7ZeiXOM7T1cXRHfmMh71bgb0G1wd-Tsm', 1610555079, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('7lOACvw2fIsSeLLgjEWBzOD3zV5gxm5d', 1610556057, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('7xJkk3xstP87K_6pEJUXVXjWchm2s-Hw', 1610548484, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('8EOUI37VkdXqIYQx0hg6R4lXJG6IAnP0', 1610580072, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('8QrTEum9wfSqOfQjSzOcxLG9bMrnQyXR', 1610551192, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('8UMiS9th1h9HZqPSDoTqff5u886eGUi1', 1610548025, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('8VH7HNZgVtikZefEXg2h9O__3iCwo5Cz', 1610560340, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('8gfJO0RYXA38GDbXZ3sJ52tp_mXrElxc', 1610575773, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('90wI0s2bcjHzrYk-1LIAVtmxweUcIgif', 1610578826, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('9RX7zoOAsDeXfmI2hc55PsF2UIiZrciQ', 1610565652, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('9jcxnjPrV8fEe4RsYS92blpYYLHsrT99', 1610553937, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('A1cUI4CZU8hRzT6bU0FR5Mgdsaw83eAM', 1610576206, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('AFQTw_y3fe3_2fVXQBnh-ridudmBzOwH', 1610549287, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('AMyF0DXzy93E5fRX6WVsxg2CiiEy_Gxt', 1610592450, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('AN5jU9lZEfZP3n9YLu1N3lKN8iSmPFpo', 1610553614, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('AljiFcZsjooFi0D2ml7JRbSEdpo-1lGb', 1610576059, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('AvLLC6Og0NzPBi7kNgTYadySA4--DmtB', 1610559855, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('B9Yv4i1ZFA-UYFrcZkzMSv4s5VtWT7Nu', 1610578330, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('BKWs-_hniDjD4fobQIWU2ZBTVzs2KYNe', 1610530793, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('BPjG7sPOfEpczemSRP3xFvjjLvJylCC_', 1610542650, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('C21NEFqQnOteVO9cQhia-7WtXzSQSYMh', 1610562792, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('C2UtyXloURneOw4NCK3pWH8Z8o41yKiP', 1610547637, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('C50CLjwC4Mb6MJxSe6NePfBG16WQV3ct', 1610561729, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('CCHmJrNEGM8r6Gl6X_jW14S2bNfsDS0R', 1610554945, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('CUPwIYmpysmHqOq4dc-DbvA6_mff0Pbs', 1610578824, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('CUiSAmtg5SwUcrUUe5_FGiN7p-lu5fAc', 1610560877, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Cgg3QVmRri_0pqXnFb4hNn_jJW4hdoVT', 1610547945, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('DK3yhLPTbK_9-sDH8aqQf2K13eqAXngp', 1610560278, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Dqk8ZjWrWB9ddOXntFBobtWklQslGbs-', 1610559963, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Dzzujks9Z37BrtNdUxXMQQgiRj7eluQ5', 1610553267, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('E7tmj_PrGYJkIdd6kjT-uK3hfo_f64iU', 1610592425, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('EDP4l7A0DH2JFQO8uyv5UnIViP1L6zO-', 1610561120, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ESg_DdjhwlSihXc47jEsWSH7grfrMPqC', 1610551833, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ET0ICg8OyCijyglieRNg9kD9taVHl8yq', 1610574799, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('EkWU3HCHWA3WEpY_a4Qa9PaiU5hvhej5', 1610578484, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('FH9TbM9XggJSXzV0DcLrILSn5cPanEaY', 1610554712, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('FN20GzTBBCxtegSyYUw2qMzooxbkPxjE', 1610610832, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"cart\":[{\"id\":0},{\"id\":2},{\"id\":2},{\"id\":2},{\"id\":2},{\"id\":2},{\"id\":2},{\"id\":1},{\"id\":1}],\"authUser\":{\"username\":\"hxk\",\"ID\":1,\"permission\":2},\"retUrl\":null}');
INSERT INTO `sessions` VALUES ('FPrFpIzsAd1Wb312izImnWhIdZjrJODW', 1610544129, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('FZRKUqwasuHZM_PFcPDMhCXzWGmTCcnm', 1610547170, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('FdS6oncgAL8bhgm78s8Z4VOXpzn7QnLE', 1610580389, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('FoaeppRPV0E9TiO76mVGClT9__4vCjeq', 1610576888, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('FxlNmUv9NzmsPQW8IlYYgiYgllFb9Ael', 1610551195, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('FzzOx3vk_hHhJGlmUQpJOWVw_5U2kXnZ', 1610556360, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('G2k6XmSmNBTyftXFwvtzVjWuaKIVGz73', 1610550460, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('G3GyxXAwjLwCw3mDQhDeMuzV-2n0ub1O', 1610580252, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('GN6J8kNRwjRFHUEPIcHljXlXsPLfArvL', 1610550650, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('GQtMiQzP_ZwmRVtTSIFuCvHarEkGTVzj', 1610562302, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('GVrh2RyApse2xGRxYnG_V_V58dQ-sieM', 1610577167, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('GkqAQzInSV7lpGLEC6ZEzQvDUW0mDVhm', 1610551081, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('GmWWo7j5rTHazt8KzdF0zk5cHXNOzZkY', 1610530881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('HFE1xnj9S3T8a1PFQfBUNbktqrlH8ZkP', 1610591692, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('HNc7FMFcKhIKErl3FWMPiX8gqMgwdHli', 1610565392, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('H_IQgZ1kAz3RTlRfnbLAYRq1pCpSXURa', 1610592164, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('HgC06S_a9n7JYiQ6S0vUZEjeoRNk2NMv', 1610560248, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('HnNcc8jWyJctlEBI_FrvzV0xNgNdxtuX', 1610530259, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('I8rvO82varVqACzRmNzKTGjJqobHOXWJ', 1610530881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('IKg687J657aOqvy-J6y4aVAbNhS5UzUp', 1610591488, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('IlKOspOG9J4K-YKT6lrAAesIig_QqY77', 1610556513, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('J94HRVvKnGcxOsAgdH5zWX0vsPJyoVIK', 1610555042, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('JWAoIbaSy7sddb1Q4l0v8jYzwkzH0wSp', 1610576297, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('J_FdGteB-T70vVrR6iG-Z1Jrnv4HRLTx', 1610574752, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Jc0Lrvf_AZjnQmbalzVzRnW5ZJvbeFSL', 1610563062, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('K-6jla0Cxa5gxs46Vyg2kXdD_6d9wbLr', 1610580074, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('KBHOPzgFIZo2KsC9jSl2o_EzazrbfEAK', 1610556121, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('KDc_U1BUv_e90zpMGCqYUONmTYL4SXaL', 1610561729, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('KUbXeuHfpv8SCYQt9B32D5ouNX5NYd-p', 1610577889, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('LA4-VDkv51cuDo2CxkYNluwLbegN5UQX', 1610530793, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('LEGxtS99SQ5yICwle479MDp1ad2nthbn', 1610546587, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Lgx_UA7-zVv1GFyJ9Hg9MEdbej3xOUs8', 1610576260, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Lvhu1ICq4TWqYaNm-GYU3heuWAtrODH4', 1610530259, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('MC6I3V7NTEz1XgJ6ZlbD1HBG5LUuMwcm', 1610560168, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('MD9IXGePh32hw8qfmaLDFZ9fNF6WBsfl', 1610575740, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('McfpP9nDFGeSRdkCbAzldPXQ0l0_VCnS', 1610575090, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('NJ_WavUPF2xv_tIXQmeIin7ZDAjkcryK', 1610591692, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('NZC0p_bDkgaGlLttp1QTu89S0X6ctFCG', 1610561239, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('NgD-6mfTTdbSNhRdOrSKzawuKt2CkRW3', 1610580429, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('NlRyibMDPI3H6u9DcNeO33MDUYP-CuvO', 1610549500, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('NmxNHyESfh2ujQ_MKHnQlzJWAin4LC1k', 1610578808, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('O5K76V-wxFJswihenPKbYMsjZJ4VpEhH', 1610561226, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('OGP9mNNLeBrKjUKLaEFYlms9AOYSSqgt', 1610544129, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ObUdR2IjzV_8-Nq44hNtBFaM8mwZfCgJ', 1610559963, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('PPEeIcnI2PdwupXkXXQw8OOnGSmj5iOs', 1610562519, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('PSAwlesKhNkO-r_wuaw0YzwjikWTlJa_', 1610580032, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('PbIfynV1n97_mxt0LFlr1-X-xGQuCVpd', 1610577027, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('PkRK_7HpWEuisMZOLTx9Z7bukuzlck2n', 1610560073, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('QI3l-RKfetm3GNorLw1RmxfSlzdxU55Q', 1610530771, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('QJ4Fnl5guncdLkEgAeYls0olY3cZZpw2', 1610547512, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('QZF5Cj3W0T5x0VDniTblP04ziHaowl4J', 1610552930, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Qq5VMo-V4ncGcinRPEnAVl-dBiOicnV_', 1610547751, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('R6tAfcxf-ULk2isUrzj0czsqMNv2N2-T', 1610577692, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('R82ATQGq0DiV6MvuoQpPoHT6Huf0YdBh', 1610580805, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('R8qIEiOlAcadipEx25g_WATvoLs_yH24', 1610560467, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('RVcMCgp9a4b-M08uVHu4HQ9A5ffDvqLI', 1610578273, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('RcFMH2Y2q1jm9gYyz2GIZ-dgZMcFQp8l', 1610554129, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('RnBMYECfxeT0jlH4IcccRzQVjbf_Z5_I', 1610577589, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('RzmdJ-iqH86f4umTRiOOXv5yZ6zKG0Eo', 1610560976, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('S-l4r6LvBUIiiBcugFxb46sxLy6WjDKy', 1610561855, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('S14qJjmPln4nbiafYXe_W7XONmcTH86T', 1610564529, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('SNdziNl77BSzZ65L4_F5MPMSUPbiYXf2', 1610565551, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('SUGfC0rwGRjrnqoljltEYP4BR9cKORYd', 1610574650, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Slt8o66ZSai1P5CLBQwtQR7Ulrxmv2l2', 1610554730, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('StD3hYH4rWpKhzFdCboK5X4gtDwuS4zl', 1610576236, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('T3Fq77nWFxtMPzcaIXmgh-K-T1bfpA93', 1610549503, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('TOqC_0f8nQEHs4DtodEzvjXLv-gr6Q_u', 1610575618, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('TPs3tXTCytM70kOR9n7UosnMval-Mu1J', 1610575126, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('TW7cp22RXFh0VW8ayrOy3fxZVdqrF__s', 1610576610, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Td8w7Feh0JtdFLG_8j6WW48TU-UeGkN8', 1610592102, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('TucEJpi2rL77ek6IuS_zk7kQb7GuWYbx', 1610563080, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('TuvjcY9oiI20wLKUf_A_JGI1ToLt6_wC', 1610565551, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('UFaouw1M0uWncFkkRZuiwzmFEi6FL0Ix', 1610555045, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('UktR--2TFGPRzdkgSfmTqkxiX15pFbAe', 1610578821, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Ux-JNBBFKDXZXC-W9I9maHWEkGnNloor', 1610555375, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('V6t7WRSVBiMWk9cY2PDzorTqLSh9i4sY', 1610542650, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('V94xQKBM5E3Ol6K5j94eAkK6uOZoK_gu', 1610551750, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('VIeuJnk4sVOmJbDlfqMIciWfn3hjYPeZ', 1610554130, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('VSrCkm7TYCy6ls1PTLbJjVslScUS8uiu', 1610580157, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('VTyk1BQwi2bzVX0zcMssXRIfK0EX5V-t', 1610576968, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Vf74WinRewU1swKlQd7FEw_ym_lPIEzf', 1610575301, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('VzZUEg1pfVyisgSRKyyT7MxwcU3UVafQ', 1610600782, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('WDr9XmZmDIhjg7XJOVmAaoFwfFUkZ3J5', 1610530284, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('WU_WpLMrR8WVzCrX0xRja4s_liykle_V', 1610547808, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('WY0cuLHQNoMbPQ4RkrRl1jg-QOO-H9tY', 1610553941, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('XCZws2R0cWgYQK9OTFOXxU0HL6Vvs3jq', 1610564399, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('XGNPuNEw4mCu13lP7NOeAPM7Tm_qORXh', 1610562923, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('XK02ZeH47U1jLa_S7TkN4Xw_h3WHJ1B7', 1610560073, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('XR8Kaoq9ZZksVWdzmoRfD3EYr_G4fV_M', 1610525981, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('XUnjIKOBVV_0qj8LFfsRDVTvna6U1XNi', 1610547809, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Xb_txJgq-WtXXy0paWB2oIi1-g0MpnQ5', 1610561256, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Xg-N0lqy34IUcQvi-Fe0o3gzLxFuMJ6p', 1610569953, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('XpMzIQxKrQyhaq33Icv60ptduxZYTS-i', 1610578805, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('XtpKuu_8NTuMEmgh1G8A9atc-lbi97t5', 1610560976, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Y9R2eYbKXm5ECj52iS0mFl3hnjotfF3J', 1610553334, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Y9zF5ZgQA-imUiUh4QVZT_tV5ador5dc', 1610549076, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('YJEgJnnxd7etWjzJz4CM7QwThw4cGWe9', 1610548060, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('YKD0oSyMBtXVQyuBsUigQ1DnW98GSSwD', 1610544189, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('YQwFsmjd00m0ofjEnx1XHEjocpFSKcDF', 1610542454, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Yd2mXkhJR67VseR2-3kN9VyLyLtC4ji2', 1610578862, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Yltm7SNZBPBO1xSGVNLaF5KbsYzTj8xf', 1610575789, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Yw65Uz-w5z5Ht2lYnd2gcJ2SdIRgdueR', 1610530155, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Z0pxkCTk0dI8-YtMu1g9_639Xk5cG_Qb', 1610561120, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('Z9wiLmZ7GGj_v9Jr1KkrJ0zXLVFlEz1a', 1610580157, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ZB8-04RYRLpvUtuE-co88IXUNQJI_Pf1', 1610530467, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ZpkWAxCDflvj_J5_qhOPMyPYU4t878iY', 1610550465, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('_6v4oyHDmJGYK-ILWGuZmVSdG8voYJGW', 1610592156, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('_H6Wh8hRKIDENxIWNnd_HuWd3P9EL_FF', 1610580252, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('_Rtqnpydst05MNpKggPNAk1liJPOzanm', 1610576582, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('_SxyqXo83N31B_DmkXerRmrFkZP1pQKj', 1610591810, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('aHZZcUY3Xe8zuR5cLT4iKaWubyT7Fzff', 1610580810, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('aI3zcrpm-vJB7HplePwx5ZREOZNfoT8_', 1610576733, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('aNLAcwdW2_7WDtUKwa5wuF7v1jP72ueN', 1610547945, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('aWKQwxv4j2UxDQ74rfGRabgVvtEeZSsf', 1610556557, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('aZCU_AMr03PAXjebIwj_Vuo91ybAovt6', 1610562259, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('b12gZj1xovRc2-gBI9xTAT_2gA1AiKBU', 1610566561, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('b3To_TGW1L3swBxH61Af_bL0vBAh_d_g', 1610578816, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('bBSaMLAOtqUBd6WOjRwzkOwuuu8hvX35', 1610556588, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('bEtzmpiFKupT6hwulRvFmKXXFEyE6bbv', 1610530154, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('bLzcZkbAm7cl4DqiwSRTm6QOYYZ7IeEW', 1610578142, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('bTmNP7B0_aylFJZOZNAFiKQZuFeMdsFp', 1610556121, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('bVYFd7P2qzKWpZpOIiOO7DXadBHqgHCm', 1610580066, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('baBzAbXl26g-D0-IG-z2QA18n9onliZN', 1610549929, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('c4X0mB7amNkz-pwH1qMdRGosDaidnCSI', 1610556594, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('cai0Gg1BVHym3VWolLOf1mLWQWngTJM8', 1610549504, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('cmqWJz2Cwgklb_z_YyPZuiKqz8rPMGIM', 1610579643, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('co5xI4vqVNlmzeEmcdc4WlkbrBRWgTVE', 1610576774, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('czgqfsVYVd39ai2aer6TZfYtaQdfZKdM', 1610530467, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('dUWtcl067KDlkZPvvOFVNZG_Mp5W31Pw', 1610564399, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('dXoZ5qxMXY34oecbAHG_L2V8fMCcQJYh', 1610550447, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('dfe61eqO1p6xNRqkDASiqqQ07YgXRyCB', 1610577742, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('dj-kztvf4K_XtafjCJop3rMUT3s1yyG6', 1610575111, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('dmFDTIRH0o63SCnvaLLlgbkFzmm46CER', 1610553668, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('dntfBGdlZH2R4MmATcAHk8gLq3q3VoI8', 1610590269, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('dx3HWExY1bSnz1mQBWr-aKwT93XJiexJ', 1610549870, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('e0xCT6lQfAlqb4uusSDURZeY-oSpSyl6', 1610560278, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('e3J2yBKHtY7oudI3yNZTsT89rwWlmXzE', 1610592434, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('e3iH5BzntPBP17FS2KQh6ZOT_eLM8S9O', 1610547512, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('eHVUEnbJHgq_sjDV5oIUV2X-XmyYIwZY', 1610591686, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ekVPfnRi24qOg8lQm5oIOv5ShqOxRh_P', 1610589910, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('fRKFSmoflHwJuZk3NkGZfo8wQRu7rFko', 1610580249, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('g39Qw5wyx4VzWSVz1WzOHHm9xBFXOA1r', 1610590284, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('g8K5qGDbWY9x553Y5_kLxVgkLQ1ejExA', 1610577344, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('gD7z3wwZ63O_yyx7OwuPzsK1k1T_zi3l', 1610553609, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('gSZsmtwBhZEPCuOA_M0PXLUnfqF8JC4_', 1610579918, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('gTjb716ZAW9lE0Pm4qS0IVJwkBBvDeqY', 1610530771, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('g_Dfp8cy3wiXslmeBhEZA0-AsETQFl6Z', 1610553269, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('gilyzcvCaS8s5t6PTgKfILJn96RkaISN', 1610554941, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('gvTjQ0bjhSFUcrAfIEUu1yNsEUEyAPNw', 1610553177, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('h6nWyCJf0Fu-U0DlKF4jQVDrONgSCf9D', 1610562613, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('hMqmjfA9gDpOWX_2w17pHoLt5JFiYO3E', 1610560340, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('hVzPSNS0PUdmMIdztv680tFn1JAHVGLo', 1610553296, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('hdNIqySOTvzqe9BTASXhZS0HJFsjlRgU', 1610592635, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('hqGquzzU8wYj3RIqmk-x_0gJsmUv7Nxk', 1610580029, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ihhCLCOnwShqSInDcajx2Lm1OVW7Q3Hq', 1610577066, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('iiQsL0eyytWWTs01ZBzWqZbuQvSE8ALP', 1610541920, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ixvDu3QJYAXFvL3rzTODo4KldHte96X9', 1610548484, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('jdkQX_3WOQbxCzbuQQ_FVqkgfja0Y2_w', 1610556007, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('jfUI-OB-CaNPHiseh8wdSlXBk5bibb6c', 1610551833, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('jh9mFodRAMGCiiu8Zy58IV1O0dxoWYB5', 1610554727, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('jqbi-qTR02NX-IQNE5eEnVy1fDSwwF0H', 1610553670, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('k7JWsiCC1PTCm9vMbimvk7dwhBcu--a9', 1610580152, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('kAY4rZIZ_MThaF2Af9qQPzm2Mt19r1D-', 1610562676, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('kEM7TRshv3-dpztlFDsQKGgWfuCi2GzZ', 1610547563, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('kKlzoD1dXLLSeu1dAw-owDcFLwAO7nj3', 1610543051, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('kL-vAFT0i4cKyUfFkHmGaZkmvvdI3gxh', 1610544188, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('kTiwSBI6SG0IpvwcqHgHidQ3Oe83ZMnb', 1610552926, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ki2csUSTVO51jT-H8FBW92fJRHleJN_m', 1610591805, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('lSdpSkobStVp85LI6tx-m8dxhO-cSSUJ', 1610553299, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('lmUNaYwwKUqDfFSyH55Ot9btwsxD9-IO', 1610578818, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('mc5lZ169IoeQJDdJiNeDtY0S2JWGUtL1', 1610574650, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('mp-bggocP_PphvyO-Tke2B8I7XQsWMBe', 1610542425, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('nKmSKDda4KmQrsSEgUamI9TgxGyBbhUc', 1610561256, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('nU1KJpGsjcnc-w1z2aluo-3wN9DoGZKp', 1610549076, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ncfHghvMi9iIpvOXWUitikJCirs1RIgL', 1610560168, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('njkjR7RsQFMbV8kFOTsdM4AeRFNvkZXW', 1610547750, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ntNknSTkCWANLqUYsD7jq0fX9ZfbZ1-n', 1610577540, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('o4DXVADLIJyMZhJbnD7ANReMHp5CYDyJ', 1610555082, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('oEvHELixY4zwGImw7LuhYwcczCg8G1iu', 1610592095, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('oPUg7l1luKjsw2tbd-IQRCoQC9tUc2aX', 1610561809, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('og_BeSIBCODGUU_AOm08rol6_PqHn453', 1610576635, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('osVslYOBEzit1lT3zygDFmlE1ACFxojS', 1610577944, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('oszEP6WSsOar1kpDTnVjkRJLWN9eSW5G', 1610576412, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('oxstYQ-LcUj-H4LmdB6Vl8K7U65lxgHw', 1610555371, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('pCKH4NxDlkew_LKFakIH61M4LtDZclcR', 1610549228, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('pM5xPJblqWwbOWaEDrrjLhrBCufE8A9j', 1610592016, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('pY00fMRNto1yWC9QfH8pV0qGUMV8O05H', 1610553213, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('plFSzGff91sdVD6ZQkeJGqSY6fHA9FCd', 1610549286, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('q8qu1Cz3l1lvokOkVYqQLyW93kcOdWLh', 1610575756, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('qIJcnMfZg5E0PdzPdw0vVUaETg_K2j8n', 1610580437, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('qZjZG5gzXYc9atzKOS1Pm-PDGWEyDTlh', 1610576596, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('qg5GDnu7hQ6VzT-7hrNER8GwqziNpoON', 1610580032, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('qku77E8b_VcC4j0G8BOO5IRceh6Bww73', 1610580437, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('r0XKkDh0qtm5QwA8P9xDOGn7CHt9h47L', 1610560877, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('rIuE_FqZnc9DpUzWx_C5aR_l-d38SZyf', 1610543052, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('sdWzsHyKytMEDtYLFVhwmwUxlLSYBqZx', 1610563080, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('sjDcT67b4llGMBSEoAN34nzs2iY2gd_-', 1610550196, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('tKf17NbeYBXp-FKVTBdR9eLjnBlRqO7o', 1610547562, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('tYAIawSpfFzx8RRaB-cbzKzs0eZ6LluP', 1610560819, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('tyF7AmgaFV0NbA76i_3yBdn7g59zBI12', 1610575608, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('uHCwkBtc2bPfRq43cucrQ9vLyHleGrKq', 1610579649, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('uqfM7yuiQxZFGdUMTNjaAcZ4bU78k4OL', 1610575077, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('vAzX14j7mV5aobtnSueF3Q_Hm----r7y', 1610579649, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('vGNqfxytOWAg1t9XhkcymTUQkoGRJLS7', 1610560248, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('vMug3u7e8VaHDsDNQABOSNXsWmnRuPuQ', 1610592640, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('vj3kOcc2xkkaq22McJqTDVrQFjhw7RtC', 1610577168, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('vkFzZk7DDv_PA-QOQRJdvvWGBtY5P4Iw', 1610578250, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('w80tSfEdr95Jov6fG2_GJPmU-PV3XnEU', 1610561809, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('w8Te_1ydO8btHNck5lFT_PR-Nc0pXy_t', 1610578862, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('wKsoWKAJ0v-PPKg3Sox9fyc2hbISxLoc', 1610551746, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('wPuTWCc9lVhvckuvVFL1ycTfiOAQ-X4J', 1610561957, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('wW_eSie5cD0kFjB-AzYDpN-bQhep0yGU', 1610559687, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('wffpqsbP6ltPKAErl4FUmGicn2M5st91', 1610551078, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('wlciksMu7ie8vyBx79b_GlR0HWqHCPta', 1610553337, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('xF6YM97yTWaB199voK_z7gbO9Bi_mvaw', 1610551876, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('xK54_26lzcmyVUGtgK9HLSCZ-PQMCLxo', 1610525981, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('xgcxFroRjTCwZkzycRYZkcd0ENq6sH1F', 1610565376, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('xhbRwGm6yqNgt0Mi5aqM9XLooGfSy7ub', 1610577172, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('yFphac17VJpQVT2y1IUvbG27d2Ytp1fa', 1610574752, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('yNTlNFPZlnamxTTEqpn-S1vgrkh0SWaL', 1610550192, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('yWAhsvrlLJeUWhubrk-LjkmbwbtWxCSh', 1610562425, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('ydRzUZ3aHtcABS-EfPnTV8gVa6NzfYny', 1610549228, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
INSERT INTO `sessions` VALUES ('z2_BbAhTA4BK3sn-iqMTVKX0L3vgyGh3', 1610561846, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, 'BÙI TẠ ĐỨC TUẤN', '2000-06-15', 'tuanduc1506@gmail.com', 1, 'St1');

-- ----------------------------
-- Table structure for subcategories
-- ----------------------------
DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE `subcategories`  (
  `SubCategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`SubCategoryID`) USING BTREE,
  INDEX `subcategories_categories_FK_idx`(`CategoryID`) USING BTREE,
  CONSTRAINT `subcategories_categories_FK` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subcategories
-- ----------------------------
INSERT INTO `subcategories` VALUES (1, 'Web Development', 1);
INSERT INTO `subcategories` VALUES (2, 'Mobile Developer', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES (1, 'Hoàng Xuân Kiệt', '2020-12-27', '', 1, 'Tea1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Ctun1506', '$2a$12$91UCUaFZ9s84YzPZqgyKfeBYgt340tSMutnuIKLC9c6NNPWZ6vd.S', 1, 'St1');
INSERT INTO `users` VALUES (2, 'hxk', '$2a$12$ia.Ebyvvm1CeoaumVByHM.IvjmY7b3T8yMV0baMuWP9ddZyLPQWxC', 2, 'Tea1');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `VideoId` int NOT NULL AUTO_INCREMENT,
  `CourseSectionID` int NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`VideoId`) USING BTREE,
  INDEX `Video_CourseSection_FK_idx`(`CourseSectionID`) USING BTREE,
  CONSTRAINT `Video_CourseSection_FK` FOREIGN KEY (`CourseSectionID`) REFERENCES `coursesection` (`CourseSectionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, 1, 'Introduction to Web Development');
INSERT INTO `video` VALUES (2, 2, 'Building Your First Website | Learn HTML');
INSERT INTO `video` VALUES (3, 2, 'Intro to HTML, HEAD, BODY, and HEADER ');
INSERT INTO `video` VALUES (4, 2, ' Lists, Paragraphs, and Text Styling');
INSERT INTO `video` VALUES (5, 2, '6. Displaying Data With Table ');
INSERT INTO `video` VALUES (6, 2, '7.Learn HTML Forms, Img and Iframe Tags ');
INSERT INTO `video` VALUES (7, 2, '8. Working with CSS images and box shadows ');
INSERT INTO `video` VALUES (8, 3, '1. Introduction to JavaScript Tutorial For Beginners');
INSERT INTO `video` VALUES (9, 4, 'Building a Multi-Page Application with Dart\'s Flutter Mobile Framework');
INSERT INTO `video` VALUES (10, 4, 'Making Http requests and Using Json in Dart\'s Flutter Framework');
INSERT INTO `video` VALUES (11, 5, 'React Tutorial for Beginners');
INSERT INTO `video` VALUES (12, 6, 'The Complete iOS 13 App Development Course');
INSERT INTO `video` VALUES (13, 7, 'How Does an App Work?');
INSERT INTO `video` VALUES (14, 7, 'How Does an App Work?');

-- ----------------------------
-- Table structure for watchlist
-- ----------------------------
DROP TABLE IF EXISTS `watchlist`;
CREATE TABLE `watchlist`  (
  `StuID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`StuID`, `CourseID`) USING BTREE,
  INDEX `watchlist_course_FK_idx`(`CourseID`) USING BTREE,
  CONSTRAINT `watchlist_course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `watchlist_student_FK` FOREIGN KEY (`StuID`) REFERENCES `students` (`StuID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of watchlist
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
