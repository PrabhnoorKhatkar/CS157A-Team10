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
  `role` varchar(100) NOT NULL,
  `referralCode` varchar(50) NOT NULL,
  `referralCodeUsed` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `admin_pk` (`referralCode`),
  KEY `referralCode_fk` (`referralCodeUsed`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `referralCode_fk` FOREIGN KEY (`referralCodeUsed`) REFERENCES `admin` (`referralCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'System Administrator','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(2,'Privacy Administrator','szd9x9d5aok0fke67qrut94kd8dvfaif','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(3,'Security Administrator','lmlu3jjbkqx37lnjc71zn9vm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(4,'Content Administrator','hpbni89izmfxau7h94yvn99gpzyqn2yg','lmlu3jjbkqx37lnjc71zn9vm9zl2jx2m'),(5,'Content Administrator','lmlu3jjbkqx37lnjc71df9343m9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(6,'Content Administrator','lmlu387jhqx37lnjc71zn9vm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(7,'Content Administrator','lmlu3jjbkqx37ln242bsidsdsdsl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(8,'Content Administrator','lmldsdskj83ds7lnjc71zn9vm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(9,'Content Administrator','lmlu3jjbkqx37lnjc71zn9vmr3uhdkjndf','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(10,'Content Administrator','lmlu3jj23484jnsdhgssdf9vm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(11,'Content Administrator','3usdjnisdgqx37lnjc71zn9vm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(12,'Content Administrator','8hsdjnsdoija37lnjc71zn9vm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(13,'Content Administrator','lmlu3jjbkqia9sdkjndsuinavm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(14,'Content Administrator','lmlu3jjb9djsdsiubas9vm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv'),(15,'Content Administrator','lmlu3jj9ns9nsdfjndfsdfs9vm9zl2jx2m','vs9nlgiyjxiwdzeh1g3r1wtsenhrxyuv');
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
INSERT INTO `artimage` VALUES (1,1),(10,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(11,22),(12,23),(13,24),(14,25),(15,26),(16,32),(17,33),(18,34),(19,35),(20,36),(21,37),(22,38);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
INSERT INTO `artwork` VALUES (1,'Dancing in the Rain','An impressionistic piece capturing the joy of dancing in a summer rain shower. Created using oil paints with vibrant blues and purples.','Emily Chen'),(2,'Urban Solitude','A contemporary urban landscape showing a quiet city street at dawn. Painted in muted tones with watercolor and ink.','Marcus Rodriguez'),(3,'Wildflower Dreams','Abstract representation of a wildflower meadow in spring. Mixed media piece combining acrylics and pressed flowers.','Sarah O\'Connor'),(4,'Digital Dystopia','Digital art piece exploring themes of technology and isolation in modern society. Created using 3D modeling and digital painting.','Alex Kim'),(5,'Mountain Whispers','Traditional landscape painting of the Rocky Mountains at sunset. Oil on canvas with detailed foreground elements.','James Morrison'),(6,'Fragments of Memory','Abstract collage combining photography and paint to explore themes of memory and time. Mixed media on canvas.','Lisa Wong'),(7,'Ocean\'s Symphony','Large-scale seascape capturing the power and movement of ocean waves. Created with oil paints in various shades of blue.','David Thompson'),(8,'Neon Dreams','Contemporary piece featuring bright neon colors and geometric patterns. Acrylic and spray paint on canvas.','Maria Garcia'),(9,'Silent Forest','Minimalist representation of a winter forest scene. Created using charcoal and white chalk on toned paper.','Thomas Wright'),(10,'Cultural Fusion','Mixed media artwork combining traditional Eastern patterns with Western abstract expressionism. Incorporates gold leaf and acrylics.','Yuki Tanaka'),(11,'Minimalism Nature','Minimalism take on nature and trees','Zachariah Wilkinson'),(12,'Glass Fish','Mosaic Fish made with glass tiles','Lara Golden'),(13,'Marble Blue','Marble pattern blue shades, modern abstract elegant brushstrokes','Buck Barrett'),(14,'Boots','Boots','Jackson Christian'),(15,'Bird over water','White seagull over water body','Randi Donovan'),(16,'Colorful Shoes','Colorful shoes oil painting','Kyle Hess'),(17,'Tales of Women','Abstract art of women, oil painting','Neil Rosario'),(18,'Divine Love','Abstract art','Melody Lynn'),(19,'Peaceful Village Town','Peaceful Village Town with a night sky in background','Allen Alexander'),(20,'Scared Bunny','Bunny and Bear in forest, on a oil water painting','Charlene Simmons'),(21,'Brush Color','Colorful, vibrant brushstrokes modern art','Tonia Barrett'),(22,'African Ladies','African ladies depicted with fruits on their heads','Deana Gibson');
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
INSERT INTO `auction` VALUES (1,1),(2,2),(2,17),(3,3),(4,4),(5,5),(6,6),(7,7),(7,16),(8,8),(9,9),(10,10),(11,11),(11,19),(11,20),(12,12),(12,21),(13,13),(13,18),(14,14),(15,15),(15,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctiondetails`
--

LOCK TABLES `auctiondetails` WRITE;
/*!40000 ALTER TABLE `auctiondetails` DISABLE KEYS */;
INSERT INTO `auctiondetails` VALUES (1,'2024-11-19 18:00:00','2024-12-11 18:00:00',1500.00,1000.00,1200.00,'SOLD'),(2,'2024-11-19 18:00:00','2024-12-03 18:00:00',2000.00,1500.00,1800.00,'SOLD'),(3,'2024-11-19 18:00:00','2024-12-11 18:00:00',2600.00,2000.00,2500.00,'SOLD'),(4,'2024-11-19 18:00:00','2024-12-09 18:00:00',3500.00,1800.00,2000.00,'SOLD'),(5,'2024-11-19 18:00:00','2024-12-03 18:00:00',2600.00,2500.00,2800.00,'RESERVE NOT MET'),(6,'2024-11-19 18:00:00','2024-12-11 18:00:00',2654.00,1200.00,1500.00,'SOLD'),(7,'2024-11-19 18:00:00','2024-12-11 18:00:00',2933.00,2200.00,2500.00,'SOLD'),(8,'2024-11-20 18:00:00','2024-12-03 18:00:00',2800.00,2000.00,2500.00,'SOLD'),(9,'2024-11-19 18:00:00','2024-12-11 18:20:00',10000.00,1500.00,1800.00,'SOLD'),(10,'2024-11-17 18:00:00','2024-12-11 18:00:00',5644.00,1700.00,2000.00,'SOLD'),(11,'2024-12-06 08:44:57','2024-12-11 08:44:57',1200.00,750.00,1100.00,'SOLD'),(12,'2024-12-10 08:46:07','2024-12-11 08:46:07',6555.00,1200.00,2500.00,'SOLD'),(13,'2024-12-10 08:49:41','2024-12-11 08:46:07',7777.00,1.00,5000.00,'SOLD'),(14,'2024-12-02 08:50:55','2024-12-11 08:46:07',4500.00,100.00,250.00,'SOLD'),(15,'2024-12-10 08:51:59','2024-12-11 08:46:07',100000.00,10000.00,20000.00,'SOLD'),(16,'2024-12-07 10:01:02','2024-12-11 08:46:07',12000.00,100.00,2000.00,'SOLD'),(17,'2024-12-04 10:02:16','2024-12-11 08:46:07',1000.00,750.00,999.00,'SOLD'),(18,'2024-12-12 10:03:22','2025-01-01 10:03:22',NULL,1750.00,3500.00,'ACTIVE'),(19,'2024-12-12 10:04:42','2025-01-01 10:04:42',NULL,7000.00,7777.00,'ACTIVE'),(20,'2024-12-04 10:05:57','2024-12-22 10:05:57',NULL,5000.00,10000.00,'ACTIVE'),(21,'2024-12-04 10:07:03','2025-01-01 10:07:03',NULL,1000.00,2000.00,'ACTIVE'),(22,'2024-12-12 10:08:05','2025-01-01 10:08:05',NULL,12000.00,15000.00,'ACTIVE');
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
INSERT INTO `bid` VALUES (2,1,'2024-11-19 20:00:00',1100.00),(2,1,'2024-11-19 21:00:00',1200.00),(3,1,'2024-11-19 22:00:00',1500.00),(4,2,'2024-11-19 20:00:00',1600.00),(5,2,'2024-11-19 21:00:00',1800.00),(6,2,'2024-11-19 22:00:00',2000.00),(6,8,'2024-11-19 20:00:00',2800.00),(6,10,'2024-12-02 19:00:00',5644.00),(7,5,'2024-11-19 20:00:00',2600.00),(7,11,'2024-12-06 18:00:00',1200.00),(7,12,'2024-12-10 20:00:00',6555.00),(7,13,'2024-12-10 20:00:00',7777.00),(7,14,'2024-12-08 20:00:00',4500.00),(7,15,'2024-12-10 20:00:00',100000.00),(7,17,'2024-12-09 20:00:00',1000.00),(8,5,'2024-11-19 21:00:00',2800.00),(8,6,'2024-12-02 18:00:00',2654.00),(8,7,'2024-12-02 18:00:00',2933.00),(9,5,'2024-11-19 22:00:00',3000.00),(9,16,'2024-12-09 20:00:00',12000.00),(11,4,'2024-12-02 18:00:00',3500.00),(12,3,'2024-12-02 18:00:00',2600.00),(14,8,'2024-12-02 10:00:00',2800.00),(14,9,'2024-12-02 17:00:00',10000.00);
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
INSERT INTO `favorite` VALUES (2,1),(8,1),(15,1),(1,2),(9,2),(14,2),(1,3),(2,3),(9,3),(3,4),(10,4),(15,4),(1,5),(3,5),(4,5),(2,6),(5,6),(11,6),(4,7),(6,7),(10,7),(7,8),(12,8),(3,9),(5,9),(8,9),(11,9),(4,10),(9,10),(13,10),(6,11),(10,11),(12,11),(11,12),(14,12),(5,13),(7,13),(12,13),(13,13),(6,14),(13,14),(15,14),(7,15),(8,15),(14,15);
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
INSERT INTO `follow` VALUES (2,1),(4,1),(6,1),(11,1),(13,1),(4,2),(6,2),(8,2),(10,2),(11,2),(14,2),(15,2),(1,3),(10,3),(11,3),(15,3),(2,4),(6,4),(10,4),(12,4),(13,4),(15,4),(12,5),(15,5),(4,6),(7,6),(11,6),(13,6),(2,7),(4,7),(6,7),(8,7),(13,7),(14,7),(1,8),(12,8),(13,8),(14,8),(1,9),(2,9),(6,9),(11,9),(14,9),(4,10),(7,10),(8,10),(12,10),(14,10),(1,11),(6,11),(15,11),(2,12),(7,12),(11,12),(3,13),(8,13),(12,13),(4,14),(9,14),(13,14),(5,15),(10,15),(14,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'art-10-2467580-HSC00001-7.jpg',1),(2,'art-1-5NRmIQHz.jpg',3),(3,'art-11-images.jpg',3),(4,'art-3-PjEcbylw.jpg',5),(5,'art-4-Kcgd4weU.jpg',5),(6,'art-5-o6dBd600.jpg',6),(7,'art-6-r2lPywol.jpg',6),(8,'art-7-F2uWnkV1.jpg',7),(9,'art-8-evk9wj9J.jpg',7),(10,'art-9-64ebf4RM.jpg',8),(11,'profile-pic-0-KspewSnw.jpg',1),(12,'profile-pic-1-ZeBM90Sw.jpg',2),(13,'profile-pic-2-LZM2PdOD.jpg',3),(14,'profile-pic-3-8ilzL4dz.jpg',4),(15,'profile-pic-4-cYG3BuZ2.jpg',5),(16,'profile-pic-5-h5mqegh2.jpg',6),(17,'profile-pic-6-Qjt95p3G.jpg',7),(18,'profile-pic-7-17KKLjiL.jpg',8),(19,'profile-pic-8-RYPfQSGn.jpg',8),(20,'profile-pic-9-mH33ltOO.jpg',9),(21,'art-kvM2Bog4-images.jpeg',4),(22,'art-Xl6ePW6J-boho-art-7289600_1280.jpeg',6),(23,'art-CmDR6Iq9-mosaic-200864_1280.jpg',6),(24,'art-HqWULmSX-marbling-8620587_1280.jpeg',6),(25,'art-aD062T7e-boots-8338072_1280.jpg',6),(26,'art-JYJFWBLm-bird-3342446_1280.jpeg',6),(27,'profile-pic-6UAU9Jxu-images (3).jpeg',11),(28,'profile-pic-dZQgILQU-images (2).jpeg',12),(29,'profile-pic-k8HMwZUW-images (1).jpeg',13),(30,'profile-pic-c1APPKPG-images.jpeg',14),(31,'profile-pic-IJXys0Yp-download.jpeg',15),(32,'art-cGYvqqtK-concept-art-8338074_1280.jpg',6),(33,'art-VEj8scY1-art-1905711_1280.jpg',6),(34,'art-PTSgt9bh-art-8324765_1280.jpeg',6),(35,'art-BFn6vdmS-art-8396377_1280.jpeg',6),(36,'art-YMRt2Lcs-forest-7383165_1280.jpeg',6),(37,'art-zdqUgszG-colourful-4804818_1280.jpeg',6),(38,'art-t6xMvUNR-african-art-1732252_1280.jpeg',6);
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
INSERT INTO `order` VALUES (3,1),(6,2),(6,9),(7,10),(7,11),(7,12),(7,13),(7,14),(7,16),(8,5),(8,6),(9,15),(11,4),(12,3),(14,7),(14,8);
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
INSERT INTO `orderdetails` VALUES (1,'2024-12-03 19:10:00','TRK34567812US','PROCESSING',2000.00),(2,'2024-12-03 18:00:00','TRK23456789US','PROCESSING',2700.00),(3,'2024-12-11 18:00:00','TRK9876543US','PROCESSING',3360.00),(4,'2024-12-11 18:00:00','TRK45612345US','PROCESSING',4350.00),(5,'2024-12-11 18:00:00','TRK65478932US','PROCESSING',3360.00),(6,'2024-12-11 18:00:00','TRK31234567US','PROCESSING',3419.40),(7,'2024-12-11 18:00:00','TRK7654321US','PROCESSING',3726.30),(8,'2024-12-11 18:00:00','TRK98765123US','PROCESSING',11500.00),(9,'2024-12-11 18:00:00','TRK54321876US','PROCESSING',6708.00),(10,'2024-12-11 18:00:00','TRK87654321US','PROCESSING',6208.00),(11,'2024-12-11 18:00:00','TRK12345678US','PROCESSING',1820.00),(12,'2024-12-11 18:00:00','TRK32145678US','PROCESSING',7710.50),(13,'2024-12-11 18:00:00','TRK12309876US','PROCESSING',9054.70),(14,'2024-12-11 18:00:00','TRK54321876US','PROCESSING',5450.00),(15,'2024-12-11 18:00:00','TRK56789012US','PROCESSING',110500.00),(16,'2024-12-11 18:00:00','TRK45678901US','PROCESSING',13700.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16);
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
INSERT INTO `profilepicture` VALUES (4,11),(1,12),(2,12),(5,13),(6,14),(3,15),(7,16),(8,17),(9,18),(10,19),(11,27),(12,28),(13,29),(14,30),(15,31);
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
INSERT INTO `tag` VALUES (1,'landscape'),(1,'sunset'),(2,'abstract'),(3,'nature'),(4,'urban'),(5,'nature'),(6,'seascape'),(7,'digital'),(8,'flowers'),(9,'space'),(11,'minimalism'),(11,'nature'),(11,'tree'),(12,'abstract'),(12,'fish'),(12,'glass'),(12,'mosaic'),(12,'tiles'),(13,'abstract'),(13,'bling'),(13,'blue'),(13,'marble'),(13,'modern'),(14,'boots'),(14,'brush'),(14,'laces'),(14,'paint'),(15,'bird'),(15,'ocean'),(15,'sea'),(15,'seagull'),(15,'water'),(16,'art'),(16,'colorful'),(16,'laces'),(16,'shoes'),(17,'brush'),(17,'oil'),(17,'painting'),(17,'strokes'),(18,'abstract'),(18,'brush'),(18,'canvas'),(18,'colorful'),(18,'colors'),(18,'oil'),(18,'painting'),(18,'vibrant'),(19,'cabin'),(19,'calm'),(19,'dark'),(19,'night'),(19,'peaceful'),(19,'sky'),(19,'village'),(20,'bear'),(20,'brush'),(20,'bunny'),(20,'canvas'),(20,'forest'),(20,'oil'),(20,'painting'),(21,'brush'),(21,'canvas'),(21,'color'),(21,'colorful'),(21,'modern'),(21,'painting'),(21,'vibrant'),(22,'acrylic'),(22,'africa'),(22,'african'),(22,'brush'),(22,'canvas'),(22,'fruit'),(22,'oil'),(22,'vibrant');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john.doe@email.com','38c5ae2bcd1f12aa269e45ae8c8762f030630a5137dd6d1c799c019626f33096','John Doe','JohnD','123 Main St, New York, NY 10001',0),(2,'sarah.smith@email.com','ea76b1e251a0c876b3d96d2c81f12736df3bed36ecb293f79c493c089924cbdc','Sarah Smith','SarahS','456 Oak Avenue, Los Angeles, CA 90001',0),(3,'mike.johnson@email.com','12313e7066d59b17cb8387c4d27ef847e39bc7b23ec48c9bbb6a08bac39252f3','Michael Johnson','MikeJ','789 Pine Road, Chicago, IL 60601',0),(4,'emily.brown@email.com','334ddbbc1437d63a0bf14657fb9c584d6af8697701c726febb7d8a833d9bdf27','Emily Brown','Em_Brown','321 Maple Lane, Houston, TX 77001',0),(5,'anonymous_user_1@email.com','43eb28aba4577b8655cca86b084c8421660e50c40cdc1a3aad61dea941fdca05','Anonymous User','Anon1',NULL,1),(6,'david.wilson@email.com','e3af2e502923051d802c608b7b7b31cbc978883f06cde3eb7bc0154e28a3e539','David Wilson','Dave_W','741 Beach Blvd, Miami, FL 33101',0),(7,'lisa.garcia@email.com','ad395fe6c161f463caebc59851ce565ad032ff30e3c71cd04a5356ebe05a4eb5','Lisa Garcia','LisaG','852 Hill Street, Seattle, WA 98101',0),(8,'robert.taylor@email.com','c62bb6b2345916b31d96d21b6d0a305936895bb8eef035cd15404cbd5fd4fb22','Robert Taylor','Rob_T','963 Valley Road, Boston, MA 02101',0),(9,'anonymous_user_2@email.com','1a17e7d0d8c634f6812090d7dd1b5c7161e409c4ac5806c1197664345b8bc3e8','Anonymous User 2','Anon2',NULL,1),(10,'michelle.lee@email.com','2811ee3c73ce17dfd398133f7207d4f8d7edbb97a54013880bf8fef8d930be2b','Michelle Lee','MichelleL','159 River Drive, San Francisco, CA 94101',0),(11,'fransico@email.com','47bb0fb013b151d5210f7cdf0819157d5e3f0d73b4576f724fd4e16b3f34c5f4','Francisca Owens','Ciscoa','3937 Oxford Court, Jackson, MS 39201',0),(12,'nich@email.com','f3b85859a45a8578b31a8fbeac54195f3ad6339507fc5316f9c176fe16c0a58b','Nichole Morrow','TommorowN','3202 Camden Place, Myrtle Beach, SC, 2957',0),(13,'kris.f@email.com','87de00b83184fe5513aa2ee4c73f2fcee13d6b23ecda3e1db98f312f2833b862','Kris Foster','Krisy','2844 Khale Street, Walterboro, SC 29488',0),(14,'long.rodrigo@email.com','e78b85ec36b1a26f0a08b2aa84814c1a23f2102ef4143713c090a3598b260306','Rodrigo Long','LongoD','2060 Rockford Mountain Lane, Milwaukee, WI 53202',0),(15,'choi.cliff@email.com','c9cd11537b30c2927618c2e6fdee76b907a033759a8907a40dc30e1f4b55c289','Cliff Choi','cliffbar','1705 Formula Lane, Farmers Branch, TX 75244',0),(16,'harly.o@email.com','964b503d16ebea882d3326cd7b9a1272a56b710ae798ef9c8eac87ad47475c77','Harley Olson','harleyQNS','214 Broadway Ave, San Jose, CA 95112',0);
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

-- Dump completed on 2024-12-14 20:04:58
