-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 192.168.40.107    Database: manual_tritiya
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unique_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` varchar(255) DEFAULT NULL,
  `exhibitor_code` varchar(100) NOT NULL,
  `exhibitor_name` varchar(100) NOT NULL,
  `hall_no` varchar(100) NOT NULL,
  `division_no` varchar(45) DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_url` text,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_id` bigint unsigned DEFAULT NULL,
  `priority_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `vendor_id` text,
  `closed_by` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ticket_view` enum('1','0') DEFAULT '0',
  `ticket_view_date` timestamp NULL DEFAULT NULL,
  `ticket_view_admin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_code_UNIQUE` (`unique_code`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'drdr','','EXHK','KWEBMAKER','4','4A','drydr','','dsd',4,3,1,0,'1027,1028,1034','0','2023-01-30 23:02:48','2023-01-23 17:46:04',NULL,'0',NULL,NULL),(2,'12sdfsd','','EXH01','NIDHI JEWELS','5','4A','drydr','','sgrhere',1,1,1,0,'32',NULL,NULL,'2023-01-24 17:46:04',NULL,'0',NULL,NULL),(3,'3sdfsd','4','EXH02','OM JEWELS','5','4A','drydr','','sgrhere',4,2,2,0,'52',NULL,NULL,'2023-01-24 17:46:04',NULL,'0',NULL,NULL),(4,'sdfs33','5','EXH025','NIA JEWELS','6','4A','drydr','','sgrhere',1,0,1,0,'70',NULL,NULL,'2023-01-24 17:46:04',NULL,'0',NULL,NULL),(5,'ICet','6','EXH035','sultan JEWELS','7','4A','drydr','','sgrhere',3,0,1,0,'70',NULL,NULL,'2023-01-23 17:46:04',NULL,'1','2023-02-09 16:52:31','NEEL GUPTA'),(6,'678768768','1','EXHK','KWEBMAKER','4','4B','drydr','','dsd',1,3,1,0,'32,52',NULL,NULL,'2023-01-23 17:46:04',NULL,'1','2023-02-09 16:52:26','NEEL GUPTA'),(7,'12sdfsdg','3','EXH012','NIDHI JEWELS','5','4B','drydr','','sgrhere',1,1,1,0,'32',NULL,NULL,'2023-01-24 17:46:04',NULL,'1','2023-02-09 16:55:44','NEEL GUPTA'),(8,'3sdfsdh','4','EXH023','OM JEWELS','5','4B','drydr','','sgrhere',2,2,2,0,'52',NULL,NULL,'2023-01-24 17:46:04',NULL,'1','2023-02-09 16:55:49','NEEL GUPTA'),(9,'sdfs33j','5','EXH028','NIA JEWELS','6','4B','drydr','','sgrhere',1,0,1,0,'70',NULL,NULL,'2023-01-24 17:46:04',NULL,'1','2023-02-09 16:55:53','NEEL GUPTA'),(10,'ICetg','6','EXH040','Maina JEWELS','7','4C','drydr','','sgrhere',1,3,1,0,'1026,1027,1028,1034','NEEL GUPTA','2023-01-30 23:23:14','2023-01-26 17:46:04',NULL,'1','2023-02-09 16:56:00','NEEL GUPTA'),(11,'2222','6','EXH035','sultan JEWELS','7','4C','drydr','','sgrhere',3,0,1,0,'70',NULL,NULL,'2023-01-23 17:46:04',NULL,'0',NULL,NULL),(12,'drdrf2','1','EXHK','KWEBMAKER','4','4C','subject','','dsd',1,3,1,0,'52',NULL,NULL,'2023-01-23 17:46:04',NULL,'0',NULL,NULL),(13,'12sdfsdg5','3','EXH012','NIDHI JEWELS','5','4C','drydr','','sgrhere',1,1,1,0,'32',NULL,NULL,'2023-01-24 17:46:04',NULL,'0',NULL,NULL),(14,'3sdfsdh6','4','EXH023','OM JEWELS','5','4C','drydr','','sgrhere',2,2,2,0,'52',NULL,NULL,'2023-01-24 17:46:04',NULL,'0',NULL,NULL),(15,'sdfs33j6','5','EXH028','NIA JEWELS','6','4C','drydr','','sgrhere',1,0,1,4,'70',NULL,NULL,'2023-01-24 17:46:04',NULL,'0',NULL,NULL),(16,'ICetg2','6','EXH039','sultan JEWELS','7','4C','drydr','','sgrhere',1,0,1,0,'70',NULL,NULL,'2023-01-26 17:46:04',NULL,'0',NULL,NULL),(17,'drdrf25','1','EXHK','KWEBMAKER','4','5A','drydr','','dsd',1,3,1,0,'52',NULL,NULL,'2023-01-23 17:46:04',NULL,'0',NULL,NULL),(18,'12sdfsd7g5','3','EXH012','NIDHI JEWELS','4','5A','drydr','','sgrhere',4,1,1,0,'32',NULL,NULL,'2023-01-24 17:46:04',NULL,'0',NULL,NULL),(19,'3sdfsdh46','4','EXH023','OM JEWELS','4','5A','drydr','','sgrhere',4,2,2,0,'52',NULL,NULL,'2023-01-25 17:46:04',NULL,'0',NULL,NULL),(20,'sdfs343j6','5','','NIA JEWELS','4','5A','drydr','','sgrhere',4,0,1,0,'70',NULL,NULL,'2023-01-24 17:46:04',NULL,'0',NULL,NULL),(21,'IC4etg2','6','EXH039','sultan JEWELS','4','5A','drydr','','sgrhere',4,0,1,0,'70',NULL,NULL,'2023-01-23 17:46:04',NULL,'0',NULL,NULL),(22,'554796318','','','','',NULL,'Hello',NULL,'f fjaj Haleozd  nsd ',1,2,1,NULL,'72',NULL,NULL,'2023-01-31 17:46:02',NULL,'0',NULL,NULL),(23,'688911690','1','','','',NULL,'godrej',NULL,'godrej',2,2,2,1,'77',NULL,NULL,'2023-01-31 17:49:09',NULL,'0',NULL,NULL),(24,'438616759','1','','','',NULL,'yrfh',NULL,'hs',3,2,2,1,'52','jaymit','2023-02-07 17:35:08','2023-01-31 18:15:52',NULL,'1','2023-02-06 23:44:09','jaymit'),(37,'864259461',NULL,'EXHK','KWEBMAKER','4','4B','Wifi Issue',NULL,'Our Stall Wifi is not working, Please check asp',1,2,1,NULL,'99','Shubhra Sharma','2023-02-03 23:19:54','2023-02-03 23:15:39',NULL,'1','2023-02-09 16:48:15','Mukesh Panwar'),(38,'741436784',NULL,'EXH14','V U CHAINS','4','4B','Light Issue and Wifi Issue',NULL,'Please Check Light and Wifi ASP',1,1,2,NULL,'72,77','Mukesh Panwar','2023-02-09 16:50:32','2023-02-03 23:42:41',NULL,'1','2023-02-06 22:49:56','NEEL GUPTA'),(39,'434430742','1','','','',NULL,'wigigigigi',NULL,'xxfhdf',4,1,NULL,1,'71','exim','2023-02-06 20:12:52','2023-02-06 18:12:44',NULL,'1','2023-02-06 23:38:56','NEEL GUPTA'),(40,'160910984','1','','','',NULL,'ticket issue testing',NULL,'tert dfdg',4,1,NULL,1,'52','jaymit','2023-02-07 19:48:11','2023-02-06 19:56:10',NULL,'1','2023-02-06 23:38:48','NEEL GUPTA'),(41,'539062572','1','','','',NULL,'ticket issue testing',NULL,'Ticket Summary ',2,1,NULL,1,'71',NULL,NULL,'2023-02-06 20:23:24',NULL,'1','2023-02-06 20:50:41','NEEL GUPTA'),(42,'397379276','1','','','',NULL,'ticket issue dfdfgdfgg',NULL,'efss',4,2,NULL,1,'52,68,70,71','jaymit','2023-02-07 19:48:22','2023-02-06 20:25:57',NULL,'1','2023-02-06 22:54:20','NEEL GUPTA'),(43,'697141876',NULL,'EXHK','KWEBMAKER','4','5C','ticket issue',NULL,'dfsf ghdghgh ',1,0,NULL,NULL,'32,1023,1026,1027,1028','NEEL GUPTA','2023-02-06 22:35:56','2023-02-06 20:35:44',NULL,'1','2023-02-06 22:50:37','NEELs GUPTA'),(44,'152580407',NULL,'EXHK','KWEBMAKER','4','5C','Wifi and light bulb not working',NULL,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',4,3,NULL,NULL,'52,77,1023','NEEL GUPTA','2023-02-08 20:55:02','2023-02-08 20:30:11',NULL,'1','2023-02-08 20:32:13','NEEL GUPTA');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-09 12:12:20
