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
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `treatId` int NOT NULL,
  `treatName` varchar(100) NOT NULL,
  `treatStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`treatId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,'Heart Surgery','upcoming'),(2,'Heart Surgery','undergoing'),(3,'Heart Surgery','completed'),(4,'Heart Surgery','cancelled'),(11,'Knee Replacement','upcoming'),(12,'Knee Replacement','undergoing'),(13,'Knee Replacement','completed'),(14,'Knee Replacement','cancelled'),(21,'Routine Vaccination','upcoming'),(22,'Routine Vaccination','undergoing'),(23,'Routine Vaccination','completed'),(24,'Routine Vaccination','cancelled'),(31,'Diagnostic Imaging','upcoming'),(32,'Diagnostic Imaging','undergoing'),(33,'Diagnostic Imaging','completed'),(34,'Diagnostic Imaging','cancelled'),(41,'Spinal Tap Procedure','upcoming'),(42,'Spinal Tap Procedure','undergoing'),(43,'Spinal Tap Procedure','completed'),(44,'Spinal Tap Procedure','cancelled'),(51,'MRI Scan','upcoming'),(52,'MRI Scan','undergoing'),(53,'MRI Scan','completed'),(54,'MRI Scan','cancelled'),(61,'Biopsy Analysis','upcoming'),(62,'Biopsy Analysis','undergoing'),(63,'Biopsy Analysis','completed'),(64,'Biopsy Analysis','cancelled'),(71,'Medication Dispensing','upcoming'),(72,'Medication Dispensing','undergoing'),(73,'Medication Dispensing','completed'),(74,'Medication Dispensing','cancelled'),(81,'Mechanical Ventilation','upcoming'),(82,'Mechanical Ventilation','undergoing'),(83,'Mechanical Ventilation','completed'),(84,'Mechanical Ventilation','cancelled'),(91,'Trauma Stabilization','upcoming'),(92,'Trauma Stabilization','undergoing'),(93,'Trauma Stabilization','completed'),(94,'Trauma Stabilization','cancelled');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20  9:58:26
