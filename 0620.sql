-- MySQL dump 10.11
--
-- Host: localhost    Database: goodfriend
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt

create database if not exists `goodfriend`;
USE `goodfriend`;


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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `admin` (
  `id_admin` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `real_name` varchar(45) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(150) NOT NULL,
  PRIMARY KEY  (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'xu','xu','xu','123943949','xu@xu.com','dhfjkshfkshf');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `album` (
  `id_album` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `path` varchar(100) NOT NULL,
  `description` varchar(200) default NULL,
  PRIMARY KEY  (`id_album`),
  KEY `FK_album_item` (`item_id`),
  CONSTRAINT `FK_album_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (20,102,'default album','1_2.jpg',''),(21,103,'default album','1_007.jpg',''),(22,104,'default album','1_93_446286_2a0b8b35c73ab0b.jpg',''),(23,107,'','1_1.JPG',''),(24,108,'','1_1.JPG',''),(25,109,'','1_2.jpg',''),(26,110,'aa','1_3.jpg',''),(28,112,'aa','1_14.jpg','');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blog` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text,
  PRIMARY KEY  (`id`),
  KEY `FK_blog_item` (`item_id`),
  CONSTRAINT `FK_blog_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,26,'日志一','日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n日志一的内容，哈哈<br />\r\n'),(2,27,'日志二','日志二的内容，哈哈<br />\r\n日志二的内容，哈哈<br />\r\n<div style=\"text-align:center;\">日志二的内容，哈哈<br />\r\n</div>\r\n<span style=\"font-weight:bold;\">日志二的内容，哈哈</span><br />\r\n日志二的内容，哈哈<br />\r\n日志二的内容，哈哈<br />\r\n日志二的内容，哈哈<br />\r\n日志二的内容，哈哈<br />\r\n日志二的内容，哈哈<br />\r\n日志二的内容，哈哈<br />\r\n日志二的内容，哈哈<br />\r\n日志二的内容，哈哈<br />\r\n日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈<br />\r\n日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈日志二的内容，哈哈'),(3,28,'xiaoxu的日志一','xiaoxu的日志一<br />\r\nxiaoxu的日志一<br />\r\nxiaoxu的日志一<br />\r\nxiaoxu的日志一<br />\r\nxiaoxu的日志一<br />\r\nxiaoxu的日志一<br />\r\nxiaoxu的日志一<br />\r\n'),(4,29,'xiaoxu的日志二','xiaoxu的日志二<br />\r\nxiaoxu的日志二<br />\r\nxiaoxu的日志二<br />\r\nxiaoxu的日志二<br />\r\nxiaoxu的日志二<br />\r\nxiaoxu的日志二<br />\r\n'),(5,57,'asdas','<span style=\"font-weight:bold;\">sdsadasdasdsadasdsada</span><br />\r\n'),(6,69,'3432','er<span style=\"text-decoration:underline line-through;\">ewrewrewrewr</span>erewrrewrw<br />\r\n'),(9,72,'ssss','ssssssss<br />\r\n'),(10,73,'xxxx','xxxxxxxx<br />\r\n'),(11,74,'vvvvvv',''),(12,75,'nnnnn','nnnnnnnn<br />\r\n');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `friends` (
  `id_friends` int(10) unsigned NOT NULL auto_increment,
  `friend_id` int(10) unsigned NOT NULL,
  `success` varchar(2) default NULL,
  `group_name` varchar(50) default NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id_friends`),
  KEY `FK_friends_user` (`friend_id`),
  KEY `FK_friends_user2` (`user_id`),
  CONSTRAINT `FK_friends_user` FOREIGN KEY (`friend_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_friends_user2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,1,'Y','one',2),(2,1,'Y','one',3),(4,2,'Y','tttttt',3),(5,2,'Y','',1),(8,12,'N','',1),(9,2,'N','',1);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gossip`
--

DROP TABLE IF EXISTS `gossip`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gossip` (
  `id_gossip` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `from_id` int(10) unsigned NOT NULL,
  `content` varchar(250) default NULL,
  PRIMARY KEY  (`id_gossip`),
  KEY `FK_gossip_item` (`item_id`),
  KEY `FK_gossip_user` (`from_id`),
  CONSTRAINT `FK_gossip_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_gossip_user` FOREIGN KEY (`from_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gossip`
--

LOCK TABLES `gossip` WRITE;
/*!40000 ALTER TABLE `gossip` DISABLE KEYS */;
INSERT INTO `gossip` VALUES (2,16,2,'这是2条留言测试'),(3,17,2,'这是3条留言测试'),(4,18,2,'这是4条留言测试'),(6,41,1,'xurunhua 在 xiaoxu 处留言'),(7,42,1,'xurunhua 在 xiaoxu 处第二次留言'),(8,43,1,'xurunhua 在 xiaoxu 第三次留言'),(9,44,1,'xurunhua 在 xiaoxu 第4次留言'),(10,45,1,'xurunhua 在 xiaoxu 第5次留言'),(11,46,1,'xurunhua 在 xiaoxu 第6次留言'),(12,47,1,'xurunhua 在 xiaoxu 第7次留言'),(13,48,3,'xxiaorun在 xiaoxu 第1次留言'),(14,49,1,'xurunhua 在 xiaoxu 第8次留言 '),(24,95,1,'jijijijijijii'),(25,96,1,'jiang jiang'),(27,114,1,'iiiiiiiii');
/*!40000 ALTER TABLE `gossip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item` (
  `id_item` int(10) unsigned NOT NULL auto_increment,
  `record_time` datetime default NULL,
  `user` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id_item`),
  KEY `FK_item_user` (`user`),
  CONSTRAINT `FK_item_user` FOREIGN KEY (`user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'2005-10-11 00:00:00',1),(2,'2010-05-05 22:46:19',1),(3,'2010-05-05 22:47:19',1),(4,'2010-05-05 22:47:53',1),(5,'2010-05-15 15:28:10',1),(6,'2010-05-15 15:28:10',1),(7,'2010-05-15 15:28:10',1),(8,'2010-05-15 15:28:10',1),(9,'2010-05-15 15:28:10',1),(10,'2010-05-15 15:30:11',2),(11,'2010-05-15 15:30:12',2),(12,'2010-05-15 15:30:13',2),(13,'2010-05-15 15:30:14',2),(14,'2010-05-15 15:30:15',2),(16,'2010-05-15 17:15:44',1),(17,'2010-05-15 17:15:45',1),(18,'2010-05-15 17:15:45',1),(19,'2010-05-23 23:09:11',1),(20,'2010-05-23 23:09:54',1),(21,'2010-05-23 23:15:57',1),(22,'2010-05-23 23:16:08',1),(23,'2010-05-24 00:17:59',1),(24,'2010-05-24 00:35:29',16),(25,'2010-05-24 00:36:45',16),(26,'2010-05-26 14:51:07',1),(27,'2010-05-26 14:51:51',1),(28,'2010-05-26 15:25:07',2),(29,'2010-05-26 15:25:50',2),(30,'2010-05-26 22:04:44',2),(31,'2010-05-27 16:00:30',1),(32,'2010-05-27 16:03:07',1),(33,'2010-05-27 20:11:30',1),(34,'2010-05-27 20:17:54',1),(35,'2010-05-27 20:45:25',1),(36,'2010-05-27 20:48:44',1),(37,'2010-05-27 21:04:39',1),(38,'2010-05-27 21:05:43',1),(39,'2010-05-27 21:26:56',1),(41,'2010-05-31 15:06:43',2),(42,'2010-05-31 15:07:33',2),(43,'2010-05-31 15:09:23',2),(44,'2010-05-31 15:09:37',2),(45,'2010-05-31 15:09:44',2),(46,'2010-05-31 15:09:50',2),(47,'2010-05-31 15:10:04',2),(48,'2010-05-31 15:10:10',2),(49,'2010-05-31 15:34:52',2),(57,'2010-06-03 20:14:58',1),(58,'2010-06-03 20:22:22',1),(59,'2010-06-03 20:32:30',1),(61,'2010-06-03 20:34:38',1),(62,'2010-06-03 20:34:42',1),(69,'2010-06-03 20:37:20',1),(72,'2010-06-03 20:45:38',2),(73,'2010-06-03 20:45:48',2),(74,'2010-06-03 20:45:56',2),(75,'2010-06-03 20:46:06',2),(76,'2010-06-03 21:28:55',1),(77,'2010-06-03 21:29:21',1),(78,'2010-06-03 21:29:29',1),(79,'2010-06-05 16:27:35',1),(80,'2010-06-05 16:27:42',1),(89,'2010-06-07 19:07:09',1),(90,'2010-06-07 19:07:57',1),(91,'2010-06-10 15:39:24',17),(92,'2010-06-10 15:40:07',17),(93,'2010-06-10 18:43:58',1),(94,'2010-06-10 18:45:17',1),(95,'2010-06-10 18:49:22',2),(96,'2010-06-10 18:49:52',2),(97,'2010-06-10 19:56:08',1),(102,'2010-06-10 21:24:52',1),(103,'2010-06-10 21:25:14',1),(104,'2010-06-10 21:25:22',1),(105,'2010-06-17 18:48:36',2),(107,'2010-06-19 21:52:10',1),(108,'2010-06-19 22:08:10',1),(109,'2010-06-19 22:08:37',1),(110,'2010-06-19 22:09:57',1),(112,'2010-06-19 22:10:58',1),(113,'2010-06-19 22:18:17',1),(114,'2010-06-19 22:51:38',1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mail` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `from_user` int(10) unsigned default NULL,
  `to_user` int(10) unsigned NOT NULL,
  `time` time NOT NULL,
  `title` varchar(50) default NULL,
  `content` text,
  `opened` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_mail_1` (`from_user`),
  KEY `FK_mail_2` (`to_user`),
  CONSTRAINT `FK_mail_1` FOREIGN KEY (`from_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mail_2` FOREIGN KEY (`to_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (1,1,2,'22:21:52','Friends Request','用户<a href=\'#\'>xurunhua</a>请求添加您为好友。',1),(2,1,16,'22:22:26','Friends Request','用户<a href=\'#\'>xurunhua</a>请求添加您为好友。',0),(3,1,5,'23:27:08','Friends Request','用户<a href=\'#\'>xurunhua</a>请求添加您为好友。',0),(4,1,5,'20:08:55','Friends Request','用户<a href=\'#\'>xurunhua</a>请求添加您为好友。',0),(5,1,2,'20:40:07','Friends Request','用户<a href=\'#\'>xurunhua</a>请求添加您为好友。',1),(6,1,6,'16:29:27','Friends Request','用户<a href=\'#\'>xurunhua</a>请求添加您为好友。',0),(7,1,5,'19:09:18','Friends Request','用户<a href=\'#\'>xurunhua</a>请求添加您为好友。',0),(8,1,17,'20:40:05','Friends Request','用户<a href=\'#\'>xurunhua</a>请求添加您为好友。',0),(9,1,11,'21:17:09','Friends Request','<a href=\'home?userId=1\'>xurunhua</a> Want to be a friend of you!',0);
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `picture` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `album_id` int(10) unsigned default NULL,
  `introduction` text,
  `path` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_picture_item` (`item_id`),
  KEY `FK_picture_album` (`album_id`),
  CONSTRAINT `FK_picture_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_picture_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placard`
--

DROP TABLE IF EXISTS `placard`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `placard` (
  `id_placard` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(45) NOT NULL,
  `content` text,
  `record_time` datetime default NULL,
  `publish` varchar(2) default NULL,
  PRIMARY KEY  (`id_placard`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `placard`
--

LOCK TABLES `placard` WRITE;
/*!40000 ALTER TABLE `placard` DISABLE KEYS */;
INSERT INTO `placard` VALUES (1,'ddddddddddddddddd','fdsafffffffffffffffffffffffffffffffafdsfdsfsd','1999-01-01 00:00:00','y'),(2,'ddttttttttttttttttttttttt','fjflkjsalfdja;lskjfkaslfkjasljflksajfdlajs;lfd','1999-01-01 00:00:00','n'),(3,'ddtttttttttttsdflsakjflsk','faskjf;lasdjf;laskf;lkajsdflkjsa;lfjlks','1999-01-01 00:00:00','y');
/*!40000 ALTER TABLE `placard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reply` (
  `id_reply` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `from_id` int(10) unsigned NOT NULL,
  `content` varchar(250) NOT NULL,
  `record_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id_reply`),
  KEY `FK_reply_item` (`item_id`),
  KEY `FK_reply_user` (`from_id`),
  CONSTRAINT `FK_reply_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reply_user` FOREIGN KEY (`from_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (6,14,1,'许润华的第五次回复啊','2010-05-27 16:39:08'),(13,13,1,'许润华的回复','2010-05-27 17:07:55'),(15,29,1,'在这里回复','2010-05-28 01:38:11'),(25,30,1,'在这里回复qqqqqqq','2010-05-28 12:00:20'),(28,29,1,'在这里回复aaaaa','2010-05-28 12:05:27'),(35,29,1,'fsafsa','2010-05-28 12:16:38'),(36,30,1,'asfasfasfdsafsa','2010-05-28 12:17:00'),(37,17,1,'aaaaaaaaaaaaaaaaaaa','2010-06-01 01:24:05'),(44,57,1,'a','2010-06-03 12:21:22'),(45,28,1,'aasasd','2010-06-03 12:24:47'),(46,49,2,' aaa','2010-06-03 12:43:37'),(47,74,1,'ni jiushi yi ge e san','2010-06-10 07:53:31'),(48,75,1,'Reply Here :ni jiu shi e san','2010-06-10 07:54:47'),(53,105,1,'Reply Here :dddddddd','2010-06-18 13:04:09'),(54,105,1,'Reply Here :sdddddddd','2010-06-18 13:08:41'),(55,74,1,'dsfsfds','2010-06-18 14:28:00'),(56,75,1,'dsafsssssssssssss','2010-06-18 14:48:07'),(57,105,1,'a san a san','2010-06-18 14:50:17'),(61,114,1,' wwwwwwwwwwwww','2010-06-20 05:56:50'),(63,114,1,' hello!','2010-06-20 13:20:21'),(64,28,1,'dsfasdf','2010-06-20 13:37:41');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statement`
--

DROP TABLE IF EXISTS `statement`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `statement` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `content` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_statement_item` (`item_id`),
  CONSTRAINT `FK_statement_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `statement`
--

LOCK TABLES `statement` WRITE;
/*!40000 ALTER TABLE `statement` DISABLE KEYS */;
INSERT INTO `statement` VALUES (1,5,'xurunhua第1条状态信息'),(2,6,'xurunhua第2条状态信息'),(3,7,'xurunhua第3条状态信息'),(4,8,'xurunhua第4条状态信息'),(5,9,'xurunhua第5条状态信息'),(6,10,'xiaoxu第0个状态信息'),(7,11,'xiaoxu第1个状态信息'),(8,12,'xiaoxu第2个状态信息'),(9,13,'xiaoxu第3个状态信息'),(10,14,'xiaoxu第4个状态信息'),(11,19,'测试一条新状态'),(12,20,'测试第二条新状态'),(13,21,'测试第3条新状态'),(14,22,'测试第4条新状态'),(15,23,'xurunhua更新了一条状态'),(16,24,'测试更新一条状态信息，哈哈'),(17,25,'这是最新的一条信息哦'),(18,30,'xiaoxu的状态更新'),(19,31,'xurunhua更新了一条状态24'),(20,32,'xurunhua更新了一条状态27'),(21,33,'xurunhua更新了一条状态34'),(22,34,'fa'),(23,35,'xurunhua 更新 0527'),(24,36,'xurunhua 状态更新new\n'),(25,37,'新状态'),(26,38,'四十岁'),(27,39,'订单'),(28,58,'aa'),(29,59,'jahlkjsalfjsad'),(31,61,'ww'),(32,62,';'),(33,76,'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'),(34,77,'jhdfkjahkfhsad'),(35,78,'fsafsafdsfsfaaaaaaaaaaaaaaaaa\n'),(36,79,'dadasdadahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'),(37,80,'fdsfs'),(38,89,'ssssssssssssssssssssss'),(39,90,'sssaaaa'),(40,91,'today is a good day'),(41,92,'hello world'),(42,93,''),(43,94,'this is '),(44,97,'everyday is a new day~'),(45,105,'kaikai xinxin'),(46,113,'This is a test state.');
/*!40000 ALTER TABLE `statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `id_user` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `real_name` varchar(16) NOT NULL,
  `gender` varchar(2) default NULL COMMENT 'F or M',
  `birthday` date default NULL,
  `phone` varchar(16) default NULL,
  `email` varchar(45) default NULL,
  `hoby` varchar(150) default NULL,
  `photo` varchar(150) default NULL,
  `last_logout_time` datetime default NULL,
  PRIMARY KEY  (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'xurunhua','xurunhua','许润华','M','1990-01-11','12345678900','xrh.sky@gmail.com','dfsfsdfdaaaaaaaaaa','../pictures/default/1277046488828.jpg','2005-10-11 00:00:00'),(2,'xiaoxu','xiaoxu','小许',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png','2005-10-11 00:00:00'),(3,'xiaorun','xiaorun','小润',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png','2005-10-11 00:00:00'),(4,'xiaohua','xiaohua','小华',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png','2005-10-11 00:00:00'),(5,'testSave','testSave','testSave',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png','2005-10-11 00:00:00'),(6,'testSaved','testSaved','testSaved',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png','2005-10-11 00:00:00'),(7,'dddd','dddd','dddd','M','1990-01-11','dada','dsadsa','dasd','../pictures/default/default_male.png','2005-10-11 00:00:00'),(8,'username2','username2','username2',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png','2005-10-11 00:00:00'),(9,'username3','username3','username3',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png','2005-10-11 00:00:00'),(10,'username1','username1','username1',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png','2005-10-11 00:00:00'),(11,'aaaa','aaaa','aaaa','M','1990-01-11','12312341234','aaaa@aaaa.com','book','../pictures/default/default_male.png','2005-10-11 00:00:00'),(12,'ffffff','fffff','fffffff','M','2010-05-11','','','','../pictures/default/default_male.png','2005-10-11 00:00:00'),(13,'eviloctal','eviloctal','eviloctal','M','2010-05-10','','','','../pictures/default/default_male.png','2005-10-11 00:00:00'),(14,'xiaoyang','xiaoyang','洋','F','2010-05-11','2324432432','yang@yang.com','','../pictures/default/default_female.png','2005-10-11 00:00:00'),(15,'yangyang','yangyang','洋洋','F','2010-04-27','13311112222','yang@yang.com','爱好阿和算法回复按回复撒回复','../pictures/default/default_female.png','2005-10-11 00:00:00'),(16,'yuyang','yuyang','洋','F','2010-05-04','158','yuyang@yuyang.com','爱好\r\n爱好\r\n爱好\r\n爱好','../pictures/default/default_female.png','2005-10-11 00:00:00'),(17,'fengyun','fengyun','fengyun','M','2010-06-10','666666666','fengyun@gmail.com','today is a  good day','../pictures/default/default_male.png',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-20 15:18:31
