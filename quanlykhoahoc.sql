-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlykhoahoc
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `UID` varchar(10) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'IT');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `CouponID` int NOT NULL AUTO_INCREMENT,
  `NewPrice` float NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`CouponID`),
  KEY `Promotion_Course_FK_idx` (`CourseID`),
  CONSTRAINT `Promotion_Course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CoursesID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `TinyDes` text,
  `FullDes` text,
  `Price` float NOT NULL DEFAULT '0',
  `IsFinished` tinyint NOT NULL DEFAULT '0',
  `TeaID` int NOT NULL,
  `SubCategoryID` int NOT NULL,
  `LastUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CoursesID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `TedID_idx` (`TeaID`),
  KEY `Course_SubCategory_FK_idx` (`SubCategoryID`),
  CONSTRAINT `Course_SubCategory_FK` FOREIGN KEY (`SubCategoryID`) REFERENCES `subcategories` (`SubCategoryID`),
  CONSTRAINT `TedID` FOREIGN KEY (`TeaID`) REFERENCES `teachers` (`TeaID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Full Stack Web Development ','Welcome to Introduction of Full Stack Web Development Tutorial Course, with this course you will learn how to be a Full Stack Web Developer from scratch.   Full-stack web development Tutorial Course with HTML, CSS, Bootstrap 4, ES6 React and Node is the Ultimate web development course designed for your one-stop-shop front-end and back-end learning using #MERN.','<p>This <span style=\"color: #3598db;\"><strong>#fullstackwebdevelopment </strong></span>tutorial course will take us from beginner level developer to an expert level full stack developer.</p>\r\n<p>It includes a tutorial on:&nbsp;</p>\r\n<p>1. <span style=\"color: #3598db;\"><strong>#WebDevelopment,&nbsp;</strong></span></p>\r\n<p>2. React Js,</p>\r\n<p>3. NodeJS,</p>\r\n<p>4. ExpressJS, and&nbsp;</p>\r\n<p>5. MongoDB.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Let\'s begin.</p>\r\n<p>&nbsp;</p>\r\n<p>This video is an overview of what we will be learning in this course.&nbsp; This course teaches us from the very basic fundamental level to the very end.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>A) It starts with HTML and how to work with elements and tags and use them on the website accordingly.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>B) Next comes the styling part with CSS, its concepts, how it works and what it does. At the end of HTML and CSS, we will be able to make static websites on our own.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>C) To add functionalities to our websites we will be learning Javascript next. Next, we will be learning version control using Git.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>D) The next part of the course will be about Bootstrap and how to use its classes and make responsive websites using bootstrap row and column properties.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>E) Lastly, we will be entering into backend using node, MongoDB and finally learning a very powerful frontend framework, React.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>F) We will be learning to work with databases and will be developing APIs of our own.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash; Do subscribe and hit Bell Icon &mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</p>\r\n<p>&nbsp;</p>\r\n<p>Follow us in social media handles for opportunities and code related queries.</p>\r\n<p>&nbsp;</p>\r\n<p>GitHub : https://github.com/wbweb</p>\r\n<p>Instagram: https://www.instagram.com/wb.web/</p>\r\n<p>Facebook: https://www.facebook.com/wbweb/</p>\r\n<p>Twitter: https://twitter.com/wbweb_in/</p>\r\n<p>LinkedIn: https://www.linkedin.com/company/wbweb/</p>\r\n<p>&nbsp;</p>\r\n<p>&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</p>\r\n<p>&nbsp;</p>\r\n<p>Source code repository: https://github.com/WBWeb/FullStackWeb...</p>\r\n<p>&nbsp;</p>\r\n<p>&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;</p>\r\n<p>&nbsp;</p>\r\n<p>Got a question on the topic? Please share it in the comment section below and our experts will answer it for you.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>For more information, please write back to us at hi@wbweb.co.in or call us at IND: 7077568998</p>\r\n<p>&nbsp;</p>\r\n<p>After completing the course, write to biswabijaya@wbweb.co.in for an internship or freelancing opportunities.</p>\r\n<p>&nbsp;</p>\r\n<p>For consultation or partnership, related queries drop a mail to hi@wbweb.co.in.</p>',1.4,0,1,1,'2021-01-09 02:35:33'),(2,'Flutter Tutorials','In this tutorial, we build a simple mult-paged flutter application using the native flutter router.  We also look at some of the tooling offered through Intellij and third party sources.','<p>&nbsp;</p>\r\n<p><span style=\"background-color: #ecf0f1; color: #000000;\"><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Flutter studio: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=http%3A%2F%2Fmutisya.com%2F&amp;redir_token=QUFFLUhqbU53aXhqY1llaHFvdjhGbEFVdUdESmRKUTUwd3xBQ3Jtc0tsR2l6d2dKZW13bGxjbDJfS09TZmp3SFpQQmIwcW13UFNwM0pxOHA4ZjctR2plTWxVLWZLcUFVRGxXR1NtenFnZzdSMXM0dDJ6NE5UTkJEczc5WnM0c01ZV2ktM0RDa20zTU5FZVY5WmhoSkc2cGtEOA%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">http://mutisya.com/</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Information on Dart 2.0 and Flutter 2.0: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Fgithub.com%2Fflutter%2Fflutter%2Fwiki%2FTrying-the-preview-of-Dart-2-in-Flutter&amp;redir_token=QUFFLUhqbDZMOXdEaWZaWVd5N3NPbUdQYmdlaGhqaUxaQXxBQ3Jtc0tuZE5kZHdubmd6LUVIUEdRLVV1WHhNbTFWNmV1T21ZX1BhU2xkcmtmZGlMbV9Cbk0xNmNzd3FxcldKcmpSVHZwNkNfeGs0ZG9rdHlQMnNiNXpmMmtjdV9RMjRORzd1ODByeTNrR2dsOGh4YkJ4M29ITQ%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://github.com/flutter/flutter/wi...</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Source Code: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Fgithub.com%2Ftensor-programming%2Fdart_flutter_multi_page_app&amp;redir_token=QUFFLUhqbjhJWjR5c0Zoc3NBTmRETWR3aDU2YmxIVjQwUXxBQ3Jtc0trN1d4a2tvcGM2QnRHR05zc0lYOGQ2aVdueFJvN0xTNGl0NEdJekU2SWt4Rm9WSjFPdzNSVy1tb1ExemdWb0wwOFRJSEwxTHZkT2ZrdVQwNUR0YnRTR3EyMVpJdHhmaUtZTVJCU2hkSkhiQUdxQ1NFRQ%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://github.com/tensor-programming...</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Feel free to donate: BTC: 1ExBSiaEa3pceW98eptJwzR9QHrYZ71Xit ETH: 0xD210Ea51F1615794A16080A108d2BC5471F60166 ADA: DdzFFzCqrhsqPcLbpt3C9nkSW2HvMJJCER5c9ijxKwXDet3GT5KchnUp458zN9uVmCzRjzwyy8usFUEhwBQ63h2ZjvyAXHYnHRG8MZpv Check out our Blog: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=http%3A%2F%2Fwww.tensor-programming.com%2F&amp;redir_token=QUFFLUhqa1lCMGhLVmUtNFZDT3JJNmpWSnJwT1EtZmpFd3xBQ3Jtc0tsYUFUQWVHOTh4UHZSbHQyM05lTkMzdE1fYktTUnl6czJmZkpkN045RVltQUllbWlkVlNOWFIwUEdYNjM2U1pFRXlUT0tFOWFuNlZFeW53V19tVnN5MVBZbWlfMWZNeWN2THA5N21NSXh5M2JVZXhTbw%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">http://www.tensor-programming.com/</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Check out our Twitter: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Ftwitter.com%2FTensorProgram&amp;redir_token=QUFFLUhqbUtMUWxXN0cwSkRtSldlVXFXcWk2cUoxWW4xd3xBQ3Jtc0tudHBza1ZxRHBad3pqeVNzcXBhRGViX2hjNXBBTkxWODFOQXdDNWd3RlRnaFNWdUxFUGh0Uy1ZWlhJVWNIWUFLa09MWWFDdkZndy15eFNTU3hwbnNLM0RNdHVBcVNvWUppWjQ3ZG8ySGJQTVd0ZzRWUQ%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://twitter.com/TensorProgram</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Check out our Facebook: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Fwww.facebook.com%2FTensor-Programming-1197847143611799%2F&amp;redir_token=QUFFLUhqbFJNa0x3MU9MTHUtZXNUMWFNSmRoWElGc2hSUXxBQ3Jtc0ttSVhtRFJkVW1FbUd5LUpYVzVzNU1MaHhuOFZha1pTZ1NPSkwtUDdyRUNCRmF1TlVsX3RZNHFMaEZYS0RGeUhXZWFIelV4LXdfY0R2STl4bURvZEc2aUNfc0xWRkczWnY2LWRzWjVsbmdaRGhSdndDWQ%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://www.facebook.com/Tensor-Progr...</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\" style=\"margin: 0px; padding: 0px; border: 0px; background: #ecf0f1; font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\"> Check out our Steemit: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" style=\"display: var(--yt-endpoint-display, inline-block); cursor: pointer; text-decoration: var(--yt-endpoint-text-regular-decoration, none); font-family: Roboto, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ecf0f1; color: #000000;\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?q=https%3A%2F%2Fsteemit.com%2F%40tensor&amp;redir_token=QUFFLUhqbERLVkFYdmVGNHRfbk1FS1diS2JqLWV5VTFwQXxBQ3Jtc0tuOWRwdnRKTTFaNXFHbmFJcDdrZXZpU3c5eDltaF9KUzNYYmx0ZDhpNWhHdk8tSm4yZ3BkYVduVDFRakFPakx6aVhSLVF4VmFvbElRNnQwQkpsTFoxOTFiczBEdlY4eGhhemx4Uk1kQjY3STlHa1F4Zw%3D%3D&amp;v=b2fgMCeSNpY&amp;event=video_description\" target=\"_blank\" rel=\"nofollow noopener\">https://steemit.com/@tensor</a></span></p>',99.2,0,1,2,'2021-01-09 02:48:50'),(3,'React js all in one','React Tutorial - Learn to build fast web apps with React (React js) from scratch.','<p>One shot video will help you to understand the foundation of React<br /><span style=\"font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Fira Sans\', \'Droid Sans\', \'Helvetica Neue\', sans-serif; font-size: 17px;\">We will build a small game during this tutorial.&nbsp;</span><span style=\"margin: 0px; padding: 0px; box-sizing: inherit; font-weight: bolder; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Fira Sans\', \'Droid Sans\', \'Helvetica Neue\', sans-serif; font-size: 17px;\">You might be tempted to skip it because you&rsquo;re not building games &mdash; but give it a chance.</span><span style=\"font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Fira Sans\', \'Droid Sans\', \'Helvetica Neue\', sans-serif; font-size: 17px;\">&nbsp;The techniques you&rsquo;ll learn in the tutorial are fundamental to building any React app, and mastering it will give you a deep understanding of React.</span></p>',99.9,1,1,1,'2021-01-09 07:55:08'),(4,'iOS 13 App Development','From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!','<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">Welcome to the&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Complete iOS App Development Bootcamp</strong>. With over 39,000 5 star ratings and a 4.8 average my iOS course is the HIGHEST RATED iOS Course in the history of Udemy!</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">At 55+ hours, this iOS 13 course is the&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">most comprehensive</strong>&nbsp;iOS development course online!</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">This Swift 5.1 course is based on our<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;in-person</strong>&nbsp;app development bootcamp in London, where we\'ve perfected the curriculum over 4 years of in-person teaching.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">Our complete app development bootcamp teaches you how to code using Swift 5.1 and build&nbsp;<em style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">beautiful</em>&nbsp;iOS 13 apps for iPhone and iPad. Even if you have&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">ZERO</strong>&nbsp;programming experience.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">I\'ll take you step-by-step through engaging and fun video tutorials and teach you everything you need to know to succeed as an iOS app developer.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">The course includes 55+<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">&nbsp;hours</strong>&nbsp;of HD video tutorials and builds your programming knowledge while making real world apps. e.g. Pokemon Go, Whatsapp, QuizUp and Yahoo Weather.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">The curriculum has been completely revamped for iOS 13 and Xcode 11. Including comprehensive modules on Apple\'s latest technology -&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">SwiftUI</strong>&nbsp;iOS, iPadOS and macOS app interface design,&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">ARKit</strong>&nbsp;for making&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Augmented Reality</strong>&nbsp;apps as well as&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">CoreML &amp; CreateML</strong>&nbsp;for making intelligent apps with&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Machine Learning</strong>. You\'ll be building 3D augmented reality apps that look like Pokemon Go and Harry Potter\'s magical newspapers!</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">By the end of this course, you will be&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">fluently</strong>&nbsp;programming in&nbsp;<strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Swift 5.1</strong>&nbsp;and be ready to make your own apps or start a freelancing job as an iOS 13 developer.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">You\'ll also have a portfolio of over 25 apps that you can show off to any potential employer.</p>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Sign up today, and look forwards to:</strong></p>\r\n<ul style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px 0px 0px 2.4rem; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Over 55 hours of HD 1080p video content, everything you\'ll ever need to succeed as a iOS developer.</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Building over 25 fully-fledged apps including ones that use machine learning and augmented reality</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">All the knowledge you need to start building any app you want</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">A giant bundle of design assets</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">Our best selling 12 Rules to Learn to Code eBook</p>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0.4rem 0px 0px; padding: 0px 0px 0px 0.8rem;\">\r\n<p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; max-width: 118.4rem;\">$8000+ app development bootcamp course materials and curriculum</p>\r\n</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0.8rem 0px 0px; padding: 0px; font-size: 14px; max-width: 118.4rem; color: #3c3b37; font-family: \'sf pro text\', -apple-system, BlinkMacSystemFont, Roboto, \'segoe ui\', Helvetica, Arial, sans-serif, \'apple color emoji\', \'segoe ui emoji\', \'segoe ui symbol\';\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">From Beginner to iOS 13 App Developer with Just One Course</strong></p>',12.9,0,1,1,'2021-01-09 08:01:43');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursesection`
--

DROP TABLE IF EXISTS `coursesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursesection` (
  `CourseSectionID` int NOT NULL AUTO_INCREMENT,
  `CourseID` int NOT NULL,
  `Name` text NOT NULL,
  `IsPreview` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CourseSectionID`),
  UNIQUE KEY `CourseSectionID_UNIQUE` (`CourseSectionID`),
  KEY `CourseSection_Course_FK_idx` (`CourseID`),
  CONSTRAINT `CourseSection_Course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursesection`
--

LOCK TABLES `coursesection` WRITE;
/*!40000 ALTER TABLE `coursesection` DISABLE KEYS */;
INSERT INTO `coursesection` VALUES (1,1,'Chapter 1: Introdution',0),(2,1,'Chapter 2: HTML - CSS tutorial',0),(3,1,'Chapter 3: Introduction to Javascript',0),(4,2,'Chapter 1: Introduction',0),(5,3,'All course',0),(6,4,'Chapter 1: Introdution',0),(7,4,'Chapter 2: Application ',0),(8,2,'Chapter 2: A brief about Flutter ',0);
/*!40000 ALTER TABLE `coursesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `StuID` int NOT NULL,
  `CourseID` int NOT NULL,
  `Content` text,
  `Rating` int NOT NULL,
  PRIMARY KEY (`FeedbackID`),
  UNIQUE KEY `FeedbackID_UNIQUE` (`FeedbackID`),
  KEY `Feedback_Course_FK_idx` (`CourseID`),
  KEY `Feedback_Student_FK_idx` (`StuID`),
  CONSTRAINT `Feedback_Course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`),
  CONSTRAINT `Feedback_Student_FK` FOREIGN KEY (`StuID`) REFERENCES `students` (`StuID`),
  CONSTRAINT `Rating` CHECK ((`Rating` in (1,2,3,4,5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant` (
  `StuID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`StuID`,`CourseID`),
  KEY `par_course_FK_idx` (`CourseID`),
  CONSTRAINT `par_course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`),
  CONSTRAINT `par_student_FK` FOREIGN KEY (`StuID`) REFERENCES `students` (`StuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('N388tpZih87hVFKkOvo426IcjSFZDgsF',1610244031,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"authUser\":{\"username\":\"hxk\",\"ID\":1,\"permission\":2},\"retUrl\":null}'),('Xcsa3Nb_oJSgF7gZglloEul0_RxyzxiS',1610256881,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}'),('bC_rnglmtVA0hu7IqgjUKMlWRwx5bjS2',1610262045,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StuID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gender` int NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`StuID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'BÙI TẠ ĐỨC TUẤN','2000-06-15','tuanduc1506@gmail.com',1,'St1');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `SubCategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`SubCategoryID`),
  KEY `subcategories_categories_FK_idx` (`CategoryID`),
  CONSTRAINT `subcategories_categories_FK` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Web Development',1),(2,'Mobile Developer',1);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `TeaID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gender` int NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`TeaID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Hoàng Xuân Kiệt','2020-12-27','',1,'Tea1');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `permission` int NOT NULL,
  `UID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ctun1506','$2a$12$91UCUaFZ9s84YzPZqgyKfeBYgt340tSMutnuIKLC9c6NNPWZ6vd.S',1,'St1'),(2,'hxk','$2a$12$ia.Ebyvvm1CeoaumVByHM.IvjmY7b3T8yMV0baMuWP9ddZyLPQWxC',2,'Tea1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `VideoId` int NOT NULL AUTO_INCREMENT,
  `CourseSectionID` int NOT NULL,
  `Name` text NOT NULL,
  PRIMARY KEY (`VideoId`),
  KEY `Video_CourseSection_FK_idx` (`CourseSectionID`),
  CONSTRAINT `Video_CourseSection_FK` FOREIGN KEY (`CourseSectionID`) REFERENCES `coursesection` (`CourseSectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,1,'Introduction to Web Development'),(2,2,'Building Your First Website | Learn HTML'),(3,2,'Intro to HTML, HEAD, BODY, and HEADER '),(4,2,' Lists, Paragraphs, and Text Styling'),(5,2,'6. Displaying Data With Table '),(6,2,'7.Learn HTML Forms, Img and Iframe Tags '),(7,2,'8. Working with CSS images and box shadows '),(8,3,'1. Introduction to JavaScript Tutorial For Beginners'),(9,4,'Building a Multi-Page Application with Dart\'s Flutter Mobile Framework'),(10,4,'Making Http requests and Using Json in Dart\'s Flutter Framework'),(11,5,'React Tutorial for Beginners'),(12,6,'The Complete iOS 13 App Development Course'),(13,7,'How Does an App Work?'),(14,7,'How Does an App Work?');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `StuID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`StuID`,`CourseID`),
  KEY `watchlist_course_FK_idx` (`CourseID`),
  CONSTRAINT `watchlist_course_FK` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CoursesID`),
  CONSTRAINT `watchlist_student_FK` FOREIGN KEY (`StuID`) REFERENCES `students` (`StuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-09 14:03:49
