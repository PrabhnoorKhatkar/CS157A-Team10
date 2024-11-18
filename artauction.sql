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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `userID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,'John Doe - System Administrator'),(9,'Anonymous Admin - Privacy Administrator');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArtImage`
--

DROP TABLE IF EXISTS `ArtImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ArtImage` (
  `artworkID` int NOT NULL,
  `imageID` int NOT NULL,
  PRIMARY KEY (`artworkID`),
  KEY `imageID` (`imageID`),
  CONSTRAINT `artimage_ibfk_1` FOREIGN KEY (`imageID`) REFERENCES `Image` (`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArtImage`
--

LOCK TABLES `ArtImage` WRITE;
/*!40000 ALTER TABLE `ArtImage` DISABLE KEYS */;
INSERT INTO `ArtImage` VALUES (1,1),(10,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10);
/*!40000 ALTER TABLE `ArtImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artwork`
--

DROP TABLE IF EXISTS `Artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artwork` (
  `artworkID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `artist` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`artworkID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artwork`
--

LOCK TABLES `Artwork` WRITE;
/*!40000 ALTER TABLE `Artwork` DISABLE KEYS */;
INSERT INTO `Artwork` VALUES (1,'Dancing in the Rain','An impressionistic piece capturing the joy of dancing in a summer rain shower. Created using oil paints with vibrant blues and purples.','Emily Chen'),(2,'Urban Solitude','A contemporary urban landscape showing a quiet city street at dawn. Painted in muted tones with watercolor and ink.','Marcus Rodriguez'),(3,'Wildflower Dreams','Abstract representation of a wildflower meadow in spring. Mixed media piece combining acrylics and pressed flowers.','Sarah O\'Connor'),(4,'Digital Dystopia','Digital art piece exploring themes of technology and isolation in modern society. Created using 3D modeling and digital painting.','Alex Kim'),(5,'Mountain Whispers','Traditional landscape painting of the Rocky Mountains at sunset. Oil on canvas with detailed foreground elements.','James Morrison'),(6,'Fragments of Memory','Abstract collage combining photography and paint to explore themes of memory and time. Mixed media on canvas.','Lisa Wong'),(7,'Ocean\'s Symphony','Large-scale seascape capturing the power and movement of ocean waves. Created with oil paints in various shades of blue.','David Thompson'),(8,'Neon Dreams','Contemporary piece featuring bright neon colors and geometric patterns. Acrylic and spray paint on canvas.','Maria Garcia'),(9,'Silent Forest','Minimalist representation of a winter forest scene. Created using charcoal and white chalk on toned paper.','Thomas Wright'),(10,'Cultural Fusion','Mixed media artwork combining traditional Eastern patterns with Western abstract expressionism. Incorporates gold leaf and acrylics.','Yuki Tanaka');
/*!40000 ALTER TABLE `Artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auction`
--

DROP TABLE IF EXISTS `Auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auction` (
  `userID` int NOT NULL,
  `artworkID` int NOT NULL,
  PRIMARY KEY (`userID`,`artworkID`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auction`
--

LOCK TABLES `Auction` WRITE;
/*!40000 ALTER TABLE `Auction` DISABLE KEYS */;
INSERT INTO `Auction` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `Auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuctionDetails`
--

DROP TABLE IF EXISTS `AuctionDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuctionDetails` (
  `artworkID` int NOT NULL AUTO_INCREMENT,
  `startTimestamp` timestamp NOT NULL,
  `endTimestamp` timestamp NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `startingPrice` decimal(10,2) NOT NULL,
  `reserve` decimal(10,2) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`artworkID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuctionDetails`
--

LOCK TABLES `AuctionDetails` WRITE;
/*!40000 ALTER TABLE `AuctionDetails` DISABLE KEYS */;
INSERT INTO `AuctionDetails` VALUES (1,'2024-11-01 17:00:00','2024-11-07 18:00:00',1500.00,1000.00,1200.00,'SOLD'),(2,'2024-11-02 17:00:00','2024-11-08 18:00:00',2000.00,1500.00,1800.00,'SOLD'),(3,'2024-11-03 18:00:00','2024-11-09 18:00:00',NULL,2000.00,2500.00,'UNSOLD'),(4,'2024-11-04 18:00:00','2024-11-10 18:00:00',NULL,1800.00,2000.00,'UNSOLD'),(5,'2024-11-05 18:00:00','2024-11-11 18:00:00',3000.00,2500.00,2800.00,'SOLD'),(6,'2024-11-06 18:00:00','2024-11-12 18:00:00',NULL,1200.00,1500.00,'ACTIVE'),(7,'2024-11-07 18:00:00','2024-11-13 18:00:00',NULL,2200.00,2500.00,'ACTIVE'),(8,'2024-11-08 18:00:00','2024-11-14 18:00:00',2800.00,2000.00,2500.00,'SOLD'),(9,'2024-11-09 18:00:00','2024-11-15 18:00:00',NULL,1500.00,1800.00,'ACTIVE'),(10,'2024-11-10 18:00:00','2024-11-16 18:00:00',NULL,1700.00,2000.00,'ACTIVE');
/*!40000 ALTER TABLE `AuctionDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bid` (
  `userID` int NOT NULL,
  `artworkID` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bidAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`userID`,`artworkID`,`timestamp`),
  KEY `auctionDetailsID` (`artworkID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`artworkID`) REFERENCES `AuctionDetails` (`artworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bid`
--

LOCK TABLES `Bid` WRITE;
/*!40000 ALTER TABLE `Bid` DISABLE KEYS */;
INSERT INTO `Bid` VALUES (1,1,'2024-11-01 19:00:00',1100.00),(2,1,'2024-11-01 20:00:00',1200.00),(3,1,'2024-11-01 21:00:00',1500.00),(4,2,'2024-11-02 19:00:00',1600.00),(5,2,'2024-11-02 20:00:00',1800.00),(6,2,'2024-11-02 21:00:00',2000.00),(7,5,'2024-11-05 20:00:00',2600.00),(8,5,'2024-11-05 21:00:00',2800.00),(9,5,'2024-11-05 22:00:00',3000.00),(10,8,'2024-11-08 20:00:00',2800.00);
/*!40000 ALTER TABLE `Bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Favorite` (
  `userID` int NOT NULL,
  `artworkID` int NOT NULL,
  PRIMARY KEY (`userID`,`artworkID`),
  KEY `artworkID` (`artworkID`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`artworkID`) REFERENCES `Artwork` (`artworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Favorite`
--

LOCK TABLES `Favorite` WRITE;
/*!40000 ALTER TABLE `Favorite` DISABLE KEYS */;
INSERT INTO `Favorite` VALUES (2,1),(1,2),(1,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10);
/*!40000 ALTER TABLE `Favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Follow`
--

DROP TABLE IF EXISTS `Follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Follow` (
  `followerID` int NOT NULL,
  `followingID` int NOT NULL,
  PRIMARY KEY (`followerID`,`followingID`),
  KEY `followingID` (`followingID`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`followerID`) REFERENCES `User` (`userID`),
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`followingID`) REFERENCES `User` (`userID`),
  CONSTRAINT `follow_chk_1` CHECK ((`followerID` <> `followingID`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Follow`
--

LOCK TABLES `Follow` WRITE;
/*!40000 ALTER TABLE `Follow` DISABLE KEYS */;
INSERT INTO `Follow` VALUES (2,1),(4,1),(6,1),(1,2),(4,2),(1,3),(2,4),(7,6),(6,7),(7,10);
/*!40000 ALTER TABLE `Follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Image` (
  `imageID` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `uploaderID` int DEFAULT NULL,
  PRIMARY KEY (`imageID`),
  UNIQUE KEY `filename` (`filename`),
  KEY `uploaderID` (`uploaderID`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`uploaderID`) REFERENCES `User` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
INSERT INTO `Image` VALUES (1,'art-0-XbY9lSMj.jpg',1),(2,'art-1-5NRmIQHz.jpg',3),(3,'art-2-gn7ZIP02.jpg',3),(4,'art-3-PjEcbylw.jpg',5),(5,'art-4-Kcgd4weU.jpg',5),(6,'art-5-o6dBd600.jpg',6),(7,'art-6-r2lPywol.jpg',6),(8,'art-7-F2uWnkV1.jpg',7),(9,'art-8-evk9wj9J.jpg',7),(10,'art-9-64ebf4RM.jpg',8),(11,'profile-pic-0-KspewSnw.jpg',1),(12,'profile-pic-1-ZeBM90Sw.jpg',2),(13,'profile-pic-2-LZM2PdOD.jpg',3),(14,'profile-pic-3-8ilzL4dz.jpg',4),(15,'profile-pic-4-cYG3BuZ2.jpg',5),(16,'profile-pic-5-h5mqegh2.jpg',6),(17,'profile-pic-6-Qjt95p3G.jpg',7),(18,'profile-pic-7-17KKLjiL.jpg',8),(19,'profile-pic-8-RYPfQSGn.jpg',8),(20,'profile-pic-9-mH33ltOO.jpg',9);
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `userID` int NOT NULL,
  `orderDetailsID` int NOT NULL,
  PRIMARY KEY (`userID`,`orderDetailsID`),
  KEY `orderDetailsID` (`orderDetailsID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`orderDetailsID`) REFERENCES `OrderDetails` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetails`
--

DROP TABLE IF EXISTS `OrderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDetails` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `trackingNumber` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `totalPaid` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetails`
--

LOCK TABLES `OrderDetails` WRITE;
/*!40000 ALTER TABLE `OrderDetails` DISABLE KEYS */;
INSERT INTO `OrderDetails` VALUES (1,'2024-11-01 22:00:00','TRK123456','DELIVERED',1500.00),(2,'2024-11-02 22:00:00','TRK123457','SHIPPED',2000.00),(3,'2024-11-03 23:00:00','TRK123458','PROCESSING',2500.00),(4,'2024-11-04 23:00:00','TRK123459','DELIVERED',1800.00),(5,'2024-11-05 23:00:00','TRK123460','SHIPPED',3000.00),(6,'2024-11-06 23:00:00','TRK123461','PROCESSING',1200.00),(7,'2024-11-07 23:00:00','TRK123462','DELIVERED',2200.00),(8,'2024-11-08 23:00:00','TRK123463','SHIPPED',2800.00),(9,'2024-11-09 23:00:00','TRK123464','PROCESSING',1500.00),(10,'2024-11-10 23:00:00','TRK123465','DELIVERED',1700.00);
/*!40000 ALTER TABLE `OrderDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItem`
--

DROP TABLE IF EXISTS `OrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItem` (
  `orderDetailsID` int NOT NULL,
  `artworkID` int NOT NULL,
  PRIMARY KEY (`orderDetailsID`,`artworkID`),
  KEY `artworkID` (`artworkID`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderDetailsID`) REFERENCES `OrderDetails` (`ID`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`artworkID`) REFERENCES `Artwork` (`artworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
INSERT INTO `OrderItem` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `OrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProfilePicture`
--

DROP TABLE IF EXISTS `ProfilePicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProfilePicture` (
  `userID` int NOT NULL,
  `imageID` int NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `imageID` (`imageID`),
  CONSTRAINT `profilepicture_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`),
  CONSTRAINT `profilepicture_ibfk_2` FOREIGN KEY (`imageID`) REFERENCES `Image` (`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProfilePicture`
--

LOCK TABLES `ProfilePicture` WRITE;
/*!40000 ALTER TABLE `ProfilePicture` DISABLE KEYS */;
INSERT INTO `ProfilePicture` VALUES (4,11),(1,12),(2,12),(5,13),(6,14),(3,15),(7,16),(8,17),(9,18),(10,19);
/*!40000 ALTER TABLE `ProfilePicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tag` (
  `artworkID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`artworkID`,`name`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`artworkID`) REFERENCES `Artwork` (`artworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,'landscape'),(1,'sunset'),(2,'abstract'),(3,'nature'),(4,'urban'),(5,'nature'),(6,'seascape'),(7,'digital'),(8,'flowers'),(9,'space');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
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
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'john.doe@email.com','hashed_password_1','John Doe','JohnD','123 Main St, New York, NY 10001',0),(2,'sarah.smith@email.com','hashed_password_2','Sarah Smith','SarahS','456 Oak Avenue, Los Angeles, CA 90001',0),(3,'mike.johnson@email.com','hashed_password_3','Michael Johnson','MikeJ','789 Pine Road, Chicago, IL 60601',0),(4,'emily.brown@email.com','hashed_password_4','Emily Brown','Em_Brown','321 Maple Lane, Houston, TX 77001',0),(5,'anonymous_user_1@email.com','hashed_password_5','Anonymous User','Anon1',NULL,1),(6,'david.wilson@email.com','hashed_password_6','David Wilson','Dave_W','741 Beach Blvd, Miami, FL 33101',0),(7,'lisa.garcia@email.com','hashed_password_7','Lisa Garcia','LisaG','852 Hill Street, Seattle, WA 98101',0),(8,'robert.taylor@email.com','hashed_password_8','Robert Taylor','Rob_T','963 Valley Road, Boston, MA 02101',0),(9,'anonymous_user_2@email.com','hashed_password_9','Anonymous User 2','Anon2',NULL,1),(10,'michelle.lee@email.com','hashed_password_10','Michelle Lee','MichelleL','159 River Drive, San Francisco, CA 94101',0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 16:25:09
