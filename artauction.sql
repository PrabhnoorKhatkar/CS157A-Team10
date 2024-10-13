-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
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
  `accountID` varchar(30) NOT NULL,
  `adminAccountID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('1','Alex'),('10','Thy'),('2','Aries'),('3','Daniel'),('4','Daphne'),('5','David'),('6','Eve'),('7','Kai'),('8','Pearl'),('9','Prabhnoor');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArtCompany`
--

DROP TABLE IF EXISTS `ArtCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ArtCompany` (
  `accountID` int NOT NULL,
  `corpName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArtCompany`
--

LOCK TABLES `ArtCompany` WRITE;
/*!40000 ALTER TABLE `ArtCompany` DISABLE KEYS */;
INSERT INTO `ArtCompany` VALUES (21,'Etsy'),(22,'Async Art'),(23,'Minted'),(24,'Folklore Studio'),(25,'Rainy Studios'),(26,'Verisart'),(27,'ARTERNAL'),(28,'Artisroom'),(29,'Particle'),(30,'Kosium');
/*!40000 ALTER TABLE `ArtCompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artwork`
--

DROP TABLE IF EXISTS `Artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artwork` (
  `artID` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `startingPrice` int DEFAULT NULL,
  `auctionDuration` varchar(45) DEFAULT NULL,
  `reserve` varchar(45) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`artID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artwork`
--

LOCK TABLES `Artwork` WRITE;
/*!40000 ALTER TABLE `Artwork` DISABLE KEYS */;
INSERT INTO `Artwork` VALUES (112,'The Moon','An oil painting of the Moon.','moon.png',10,'24:00:00','1000','pending'),(113,'River','A painting of a River. ','river.png',10,'24:00:00','2000','sold'),(114,'The Horizon','A digital painting of the Horizon.','horizon.png',10,'24:00:00','1500','unsold'),(115,'The City','An oil painting of the City.','city.png',10,'24:00:00','3200','pending'),(116,'Hidden Valley','A painting of a hidden valley.','valley.png',10,'24:00:00','400','sold'),(117,'Sunset','A sunset painting.','sunset.png',15,'24:00:00','1200','sold'),(118,'Forgotten Garden','A painting of a Forgotten Garden.','garden.png',10,'24:00:00','950','withdrawn'),(119,'Forest','A painting of the forest.','forest.png',10,'24:00:00','760','sold'),(120,'Pearl Earring','A painting of the girl with a pearl earring.','pearl_earring.png',10,'48:00:00','7000','sold'),(121,'A Deer','A painting of a deer.','deer.png',20,'24:00:00','320','sold'),(122,'Dream','A painting of the artist\'s dream.','dream.png',10,'24:00:00','15','sold'),(123,'Reflection','A painting of one\'s reflection.','reflection.png',10,'24:00:00','200','sold'),(124,'The Ocean','A painting of the ocean.','ocean.png',10,'24:00:00','100','sold'),(125,'Books','A painting of books.','books.png',10,'24:00:00','45','sold'),(126,'Feather','A painting of a bird feather.','feather.png',12,'24:00:00','70','sold'),(127,'Cracked Mirror','A painting of a cracked mirror','mirror.png',20,'24:00:00','80','sold'),(128,'Leaves','A painting of leaves on the ground.','leaves.png',20,'24:00:00','25','sold'),(129,'Suitcase','A painting of a suitcase.','suitcase.png',10,'24:00:00','54','sold'),(130,'Broken Glass','A painting of broken glass.','glass.png',30,'24:00:00','33','sold');
/*!40000 ALTER TABLE `Artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auction`
--

DROP TABLE IF EXISTS `Auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auction` (
  `auctionID` int NOT NULL,
  `accountID` int DEFAULT NULL,
  `artID` int DEFAULT NULL,
  `bidTimestamp` timestamp(6) NULL DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`auctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auction`
--

LOCK TABLES `Auction` WRITE;
/*!40000 ALTER TABLE `Auction` DISABLE KEYS */;
INSERT INTO `Auction` VALUES (1638893549,2,101,'2024-09-30 22:30:00.000000',20),(1638893550,4,102,'2024-09-30 23:00:00.000000',200),(1639453840,3,103,'2024-03-01 08:50:00.000000',45),(1643075711,9,104,'2023-10-08 14:41:58.000000',3000),(1643903116,8,105,'2023-11-29 23:10:38.000000',65),(1643903372,6,106,'2024-08-02 08:53:52.000000',90),(1646353713,7,107,'2024-02-28 00:19:52.000000',355),(1647870862,1,108,'2024-07-23 00:56:58.000000',150),(1647870888,3,110,'2024-08-01 07:29:00.000000',200),(1647870889,4,111,'2024-10-01 12:30:00.000000',90),(1655870863,5,109,'2024-09-20 08:45:00.000000',2300);
/*!40000 ALTER TABLE `Auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bid` (
  `accountID` int NOT NULL,
  `auctionID` int DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bid`
--

LOCK TABLES `Bid` WRITE;
/*!40000 ALTER TABLE `Bid` DISABLE KEYS */;
INSERT INTO `Bid` VALUES (1,1647870862),(2,1638893549),(3,1639453840),(4,1647870889),(5,1655870863),(6,1643903372),(7,1646353713),(8,1643903116),(9,1643075711),(11,1647870888),(12,1638893550);
/*!40000 ALTER TABLE `Bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Favorite` (
  `accountID` int NOT NULL,
  `artID` int DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Favorite`
--

LOCK TABLES `Favorite` WRITE;
/*!40000 ALTER TABLE `Favorite` DISABLE KEYS */;
INSERT INTO `Favorite` VALUES (1,130),(2,116),(3,117),(4,128),(5,113),(6,130),(7,130),(8,120),(9,121),(10,130);
/*!40000 ALTER TABLE `Favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Follows`
--

DROP TABLE IF EXISTS `Follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Follows` (
  `followerAccountID` int NOT NULL,
  `followerDisplayName` varchar(45) DEFAULT NULL,
  `followingAccountID` varchar(45) DEFAULT NULL,
  `followingDisplayName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`followerAccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Follows`
--

LOCK TABLES `Follows` WRITE;
/*!40000 ALTER TABLE `Follows` DISABLE KEYS */;
INSERT INTO `Follows` VALUES (11,'Rob','12','Doro'),(12,'Doro','11','Rob'),(13,'Bill','14','Char'),(14,'Char','13','Bill'),(15,'Per','16','Dani'),(16,'Dani','15','Per'),(17,'Dav','18','Je'),(18,'Je','17','Dav'),(19,'Ru','20','Ral'),(20,'Ral','19','Ru');
/*!40000 ALTER TABLE `Follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetails`
--

DROP TABLE IF EXISTS `OrderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDetails` (
  `orderNumber` int NOT NULL,
  `orderTimestamp` timestamp(6) NULL DEFAULT NULL,
  `orderStatus` varchar(45) DEFAULT NULL,
  `totalPaid` int DEFAULT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetails`
--

LOCK TABLES `OrderDetails` WRITE;
/*!40000 ALTER TABLE `OrderDetails` DISABLE KEYS */;
INSERT INTO `OrderDetails` VALUES (1,'2024-10-02 03:30:00.000000','sold',760),(2,'2024-09-20 12:45:00.000000','sold',7000),(3,'2023-01-12 20:01:00.000000','sold',320),(4,'2024-09-21 16:00:00.000000','sold',15),(5,'2024-10-01 07:45:00.000000','sold',200),(6,'2024-08-10 08:25:00.000000','sold',100),(7,'2024-08-15 03:00:00.000000','sold',45),(8,'2024-09-10 03:30:00.000000','sold',70),(9,'2024-07-05 17:30:00.000000','sold',80),(10,'2024-10-02 11:50:00.000000','pending',1000);
/*!40000 ALTER TABLE `OrderDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItem`
--

DROP TABLE IF EXISTS `OrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItem` (
  `orderNumber` int NOT NULL,
  `artId` int NOT NULL,
  PRIMARY KEY (`orderNumber`,`artId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
INSERT INTO `OrderItem` VALUES (1,104),(2,108),(3,105),(4,101),(5,102),(6,103),(7,111),(8,110),(9,107),(10,109);
/*!40000 ALTER TABLE `OrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `accountID` int NOT NULL,
  `orderNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`accountID`,`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'10'),(3,'8'),(5,'2'),(6,'3'),(7,'4'),(9,'5'),(10,'9'),(11,'1'),(15,'6'),(21,'7');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Post`
--

DROP TABLE IF EXISTS `Post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Post` (
  `accountID` int NOT NULL,
  `artID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (1,'117'),(2,'118'),(3,'113'),(4,'112'),(5,'116'),(6,'120'),(7,'114'),(8,'127'),(9,'128'),(10,'125');
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Remove`
--

DROP TABLE IF EXISTS `Remove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Remove` (
  `accountID` int NOT NULL,
  `artID` int DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Remove`
--

LOCK TABLES `Remove` WRITE;
/*!40000 ALTER TABLE `Remove` DISABLE KEYS */;
INSERT INTO `Remove` VALUES (1,112),(2,116),(3,115),(4,123),(5,127),(6,114),(7,119),(8,129),(9,130),(10,118);
/*!40000 ALTER TABLE `Remove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `accountID` int NOT NULL AUTO_INCREMENT,
  `displayName` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `emailAddress` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `anonymous` tinyint DEFAULT '0',
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (11,'Rob','Robert','rob@gmail.com','rob123','777 Brockton Ave',1),(12,'Doro','Doroteo','doro@gmail.com','doro321','30 Memorial Dr',0),(13,'Bill','Bill','bill@gmail.com','bill1234','250 Hartford Ave',0),(14,'Char','Charles','charles@gmail.com','char12345','700 Oak St',0),(15,'Per','Per','per@gmail.com','per122','591 Memorial Dr',1),(16,'Dani','Danilo','dani@gmail.com','dani133','137 Teaticket Hwy',0),(17,'Dav','David','dav@gmail.com','dav144','374 William S Canning Blvd',0),(18,'Je','Jean','je@gmail.com','je155','121 Worcester Rd',0),(19,'Ru','Ruth','ru@gmail.com','ru166','677 Timapny Blvd',1),(20,'Ral','Ralph','ral@gmail.com','ral177','1775 Washington St',0),(21,'YEEHAW12','Exercise1','test@gmail.com','1234','214 Broadway Ave, San Jose 95112',0);
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

<<<<<<< HEAD
-- Dump completed on 2024-10-13  0:00:05
=======
-- Dump completed on 2024-10-13  0:27:37
>>>>>>> a62138c1e81eadf5696e6fc0a43b3d6106e283db
