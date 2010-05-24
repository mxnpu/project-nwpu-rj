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
  `title` varchar(100) default NULL,
  `cover` varchar(100) NOT NULL,
  `description` varchar(200) default NULL,
  PRIMARY KEY  (`id_album`),
  KEY `FK_album_item` (`item_id`),
  CONSTRAINT `FK_album_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (4,1,NULL,'dddd',NULL),(5,1,NULL,'dddd',NULL),(6,1,NULL,'dddd',NULL),(7,1,NULL,'dddd',NULL),(8,2,NULL,'tty',NULL),(9,3,NULL,'tty',NULL),(10,4,NULL,'ttddy',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,1,'Y','one',2),(2,1,'Y','one',3),(3,1,'Y','two',4),(4,2,'Y','tttttt',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gossip`
--

LOCK TABLES `gossip` WRITE;
/*!40000 ALTER TABLE `gossip` DISABLE KEYS */;
INSERT INTO `gossip` VALUES (1,15,2,'这是1条留言测试--更新过'),(2,16,2,'这是2条留言测试'),(3,17,2,'这是3条留言测试'),(4,18,2,'这是4条留言测试');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'2005-10-11 00:00:00',1),(2,'2010-05-05 22:46:19',1),(3,'2010-05-05 22:47:19',1),(4,'2010-05-05 22:47:53',1),(5,'2010-05-15 15:28:10',1),(6,'2010-05-15 15:28:10',1),(7,'2010-05-15 15:28:10',1),(8,'2010-05-15 15:28:10',1),(9,'2010-05-15 15:28:10',1),(10,'2010-05-15 15:30:11',2),(11,'2010-05-15 15:30:11',2),(12,'2010-05-15 15:30:11',2),(13,'2010-05-15 15:30:11',2),(14,'2010-05-15 15:30:11',2),(15,'2010-05-15 17:15:44',1),(16,'2010-05-15 17:15:44',1),(17,'2010-05-15 17:15:45',1),(18,'2010-05-15 17:15:45',1),(19,'2010-05-23 23:09:11',1),(20,'2010-05-23 23:09:54',1),(21,'2010-05-23 23:15:57',1),(22,'2010-05-23 23:16:08',1),(23,'2010-05-24 00:17:59',1),(24,'2010-05-24 00:35:29',16),(25,'2010-05-24 00:36:45',16);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES (6,1,4,'picture0','D:\\fsdf\\dfsf\\p0.jpg'),(7,1,4,'picture3','D:\\fsdf\\dfsf\\p3.jpg'),(8,1,4,'picture4','D:\\fsdf\\dfsf\\p4.jpg'),(9,1,4,'picture2','D:\\fsdf\\dfsf\\p2.jpg'),(10,1,4,'picture1','D:\\fsdf\\dfsf\\p1.jpg'),(11,1,7,'picture0','D:\\fsdf\\dfsf\\p0.jpg'),(12,1,7,'picture1','D:\\fsdf\\dfsf\\p1.jpg'),(13,1,7,'picture2','D:\\fsdf\\dfsf\\p2.jpg'),(14,1,7,'picture3','D:\\fsdf\\dfsf\\p3.jpg'),(15,1,7,'picture4','D:\\fsdf\\dfsf\\p4.jpg');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `placard`
--

LOCK TABLES `placard` WRITE;
/*!40000 ALTER TABLE `placard` DISABLE KEYS */;
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
  PRIMARY KEY  (`id_reply`),
  KEY `FK_reply_item` (`item_id`),
  KEY `FK_reply_user` (`from_id`),
  CONSTRAINT `FK_reply_user` FOREIGN KEY (`from_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reply_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `statement`
--

LOCK TABLES `statement` WRITE;
/*!40000 ALTER TABLE `statement` DISABLE KEYS */;
INSERT INTO `statement` VALUES (1,5,'xurunhua第1条状态信息'),(2,6,'xurunhua第2条状态信息'),(3,7,'xurunhua第3条状态信息'),(4,8,'xurunhua第4条状态信息'),(5,9,'xurunhua第5条状态信息'),(6,10,'xiaoxu第0个状态信息'),(7,11,'xiaoxu第1个状态信息'),(8,12,'xiaoxu第2个状态信息'),(9,13,'xiaoxu第3个状态信息'),(10,14,'xiaoxu第4个状态信息'),(11,19,'测试一条新状态'),(12,20,'测试第二条新状态'),(13,21,'测试第3条新状态'),(14,22,'测试第4条新状态'),(15,23,'xurunhua更新了一条状态'),(16,24,'测试更新一条状态信息，哈哈'),(17,25,'这是最新的一条信息哦');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'xurunhua','xurunhua','xurunhua',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(2,'xiaoxu','xiaoxu','xiaoxu',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(3,'xiaorun','xiaorun','xiaorun',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(4,'xiaohua','xiaohua','xiaohua',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(5,'testSave','testSave','testSave',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(6,'testSaved','testSaved','testSaved',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(7,'dddd','dddd','dddd','M','1990-01-11','dada','dsadsa','dasd','../pictures/default/default_male.png',NULL),(8,'username2','username2','username2',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(9,'username3','username3','username3',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(10,'username1','username1','username1',NULL,NULL,NULL,NULL,NULL,'../pictures/default/default_male.png',NULL),(11,'aaaa','aaaa','aaaa','M','1990-01-11','12312341234','aaaa@aaaa.com','book','../pictures/default/default_male.png',NULL),(12,'ffffff','fffff','fffffff','M','2010-05-11','','','','../pictures/default/default_male.png',NULL),(13,'eviloctal','eviloctal','eviloctal','M','2010-05-10','','','','../pictures/default/default_male.png',NULL),(14,'xiaoyang','xiaoyang','洋','F','2010-05-11','2324432432','yang@yang.com','','../pictures/default/default_female.png',NULL),(15,'yangyang','yangyang','洋洋','F','2010-04-27','13311112222','yang@yang.com','爱好阿和算法回复按回复撒回复','..\\pictures\\default\\default_female.png',NULL),(16,'yuyang','yuyang','洋','F','2010-05-04','158','yuyang@yuyang.com','爱好\r\n爱好\r\n爱好\r\n爱好','../pictures/default/default_female.png',NULL);
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

-- Dump completed on 2010-05-24 15:13:10
