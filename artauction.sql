-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: localhost    Database: artauction
-- ------------------------------------------------------
-- Server version	8.0.39

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
  `userID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `emailAddress` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'John Doe','john.doe@email.com','System Administrator'),(2,'Sarah Smith','sarah.smith@email.com','Privacy Administrator'),(3,'Michael Johnson','mike.johnson@email.com','Security Administrator'),(4,'Emily Brown','emily.brown@email.com','Content Administrator');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artimage`
--

DROP TABLE IF EXISTS `artimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artimage` (
  `artworkID` int NOT NULL,
  `imageID` int NOT NULL,
  PRIMARY KEY (`artworkID`),
  KEY `imageID` (`imageID`),
  CONSTRAINT `artimage_ibfk_1` FOREIGN KEY (`imageID`) REFERENCES `image` (`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artimage`
--

LOCK TABLES `artimage` WRITE;
/*!40000 ALTER TABLE `artimage` DISABLE KEYS */;
INSERT INTO `artimage` VALUES (1,1),(10,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10);
/*!40000 ALTER TABLE `artimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork` (
  `artworkID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `artist` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`artworkID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
INSERT INTO `artwork` VALUES (1,'Dancing in the Rain','An impressionistic piece capturing the joy of dancing in a summer rain shower. Created using oil paints with vibrant blues and purples.','Emily Chen'),(2,'Urban Solitude','A contemporary urban landscape showing a quiet city street at dawn. Painted in muted tones with watercolor and ink.','Marcus Rodriguez'),(3,'Wildflower Dreams','Abstract representation of a wildflower meadow in spring. Mixed media piece combining acrylics and pressed flowers.','Sarah O\'Connor'),(4,'Digital Dystopia','Digital art piece exploring themes of technology and isolation in modern society. Created using 3D modeling and digital painting.','Alex Kim'),(5,'Mountain Whispers','Traditional landscape painting of the Rocky Mountains at sunset. Oil on canvas with detailed foreground elements.','James Morrison'),(6,'Fragments of Memory','Abstract collage combining photography and paint to explore themes of memory and time. Mixed media on canvas.','Lisa Wong'),(7,'Ocean\'s Symphony','Large-scale seascape capturing the power and movement of ocean waves. Created with oil paints in various shades of blue.','David Thompson'),(8,'Neon Dreams','Contemporary piece featuring bright neon colors and geometric patterns. Acrylic and spray paint on canvas.','Maria Garcia'),(9,'Silent Forest','Minimalist representation of a winter forest scene. Created using charcoal and white chalk on toned paper.','Thomas Wright'),(10,'Cultural Fusion','Mixed media artwork combining traditional Eastern patterns with Western abstract expressionism. Incorporates gold leaf and acrylics.','Yuki Tanaka');
/*!40000 ALTER TABLE `artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `userID` int NOT NULL,
  `artworkID` int NOT NULL,
  PRIMARY KEY (`userID`,`artworkID`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,1),(2,2),(3,3),(4,4),(4,11),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctiondetails`
--

DROP TABLE IF EXISTS `auctiondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctiondetails` (
  `artworkID` int NOT NULL AUTO_INCREMENT,
  `startTimestamp` timestamp NOT NULL,
  `endTimestamp` timestamp NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `startingPrice` decimal(10,2) NOT NULL,
  `reserve` decimal(10,2) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`artworkID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctiondetails`
--

LOCK TABLES `auctiondetails` WRITE;
/*!40000 ALTER TABLE `auctiondetails` DISABLE KEYS */;
INSERT INTO `auctiondetails` VALUES (1,'2024-11-19 18:00:00','2024-12-23 18:00:00',1500.00,1000.00,1200.00,'ACTIVE'),(2,'2024-11-19 18:00:00','2024-12-03 18:00:00',2000.00,1500.00,1800.00,'SOLD'),(3,'2024-11-19 18:00:00','2024-12-23 18:00:00',NULL,2000.00,2500.00,'ACTIVE'),(4,'2024-11-19 18:00:00','2024-12-23 18:00:00',NULL,1800.00,2000.00,'ACTIVE'),(5,'2024-11-19 18:00:00','2024-12-03 18:00:00',2600.00,2500.00,2800.00,'RESERVE NOT MET'),(6,'2024-11-19 18:00:00','2024-12-23 18:00:00',NULL,1200.00,1500.00,'ACTIVE'),(7,'2024-11-19 18:00:00','2024-12-23 18:00:00',NULL,2200.00,2500.00,'ACTIVE'),(8,'2024-11-20 18:00:00','2024-12-03 18:00:00',2800.00,2000.00,2500.00,'UNSOLD'),(9,'2024-11-19 18:00:00','2024-12-28 18:20:00',NULL,1500.00,1800.00,'ACTIVE'),(10,'2024-11-17 18:00:00','2024-12-28 18:00:00',NULL,1700.00,2000.00,'ACTIVE');
/*!40000 ALTER TABLE `auctiondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `userID` int NOT NULL,
  `artworkID` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bidAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`userID`,`artworkID`,`timestamp`),
  KEY `auctionDetailsID` (`artworkID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`artworkID`) REFERENCES `auctiondetails` (`artworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,1,'2024-11-19 20:00:00',1100.00),(2,1,'2024-11-19 21:00:00',1200.00),(3,1,'2024-11-19 22:00:00',1500.00),(4,2,'2024-11-19 20:00:00',1600.00),(5,2,'2024-11-19 21:00:00',1800.00),(6,2,'2024-11-19 22:00:00',2000.00),(6,8,'2024-11-19 20:00:00',2800.00),(7,5,'2024-11-19 20:00:00',2600.00),(8,5,'2024-11-19 21:00:00',2800.00),(9,5,'2024-11-19 22:00:00',3000.00);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `userID` int NOT NULL,
  `artworkID` int NOT NULL,
  PRIMARY KEY (`userID`,`artworkID`),
  KEY `artworkID` (`artworkID`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`artworkID`) REFERENCES `artwork` (`artworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (2,1),(1,2),(1,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `followerID` int NOT NULL,
  `followingID` int NOT NULL,
  PRIMARY KEY (`followerID`,`followingID`),
  KEY `followingID` (`followingID`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`followerID`) REFERENCES `user` (`userID`),
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`followingID`) REFERENCES `user` (`userID`),
  CONSTRAINT `follow_chk_1` CHECK ((`followerID` <> `followingID`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (2,1),(4,1),(6,1),(4,2),(6,2),(8,2),(10,2),(1,3),(10,3),(2,4),(6,4),(10,4),(4,6),(7,6),(2,7),(4,7),(6,7),(8,7),(1,8),(1,9),(2,9),(6,9),(4,10),(7,10),(8,10);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `imageID` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `uploaderID` int DEFAULT NULL,
  PRIMARY KEY (`imageID`),
  UNIQUE KEY `filename` (`filename`),
  KEY `uploaderID` (`uploaderID`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`uploaderID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'art-10-2467580-HSC00001-7.jpg',1),(2,'art-1-5NRmIQHz.jpg',3),(3,'art-11-images.jpg',3),(4,'art-3-PjEcbylw.jpg',5),(5,'art-4-Kcgd4weU.jpg',5),(6,'art-5-o6dBd600.jpg',6),(7,'art-6-r2lPywol.jpg',6),(8,'art-7-F2uWnkV1.jpg',7),(9,'art-8-evk9wj9J.jpg',7),(10,'art-9-64ebf4RM.jpg',8),(11,'profile-pic-0-KspewSnw.jpg',1),(12,'profile-pic-1-ZeBM90Sw.jpg',2),(13,'profile-pic-2-LZM2PdOD.jpg',3),(14,'profile-pic-3-8ilzL4dz.jpg',4),(15,'profile-pic-4-cYG3BuZ2.jpg',5),(16,'profile-pic-5-h5mqegh2.jpg',6),(17,'profile-pic-6-Qjt95p3G.jpg',7),(18,'profile-pic-7-17KKLjiL.jpg',8),(19,'profile-pic-8-RYPfQSGn.jpg',8),(20,'profile-pic-9-mH33ltOO.jpg',9),(21,'art-kvM2Bog4-images.jpeg',4);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `userID` int NOT NULL,
  `orderID` int NOT NULL,
  PRIMARY KEY (`userID`,`orderID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (6,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `orderID` int NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `trackingNumber` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `totalPaid` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,'2024-12-03 19:10:00','TRK123456','PROCESSING',2000.00);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `artworkID` int NOT NULL,
  PRIMARY KEY (`orderID`,`artworkID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,2);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profilepicture`
--

DROP TABLE IF EXISTS `profilepicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profilepicture` (
  `userID` int NOT NULL,
  `imageID` int NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `imageID` (`imageID`),
  CONSTRAINT `profilepicture_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `profilepicture_ibfk_2` FOREIGN KEY (`imageID`) REFERENCES `image` (`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profilepicture`
--

LOCK TABLES `profilepicture` WRITE;
/*!40000 ALTER TABLE `profilepicture` DISABLE KEYS */;
INSERT INTO `profilepicture` VALUES (4,11),(1,12),(2,12),(5,13),(6,14),(3,15),(7,16),(8,17),(9,18),(10,19);
/*!40000 ALTER TABLE `profilepicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `artworkID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`artworkID`,`name`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`artworkID`) REFERENCES `artwork` (`artworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'landscape'),(1,'sunset'),(2,'abstract'),(3,'nature'),(4,'urban'),(5,'nature'),(6,'seascape'),(7,'digital'),(8,'flowers'),(9,'space');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `emailAddress` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `displayName` varchar(50) DEFAULT NULL,
  `address` text,
  `anonymous` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john.doe@email.com','38c5ae2bcd1f12aa269e45ae8c8762f030630a5137dd6d1c799c019626f33096','John Doe','JohnD','123 Main St, New York, NY 10001',0),(2,'sarah.smith@email.com','ea76b1e251a0c876b3d96d2c81f12736df3bed36ecb293f79c493c089924cbdc','Sarah Smith','SarahS','456 Oak Avenue, Los Angeles, CA 90001',0),(3,'mike.johnson@email.com','12313e7066d59b17cb8387c4d27ef847e39bc7b23ec48c9bbb6a08bac39252f3','Michael Johnson','MikeJ','789 Pine Road, Chicago, IL 60601',0),(4,'emily.brown@email.com','334ddbbc1437d63a0bf14657fb9c584d6af8697701c726febb7d8a833d9bdf27','Emily Brown','Em_Brown','321 Maple Lane, Houston, TX 77001',0),(5,'anonymous_user_1@email.com','43eb28aba4577b8655cca86b084c8421660e50c40cdc1a3aad61dea941fdca05','Anonymous User','Anon1',NULL,1),(6,'david.wilson@email.com','e3af2e502923051d802c608b7b7b31cbc978883f06cde3eb7bc0154e28a3e539','David Wilson','Dave_W','741 Beach Blvd, Miami, FL 33101',0),(7,'lisa.garcia@email.com','ad395fe6c161f463caebc59851ce565ad032ff30e3c71cd04a5356ebe05a4eb5','Lisa Garcia','LisaG','852 Hill Street, Seattle, WA 98101',0),(8,'robert.taylor@email.com','c62bb6b2345916b31d96d21b6d0a305936895bb8eef035cd15404cbd5fd4fb22','Robert Taylor','Rob_T','963 Valley Road, Boston, MA 02101',0),(9,'anonymous_user_2@email.com','1a17e7d0d8c634f6812090d7dd1b5c7161e409c4ac5806c1197664345b8bc3e8','Anonymous User 2','Anon2',NULL,1),(10,'michelle.lee@email.com','2811ee3c73ce17dfd398133f7207d4f8d7edbb97a54013880bf8fef8d930be2b','Michelle Lee','MichelleL','159 River Drive, San Francisco, CA 94101',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 22:27:10
