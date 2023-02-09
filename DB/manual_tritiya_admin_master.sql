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
-- Table structure for table `admin_master`
--

DROP TABLE IF EXISTS `admin_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `admin_access` varchar(255) NOT NULL,
  `vendor_access` varchar(105) DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `region_name` varchar(255) NOT NULL,
  `division_name` varchar(255) NOT NULL,
  `cc_tv_access` varchar(200) DEFAULT NULL,
  `status` int NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scheme` varchar(105) DEFAULT NULL,
  `hall` varchar(105) DEFAULT NULL,
  `image` varchar(205) DEFAULT NULL,
  `online` enum('1','0') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1038 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_master`
--

LOCK TABLES `admin_master` WRITE;
/*!40000 ALTER TABLE `admin_master` DISABLE KEYS */;
INSERT INTO `admin_master` VALUES (1,'NEEL GUPTA','','neelmani@kwebmaker.com','123456','Super Admin','ALL',NULL,'','','','',1,'2023-02-09 06:22:05',NULL,NULL,'neel.gif','1'),(18,'HARSH THAKUR','8657871288','zone2a.iijs@gmail.com','123456','Admin','Division Wise',NULL,'','','2A','',1,'2022-11-22 12:08:41',NULL,NULL,NULL,'0'),(20,'ARYAN MISTRY','8657081766','zone1d.iijs@gmail.com','123456','Admin','Division Wise',NULL,'','','1D','',1,'2022-11-22 09:40:14',NULL,NULL,NULL,'0'),(22,'SHIVAM TRIPATHI','8657871291','zone1c.iijs@gmail.com','123456','Admin','Division Wise',NULL,'','','1C','',1,'2022-11-22 09:39:51',NULL,NULL,NULL,'0'),(25,'MUEEZ JAMLANEY','9920023574','zone1b.iijs@gmail.com','123456','Admin','Division Wise',NULL,'','','1B','',1,'2022-11-22 09:39:26',NULL,NULL,NULL,'0'),(26,'Yash Somani','9920023421','zone1a.iijs@gmail.com','123456','Admin','Division Wise',NULL,'','','1A','',1,'2022-11-22 09:38:48',NULL,NULL,NULL,'0'),(27,'Mukesh Panwar','9987753840','mukesh@gjepcindia.com','78787878','Super Admin','ALL',NULL,'','','','',1,'2023-02-09 06:10:50',NULL,NULL,'panwar.jpg','1'),(29,'Bhavin Khorasia','9987753835','bhavin@gjepcindia.com','coolcm8419','Super Admin','',NULL,'','','','',1,'2023-02-09 06:10:42',NULL,NULL,NULL,'0'),(32,'Akshay Kumar','0000000000','akshayseventy@gmail.com','12345678','Vendor','Safe Rental',NULL,'','','','',1,'2018-01-11 06:16:51',NULL,NULL,NULL,'0'),(51,'HOTELS','9876543210','hotels@gjepcindia.com','hotels@123','Super Admin','',NULL,'','','','',0,'2023-01-24 07:32:51',NULL,NULL,NULL,'0'),(52,'jaymit','9004603313','sanjeev@jaymit.com','cctv@123','Vendor','Electronic Surveillance',NULL,'','','','jaymit',1,'2023-02-07 12:11:36',NULL,NULL,NULL,'0'),(54,'SURAT','1234568900','surat@gjepcindia.com','surat@123','Admin','Region Wise',NULL,'','RO-SRT','','',1,'2016-01-27 04:54:10',NULL,NULL,NULL,'0'),(56,'DELHI','1234567890','delhi@gjepcindia.com','delhi@123','Admin','Region Wise',NULL,'','RO-DEL','','',1,'2016-01-27 04:54:37',NULL,NULL,NULL,'0'),(57,'JAIPUR','1234567890','jaipur@gjepcindia.com','jaipur@123','Admin','Region Wise',NULL,'','RO-JAI','','',1,'2016-01-27 04:55:11',NULL,NULL,NULL,'0'),(58,'CHENNAI','1234567890','chennai@gjepcindia.com','chennai@123','Admin','Region Wise',NULL,'','RO-CHE','','',1,'2016-01-27 04:55:45',NULL,NULL,NULL,'0'),(59,'KOLKATA','1234567890','kolkata@gjepcindia.com','kolkata@123','Admin','Region Wise',NULL,'','RO-KOL','','',1,'2016-01-27 04:56:16',NULL,NULL,NULL,'0'),(67,'Dipesh','1234678978','dipesh_4321@yahoo.co.in','123456','Super Admin','',NULL,'','','','',1,'2017-01-11 09:54:06',NULL,NULL,NULL,'0'),(68,'Jaymit','1234567890','sanjeev@jaymit.com','cctv@12345','Vendor','Electronic Surveillance',NULL,'','','','jaymit',1,'2021-08-17 17:53:43',NULL,NULL,NULL,'0'),(70,'spectra','8879970901','rajesh@spectraservices.co.in','cctv@12345','Vendor','Electronic Surveillance',NULL,'','','','spectra',1,'2023-02-03 12:50:17',NULL,NULL,NULL,'0'),(71,'exim','8828108395','iijscctv@gmail.com','cctv@12345','Vendor','Electronic Surveillance',NULL,'','','','exim',1,'2023-02-06 09:57:59',NULL,NULL,NULL,'0'),(72,'sai','9873092354','gautamenterprises@hotmail.com','cctv@12345','Vendor','Electronic Surveillance',NULL,'','','','sai',1,'2018-01-13 06:26:16',NULL,NULL,NULL,'0'),(77,'Godrej','1234567890','safe@godrej.com','safe@123','Vendor','Safe Rental',NULL,NULL,'','',NULL,1,'2020-01-08 11:19:51',NULL,NULL,NULL,'0'),(82,'ARYAN MISTRY','9920024178','Zone4b.iijs@gmail.com','123456','Admin','Division Wise',NULL,'signature_club','','4B',NULL,1,'2023-01-25 11:07:52','BI2','',NULL,'0'),(83,'Akshay ','9619366020','akshayseventy@gmail.com','123456','Vendor','Safe Rental',NULL,NULL,'','',NULL,0,'2022-11-26 07:43:01',NULL,NULL,NULL,'0'),(84,'SHIVAM TRIPATHI','8657871291','Zone4c.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','4C',NULL,1,'2023-02-03 12:47:05',NULL,NULL,NULL,'0'),(88,'Shubhra Sharma','1234567890','Shubhra@gjepcindia.com','shubhra@123','Super Admin','',NULL,NULL,'','',NULL,1,'2021-08-17 11:25:17',NULL,NULL,NULL,'0'),(90,'HARSHA SETHIA','8657081766','Zone4a.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','4A',NULL,1,'2023-01-17 09:23:55',NULL,NULL,NULL,'0'),(91,'stall layout','1234567890','layout@gjepcindia.com','layout@signature','Vendor','layout','All',NULL,'','',NULL,1,'2022-11-30 12:14:58',NULL,NULL,NULL,'0'),(92,'HARSH SHAH','8657871289','zone3b.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','3B',NULL,1,'2022-11-22 09:42:23',NULL,NULL,NULL,'0'),(93,'KINSHUK PAREKH','9920023697','zone3a.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','3A',NULL,1,'2022-11-28 09:08:18',NULL,NULL,NULL,'0'),(94,'KHYATI THAKER','8657871287','zone2b.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','2B',NULL,1,'2022-11-22 12:09:13',NULL,NULL,NULL,'0'),(95,'Shubhra Sharma','8657893227','Shubhra.Sharma@gjepcindia.com','shubhra@123','Admin','Division Wise',NULL,NULL,'','4B',NULL,1,'2023-02-03 12:47:14',NULL,NULL,NULL,'1'),(99,'nkkapur@gmail.com','1234567890','nkkapur@gmail.com','nkkapur@123','Vendor','Stadfitting','Kapur',NULL,'','4C',NULL,1,'2023-02-03 13:02:57',NULL,NULL,NULL,'0'),(101,'amith.mittal@shribalajiexims.com','1234567890','amith.mittal@shribalajiexims.com','amith@123','Vendor','Stadfitting','Balaji',NULL,'','',NULL,1,'2022-11-26 07:34:19',NULL,NULL,NULL,'0'),(106,'Akash Bhosle','9004446114','akash@gjepcindia.com','akash@123','Super Admin','',NULL,NULL,'','',NULL,1,'2021-08-17 08:50:53',NULL,NULL,NULL,'0'),(108,'Bhushan Purohit','9167487292','bhushanprht@gmail.com','bhushan@123','Vendor','Stall Layout',NULL,NULL,'','',NULL,1,'2022-12-06 12:48:34',NULL,NULL,NULL,'0'),(1020,'Expro','1234567890','expro@gjepcindia.com','expro@123','Vendor','Stadfitting','expro',NULL,'','',NULL,1,'2022-07-04 15:29:06',NULL,NULL,NULL,'0'),(1021,'hemant.singh@pavilionsinteriors.com','1234567890','hemant.singh@pavilionsinteriors.com','hemanth@123','Vendor','Stadfitting','P&I',NULL,'','J1,J2,J3',NULL,1,'2022-02-07 09:38:18',NULL,NULL,NULL,'0'),(1022,'MUGDHA DESHPANDE','8657418860','mugdha.deshpande@gjepcindia.com','123456','Super Admin','',NULL,NULL,'','',NULL,1,'2022-07-07 09:19:35',NULL,NULL,NULL,'0'),(1023,'Nitin Shetty','1234567890','nitin.shetty@jamoutsourcing.com','123456','Vendor','Badges',NULL,NULL,'','',NULL,1,'2023-02-08 10:10:15',NULL,NULL,NULL,'1'),(1024,'SACHIN NIRWAL','9920024178','zone7a.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','7A',NULL,1,'2022-11-25 09:53:01',NULL,NULL,NULL,'0'),(1026,'kwebmaker','9619662253','exhibitor@kwebmaker.com','password@2022','Vendor','Badges',NULL,NULL,'','',NULL,1,'2022-07-29 07:55:16',NULL,NULL,NULL,'0'),(1027,'Naheed','8956230147','naheed@gjepcindia.com','password@2022','Vendor','Badges',NULL,NULL,'','',NULL,1,'2022-08-02 15:39:15',NULL,NULL,NULL,'0'),(1028,'supportteam','1234567899','support@kweb.com','12345','Vendor','Badges',NULL,NULL,'','',NULL,1,'2022-08-03 06:17:01',NULL,NULL,NULL,'0'),(1029,'Shivang Chaturvedi','8657907441','shivang.chaturvedi@gjepcindia.com','welcome@123','Super Admin','',NULL,NULL,'','',NULL,1,'2022-11-09 12:05:34',NULL,NULL,NULL,'0'),(1030,'Pooja Andhe','9892222846','pooja.andhe@gjepcindia.com','GJEPC@123','Super Admin','',NULL,NULL,'','',NULL,1,'2022-11-09 12:06:32',NULL,NULL,NULL,'0'),(1031,'HARSH SHAH','8657871289','Zone5a.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','5A',NULL,1,'2023-01-17 09:30:41',NULL,NULL,NULL,'0'),(1032,'HRISHIKESH TIWARI','8291983167','Zone5b.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','5B',NULL,1,'2023-01-17 09:31:14',NULL,NULL,NULL,'0'),(1034,'Asterix','9833075782','shamit_thakkar@yahoo.com','Shamit@236786','Vendor','Electronic Surveillance',NULL,NULL,'','','asterix',1,'2022-12-07 05:44:57',NULL,NULL,NULL,'0'),(1035,'SERINA OGUH','9920023542','Zone4d.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','4D',NULL,1,'2023-02-08 10:13:27',NULL,NULL,NULL,'0'),(1036,'KHYATI THAKER','8657871287','Zone5c.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','5C',NULL,1,'2023-02-08 10:13:36',NULL,NULL,NULL,'1'),(1037,'MANSI DEDANIA','8657871290','Zone5d.iijs@gmail.com','123456','Admin','Division Wise',NULL,NULL,'','5D',NULL,1,'2023-01-17 09:32:30',NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `admin_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-09 12:12:23
