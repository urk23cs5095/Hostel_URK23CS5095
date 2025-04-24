-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: hostel_database
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `leave_applications`
--

DROP TABLE IF EXISTS `leave_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL,
  `leave_period` varchar(50) DEFAULT NULL,
  `parent_mobile` varchar(15) DEFAULT NULL,
  `student_mobile` varchar(15) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_applications`
--

LOCK TABLES `leave_applications` WRITE;
/*!40000 ALTER TABLE `leave_applications` DISABLE KEYS */;
INSERT INTO `leave_applications` VALUES (1,'dhanam','1','10-april to 15 april','9876543210','8870564067','Accepted'),(2,'durga','16','10-april to 15 april','9876543210','8870564067','Accepted'),(3,'joy','21','10-april to 15 april','9876543210','8870564067','Declined'),(4,'dhanam','16',NULL,'9876543210','8870564067','Pending'),(5,'dhanam','16',NULL,'9876543210','8870564067','Pending'),(6,'shally','319','10-april to 15-april','9876543210','8870564067','Declined'),(7,'shally','8','10-apr to 11-apr','9275366288','1234567890','Accepted'),(8,'angel sweety','31','10-Apr to 15-Apr','9876543210','8870564067','Declined'),(9,'lincy','3','27-may to 29-may','9876543210','8870564067','Accepted'),(10,'beulah','5','22-apr to 19-may','9787434111','8943534111','Accepted'),(11,'Fedora','6','24-may to 31-may','9843534111','9787434111','Accepted');
/*!40000 ALTER TABLE `leave_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_requests`
--

DROP TABLE IF EXISTS `maintenance_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL,
  `issue_description` text,
  `status` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_requests`
--

LOCK TABLES `maintenance_requests` WRITE;
/*!40000 ALTER TABLE `maintenance_requests` DISABLE KEYS */;
INSERT INTO `maintenance_requests` VALUES (1,'dhanam','1','hi','Accepted'),(2,'dhanam','1','light is not working properly','Accepted'),(3,'dhanam','1','hgh','Pending'),(4,'dhanam','16','fan is not working','Accepted'),(5,'shally','319','door handle was broken','Accepted'),(6,'shally','8','chair broken','Accepted'),(7,'angel sweety','31','cot has been broken','Accepted'),(8,'beulah','5','charger pluging not working','Pending'),(9,'lincy','21','fan switch not working','Pending'),(10,'angeline','7','mirror broken','Pending'),(11,'yasby','32','insects are comming','Pending'),(12,'rekha','8','water doctor not working','Pending'),(13,'Fedora','6','Things getting lost','Pending');
/*!40000 ALTER TABLE `maintenance_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_booking`
--

DROP TABLE IF EXISTS `room_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `roomType` varchar(10) DEFAULT NULL,
  `roomCapacity` varchar(15) DEFAULT NULL,
  `roomNo` varchar(10) DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_id` (`student_id`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_booking`
--

LOCK TABLES `room_booking` WRITE;
/*!40000 ALTER TABLE `room_booking` DISABLE KEYS */;
INSERT INTO `room_booking` VALUES (1,'dhanam','AC','1','2',NULL),(2,'Bala','Non-AC','2','4',NULL),(3,'dhanam','AC','1','2',NULL),(4,'akila','AC','1','1',NULL),(5,'dhanam','AC','1','3',NULL),(6,'dhanam','Non-AC','2','31',NULL),(7,'durga','AC','2','16',NULL),(8,'shally','AC','1','10',NULL),(9,'joy','AC','4','21',NULL),(10,'beulah','AC','4','22',NULL),(11,'shally','AC','1','8',NULL),(12,'malar','Non-AC','2','41',NULL),(13,'malar','AC','4','27',NULL);
/*!40000 ALTER TABLE `room_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_status`
--

DROP TABLE IF EXISTS `room_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_status` (
  `room_number` int NOT NULL,
  `floor` int DEFAULT NULL,
  `room_type` varchar(10) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `current_count` int DEFAULT '0',
  PRIMARY KEY (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_status`
--

LOCK TABLES `room_status` WRITE;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
INSERT INTO `room_status` VALUES (1,1,'AC',1,0),(2,1,'AC',2,0),(3,1,'AC',2,0),(4,1,'AC',4,0),(5,1,'Non-AC',1,0),(6,1,'Non-AC',2,0),(7,1,'Non-AC',2,0),(8,1,'Non-AC',4,0),(9,1,'AC',1,0),(10,1,'Non-AC',1,0),(11,1,'AC',2,0),(12,1,'AC',4,0),(13,1,'Non-AC',1,0),(14,1,'Non-AC',2,0),(15,1,'AC',4,0),(16,1,'AC',1,0),(17,1,'Non-AC',2,0),(18,1,'AC',2,0),(19,1,'Non-AC',4,0),(20,1,'AC',1,0),(21,2,'AC',1,0),(22,2,'AC',2,0),(23,2,'AC',2,0),(24,2,'AC',4,0),(25,2,'Non-AC',1,0),(26,2,'Non-AC',2,0),(27,2,'Non-AC',2,0),(28,2,'Non-AC',4,0),(29,2,'AC',1,0),(30,2,'Non-AC',1,0),(31,2,'AC',2,0),(32,2,'AC',4,0),(33,2,'Non-AC',1,0),(34,2,'Non-AC',2,0),(35,2,'AC',4,0),(36,2,'AC',1,0),(37,2,'Non-AC',2,0),(38,2,'AC',2,0),(39,2,'Non-AC',4,0),(40,2,'AC',1,0),(41,3,'AC',1,0),(42,3,'AC',2,0),(43,3,'AC',2,0),(44,3,'AC',4,0),(45,3,'Non-AC',1,0),(46,3,'Non-AC',2,0),(47,3,'Non-AC',2,0),(48,3,'Non-AC',4,0),(49,3,'AC',1,0),(50,3,'Non-AC',1,0),(51,3,'AC',2,0),(52,3,'AC',4,0),(53,3,'Non-AC',1,0),(54,3,'Non-AC',2,0),(55,3,'AC',4,0),(56,3,'AC',1,0),(57,3,'Non-AC',2,0),(58,3,'AC',2,0),(59,3,'Non-AC',4,0),(60,3,'AC',1,0),(61,4,'AC',1,0),(62,4,'AC',2,0),(63,4,'AC',2,0),(64,4,'AC',4,0),(65,4,'Non-AC',1,0),(66,4,'Non-AC',2,0),(67,4,'Non-AC',2,0),(68,4,'Non-AC',4,0),(69,4,'AC',1,0),(70,4,'Non-AC',1,0),(71,4,'AC',2,0),(72,4,'AC',4,0),(73,4,'Non-AC',1,0),(74,4,'Non-AC',2,0),(75,4,'AC',4,0),(76,4,'AC',1,0),(77,4,'Non-AC',2,0),(78,4,'AC',2,0),(79,4,'Non-AC',4,0),(80,4,'AC',1,0);
/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `seater` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'AC',1,'Available'),(2,'AC',1,'Available'),(3,'AC',2,'Available'),(4,'Non-AC',1,'Available'),(5,'Non-AC',2,'Available');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'dhanam','dhanams@karunya.edu.in','123','9876543210'),(2,'deepa','deepa@gmail.com','deepa','8870564067'),(3,'dhanam','dhanams@gmail.com','dhanam','8870564067'),(6,'dhanam','akila@gmail.com','akila','8870564067'),(13,'dhanam','abcd@gmail.com','fhjshd','8870564067'),(16,'sarath','sarath12@gmail.com','sarath@12','9080437479'),(18,'akila','akila1@gmail.com','akila','8870564067'),(19,'beulah','beulah@gmail.com','beulah','1234567890'),(20,'durga','durga@gmail.com','durga','8098258247'),(21,'shally','shally@karunya.edu.in','shally','8122754358'),(22,'joy','joy@gmail.com','joy','7550231504'),(23,'beulah','beulah@mail.com','beulah','9787434111'),(24,'shally','shallys2209@gmail.com','22092005','9944193028'),(25,'angel sweety','angelsweety@gmail.com','angelsweety','9080437479');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-25  0:55:27
