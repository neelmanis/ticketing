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
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `exhibitor_code` varchar(105) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
INSERT INTO `ticket_replies` VALUES (1,3,'1',NULL,0,NULL,'sfasf','2023-01-25 23:39:31',NULL),(2,3,'1',NULL,0,'Super Admin','कंप्यूटर','2023-01-25 23:39:51',NULL),(3,3,'1',NULL,0,'Super Admin','?','2023-01-25 23:41:14',NULL),(4,3,'1',NULL,0,'Super Admin','❤️','2023-01-25 23:45:49',NULL),(5,3,'1',NULL,0,'Super Admin','????????  ','2023-01-25 23:46:31',NULL),(6,3,'1',NULL,0,'Super Admin','❤️helo','2023-01-25 23:46:47',NULL),(7,2,'1',NULL,NULL,'Super Admin','hhhh','2023-01-26 00:18:20',NULL),(8,2,'1',NULL,NULL,'Super Admin','voooo','2023-01-26 02:13:54',NULL),(9,2,'1',NULL,0,'Super Admin','dfsaf','2023-01-26 02:14:53',NULL),(10,2,'1',NULL,7,'Super Admin','mmmmmmmmm','2023-01-26 02:32:49',NULL),(11,2,'1',NULL,8,'Super Admin','lol','2023-01-26 02:34:11',NULL),(12,2,'1',NULL,NULL,'Super Admin','hhhhh','2023-01-26 02:53:32',NULL),(13,2,'1',NULL,NULL,'Super Admin','Jai ho','2023-01-26 02:55:41',NULL),(14,2,'1',NULL,0,'Super Admin','new','2023-01-25 02:56:32',NULL),(15,2,'1',NULL,14,'Super Admin','Suno','2023-01-26 02:56:49',NULL),(16,2,'1',NULL,15,'Super Admin','Bhaiya ji','2023-01-26 02:57:08',NULL),(17,2,'1',NULL,9,'Super Admin','asfasa','2023-01-26 03:06:12',NULL),(18,2,'27',NULL,0,'Super Admin','bhavinnn','2023-01-26 03:06:38',NULL),(19,3,'18',NULL,0,'Admin','kya haal h','2023-01-27 17:02:03',NULL),(20,1,'18',NULL,0,'Admin','helo','2023-01-27 17:02:17',NULL),(21,1,'1',NULL,0,'Super Admin','hrllo','2023-01-27 17:02:42',NULL),(22,1,'1',NULL,0,'Super Admin','nhi','2023-01-27 17:02:48',NULL),(23,1,'1',NULL,21,'Super Admin','nhi hahi','2023-01-27 17:02:59',NULL),(24,1,'1',NULL,23,'Super Admin','cool','2023-01-27 17:03:05',NULL),(25,1,'1',NULL,22,'Super Admin','lolo','2023-01-27 17:03:13',NULL),(26,19,'52',NULL,0,'Vendor','Heelo Jaymit','2023-01-28 17:26:33',NULL),(27,19,'52',NULL,0,'Vendor','see you','2023-01-28 17:26:50',NULL),(28,10,'1',NULL,0,'Super Admin','Hi Neel','2023-01-28 17:27:32',NULL),(29,10,'1',NULL,28,'Super Admin','cool','2023-01-30 17:10:06',NULL),(30,10,'1',NULL,29,'Super Admin','no','2023-01-30 17:10:16',NULL),(31,10,'1',NULL,0,'Super Admin','nonono','2023-01-30 17:10:22',NULL),(32,10,'1',NULL,0,'Super Admin','what r u ding','2023-01-30 20:58:34',NULL),(33,10,'1',NULL,32,'Super Admin','nothing','2023-01-30 20:58:43',NULL),(34,24,'27',NULL,0,'Super Admin','kya haal hai\r\n','2023-01-31 20:08:55',NULL),(35,10,'70',NULL,0,'Vendor','hello team','2023-02-01 16:58:17',NULL),(36,2,'90',NULL,0,'Admin','nhi yar','2023-02-01 17:01:30',NULL),(37,2,'90',NULL,0,'Admin','nonono','2023-02-01 17:03:34',NULL),(38,16,'1',NULL,0,'Super Admin','hello','2023-02-01 17:17:10',NULL),(39,16,'84',NULL,38,'Admin','ok sir','2023-02-01 17:19:21',NULL),(40,16,'70',NULL,39,'Vendor','ok sir will check and confirm','2023-02-01 17:20:23',NULL),(41,11,'1',NULL,0,'Super Admin','Pleae check ticket\r\n','2023-02-01 17:53:09',NULL),(42,11,'70',NULL,41,'Vendor','hey','2023-02-01 17:54:33',NULL),(43,11,'84',NULL,42,'Admin','fast','2023-02-01 17:54:56',NULL),(44,11,'70',NULL,43,'Vendor','ok\r\n','2023-02-01 17:55:47',NULL),(45,11,'70',NULL,0,'Vendor','nbvbc','2023-02-01 17:56:06',NULL),(46,13,'1',NULL,0,'Super Admin','hii','2023-02-03 20:34:21',NULL),(47,36,'',NULL,0,'','hii','2023-02-03 21:30:09',NULL),(48,36,'600714127',NULL,0,'exhibitor','Hii','2023-02-03 22:47:06',NULL),(49,36,'600714127',NULL,0,'exhibitor','Hiiiiiiiiiiiiiiiiiiiii','2023-02-03 22:50:25',NULL),(50,36,'600714127',NULL,0,'exhibitor','hiiiiii','2023-02-03 22:52:16',NULL),(51,36,'600714127',NULL,0,'exhibitor','fgfd','2023-02-03 22:53:05',NULL),(52,36,'600714127',NULL,0,'exhibitor','fgfg','2023-02-03 22:53:21',NULL),(53,36,'1',NULL,0,'Super Admin','HIII','2023-02-03 22:58:53',NULL),(54,36,'1',NULL,0,'Super Admin','cool','2023-02-03 23:01:55',NULL),(55,36,'600714127',NULL,0,'exhibitor','I am fine','2023-02-03 23:02:35',NULL),(56,36,'1',NULL,0,'Super Admin','nonono','2023-02-03 23:04:02',NULL),(57,16,'70',NULL,0,'Vendor','Ppp','2023-02-03 23:12:46',NULL),(58,16,'84',NULL,0,'Admin','test today','2023-02-03 23:13:41',NULL),(59,16,'70',NULL,58,'Vendor','ok','2023-02-03 23:14:09',NULL),(60,37,'99',NULL,0,'Vendor','I am sending worker','2023-02-03 23:20:59',NULL),(61,37,'600714127',NULL,60,'exhibitor','ok','2023-02-03 23:21:40',NULL),(62,37,'95',NULL,60,'Admin','will check','2023-02-03 23:22:11',NULL),(63,37,'95',NULL,62,'Admin','dekho','2023-02-03 23:28:10',NULL),(64,37,'600714127',NULL,63,'exhibitor','Please Resolve asp','2023-02-03 23:40:16',NULL),(65,38,'1023',NULL,0,'Vendor','Ok checking ','2023-02-03 23:45:21',NULL),(66,38,'600725550',NULL,65,'exhibitor','Please ','2023-02-03 23:50:34',NULL),(67,38,'95',NULL,66,'Admin','when it will be done','2023-02-03 23:52:19',NULL),(68,38,'1',NULL,67,'Super Admin','Please try asap','2023-02-03 23:52:41',NULL),(69,38,'1023',NULL,0,'Vendor','ticket resolved','2023-02-03 23:58:37',NULL),(70,38,'600725550',NULL,0,'exhibitor','ok thank you','2023-02-03 23:58:55',NULL),(71,38,'1',NULL,0,'Super Admin','hello','2023-02-04 00:07:42',NULL),(72,38,'1',NULL,0,'Super Admin','hhh','2023-02-04 00:08:35',NULL),(73,38,'1',NULL,0,'Super Admin','hhhhh','2023-02-04 00:08:48',NULL),(74,38,'1',NULL,0,'Super Admin','qqq','2023-02-04 00:09:09',NULL),(75,38,'1',NULL,0,'Super Admin','ssss','2023-02-04 00:09:32',NULL),(76,38,'1',NULL,68,'Super Admin','thank','2023-02-04 00:09:44',NULL),(77,38,'1',NULL,0,'Super Admin','sssss','2023-02-04 00:10:03',NULL),(78,38,'1',NULL,0,'Super Admin','Neeeeelelelel','2023-02-04 00:10:19',NULL),(79,38,'600725550',NULL,0,'exhibitor','fdfsdf','2023-02-04 00:10:22',NULL),(80,38,'1',NULL,0,'Super Admin','ram kumar','2023-02-04 00:10:47',NULL),(81,38,'1',NULL,76,'Super Admin','dekh lo','2023-02-04 00:10:56',NULL),(82,43,'600714127',NULL,0,'exhibitor','hii','2023-02-06 20:39:18',NULL),(83,44,'600714127',NULL,0,'exhibitor','Hii ','2023-02-08 20:31:03',NULL),(84,44,'600714127',NULL,0,'exhibitor','When will be issue is resolved','2023-02-08 20:31:57',NULL),(85,44,'1',NULL,0,'Super Admin','we working on it','2023-02-08 20:32:41',NULL),(86,44,'1023',NULL,0,'Vendor','we checking wifi issue','2023-02-08 20:40:41',NULL),(87,44,'600714127',NULL,0,'exhibitor','ok ','2023-02-08 20:45:29',NULL);
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-09 12:12:24
