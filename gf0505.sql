-- MySQL dump 10.11
--
-- Host: localhost    Database: goodfriend
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt

Create database if not exists `goodfriend`;

Use `goodfriend`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
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
  `group` varchar(50) default NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id_friends`),
  KEY `FK_friends_user` (`friend_id`),
  KEY `FK_friends_user2` (`user_id`),
  CONSTRAINT `FK_friends_user2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_friends_user` FOREIGN KEY (`friend_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
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
  `from` int(10) unsigned NOT NULL,
  `content` varchar(250) default NULL,
  PRIMARY KEY  (`id_gossip`),
  KEY `FK_gossip_item` (`item_id`),
  KEY `FK_gossip_user` (`from`),
  CONSTRAINT `FK_gossip_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_gossip_user` FOREIGN KEY (`from`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gossip`
--

LOCK TABLES `gossip` WRITE;
/*!40000 ALTER TABLE `gossip` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
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
  CONSTRAINT `FK_picture_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_picture_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
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
  `from` int(10) unsigned NOT NULL,
  `content` varchar(250) NOT NULL,
  PRIMARY KEY  (`id_reply`),
  KEY `FK_reply_item` (`item_id`),
  KEY `FK_reply_user` (`from`),
  CONSTRAINT `FK_reply_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_reply_user` FOREIGN KEY (`from`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `statement`
--

LOCK TABLES `statement` WRITE;
/*!40000 ALTER TABLE `statement` DISABLE KEYS */;
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
  PRIMARY KEY  (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2010-05-05  9:35:45
