CREATE DATABASE  IF NOT EXISTS `testdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testdb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL,
  `course_name` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Engineering'),(2,'Medical'),(3,'Commerce'),(4,'Arts'),(5,'Law');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalinfo`
--

DROP TABLE IF EXISTS `personalinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mobile_num` bigint NOT NULL,
  `grade` varchar(25) NOT NULL,
  `gender` char(8) NOT NULL,
  `course_id` int DEFAULT NULL,
  `Misc` varchar(30) DEFAULT 'IITJEE',
  PRIMARY KEY (`id`),
  KEY `fk_course` (`course_id`),
  CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalinfo`
--

LOCK TABLES `personalinfo` WRITE;
/*!40000 ALTER TABLE `personalinfo` DISABLE KEYS */;
INSERT INTO `personalinfo` VALUES (1,'John Doe',9876543210,'12th','Male',1,'IITJEE'),(2,'Jane Smith',9876543211,'11th','Female',2,'IITJEE'),(3,'Robert Brown',9876543212,'10th','Male',3,'IITJEE'),(4,'Emily Davis',9876543213,'9th','Female',4,'IITJEE'),(5,'Michael Johnson',9876543214,'12th','Male',1,'IITJEE'),(6,'Sarah Wilson',9876543215,'11th','Female',2,'IITJEE'),(7,'William Taylor',9876543216,'10th','Male',5,'IITJEE'),(8,'Olivia Anderson',9876543217,'9th','Female',3,'IITJEE'),(9,'James Thomas',9876543218,'12th','Male',1,'IITJEE'),(10,'Sophia Martinez',9876543219,'11th','Female',2,'IITJEE'),(11,'Anubhav',9560058067,'10th','Male',NULL,'IITJEE'),(12,'Shreya ',8210688730,'10th','Female',NULL,'Medical'),(13,'Safi haider',4948658454848,'10th','Male',NULL,'Medical'),(14,'Ravi kumar',45375753375,'10th','Male',NULL,'Engineering');
/*!40000 ALTER TABLE `personalinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockregister`
--

DROP TABLE IF EXISTS `stockregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockregister` (
  `stock_ID` int NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(30) NOT NULL,
  `stock_details` varchar(70) DEFAULT NULL,
  `stock_qty` float DEFAULT NULL,
  `received_from` varchar(30) DEFAULT NULL,
  `issued_to` varchar(30) DEFAULT NULL,
  `date_purchase` varchar(20) DEFAULT '01/01/2024',
  `warranty` tinyint(1) DEFAULT NULL,
  `working` tinyint(1) DEFAULT NULL,
  `invoice_num` varchar(25) DEFAULT '0',
  `purchase_price` int DEFAULT '5000',
  PRIMARY KEY (`stock_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockregister`
--

LOCK TABLES `stockregister` WRITE;
/*!40000 ALTER TABLE `stockregister` DISABLE KEYS */;
INSERT INTO `stockregister` VALUES (1,'Laptop','Dell Inspiron 14 5000',10,'TechSupplier Co.','IT Department','2023-01-15',1,1,'0',5000),(2,'Monitor','Samsung 24-inch',20,'VisionElectronics','Graphics Team','2023-03-10',1,1,'0',5000),(3,'Keyboard','Mechanical RGB',15,'HardwareSuppliers','Admin','2022-12-05',0,1,'0',5000),(4,'Mouse','Wireless Logitech',25,'TechSupplier Co.','Admin','2023-07-20',1,1,'0',5000),(5,'Printer','HP LaserJet Pro',5,'OfficeEquip Inc.','Printing Room','2023-02-11',1,1,'0',5000),(6,'Router','TP-Link Archer AX50',8,'NetWorld Ltd.','Network Team','2023-08-01',1,1,'0',5000),(7,'Projector','Epson EB-S41',2,'DisplayExperts','Conference Hall','2023-05-18',0,1,'0',5000),(8,'UPS','APC 1500VA',12,'PowerSolutions','Server Room','2022-11-25',1,1,'0',5000),(9,'Desk Phone','Polycom VVX 450',18,'TeleComs Ltd.','Support Team','2023-09-05',0,1,'0',5000),(10,'Webcam','Logitech C920',30,'TechSupplier Co.','HR Department','2023-10-15',1,1,'0',5000),(11,'Pages for Xerox','A4 size printable pages',5,'Ravi kumar','','',1,1,'',5000);
/*!40000 ALTER TABLE `stockregister` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 19:08:03
