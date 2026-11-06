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
-- Table structure for table `department_has_treatment`
--

DROP TABLE IF EXISTS `department_has_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_has_treatment` (
  `deptId` int NOT NULL,
  `treatId` int NOT NULL,
  PRIMARY KEY (`deptId`,`treatId`),
  KEY `treatId` (`treatId`),
  CONSTRAINT `department_has_treatment_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `department` (`deptId`),
  CONSTRAINT `department_has_treatment_ibfk_2` FOREIGN KEY (`treatId`) REFERENCES `treatment` (`treatId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_has_treatment`
--

LOCK TABLES `department_has_treatment` WRITE;
/*!40000 ALTER TABLE `department_has_treatment` DISABLE KEYS */;
INSERT INTO `department_has_treatment` VALUES (1,1),(1,2),(1,3),(1,4),(2,11),(2,12),(2,13),(2,14),(4,21),(4,22),(4,23),(4,24),(5,31),(5,32),(5,33),(5,34),(6,41),(6,42),(6,43),(6,44),(7,51),(7,52),(7,53),(7,54),(8,61),(8,62),(8,63),(8,64),(9,71),(9,72),(9,73),(9,74),(10,81),(10,82),(10,83),(10,84),(11,91),(11,92),(11,93),(11,94);
/*!40000 ALTER TABLE `department_has_treatment` ENABLE KEYS */;
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
