CREATE DATABASE  IF NOT EXISTS `music` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `music`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: music
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `artist_id` bigint(20) DEFAULT NULL,
  `kindofmusic_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1nh34aosh1k5u4d8psyf915ty` (`artist_id`),
  KEY `FK_dvp20ioe4mhe8j8vsh4u9ia68` (`kindofmusic_id`),
  KEY `FK_pvitqwftj752cqhs8k4525p3y` (`user_id`),
  CONSTRAINT `FK_1nh34aosh1k5u4d8psyf915ty` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`),
  CONSTRAINT `FK_dvp20ioe4mhe8j8vsh4u9ia68` FOREIGN KEY (`kindofmusic_id`) REFERENCES `kindofmusic` (`id`),
  CONSTRAINT `FK_pvitqwftj752cqhs8k4525p3y` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'2017-12-14 16:25:06','2017-12-14 16:25:06','Khac viet Album','BvYWphYSHF9TXZbhK.jpg',1,1,3),(2,'2017-12-14 16:29:56','2017-12-14 16:29:56','Bao Anh','ogp06Egk3QninrkmU.jpg',1,1,3),(3,'2017-12-14 16:32:27','2017-12-14 16:32:27','Nhac Que Huong','4Rbiw31Y9T13cgV6r.jpg',3,3,3);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_song`
--

