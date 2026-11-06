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
-- Table structure for table `medical_information`
--

DROP TABLE IF EXISTS `medical_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_information` (
  `patId` int NOT NULL,
  `birthDate` date DEFAULT NULL,
  `bloodType` varchar(5) DEFAULT NULL,
  `height` decimal(3,2) DEFAULT NULL,
  `weight` decimal(4,1) DEFAULT NULL,
  `allergies` text,
  `pregnancyStatus` tinyint DEFAULT NULL,
  `medications` text,
  `medicalConditions` text,
  PRIMARY KEY (`patId`),
  CONSTRAINT `medical_information_ibfk_1` FOREIGN KEY (`patId`) REFERENCES `patient` (`patId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_information`
--

LOCK TABLES `medical_information` WRITE;
/*!40000 ALTER TABLE `medical_information` DISABLE KEYS */;
INSERT INTO `medical_information` VALUES (1247,'2005-02-22','A-',1.55,55.6,'Cats',0,'None','Anxiety, Diabetes'),(1298,'1985-06-15','O+',1.68,65.2,'Penicillin',0,'Metoprolol','Hypertension'),(2632,'1972-11-20','A-',1.80,88.5,'None',0,'Aspirin','Osteoarthritis'),(3456,'2019-03-01','B+',0.95,14.7,'Dairy',1,'Vitamins','Asthma'),(4127,'1999-09-09','AB+',1.75,75.0,'Pollen',0,'None','Diabetes'),(5612,'1980-12-30','AB-',1.78,84.0,'Pollen',0,'Ibuprofen','Mild Arthritis'),(6121,'1995-04-12','O-',1.70,71.3,'Nuts',0,'Vitamins','Asthma'),(7192,'1965-01-28','A+',1.90,95.9,'Latex',0,'Statins','High Cholesterol, Diabetes'),(8120,'1988-10-05','B-',1.63,62.1,'None',0,'Sertraline','Migraines'),(9310,'1990-07-07','O+',1.82,80.4,'Shellfish',0,'None','Concussion History');
/*!40000 ALTER TABLE `medical_information` ENABLE KEYS */;
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
