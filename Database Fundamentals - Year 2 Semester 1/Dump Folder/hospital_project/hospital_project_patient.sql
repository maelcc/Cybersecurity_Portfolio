-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_project
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patId` int NOT NULL,
  `patFirstName` varchar(50) NOT NULL,
  `patLastName` varchar(50) NOT NULL,
  `patPhoneNumber` varchar(20) DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `homeAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1247,'Jessica','Hall','02-8760010','jessica.h@email.com','5 New Road, Cardiff'),(1298,'Alice','Smith','02-8760001','alice.s@email.com','1 High Street, London'),(2632,'Robert','Jones','02-8760002','robert.j@email.com','15 Oak Lane, Birmingham'),(3456,'Laura','Gomez','02-8760003','laura.g@email.com','42 Elm Road, Manchester'),(4127,'Michael','Brown','02-8760004','michael.b@email.com','8 The Avenue, Bristol'),(5612,'John','Bob','02-876005','john.b@email.com','12 Old Town, Belfast'),(6121,'Sarah','Wilson','02-8760006','sarah.w@email.com','29 Park Row, Leeds'),(7192,'James','Miller','02-8760007','james.m@email.com','6 Willow Crescent, Edinburgh'),(8120,'Emily','Clark','02-8760008','emily.c@email.com','10 Forest View, Glasgow'),(9310,'Daniel','Walker','02-8760009','daniel.w@email.com','33 River Lane, Dublin');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20  9:58:25
