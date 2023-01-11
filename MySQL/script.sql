CREATE DATABASE  IF NOT EXISTS `ptudw_finalproject_onlineacademy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ptudw_finalproject_onlineacademy`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: javachatapplication.mysql.database.azure.com    Database: ptudw_finalproject_onlineacademy
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `AccountID` varchar(36) NOT NULL,
  `Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pass` binary(60) DEFAULT NULL,
  `AccountType` int DEFAULT '0',
  `LockAccount` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`AccountID`),
  CONSTRAINT `accounts_chk_1` CHECK ((`AccountType` in (0,1,2)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('15637ec4-c85f-11ea-87d0-0242ac130003','20127610@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',0,0),('1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127100@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',1,1),('2301c5d3-c96c-47d5-98a5-83cc64293658','nguyennp@younetgroup.com',_binary '$2a$10$lm9wSHSK7ScIEbRVpxfW5OPl6y4JSB6K7bFA/jEKP.wVskj.76ZsW',0,0),('25637ec4-c85f-11ea-87d0-0242ac130003','20127575@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',0,0),('2ba09709-9968-4f9f-ba6b-468a40bddeb4','duynguyen24th@gmail.com',_binary '$2a$10$kiGK.C1V8E/UX9o3DVaRLOCSkZQPeCwXZJZIXlF0uHWHQ6GENBIo2',1,0),('2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127376@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',1,0),('3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127343@student.hcmus.edu.vn',_binary '$2a$10$CzJ/okBfOzJovA8UUF.8s.9H5DoJwMZZjR3QblKabVqA2xHGubdFC',1,0),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','test@yahoo.com',_binary '$2a$10$bao/yC/btbS1IXRF6xjzL.oz2zZ.9wLy/.4rFqk.CVVDhZRNJmIZy',0,0),('6a951f28-5833-495a-b8b5-d35fb2c5df87','sam@gmail.com',_binary '$2a$10$QTtxLAMh/MvnMVH4UiMIkO41lvlCLGuTxZnfNoUKkBogqylpyKp9m',0,0),('6cf0f452-a848-4684-bcb4-1f42fc4353ab','test123@gmail.com',_binary '$2a$10$eXYLav/Fjr1OBKRBjrnfOuJUKDg4Y9T4hFydF5HZiyQuZ.ZgpPguu',0,0),('6ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127013@student.hcmus.edu.vn',_binary '$2y$12$jLVXBWeCalJVgTvFEARfveQRwYvH4uJKG6aVr/3oQOLR2DSqUcqIq',2,0),('75c802af-7137-4b0c-aa0f-1176a8c95f1b','def@gmail.com',_binary '$2a$10$daUTAZuz9EelC5GTkjthUOyY0s/pxiKn9m6Y3dQIhC6YNwVq8iG4K',0,0),('85182197-937e-4e35-8e74-c0568657ee89','19127245@student.hcmus.edu.vn',_binary '$2a$10$vHvHby9toI8m2tF00otGDuFGR3ZOaLEfdLcwT4Jtj8qt4.W6x2qgO',0,0),('901dd881-1338-4329-a9e0-0497ccfd54c2','suck@gmail.com',_binary '$2a$10$XGt3FSW/E5Dav8cUWPUn7u3QurlIHr4oSjLW0PRXskTj//Kf.Vs.u',0,0),('933212ef-f83b-4685-8d78-f545e957eb10','abc@gmail.com',_binary '$2a$10$/OXZpfn4inKS2zvVugmMEOZTM9DScuCT452E3l9VcB97NbZ5GRI5a',0,0),('967ff946-aa54-4455-be35-4bb61e294f47','nhuy@gmail.com',_binary '$2a$10$iLezYM4YbTB8hr9uqJSIXuw9nAqqYlAAtD5x8YTMam3lQDtQVIKa.',0,1),('9ef1f138-1fa6-427e-93f5-7b507dbfc3fb','lala@gmail.com',_binary '$2a$10$wxOi7rCGkRXfTicGAPZ3reTCJQmats9S/EmDKErDZbOao4uD7i446',0,0),('a5bad11e-49e5-4752-88a4-88090a21c9c8','nhattruong1009@gmail.com',_binary '$2a$10$zxSTkeyNAGu8WW.av9OC/uLabKqM9WSbd/UxWnCzIY4222OBwrY2C',0,0),('b95fdf54-0077-4f91-9b71-4436dd48825b','test@gmail.com',_binary '$2a$10$lBRZ87n.z9Pv2b88Jcx1mudqnUEj4NGruQHtk6WA8PXuIu1HIKcJy',0,0),('d3a17fae-e896-41bb-bc42-cc04641cbafd','lulu@gmail.com',_binary '$2a$10$6swKu8f69fYLi0U1UOeSGOXxnh71TwT5FzFSwySr8KmZA4vpN9t6y',0,0),('feb131f8-d151-4259-82cb-d2250506dfc8','20127001@student.hcmus.edu.vn',_binary '$2a$10$TugEFPT7AogvjgGD5UcMfO2y9oR46Bftrz16yrAtjIdkX9XnVJegO',1,0);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `AdminID` varchar(36) NOT NULL,
  `AdminName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`AdminID`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `accounts` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('6ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Đặng Nguyễn Duy');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CatID` varchar(36) NOT NULL,
  `CatName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CatLevel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`CatID`),
  UNIQUE KEY `CatName` (`CatName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('110b962e-041c-11e1-9234-0123456789ab','Lập Trình Web','IT'),('18213878-64eb-441f-a995-3ea8a03dd722','Kiếm Tiền','Kinh Doanh'),('1d040fab-0dff-40c7-8337-5d28acb1c691','Khởi Nghiệp','Kinh Doanh'),('210b962e-041c-11e1-9234-0123456789ab','Lập Trình Hệ Điều Hành','IT'),('287caac6-b824-4f4c-9f2d-f8d7f08f3bb5','Yoga','Sức khỏe & Đời sống'),('385ab80e-36fd-4e8f-a5db-4ee7ef5a2e42','Thiết kế 3D & Hoạt Cảnh','Thiết Kế'),('7b47291a-ec31-4def-812a-efaa1075486b','Thương Mại Điện Tử','Kinh Doanh'),('94b2ac8e-c4c4-4871-8711-4a9a3f5f6025','Thể Thao','Sức khỏe & Đời sống'),('ba6d6f92-5320-482f-a4da-9a620f9078ea','Thiết kế Web','Thiết Kế'),('c02ba921-85f0-4fd2-a862-34dde79e165f','SEO','Marketing'),('fa7508ce-a34d-4cd2-9476-500e84cfb954','Tiếp Thị Kỹ Thuật Số','Marketing'),('fd296b2e-6a96-4609-8339-a1c36b01712f','Sản Xuất Âm Nhạc','Âm Nhạc');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chaptercontent`
--

DROP TABLE IF EXISTS `chaptercontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chaptercontent` (
  `CourseID` varchar(36) DEFAULT NULL,
  `ChapterID` varchar(36) DEFAULT NULL,
  `ContentID` varchar(36) NOT NULL,
  `ContentName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ContentID`),
  KEY `CourseID` (`CourseID`),
  KEY `ChapterID` (`ChapterID`),
  CONSTRAINT `chaptercontent_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  CONSTRAINT `chaptercontent_ibfk_2` FOREIGN KEY (`ChapterID`) REFERENCES `coursechapter` (`ChapterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chaptercontent`
--

LOCK TABLES `chaptercontent` WRITE;
/*!40000 ALTER TABLE `chaptercontent` DISABLE KEYS */;
INSERT INTO `chaptercontent` VALUES ('dd13c621-4553-45c2-8a05-7e3b7d48fe29','4eca6948-5481-47ab-84f9-db33420eda8f','11db93ff-528b-4152-9cb0-75b24de99a1b','Cách làm một trang cá nhân thu hút người xem','/public/vid/11db93ff-528b-4152-9cb0-75b24de99a1b.mp4','2023-01-09 14:54:41'),('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','10000000-4067-11e9-8bad-9b1deb4d3b7d','20000000-4067-11e9-8bad-9b1deb4d3b7d','Mở đầu về HTML','/public/vid/20000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','11000000-4067-11e9-8bad-9b1deb4d3b7d','21000000-4067-11e9-8bad-9b1deb4d3b7d','Các tag cơ bản','/public/vid/21000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('2d9557e0-08a2-43c8-bbf9-d66973ba1c3a','f4b4c330-2c8a-4131-a5e9-6d289df391ee','22000000-4067-11e9-8bad-9b1deb4d3b7d','Ngay thẳng là gì','/public/vid/22000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('3c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','f5b4c330-2c8a-4131-a5e9-6d289df391ee','23000000-4067-11e9-8bad-9b1deb4d3b7d','Starup cần những gì?','/public/vid/23000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','f7b4c330-2c8a-4131-a5e9-6d289df391ee','24000000-4067-11e9-8bad-9b1deb4d3b7d','3 bộ phận của MVC','/public/vid/24000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('73467415-6352-481d-8877-1c16fb3015b4','f8b4c330-2c8a-4131-a5e9-6d289df391ee','25000000-4067-11e9-8bad-9b1deb4d3b7d','Các luật cơ bản trong cầu lông','/public/vid/25000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('7f3991af-29e0-433a-a229-9dd4d549d4d2','f9b4c330-2c8a-4131-a5e9-6d289df391ee','26000000-4067-11e9-8bad-9b1deb4d3b7d','Các công cụ làm hoạt hình','/public/vid/26000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('7f3991af-29e0-433a-a229-9dd4d549d4d2','f104c330-2c8a-4131-a5e9-6d289df391ee','27000000-4067-11e9-8bad-9b1deb4d3b7d','Làm một phim hoạt hình đầu tiên','/public/vid/27000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('a9dfe0c7-fdde-45ba-8efe-c421aaca8bfe','f1c4c330-2c8a-4131-a5e9-6d289df391ee','28000000-4067-11e9-8bad-9b1deb4d3b7d','Cách làm chuyển động 3D','/public/vid/28000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('aa89c621-4553-45c2-8a05-7e3b7d48fe29','f9c4c330-2c8a-4131-a5e9-6d289df391ee','29000000-4067-11e9-8bad-9b1deb4d3b7d','Tải VS','/public/vid/29000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('cb3fb35f-5721-4116-82f6-33a7916bf2ef','f9d4c330-2c8a-4131-a5e9-6d289df391ee','30000000-4067-11e9-8bad-9b1deb4d3b7d','Lồng tiếng nhân vật','/public/vid/30000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('d1f4809b-ee26-4256-87e7-b3de0fd24e5a','f9e4c330-2c8a-4131-a5e9-6d289df391ee','31000000-4067-11e9-8bad-9b1deb4d3b7d','Cách bước chân','/public/vid/31000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('d589c621-4553-45c2-8a05-7e3b7d48fe29','f9f4c330-2c8a-4131-a5e9-6d289df391ee','32000000-4067-11e9-8bad-9b1deb4d3b7d','Cài đặt Node js','/public/vid/32000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('d63a1378-55c1-483f-b7f0-f0dbef46409f','f9g4c330-2c8a-4131-a5e9-6d289df391ee','33000000-4067-11e9-8bad-9b1deb4d3b7d','Nhạc lý cơ bản','/public/vid/33000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd12c621-4553-45c2-8a05-7e3b7d48fe29','f9h4c330-2c8a-4131-a5e9-6d289df391ee','34000000-4067-11e9-8bad-9b1deb4d3b7d','Bài 1','/public/vid/34000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd13c621-4553-45c2-8a05-7e3b7d48fe29','f9i4c330-2c8a-4131-a5e9-6d289df391ee','35000000-4067-11e9-8bad-9b1deb4d3b7d','Các bước lập facebook bán hàng','/public/vid/35000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd14c621-4553-45c2-8a05-7e3b7d48fe29','f9m4c330-2c8a-4131-a5e9-6d289df391ee','36000000-4067-11e9-8bad-9b1deb4d3b7d','Khởi động','/public/vid/36000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd14c621-4553-45c2-8a05-7e3b7d48fe29','f9n4c330-2c8a-4131-a5e9-6d289df391ee','37000000-4067-11e9-8bad-9b1deb4d3b7d','Ép dẻo','/public/vid/37000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd15c621-4553-45c2-8a05-7e3b7d48fe29','f9o4c330-2c8a-4131-a5e9-6d289df391ee','38000000-4067-11e9-8bad-9b1deb4d3b7d','Các luật cơ bản trong bóng đá','/public/vid/38000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd16c621-4553-45c2-8a05-7e3b7d48fe29','f9p4c330-2c8a-4131-a5e9-6d289df391ee','39000000-4067-11e9-8bad-9b1deb4d3b7d','Tiếp thị cho người dùng','/public/vid/39000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd17c621-4553-45c2-8a05-7e3b7d48fe29','f9r4c330-2c8a-4131-a5e9-6d289df391ee','40000000-4067-11e9-8bad-9b1deb4d3b7d','Tiếp cận dễ dàng với người tiêu dùng','/public/vid/40000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd18c621-4553-45c2-8a05-7e3b7d48fe29','f9s4c330-2c8a-4131-a5e9-6d289df391ee','41000000-4067-11e9-8bad-9b1deb4d3b7d','Nhạc lý cơ bản','/public/vid/41000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('dd89c621-4553-45c2-8a05-7e3b7d48fe29','f9t4c330-2c8a-4131-a5e9-6d289df391ee','42000000-4067-11e9-8bad-9b1deb4d3b7d','Cách nhảy lên đập cầu','/public/vid/42000000-4067-11e9-8bad-9b1deb4d3b7d.mp4','2023-01-09 14:54:41'),('5ca5bd8d-af8b-4ba1-8c18-2b46a26cb4d2','5230204c-28c6-440f-a5c5-2c265da062d2','5a8f4f33-ef6d-41b7-bec0-076fc207e4d0','Điều đầu tiên','/public/vid/5a8f4f33-ef6d-41b7-bec0-076fc207e4d0.mp4','2023-01-11 13:22:23'),('09b04ba9-0d6e-4d17-9da5-f30222c38da9','f1b4c330-2c8a-4131-a5e9-6d289df391ee','ab832335-fe1e-493d-84a7-3d734a1225b2','Tìm hiểu về thị trường chứng khoán','/public/vid/ab832335-fe1e-493d-84a7-3d734a1225b2.mp4','2023-01-11 03:54:37'),('09b04ba9-0d6e-4d17-9da5-f30222c38da9','d6061cde-b879-4e3b-87b6-56cedfc33c82','ac832335-fe1e-493d-84a7-3d734a1225b2','Các loại cổ phiếu khác nhau','/public/vid/ac832335-fe1e-493d-84a7-3d734a1225b2.mp4','2023-01-11 03:54:37'),('2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','f2b4c330-2c8a-4131-a5e9-6d289df391ee','ad832335-fe1e-493d-84a7-3d734a1225b2','Class trong Java','/public/vid/ad832335-fe1e-493d-84a7-3d734a1225b2.mp4','2023-01-11 03:54:37'),('2d9557e0-08a2-43c8-bbf9-d66973ba1c3a','f3b4c330-2c8a-4131-a5e9-6d289df391ee','ae832335-fe1e-493d-84a7-3d734a1225b2','Khiêm nhường là một trong những đức tính quý giá để làm nên giá trị của một con người.','/public/vid/ae832335-fe1e-493d-84a7-3d734a1225b2.mp4','2023-01-11 03:54:37'),('4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','f6b4c330-2c8a-4131-a5e9-6d289df391ee','af832335-fe1e-493d-84a7-3d734a1225b2','MVC là mô hình gồm 3 phần','/public/vid/af832335-fe1e-493d-84a7-3d734a1225b2.mp4','2023-01-11 03:54:37');
/*!40000 ALTER TABLE `chaptercontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursechapter`
--

DROP TABLE IF EXISTS `coursechapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursechapter` (
  `CourseID` varchar(36) DEFAULT NULL,
  `ChapterID` varchar(36) NOT NULL,
  `ChapterName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Preview` tinyint(1) DEFAULT '0',
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ChapterID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `coursechapter_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursechapter`
--

LOCK TABLES `coursechapter` WRITE;
/*!40000 ALTER TABLE `coursechapter` DISABLE KEYS */;
INSERT INTO `coursechapter` VALUES ('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','10000000-4067-11e9-8bad-9b1deb4d3b7d','Bài 1',1,'2023-01-09 03:16:00'),('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','11000000-4067-11e9-8bad-9b1deb4d3b7d','Bài 2',0,'2023-01-09 04:16:00'),('dd13c621-4553-45c2-8a05-7e3b7d48fe29','4eca6948-5481-47ab-84f9-db33420eda8f','Cách tạo acc facebook',1,'2023-01-09 21:52:09'),('5ca5bd8d-af8b-4ba1-8c18-2b46a26cb4d2','5230204c-28c6-440f-a5c5-2c265da062d2','Nhập môn yoga',0,'2023-01-11 20:21:22'),('09b04ba9-0d6e-4d17-9da5-f30222c38da9','d6061cde-b879-4e3b-87b6-56cedfc33c82','Phát triển hướng đầu tư của bản thân',0,'2023-01-11 10:51:20'),('7f3991af-29e0-433a-a229-9dd4d549d4d2','f104c330-2c8a-4131-a5e9-6d289df391ee','Bước đầu để làm hoạt hình',0,'2023-01-11 12:50:59'),('09b04ba9-0d6e-4d17-9da5-f30222c38da9','f1b4c330-2c8a-4131-a5e9-6d289df391ee','Tham gia vào thị trường',1,'2023-01-11 10:50:59'),('a9dfe0c7-fdde-45ba-8efe-c421aaca8bfe','f1c4c330-2c8a-4131-a5e9-6d289df391ee','Cách làm chuyển động 3D',1,'2023-01-11 12:50:59'),('2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','f2b4c330-2c8a-4131-a5e9-6d289df391ee','Class trong Java',1,'2023-01-11 10:50:59'),('2d9557e0-08a2-43c8-bbf9-d66973ba1c3a','f3b4c330-2c8a-4131-a5e9-6d289df391ee','Đức tính khiêm nhường',1,'2023-01-11 10:50:59'),('2d9557e0-08a2-43c8-bbf9-d66973ba1c3a','f4b4c330-2c8a-4131-a5e9-6d289df391ee','Đức tính ngay thẳng',0,'2023-01-11 12:50:59'),('3c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','f5b4c330-2c8a-4131-a5e9-6d289df391ee','Định hướng xây dựng starup',0,'2023-01-11 12:50:59'),('4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','f6b4c330-2c8a-4131-a5e9-6d289df391ee','Web MVC là gì',1,'2023-01-11 12:50:59'),('4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','f7b4c330-2c8a-4131-a5e9-6d289df391ee','Các tổ chức MVC',0,'2023-01-11 12:50:59'),('73467415-6352-481d-8877-1c16fb3015b4','f8b4c330-2c8a-4131-a5e9-6d289df391ee','Luật trong cầu lông',0,'2023-01-11 12:50:59'),('7f3991af-29e0-433a-a229-9dd4d549d4d2','f9b4c330-2c8a-4131-a5e9-6d289df391ee','Các công cụ để làm hoạt hình',1,'2023-01-11 12:50:59'),('aa89c621-4553-45c2-8a05-7e3b7d48fe29','f9c4c330-2c8a-4131-a5e9-6d289df391ee','Làm web cần những công cụ gì',0,'2023-01-11 12:50:59'),('cb3fb35f-5721-4116-82f6-33a7916bf2ef','f9d4c330-2c8a-4131-a5e9-6d289df391ee','Cách lồng tiếng',1,'2023-01-11 12:50:59'),('d1f4809b-ee26-4256-87e7-b3de0fd24e5a','f9e4c330-2c8a-4131-a5e9-6d289df391ee','Các bước cơ bản trong khiêu vũ',0,'2023-01-11 12:50:59'),('d589c621-4553-45c2-8a05-7e3b7d48fe29','f9f4c330-2c8a-4131-a5e9-6d289df391ee','Cài đặt Node js',1,'2023-01-11 12:50:59'),('d63a1378-55c1-483f-b7f0-f0dbef46409f','f9g4c330-2c8a-4131-a5e9-6d289df391ee','Nhạc lý cơ bản',0,'2023-01-11 12:50:59'),('dd12c621-4553-45c2-8a05-7e3b7d48fe29','f9h4c330-2c8a-4131-a5e9-6d289df391ee','Các kiến thức cần thiết',0,'2023-01-11 12:50:59'),('dd13c621-4553-45c2-8a05-7e3b7d48fe29','f9i4c330-2c8a-4131-a5e9-6d289df391ee','Cách lập facebook bán hàng',0,'2023-01-11 12:50:59'),('dd14c621-4553-45c2-8a05-7e3b7d48fe29','f9m4c330-2c8a-4131-a5e9-6d289df391ee','Khởi động',1,'2023-01-11 12:50:59'),('dd14c621-4553-45c2-8a05-7e3b7d48fe29','f9n4c330-2c8a-4131-a5e9-6d289df391ee','Bài 1',0,'2023-01-11 12:52:59'),('dd15c621-4553-45c2-8a05-7e3b7d48fe29','f9o4c330-2c8a-4131-a5e9-6d289df391ee','Luật trong bóng đá',1,'2023-01-11 12:52:59'),('dd16c621-4553-45c2-8a05-7e3b7d48fe29','f9p4c330-2c8a-4131-a5e9-6d289df391ee','Tiếp thị',0,'2023-01-11 12:52:59'),('dd17c621-4553-45c2-8a05-7e3b7d48fe29','f9r4c330-2c8a-4131-a5e9-6d289df391ee','Tiếp cận người tiêu dùng',1,'2023-01-11 12:52:59'),('dd18c621-4553-45c2-8a05-7e3b7d48fe29','f9s4c330-2c8a-4131-a5e9-6d289df391ee','Nhạc lý cơ bản',0,'2023-01-11 12:52:59'),('dd89c621-4553-45c2-8a05-7e3b7d48fe29','f9t4c330-2c8a-4131-a5e9-6d289df391ee','Cách đập cầu',1,'2023-01-11 12:52:59');
/*!40000 ALTER TABLE `coursechapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CourseID` varchar(36) NOT NULL,
  `CourseName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CatID` varchar(36) DEFAULT NULL,
  `CourseAvatar` varchar(100) DEFAULT NULL,
  `TinyDes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FullDes` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Rating` float DEFAULT '0',
  `Reviews` int DEFAULT '0',
  `Views` int DEFAULT '0',
  `Students` int DEFAULT '0',
  `Tuition` int DEFAULT '0',
  `Discount` int DEFAULT NULL,
  `DiscountInfo` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `CreateTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `LecID` varchar(36) DEFAULT NULL,
  `Disable` tinyint(1) DEFAULT '0',
  `Complete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`CourseID`),
  KEY `CatID` (`CatID`),
  KEY `LecID` (`LecID`),
  FULLTEXT KEY `CourseName` (`CourseName`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`CatID`) REFERENCES `categories` (`CatID`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`LecID`) REFERENCES `lecturers` (`LecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('09b04ba9-0d6e-4d17-9da5-f30222c38da9','Chứng khoán','18213878-64eb-441f-a995-3ea8a03dd722','/public/img/09b04ba9-0d6e-4d17-9da5-f30222c38da9.png','<p>Chứng khoán</p>','<p><strong>Nhập môn chứng khoán</strong></p>',0,0,41,0,1000000,NULL,NULL,'2023-01-11 10:48:40','2023-01-11 10:54:37','3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Lập trình front end với HTML','110b962e-041c-11e1-9234-0123456789ab','/public/img/1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d.png','Khóa học về HTML','Dạy các kiến thức cơ bản về các tag trong HTML',1,1,18,1,1000000,999999,'','2023-01-09 03:16:00',NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Lập trình back end với Java','210b962e-041c-11e1-9234-0123456789ab','/public/img/2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d.png','Khóa học về Java','Dạy các kiến thức về OOP trong java và thực hành các bài tập đơn giản',5,1,6,1,1000000,999999,'','2023-01-09 03:17:00',NULL,'2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('2d9557e0-08a2-43c8-bbf9-d66973ba1c3a','Cách đối nhân xử thế đảm bảo có nhiều bạn','1d040fab-0dff-40c7-8337-5d28acb1c691','/public/img/2d9557e0-08a2-43c8-bbf9-d66973ba1c3a.png','<p>Kh&oacute;a học d&agrave;nh cho những ai sống lỗi n&ecirc;n kh&ocirc;ng c&oacute; nhiều bạn.</p>','<p>Theo &ocirc;ng Robert Sutton - gi&aacute;o sư khoa học quản l&yacute; của ĐH Stanford, việc x&acirc;y dựng một nh&oacute;m to&agrave;n những cạ cứng l&agrave; điều kh&ocirc;ng thể. Đ&oacute; cũng l&agrave; l&yacute; do tại sao người th&ocirc;ng minh phải t&igrave;m c&aacute;ch cư xử ph&ugrave; hợp với những người họ kh&ocirc;ng th&iacute;ch.</p>\r\n<p>Dưới đ&acirc;y l&agrave; c&aacute;ch họ đ&atilde; l&agrave;m.</p>\r\n<p><strong>1. Chấp nhận chuyện kh&ocirc;ng y&ecirc;u qu&yacute; được tất cả mọi người</strong></p>\r\n<p>Đ&ocirc;i khi ch&uacute;ng ta cứ nghĩ rằng, ch&uacute;ng ta sẽ y&ecirc;u qu&yacute; tất cả những người m&igrave;nh gặp, nhưng việc bạn sẽ gặp phải những người bạn kh&ocirc;ng ưa l&agrave; điều kh&ocirc;ng thể tr&aacute;nh khỏi.</p>\r\n<p>Người th&ocirc;ng minh lu&ocirc;n biết điều n&agrave;y. Họ cũng hiểu những xung đột hay bất đồng l&agrave; do sự kh&aacute;c biệt về c&aacute;c gi&aacute; trị.</p>\r\n<p>Người bạn kh&ocirc;ng th&iacute;ch bản chất c&oacute; thể kh&ocirc;ng phải l&agrave; người xấu. L&yacute; do bạn kh&ocirc;ng thể h&ograve;a hợp với họ l&agrave; do c&aacute;c bạn c&oacute; những gi&aacute; trị kh&aacute;c biệt v&agrave; sự kh&aacute;c biệt đ&oacute; tạo ra sự ph&aacute;n x&eacute;t. Một khi bạn chấp nhận sự thật kh&ocirc;ng phải ai cũng y&ecirc;u qu&yacute; m&igrave;nh v&agrave; bạn cũng sẽ kh&ocirc;ng y&ecirc;u qu&yacute; được tất cả mọi người do sự kh&aacute;c biệt về gi&aacute; trị th&igrave; những cảm x&uacute;c ti&ecirc;u cực sẽ kh&ocirc;ng c&ograve;n nữa.</p>\r\n<div class=\"VCSortableInPreviewMode active\">\r\n<div class=\"PhotoCMS_Caption\">\r\n<p data-placeholder=\"[nhập ch&uacute; th&iacute;ch]\">H&atilde;y tập luyện một gương mặt ngoại giao để lu&ocirc;n ứng xử đ&uacute;ng mực</p>\r\n</div>\r\n</div>\r\n<p><strong>2. Xử sự văn minh với những người họ kh&ocirc;ng ưa</strong></p>\r\n<p>Bất kể cảm x&uacute;c của bạn như thế n&agrave;o, khi bạn ứng xử h&ograve;a nh&atilde; với họ, họ cũng sẽ đ&aacute;p lại như thế với bạn. Nếu bạn th&ocirc; lỗ với họ, họ cũng sẽ kh&ocirc;ng ngại ngần vứt bỏ mọi sự lịch thiệp v&agrave; th&ocirc; lỗ lại với bạn.</p>\r\n<p>\"Tập luyện khu&ocirc;n mặt ngoại giao rất quan trọng. Bạn cần phải thể hiện chuy&ecirc;n nghiệp v&agrave; t&iacute;ch cực\", Ben Dattner, nh&agrave; t&acirc;m l&yacute; học, t&aacute;c giả cuốn The Blame Game nhận định.</p>\r\n<p><strong>3. Xem lại kỳ vọng của m&igrave;nh</strong></p>\r\n<p>Việc c&oacute; những kỳ vọng kh&ocirc;ng thực tế về người kh&aacute;c kh&ocirc;ng phải chuyện hiếm. Ch&uacute;ng ta c&oacute; thể mong đợi người kh&aacute;c h&agrave;nh động giống như m&igrave;nh, hoặc n&oacute;i những điều ch&iacute;nh ch&uacute;ng ta sẽ n&oacute;i trong trường hợp đ&oacute;. Tuy nhi&ecirc;n, điều đ&oacute; l&agrave; kh&ocirc;ng thực tế.</p>\r\n<p>\"Ai cũng c&oacute; những đặc điểm t&iacute;nh c&aacute;ch đ&atilde; được ăn s&acirc;u - yếu tố quyết định phần lớn phản ứng của họ. Kỳ vọng người kh&aacute;c h&agrave;nh xử giống m&igrave;nh sẽ khiến bạn thất vọng nhiều hơn\" - Alan A. Cavaiola, gi&aacute;o sư T&acirc;m l&yacute; học, ĐH Monmouth, Mỹ cho hay.</p>\r\n<p>Nếu một người trong t&igrave;nh huống n&agrave;o cũng lu&ocirc;n mang lại cho bạn cảm gi&aacute;c giống nhau th&igrave; bạn h&atilde;y điều chỉnh kỳ vọng của m&igrave;nh về người đ&oacute;. C&aacute;ch n&agrave;y gi&uacute;p bạn chuẩn bị t&acirc;m l&yacute; v&agrave; h&agrave;nh vi của họ sẽ kh&ocirc;ng khiến bạn ngạc nhi&ecirc;n.</p>\r\n<p>Người th&ocirc;ng minh lu&ocirc;n l&agrave;m điều n&agrave;y n&ecirc;n kh&ocirc;ng phải l&uacute;c n&agrave;o họ cũng bị ngạc nhi&ecirc;n về h&agrave;nh động của người họ kh&ocirc;ng th&iacute;ch.</p>\r\n<p><strong>4. Giấu cảm x&uacute;c v&agrave;o trong v&agrave; chỉ tập trung v&agrave;o bản th&acirc;n</strong></p>\r\n<p>Quan trọng l&agrave; bạn học c&aacute;ch xử l&yacute; với sự thất vọng của m&igrave;nh khi tiếp x&uacute;c với người bạn kh&ocirc;ng ưa. Thay v&igrave; nghĩ về việc người đ&oacute; kh&oacute; chịu đến mức n&agrave;o, h&atilde;y tập trung v&agrave;o việc tại sao bạn lại phản ứng như vậy. Đ&ocirc;i khi c&aacute;i ch&uacute;ng ta kh&ocirc;ng th&iacute;ch ở người kh&aacute;c lại l&agrave; c&aacute;i ch&uacute;ng ta kh&ocirc;ng th&iacute;ch ở bản th&acirc;n.</p>',4,1,25,1,100000,NULL,NULL,'2023-01-09 03:18:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('3c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Starup','1d040fab-0dff-40c7-8337-5d28acb1c691','/public/img/3c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d.png','Cách làm giàu','Học cách khởi nghiệp từ những nhà khởi nghiệp thành công để tạo nên tài sản cho bản thân',0,0,5,0,1500000,1200000,NULL,'2023-01-09 03:19:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Lập trình Web MVC','110b962e-041c-11e1-9234-0123456789ab','/public/img/4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d.png','Làm web với MVC','Sử dụng mô hình MVC để làm ra các website mạnh mẽ',5,1,17,1,2500000,2000000,NULL,'2023-01-09 03:20:00',NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('5ca5bd8d-af8b-4ba1-8c18-2b46a26cb4d2','Yoga tịnh tâm cho người hay nổi nóng','287caac6-b824-4f4c-9f2d-f8d7f08f3bb5','/public/img/5ca5bd8d-af8b-4ba1-8c18-2b46a26cb4d2.png','<p>Yoga gi&uacute;p con người t&igrave;m thấy niềm vui trong cuộc sống</p>','<p><strong>Yoga</strong>&nbsp;(sa.&nbsp;<em>yoga</em>), hay c&ograve;n gọi l&agrave;&nbsp;<strong>Du-gi&agrave;</strong>&nbsp;(zh. 瑜伽), l&agrave; một họ c&aacute;c phương ph&aacute;p luyện t&acirc;m v&agrave; luyện th&acirc;n cổ xưa bắt nguồn từ&nbsp;<a title=\"Ấn Độ\" href=\"https://vi.wikipedia.org/wiki/%E1%BA%A4n_%C4%90%E1%BB%99\">Ấn Độ</a>. C&aacute;c nh&agrave; nghi&ecirc;n cứu cho rằng,&nbsp;<a title=\"T&acirc;m linh\" href=\"https://vi.wikipedia.org/wiki/T%C3%A2m_linh\">thế giới t&acirc;m linh</a>&nbsp;của Ấn Độ được phổ biến ch&iacute;nh qua kh&aacute;i niệm Yoga n&agrave;y. Người nam luyện Yoga được gọi l&agrave; (<strong>Du-gi&agrave;</strong>)&nbsp;<strong>H&agrave;nh giả</strong>&nbsp;(sa.&nbsp;<em>yogin</em>), người nữ l&agrave;&nbsp;<strong>Nữ h&agrave;nh giả</strong>&nbsp;(sa.&nbsp;<em>yoginī</em>). C&oacute; l&uacute;c ta cũng thấy c&aacute;ch gọi&nbsp;<strong>Du-gi&agrave; sư</strong>,&nbsp;<strong>Du-gi&agrave; tăng</strong>.</p>\r\n<p>Hệ thống Yoga cổ điển như một ph&aacute;i triết học được&nbsp;<a class=\"new\" title=\"Ba-đan-x&agrave;-l&ecirc; (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Ba-%C4%91an-x%C3%A0-l%C3%AA&amp;action=edit&amp;redlink=1\">Ba-đan-x&agrave;-l&ecirc;</a>&nbsp;(zh. 巴丹闍梨, sa.&nbsp;<em>pata&ntilde;jali</em>, tiểu sử kh&ocirc;ng r&otilde;, c&oacute; thể sống thế kỉ 2/3 trước CN hoặc thứ 5 sau CN), t&aacute;c giả của bộ&nbsp;<em><a class=\"new\" title=\"Du-gi&agrave; kinh (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Du-gi%C3%A0_kinh&amp;action=edit&amp;redlink=1\">Du-gi&agrave; kinh</a></em>&nbsp;(zh. 瑜伽經, sa.&nbsp;<em>yogasūtra</em>) khai s&aacute;ng. Trong hệ thống n&agrave;y, Yoga kết hợp chặt chẽ với&nbsp;<a class=\"new\" title=\"Triết học số luận (trang kh&ocirc;ng tồn tại)\" href=\"https://vi.wikipedia.org/w/index.php?title=Tri%E1%BA%BFt_h%E1%BB%8Dc_s%E1%BB%91_lu%E1%BA%ADn&amp;action=edit&amp;redlink=1\">Triết học số luận</a>&nbsp;(zh. 數論, sa.&nbsp;<em>sāṃkhya</em>) đến mức người ta xem Yoga v&agrave; Số luận gần như l&agrave; một hệ thống với Yoga đại diện kh&iacute;a cạnh thực h&agrave;nh v&agrave; Số luận đại diện phần l&yacute; thuyết. Yoga hấp thụ phần triết học si&ecirc;u h&igrave;nh của Số luận. Tuy nhi&ecirc;n, người ta t&igrave;m thấy hai điểm kh&aacute;c biệt nổi bật giữa hai hệ thống n&agrave;y: ph&aacute;i Số luận thuộc hệ thống v&ocirc; thần trong khi hệ thống Yoga thừa nhận một đấng Tự Tại (sa.&nbsp;<em>īśvara</em>). Theo Số luận th&igrave; chỉ nhận thức si&ecirc;u việt mới ch&iacute;nh l&agrave; con đường dẫn đến&nbsp;<a title=\"Giải tho&aacute;t\" href=\"https://vi.wikipedia.org/wiki/Gi%E1%BA%A3i_tho%C3%A1t\">giải tho&aacute;t</a>. Đối với hai hệ thống n&agrave;y th&igrave; Ph&uacute;-l&acirc;u-sa (zh. 富樓沙, sa.&nbsp;<em>puruṣa</em>), t&acirc;m thức si&ecirc;u việt trường tồn v&agrave; bản t&iacute;nh (zh. 本性, sa.&nbsp;<em>prakṛti</em>,&nbsp;<em>Du-gi&agrave; kinh</em>&nbsp;1,24-27) l&agrave; hai nguy&ecirc;n l&yacute; tối cao. Ph&uacute;-l&acirc;u-sa, khi phản chiếu trong t&acirc;m thức (sa.&nbsp;<em>citta</em>) con người ch&iacute;nh l&agrave; tiểu ng&atilde; hoặc linh hồn (sa.&nbsp;<em>jīva</em>) hiển hiện trong thế giới hiện tượng, lăn tr&ocirc;i trong v&ograve;ng sinh tử. Khi t&acirc;m thức con người được an tĩnh, kh&ocirc;ng c&ograve;n sự phản chiếu nữa th&igrave; khi ấy, n&oacute; nhận thức được bản t&iacute;nh uy&ecirc;n nguy&ecirc;n của n&oacute; v&agrave; đạt giải tho&aacute;t. Con đường dẫn đến mục đ&iacute;ch n&agrave;y ch&iacute;nh l&agrave; Yoga.</p>\r\n<p>Trong c&acirc;u kệ thứ hai của&nbsp;<em>Du-gi&agrave; kinh</em>&nbsp;Ba-đan-x&agrave;-l&ecirc; định nghĩa Yoga (Du-gi&agrave;) như sau:</p>\r\n<dl>\r\n<dd>yogaś cittavṛttinirodhaḥ</dd>\r\n<dd>Yoga l&agrave; sự chế ngự (<em>nirodha</em>) những hoạt động của t&acirc;m thức (<em>cittavṛtti</em>).</dd>\r\n</dl>\r\n<p>T&acirc;m thức c&oacute; năm hoạt động, đ&oacute; l&agrave;:</p>\r\n<ol>\r\n<li>Ch&acirc;n lượng (sa.&nbsp;<em>pramāṇa</em>, xem th&ecirc;m&nbsp;<a title=\"Lượng (Phật gi&aacute;o)\" href=\"https://vi.wikipedia.org/wiki/L%C6%B0%E1%BB%A3ng_(Ph%E1%BA%ADt_gi%C3%A1o)\">Lượng</a>), tức l&agrave; nhận thức, ước lượng ch&acirc;n ch&iacute;nh.</li>\r\n<li>Đảo kiến (sa.&nbsp;<em>viparyaya</em>), l&agrave; kiến giải, nhận thức đi&ecirc;n đảo</li>\r\n<li>Vọng tưởng (sa.&nbsp;<em>vikalpa</em>), tưởng tượng.</li>\r\n<li>Mi&ecirc;n (sa.&nbsp;<em>nidrā</em>), l&agrave; giấc ngủ</li>\r\n<li>Niệm (sa.&nbsp;<em>smṛti</em>), l&agrave; tr&iacute; nhớ.</li>\r\n</ol>\r\n<p>Năm hoạt động t&acirc;m thức tr&ecirc;n c&oacute; thể g&acirc;y phiền n&atilde;o (sa.&nbsp;<em>kliṣṭa</em>) hoặc kh&ocirc;ng g&acirc;y phiền n&atilde;o (sa.&nbsp;<em>akliṣṭa</em>, 1,5). Những hoạt động t&acirc;m thức g&acirc;y phiền n&atilde;o lập cơ sở cho việc thu thập v&agrave; gia tăng&nbsp;<a title=\"Nghiệp\" href=\"https://vi.wikipedia.org/wiki/Nghi%E1%BB%87p\">nghiệp</a>&nbsp;chướng, tr&oacute;i buộc t&acirc;m thức. C&oacute; năm hoạt động t&acirc;m thức g&acirc;y phiền n&atilde;o, đ&oacute; l&agrave;:</p>\r\n<ol>\r\n<li><a title=\"V&ocirc; minh\" href=\"https://vi.wikipedia.org/wiki/V%C3%B4_minh\">V&ocirc; minh</a>&nbsp;(sa.&nbsp;<em>avidyā</em>).</li>\r\n<li>Vị kỉ (sa.&nbsp;<em>asmitā</em>), chỉ biết đến m&igrave;nh.</li>\r\n<li>Tham &aacute;i (sa.&nbsp;<em>rāga</em>)</li>\r\n<li>S&acirc;n (sa.&nbsp;<em>dveṣa</em>), s&acirc;n hận.</li>\r\n<li>Hữu &aacute;i (sa.&nbsp;<em>abhiniveśa</em>), kh&aacute;t vọng tồn tại.</li>\r\n</ol>\r\n<p>Những hoạt động g&acirc;y phiền n&atilde;o b&ecirc;n tr&ecirc;n c&oacute; thể được diệt trừ bằng t&acirc;m thức tinh tiến (sa.&nbsp;<em>abhyāsa</em>) v&agrave; v&ocirc; tham (sa.&nbsp;<em>vairāgya</em>). Qu&aacute; tr&igrave;nh d&agrave;i dẳng v&agrave; gian nan n&agrave;y ch&iacute;nh l&agrave; Yoga v&agrave; theo Ba-đan-x&agrave;-l&ecirc;, n&oacute; bao gồm t&aacute;m cấp bậc.</p>',0,0,6,0,1000000,NULL,NULL,'2023-01-11 20:20:55','2023-01-11 20:22:23','3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('73467415-6352-481d-8877-1c16fb3015b4','Cầu Lông (Dễ)','1d040fab-0dff-40c7-8337-5d28acb1c691','/public/img/73467415-6352-481d-8877-1c16fb3015b4.png','Khóa học cầu lông cho người mới bắt đầu','Dạy đánh cầu lông từ A->Z',0,0,5,0,500000,NULL,NULL,'2023-01-09 03:21:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('7f3991af-29e0-433a-a229-9dd4d549d4d2','Hoạt hình đơn giản','385ab80e-36fd-4e8f-a5db-4ee7ef5a2e42','/public/img/7f3991af-29e0-433a-a229-9dd4d549d4d2.png','Khóa học hướng dẫn làm video hoạt hình đơn giản','Với khóa học này, bạn có thể tự làm một video hoạt hình ngắn 5\' từ đầu đến cuối trong vòng 14 ngày.',2.66667,3,32,3,1000000,NULL,NULL,'2023-01-09 03:25:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('a9dfe0c7-fdde-45ba-8efe-c421aaca8bfe','Hoạt hình siêu khó','385ab80e-36fd-4e8f-a5db-4ee7ef5a2e42','/public/img/a9dfe0c7-fdde-45ba-8efe-c421aaca8bfe.png','Khóa học nâng cao của hoạt hình khó','Educators are enthusiastically taking up the opportunities that computer animation offers for depicting dynamic content. For example, PowerPoint now has an easy-to-use animation facility that, in the right hands, can produce very effective educational animations. Because animations can explicitly depict changes over time (temporal changes), they seem ideally suited to the teaching of processes and procedures. When used to present dynamic content, animations can mirror both the changes in position (translation), and the changes in form (transformation) that are fundamental to learning this type of subject matter.\r\n\r\nIn contrast with static pictures, animations can show temporal change directly (rather than having to indicate it indirectly using auxiliary markings such as arrows and motion lines). Using animations instead of static graphics removes the need for these added markings so that displays can be not only simpler and less cluttered, but also more vivid, engaging, and more intuitively comprehended. In addition, the learner does not have to interpret the auxiliary markings and try to infer the changes that they summarise. Such interpretation and inference may demand a level of graphicacy skills that the learner does not possess. With animated depictions, information about the changes involved is available to be read straight from the display without the learner needing to perform mental animation. It\'s a bit of an exaggeration, but it\'s more like being kissed instead of reading about a kiss.\r\n\r\n\r\nSome animations challenge the learner\'s processing capacities\r\nResearch evidence about the educational effectiveness of animations is mixed. Various investigations have compared the educational effectiveness of static and animated displays across a number of content domains. While there have been some findings that show positive effects of animations on learning, other studies have found no effects or even negative effects. Some propose that the efficacy depends on the way the animation characteristics engages the psychological functioning of the learner.[2] In general, it can be concluded that animations are not intrinsically more effective than static graphics. Rather, the particular characteristics of individual animations and how they are used to play a key role in the effects that they have on learning.',4,1,10,1,4000000,NULL,NULL,'2023-01-09 03:27:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('aa89c621-4553-45c2-8a05-7e3b7d48fe29','Lập trình web cho người mới bắt đầu','110b962e-041c-11e1-9234-0123456789ab','/public/img/aa89c621-4553-45c2-8a05-7e3b7d48fe29.png','Làm web đơn giản','Dành cho những người mới bắt đầu học web',4,1,5,1,600000,NULL,NULL,'2023-01-09 03:35:00',NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('cb3fb35f-5721-4116-82f6-33a7916bf2ef','Hoạt hình hơi khó','385ab80e-36fd-4e8f-a5db-4ee7ef5a2e42','/public/img/cb3fb35f-5721-4116-82f6-33a7916bf2ef.png','Khóa học hướng dẫn làm video hoạt hình đơn giản','Với khóa học này, bạn có thể tự làm một video hoạt hình ngắn 5\' từ đầu đến cuối trong vòng 14 ngày.',2,1,9,1,1000000,NULL,NULL,'2023-01-09 03:40:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('d1f4809b-ee26-4256-87e7-b3de0fd24e5a','Khiêu vũ cho người mới bắt đầu','94b2ac8e-c4c4-4871-8711-4a9a3f5f6025','/public/img/d1f4809b-ee26-4256-87e7-b3de0fd24e5a.png','Khóa học khiêu vũ trong 7 ngày để biến bạn từ tay mơ thành lão luyện','Khóa học khiêu vũ dành cho những ai có tâm hồn lãng mạn nhưng vẫn muốn có sức khỏe với giá cực kỳ ưu đãi',3,1,8,1,2000000,NULL,NULL,'2023-01-09 04:16:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('d589c621-4553-45c2-8a05-7e3b7d48fe29','Lập trình web với node.js','110b962e-041c-11e1-9234-0123456789ab','/public/img/d589c621-4553-45c2-8a05-7e3b7d48fe29.png','Lập trình web với node.js','Công cụ node.js với nhiều tính năng mới thích hợp cho các bạn mới học về web',0,0,1,0,1200000,NULL,NULL,'2023-01-09 05:16:00',NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('d63a1378-55c1-483f-b7f0-f0dbef46409f','Đánh đàn online','fd296b2e-6a96-4609-8339-a1c36b01712f','/public/img/d63a1378-55c1-483f-b7f0-f0dbef46409f.png','Giúp bạn thông thạo các phần mềm đánh đàn online','Smule is an American mobile app developer with headquarters in San Francisco.[2] The company specializes in developing social music-making and collaboration applications for iOS, Android, and Web.[1]\r\nThe company was founded in 2008 by Jeff Smith and Stanford assistant professor Ge Wang. \"Music was the original social network before Instagram and Facebook,\" said Smith, the co-founder and CEO of Smule. Wang commented that the goal of the apps was to draw users in and \"by the time they realize they\'re making music, \'it\'s too late — they\'re already having fun.\'\"[3] In December 2011, Smule acquired fellow music app developer Khush.[4] On July 31, 2013, Wang stepped down from his role at Smule to return to Stanford full-time.[5] Smule currently has 52 million monthly active users[citation needed]. Smule has raised $156.5 million to date, with Tencent leading their latest fundraising round. \"We wanted to bring music back to its social roots,\" Smith said. \"With mobile phones we make people more expressive and can we connect them to make them social together.\" The company raised $74 million in funding in 2018 from Tencent and Times Bridge, the VC wing of India media conglomerate The Times Group.[6]',4,1,7,1,200000,NULL,NULL,'2023-01-09 06:16:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('dd12c621-4553-45c2-8a05-7e3b7d48fe29','Lập trình web bán hàng','110b962e-041c-11e1-9234-0123456789ab','/public/img/dd12c621-4553-45c2-8a05-7e3b7d48fe29.png','Làm web bán hàng cá nhân','Dành cho những ai muốn kinh doanh với trang web bán hàng dành cho riêng bạn',0,0,0,0,750000,NULL,NULL,'2023-01-09 07:16:00',NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',1,0),('dd13c621-4553-45c2-8a05-7e3b7d48fe29','Tạo trang cá nhân để bán hàng','7b47291a-ec31-4def-812a-efaa1075486b','/public/img/dd13c621-4553-45c2-8a05-7e3b7d48fe29.png','Phát triển trang cá nhân để bán hàng','Phát triển một trang cá nhân toàn diện để bán hàng online',5,1,28,2,890000,NULL,NULL,'2023-01-09 12:16:00','2023-01-09 21:54:41','3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',1,1),('dd14c621-4553-45c2-8a05-7e3b7d48fe29','Yoga cho người mới','287caac6-b824-4f4c-9f2d-f8d7f08f3bb5','/public/img/dd14c621-4553-45c2-8a05-7e3b7d48fe29.png','Yoga nhập môn','Dành cho người bắt đầu học yoga',0,0,2,0,450000,NULL,NULL,'2023-01-09 12:13:00',NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('dd15c621-4553-45c2-8a05-7e3b7d48fe29','Bóng đá','94b2ac8e-c4c4-4871-8711-4a9a3f5f6025','/public/img/dd15c621-4553-45c2-8a05-7e3b7d48fe29.png','Bóng đá nhập môn','Các kỹ thuật cơ bản trong bóng đá',0,0,2,0,700000,650000,NULL,'2023-01-07 08:16:00',NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('dd16c621-4553-45c2-8a05-7e3b7d48fe29','Tiếp thị ngày nay','fa7508ce-a34d-4cd2-9476-500e84cfb954','/public/img/dd16c621-4553-45c2-8a05-7e3b7d48fe29.png','Tiếp thị ngày nay','Các hình thức tiếp thị với thời đại 4.0',0,0,7,1,1200000,1000000,NULL,'2023-01-09 15:16:00',NULL,'2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('dd17c621-4553-45c2-8a05-7e3b7d48fe29','Tìm hiểu thị hiếu của người dùng','c02ba921-85f0-4fd2-a862-34dde79e165f','/public/img/dd17c621-4553-45c2-8a05-7e3b7d48fe29.png','SEO nhập môn','Tìm hiểu nhu cầu của người dùng qua các công cụ tìm kiếm',0,0,2,0,750000,350000,NULL,'2023-01-09 06:16:00',NULL,'2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('dd18c621-4553-45c2-8a05-7e3b7d48fe29','Đánh đàn guitar','fd296b2e-6a96-4609-8339-a1c36b01712f','/public/img/dd18c621-4553-45c2-8a05-7e3b7d48fe29.png','Đánh đàn guitar cơ bản','Khóa làm màu để đi cua người yêu auto đổ',3,1,18,2,800000,200000,NULL,'2023-01-09 17:16:00',NULL,'2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0),('dd89c621-4553-45c2-8a05-7e3b7d48fe29','Cầu Lông (Khó)','1d040fab-0dff-40c7-8337-5d28acb1c691','/public/img/dd89c621-4553-45c2-8a05-7e3b7d48fe29.png','Khóa học cầu lông cho người mới bắt đầu','Dạy đánh cầu lông từ A->Z',3,1,5,1,500000,NULL,NULL,'2023-01-09 08:16:00',NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b',0,0);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `StudentID` varchar(36) NOT NULL,
  `CourseID` varchar(36) NOT NULL,
  `Feedback` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Rating` int DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `feedbacks_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES ('2301c5d3-c96c-47d5-98a5-83cc64293658','1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','qá hay',1,'2023-01-09 13:28:19'),('2301c5d3-c96c-47d5-98a5-83cc64293658','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','ok ong',5,'2023-01-09 13:24:08'),('2301c5d3-c96c-47d5-98a5-83cc64293658','2d9557e0-08a2-43c8-bbf9-d66973ba1c3a',' ',4,'2023-01-09 13:37:58'),('2301c5d3-c96c-47d5-98a5-83cc64293658','7f3991af-29e0-433a-a229-9dd4d549d4d2','ổn',2,'2023-01-09 13:35:26'),('2301c5d3-c96c-47d5-98a5-83cc64293658','a9dfe0c7-fdde-45ba-8efe-c421aaca8bfe','ok',4,'2023-01-09 13:29:07'),('2301c5d3-c96c-47d5-98a5-83cc64293658','cb3fb35f-5721-4116-82f6-33a7916bf2ef','.',2,'2023-01-09 13:37:07'),('2301c5d3-c96c-47d5-98a5-83cc64293658','d1f4809b-ee26-4256-87e7-b3de0fd24e5a','oke ông nhưng tui không học được gì',3,'2023-01-09 13:40:22'),('2301c5d3-c96c-47d5-98a5-83cc64293658','dd89c621-4553-45c2-8a05-7e3b7d48fe29','                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ',3,'2023-01-09 13:38:53'),('6a951f28-5833-495a-b8b5-d35fb2c5df87','7f3991af-29e0-433a-a229-9dd4d549d4d2','khóa học rất tệ',1,'2023-01-09 13:22:08'),('967ff946-aa54-4455-be35-4bb61e294f47','dd13c621-4553-45c2-8a05-7e3b7d48fe29','Xuất sắc! Quá tuyệt vời!',5,'2023-01-09 14:51:17'),('a5bad11e-49e5-4752-88a4-88090a21c9c8','d63a1378-55c1-483f-b7f0-f0dbef46409f','<div>\r\n<h1>\r\nHello !\r\n</h1>\r\n<p style=\"color:blue;\">Blue</p>\r\n</div>',4,'2023-01-09 13:59:09'),('a5bad11e-49e5-4752-88a4-88090a21c9c8','dd18c621-4553-45c2-8a05-7e3b7d48fe29','https://www.google.com/',3,'2023-01-09 14:00:56'),('b95fdf54-0077-4f91-9b71-4436dd48825b','4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Trước đây tôi làm mảng tài chính, lương ba cọc ba đồng không đủ ăn. Người yêu cũ cũng bỏ theo anh đồng nghiệp IT trong cơ quan. Lúc ấy tôi giận lắm. Nhưng cũng chính hắn ta là người đại khai nhãn giới cho tôi. Chỉ ra cho tôi thấy tầm vóc vĩ đại của lĩnh vực IT. Từ đó sáng đi làm, tối tôi ra trung tâm học code quyết tâm đổi đời.\r\nBan đầu tôi nghe cũng không tin lắm, nhưng nhìn thực tế chính người phụ nữ yêu tôi 6 năm cũng bị thằng này quyến rũ cái một, lòng tôi cũng muốn đăng kí học IT, dù gì thời điểm đó cuộc đời tôi vốn loser không có gì để mất.\r\nNghe lời hắn ta, mình cũng đi học dev được 3 tháng, thấy con người mình khác hẳn, lắng nghe được tiếng sóc kêu, cảm giác được tóc lưa thưa chạm vào trán, phân biệt được chất vải mặc trên ng hằng ngày. Vào thang máy mấy cô đồng nghiệp biết mình chuyển hướng sang CNTT thì bắt chuyện hỏi thăm, rủ đi cafe ... minh đi rồi còn nghe đằng sau họ bàn bạc hợp tác nhau để tán tỉnh mình.\r\nTrước đây mình vốn thiếu ngủ và ban đêm ngủ rất không ngon giấc, từ lúc chuyển sang lập trình, nhờ những dòng lệnh cài đặt sẵn, mình ngủ ngon hơn cả một đứa bé, mơ những giấc mơ tuyệt vời, góp phần làm cho cuộc sống mình thư thái hơn.\r\nVề ngoại hình, mình bị béo bụng do stress nhiều, mặt mũi lúc nào cũng đờ đẫn, mập nhưng yếu ngoe, không đánh đấm lại được ai … Chỉ sau một thời gian ngắn học về cơ sở dữ liệu, web và tháo lắp máy tính … Cơ bụng đã xuất hiện, múi nào ra múi nấy, rắn chắc hơn bao giờ hết. Nhờ những thuật toán chạy trong đầu, mình luôn tính toán được điểm yếu của đối phương, ra đòn quyết định. Các bao cát mình tập boxing phải thay liên tục từ ngày mình học IT.\r\nVới tất cả các thay đổi từ trong ra ngoài, từ thu nhập đến địa vị xã hội, tính cách, tình cảm, ngoại hình và sức khỏe đều theo hướng tích cực hơn, em xin chốt lại vấn đề muốn review : Những gì vozer tả về ngành CNTT cũng có đúng có sai, ngành nào có làm cũng mới có ăn. Lợi ích của IT là có nhưng không ảo như nhiểu vozer troll, cái gì cũng phải cố gắng, dấn thân, bản lĩnh đương đầu mới có thành quả.',5,'2023-01-09 14:03:39'),('b95fdf54-0077-4f91-9b71-4436dd48825b','7f3991af-29e0-433a-a229-9dd4d549d4d2','Nhờ khóa học này mà tôi đã có thể cầm bút vẽ :(',5,'2023-01-09 12:28:59'),('b95fdf54-0077-4f91-9b71-4436dd48825b','aa89c621-4553-45c2-8a05-7e3b7d48fe29','Có thể nói IT là vua của các nghề\r\n\r\nNgành IT Việt Nam hiện nay ở đầu của sự phát triển. Có thể nói IT là vua của các nghề. Vừa có tiền, có quyền. Vừa kiếm được nhiều $ lại được xã hội trọng vọng.\r\n\r\nThằng em mình học bách khoa cơ khí, bỏ ngang sang IT, sinh năm 96. Tự mày mò học code rồi đi làm remote cho công ty Mỹ 2 năm nay. Mỗi tối online 3-4 giờ là xong việc. Lương tháng 3k6. Nhưng thu nhập chính vẫn là từ nhận các project bên ngoài làm thêm. Tuần làm 2,3 cái nhẹ nhàng 9,10k tiền tươi thóc thật không phải đóng thuế. Làm gần được 3 năm mà nhà xe nó đã mua đủ cả. Nghĩ mà thèm.\r\n\r\nGái gú thì cứ nghe nó bảo làm CNTT thì chảy nước. Có bé kia dân du học sinh Úc, về được cô chị giới thiệu làm ngân hàng VCB. Thế nào thằng ấy đi mở thẻ tín dụng gặp phải thế là hốt được cả chị lẫn em. 3 đứa nó sống chung một căn hộ cao cấp. Nhà con bé kia biết chuyện ban đầu phản đối sau biết thằng đấy học IT thì đổi thái độ, cách ba bữa hỏi thăm, năm bữa tặng quà giục cưới kẻo lỡ kèo. Đáng lẽ tháng này là đám cưới tụi nó nhưng dính covid nên dời lại cuối năm rồi.',4,'2023-01-09 13:59:40');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `LecID` varchar(36) NOT NULL,
  `LecName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Experience` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `AboutMe` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`LecID`),
  CONSTRAINT `lecturers_ibfk_1` FOREIGN KEY (`LecID`) REFERENCES `accounts` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES ('1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Nguyễn Trịnh Như Ý','Sinh viên tốt nghiệp xuất sắc KHTN','Thông minh và thân thiện'),('2ba09709-9968-4f9f-ba6b-468a40bddeb4','Nguyễn Duy','Sinh viên năm 3',''),('2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Trần Nhật Trường','Thủ khoa Khoa học máy tính','Ngài'),('3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Phạm Ngọc Anh Thư','Đại ca quận ktx Trần Hưng Đạo','trùm hay khóc'),('feb131f8-d151-4259-82cb-d2250506dfc8','Hà Quốc Anh','Đại ca quận Phú Nhuận',NULL);
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `sid` varchar(255) NOT NULL,
  `sess` json NOT NULL,
  `expired` datetime NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `sessions_expired_index` (`expired`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('_AGqb_zn4ovIMWcXC8D6hYDfnY07TaC3','{\"cookie\": {\"path\": \"/\", \"expires\": null, \"httpOnly\": true, \"originalMaxAge\": null}}','2023-01-12 13:08:56'),('0bE9Ty3FRlrbbNFDaUIdTzcQQUuJNDOG','{\"auth\": false, \"cookie\": {\"path\": \"/\", \"expires\": null, \"httpOnly\": true, \"originalMaxAge\": null}, \"retUrl\": \"http://localhost:3000/account/signin\", \"authUser\": null}','2023-01-12 13:28:24'),('1DLzIZ3TfeFQnD6HUVAVUw3j82R9fAhW','{\"cookie\": {\"path\": \"/\", \"expires\": null, \"httpOnly\": true, \"originalMaxAge\": null}}','2023-01-11 16:10:36'),('jE9VaPR-9w_jq0vD3kX-L6LYIbhzZQ0A','{\"auth\": true, \"cookie\": {\"path\": \"/\", \"expires\": null, \"httpOnly\": true, \"originalMaxAge\": null}, \"authUser\": {\"name\": \"Phạm Ngọc Anh Thư\", \"email\": \"20127343@student.hcmus.edu.vn\", \"aboutme\": \"trùm hay khóc\", \"accountid\": \"3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b\", \"experience\": \"Chuyên gia phân tích tài chính\", \"permission\": 1, \"lockaccount\": 0}}','2023-01-12 03:47:45'),('KlO6qdRJXYVdVzMKXEwFgp-XjVhA3558','{\"auth\": true, \"cookie\": {\"path\": \"/\", \"expires\": null, \"httpOnly\": true, \"originalMaxAge\": null}, \"authUser\": {\"name\": \"test\", \"email\": \"test@gmail.com\", \"accountid\": \"b95fdf54-0077-4f91-9b71-4436dd48825b\", \"permission\": 0, \"lockaccount\": 0}}','2023-01-12 05:17:30'),('VgDlSdB43S2VjQo_t23jZK7dIVIOEWS2','{\"auth\": true, \"cookie\": {\"path\": \"/\", \"expires\": null, \"httpOnly\": true, \"originalMaxAge\": null}, \"authUser\": {\"name\": \"Trương Samuel\", \"email\": \"sam@gmail.com\", \"accountid\": \"6a951f28-5833-495a-b8b5-d35fb2c5df87\", \"permission\": 0, \"lockaccount\": 0}}','2023-01-12 10:28:17'),('VkAZXgl2aCiH3_bE1SZOKAVAZhk1UDAZ','{\"cookie\": {\"path\": \"/\", \"expires\": null, \"httpOnly\": true, \"originalMaxAge\": null}}','2023-01-12 08:23:13');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentcourses`
--

DROP TABLE IF EXISTS `studentcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentcourses` (
  `StudentID` varchar(36) NOT NULL,
  `CourseID` varchar(36) NOT NULL,
  PRIMARY KEY (`StudentID`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `studentcourses_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `studentcourses_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentcourses`
--

LOCK TABLES `studentcourses` WRITE;
/*!40000 ALTER TABLE `studentcourses` DISABLE KEYS */;
INSERT INTO `studentcourses` VALUES ('2301c5d3-c96c-47d5-98a5-83cc64293658','1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('2301c5d3-c96c-47d5-98a5-83cc64293658','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('2301c5d3-c96c-47d5-98a5-83cc64293658','2d9557e0-08a2-43c8-bbf9-d66973ba1c3a'),('b95fdf54-0077-4f91-9b71-4436dd48825b','4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('2301c5d3-c96c-47d5-98a5-83cc64293658','7f3991af-29e0-433a-a229-9dd4d549d4d2'),('6a951f28-5833-495a-b8b5-d35fb2c5df87','7f3991af-29e0-433a-a229-9dd4d549d4d2'),('b95fdf54-0077-4f91-9b71-4436dd48825b','7f3991af-29e0-433a-a229-9dd4d549d4d2'),('2301c5d3-c96c-47d5-98a5-83cc64293658','a9dfe0c7-fdde-45ba-8efe-c421aaca8bfe'),('b95fdf54-0077-4f91-9b71-4436dd48825b','aa89c621-4553-45c2-8a05-7e3b7d48fe29'),('2301c5d3-c96c-47d5-98a5-83cc64293658','cb3fb35f-5721-4116-82f6-33a7916bf2ef'),('2301c5d3-c96c-47d5-98a5-83cc64293658','d1f4809b-ee26-4256-87e7-b3de0fd24e5a'),('a5bad11e-49e5-4752-88a4-88090a21c9c8','d63a1378-55c1-483f-b7f0-f0dbef46409f'),('967ff946-aa54-4455-be35-4bb61e294f47','dd13c621-4553-45c2-8a05-7e3b7d48fe29'),('b95fdf54-0077-4f91-9b71-4436dd48825b','dd13c621-4553-45c2-8a05-7e3b7d48fe29'),('a5bad11e-49e5-4752-88a4-88090a21c9c8','dd16c621-4553-45c2-8a05-7e3b7d48fe29'),('a5bad11e-49e5-4752-88a4-88090a21c9c8','dd18c621-4553-45c2-8a05-7e3b7d48fe29'),('b95fdf54-0077-4f91-9b71-4436dd48825b','dd18c621-4553-45c2-8a05-7e3b7d48fe29'),('2301c5d3-c96c-47d5-98a5-83cc64293658','dd89c621-4553-45c2-8a05-7e3b7d48fe29');
/*!40000 ALTER TABLE `studentcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` varchar(36) NOT NULL,
  `StudentName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `accounts` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('15637ec4-c85f-11ea-87d0-0242ac130003','Trương Samuel'),('2301c5d3-c96c-47d5-98a5-83cc64293658','Mai Quý Trung'),('25637ec4-c85f-11ea-87d0-0242ac130003','Huỳnh Cao Nguyên'),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','testyahoo'),('6a951f28-5833-495a-b8b5-d35fb2c5df87','Trương Samuel'),('6cf0f452-a848-4684-bcb4-1f42fc4353ab','Test'),('85182197-937e-4e35-8e74-c0568657ee89','Phuc Tran'),('901dd881-1338-4329-a9e0-0497ccfd54c2','cien'),('967ff946-aa54-4455-be35-4bb61e294f47','Như Ý Nguyễn Trịnh'),('a5bad11e-49e5-4752-88a4-88090a21c9c8','Trần Nhật Trường'),('b95fdf54-0077-4f91-9b71-4436dd48825b','test1'),('d3a17fae-e896-41bb-bc42-cc04641cbafd','');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentwatchcontent`
--

DROP TABLE IF EXISTS `studentwatchcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentwatchcontent` (
  `StudentID` varchar(36) NOT NULL,
  `ContentID` varchar(36) NOT NULL,
  PRIMARY KEY (`StudentID`,`ContentID`),
  KEY `ContentID` (`ContentID`),
  CONSTRAINT `studentwatchcontent_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `studentwatchcontent_ibfk_2` FOREIGN KEY (`ContentID`) REFERENCES `chaptercontent` (`ContentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentwatchcontent`
--

LOCK TABLES `studentwatchcontent` WRITE;
/*!40000 ALTER TABLE `studentwatchcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentwatchcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlists`
--

DROP TABLE IF EXISTS `watchlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlists` (
  `StudentID` varchar(36) NOT NULL,
  `CourseID` varchar(36) NOT NULL,
  PRIMARY KEY (`StudentID`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `watchlists_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `watchlists_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlists`
--

LOCK TABLES `watchlists` WRITE;
/*!40000 ALTER TABLE `watchlists` DISABLE KEYS */;
INSERT INTO `watchlists` VALUES ('15637ec4-c85f-11ea-87d0-0242ac130003','1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('25637ec4-c85f-11ea-87d0-0242ac130003','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('b95fdf54-0077-4f91-9b71-4436dd48825b','2d9557e0-08a2-43c8-bbf9-d66973ba1c3a'),('2301c5d3-c96c-47d5-98a5-83cc64293658','4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('b95fdf54-0077-4f91-9b71-4436dd48825b','a9dfe0c7-fdde-45ba-8efe-c421aaca8bfe'),('6a951f28-5833-495a-b8b5-d35fb2c5df87','cb3fb35f-5721-4116-82f6-33a7916bf2ef'),('b95fdf54-0077-4f91-9b71-4436dd48825b','cb3fb35f-5721-4116-82f6-33a7916bf2ef');
/*!40000 ALTER TABLE `watchlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-11 22:24:52