DROP TABLE IF EXISTS `album_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_song` (
  `Song_id` bigint(20) NOT NULL,
  `Album_id` bigint(20) NOT NULL,
  KEY `FK_4thdobehk3f45ociboss206gg` (`Album_id`),
  KEY `FK_ak05n11fboee2oadxixdykm2` (`Song_id`),
  CONSTRAINT `FK_4thdobehk3f45ociboss206gg` FOREIGN KEY (`Album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `FK_ak05n11fboee2oadxixdykm2` FOREIGN KEY (`Song_id`) REFERENCES `song` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_song`
--

LOCK TABLES `album_song` WRITE;
/*!40000 ALTER TABLE `album_song` DISABLE KEYS */;
INSERT INTO `album_song` VALUES (4,2),(5,3),(6,3),(7,3);
/*!40000 ALTER TABLE `album_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'2017-12-14 16:10:51','NjBcaxVMneRo6A7TB.jpg','2017-12-14 16:10:51','KHẮC VIỆT'),(2,'2017-12-14 16:12:13','CT71oa1mZl4R9ZeCW.jpg','2017-12-14 16:12:13','BẢO ANH'),(3,'2017-12-14 16:12:45','PX9k7QMrrAyPSZEkZ.jpg','2017-12-14 16:12:45','Hồ Quang Hiếu'),(4,'2017-12-14 16:14:07','pfOI0dyraZqG5pFgy.jpg','2017-12-14 16:14:07','Chi Dan'),(5,'2017-12-14 16:23:06','e4Xqi1BRtPYoqIP0L.jpg','2017-12-14 16:23:06','Quang Le'),(6,'2017-12-14 16:23:45','58N8naUvTaiQOCw1p.jpg','2017-12-14 16:23:45','Dam Vinh Hung');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_song`
--

DROP TABLE IF EXISTS `artist_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist_song` (
  `Song_id` bigint(20) NOT NULL,
  `Artist_id` bigint(20) NOT NULL,
  KEY `FK_js07j5jed3oiojjnpems81eyl` (`Artist_id`),
  KEY `FK_ihye2u28eg4utdu8n77361vm0` (`Song_id`),
  CONSTRAINT `FK_ihye2u28eg4utdu8n77361vm0` FOREIGN KEY (`Song_id`) REFERENCES `song` (`id`),
  CONSTRAINT `FK_js07j5jed3oiojjnpems81eyl` FOREIGN KEY (`Artist_id`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_song`
--

LOCK TABLES `artist_song` WRITE;
/*!40000 ALTER TABLE `artist_song` DISABLE KEYS */;
INSERT INTO `artist_song` VALUES (4,2),(5,5),(6,5),(7,5);
/*!40000 ALTER TABLE `artist_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kindofmusic`
--

DROP TABLE IF EXISTS `kindofmusic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kindofmusic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kindofmusic`
--

LOCK TABLES `kindofmusic` WRITE;
/*!40000 ALTER TABLE `kindofmusic` DISABLE KEYS */;
INSERT INTO `kindofmusic` VALUES (1,'2017-12-14 16:14:42',NULL,'2017-12-14 16:14:42','Nhac Tre'),(2,'2017-12-14 16:14:56',NULL,'2017-12-14 16:14:56','Nhac Tru Tinh'),(3,'2017-12-14 16:15:04',NULL,'2017-12-14 16:15:04','Nhac Que Huong');
/*!40000 ALTER TABLE `kindofmusic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `countWatch` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `hostMovieId` varchar(255) DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `kindofmusic_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bi3p2tbdde5ln8qm6ajki91uh` (`kindofmusic_id`),
  KEY `FK_ep83shu9r4yryum6oxuyufof0` (`user_id`),
  CONSTRAINT `FK_bi3p2tbdde5ln8qm6ajki91uh` FOREIGN KEY (`kindofmusic_id`) REFERENCES `kindofmusic` (`id`),
  CONSTRAINT `FK_ep83shu9r4yryum6oxuyufof0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,NULL,'2017-12-14 16:30:13','SrcqomRp2zU','2017-12-14 17:01:41','YÊU TỪ PHÍA XA | OFFICIAL MV FULL | CHI DÂN |','CgSSeIep8Ngu5KtDGx.jpg','CgSSeIep8Ngu5KtDGx.jpg',1,3),(2,NULL,'2017-12-14 16:30:13','RneMEagAkcE','2017-12-14 17:02:30','1234 | OFFICIAL MV FULL ','CgSSeIep8Ngu5KtDGx.jpg','CgSSeIep8Ngu5KtDGx.jpg',1,3),(3,NULL,'2017-12-14 16:30:13','RneMEagAkcE','2017-12-14 17:00:27','1234 | OFFICIAL MV FULL | CHI DÂN |','CgSSeIep8Ngu5KtDGx.jpg','CgSSeIep8Ngu5KtDGx.jpg',1,3),(4,NULL,'2017-12-14 16:30:13','3hTQYKpZG1w','2017-12-14 16:30:13','Em Biết ','CgSSeIep8Ngu5KtDGx.jpg','CgSSeIep8Ngu5KtDGx.jpg',1,3),(5,NULL,'2017-12-14 16:33:00','_jZSPqmavvY','2017-12-14 16:33:00','Nhạc Dân Ca Quê Hương Miền Tây ','Mg6EGYLabUG2CLUMD.jpg','OdMuvW9XGl1iNpLQG.jpg',3,3),(6,NULL,'2017-12-14 16:33:20','qUaVNaOXhtI','2017-12-14 16:33:20','Liveshow Hát Trên Quê Hương 2 - Quang Lê [Phần 1]','HPDSEcCzxhNK3Gm6p.jpg','ELnoS9mf45FMa9bYh.jpg',3,3),(7,NULL,'2017-12-14 16:33:40','Xm-OjE4sxZU','2017-12-14 16:33:40','Kẻ Ở Miền Xa - Quang Lê','ettRboNYcxD7IJErc.jpg','CgSSeIep8Ngu5KtDG.jpg',3,3);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `modifiedAt` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2017-12-14 16:04:38','rootmanager@gmail.com','user_default.jpg','2017-12-14 16:04:38','$2a$10$oI1gDmrR/2vZROMWpfRaW.8WPHU5CtU4Nqsys27WcahqyOQrH1dkG','Rootmanager'),(2,'2017-12-14 16:04:59','admin@gmail.com','user_default.jpg','2017-12-14 16:04:59','$2a$10$zZp08377cCAlis9sBbEN6.kL6VGyfc/IOHE8laorB75UB2aw7hyui','admin'),(3,'2017-12-14 16:05:09','user@gmail.com','user_default.jpg','2017-12-14 16:05:09','$2a$10$.X1/svLZRWzO7wCBP8uV/e88MouYVvW/JRnIjKj9T8w07tjes.rke','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g1uebn6mqk9qiaw45vnacmyo2` (`user_id`),
  CONSTRAINT `FK_g1uebn6mqk9qiaw45vnacmyo2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'ROLE_ROOTMANAGER',1),(2,'admin',2),(3,'user',3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 17:41:35
