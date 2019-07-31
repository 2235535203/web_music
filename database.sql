-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: music_db
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accompany`
--

DROP TABLE IF EXISTS `accompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accompany` (
  `m_id` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `fileSize` varchar(7) DEFAULT NULL,
  `soundQuality` char(5) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `music_id` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accompany`
--

LOCK TABLES `accompany` WRITE;
/*!40000 ALTER TABLE `accompany` DISABLE KEYS */;
INSERT INTO `accompany` VALUES (1,'C:UsersTongDesktopwhat if.mp3','8.41M','极高'),(2,'C:UsersTongDesktopmiao.mp3','1.83M','标准'),(4,'test',NULL,NULL),(7,'accmopany_location',NULL,NULL),(8,'accmopany_location',NULL,NULL);
/*!40000 ALTER TABLE `accompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `album` (
  `alb_id` int(11) NOT NULL AUTO_INCREMENT,
  `alb_name` varchar(30) NOT NULL,
  `cover` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `releaseDate` datetime NOT NULL,
  `firstchar` varchar(45) NOT NULL,
  PRIMARY KEY (`alb_id`,`releaseDate`),
  KEY `cover_id_idx` (`cover`),
  CONSTRAINT `cover_id` FOREIGN KEY (`cover`) REFERENCES `picture` (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'单曲',1,'单曲发售','0000-00-00 00:00:00',''),(2,'Mr.Cat',3,'来吸猫猫啊！','2019-07-18 16:14:00','MC'),(3,'test1',2,'just test!','2017-02-12 00:00:00','T1'),(5,'测试专用',9,'撒谎备注都行','2019-07-29 00:00:00','cszy');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `album_music`
--

DROP TABLE IF EXISTS `album_music`;
/*!50001 DROP VIEW IF EXISTS `album_music`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `album_music` AS SELECT 
 1 AS `album_id`,
 1 AS `album_name`,
 1 AS `music_name`,
 1 AS `music_id`,
 1 AS `creator_id`,
 1 AS `creator_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `albumcategory`
--

DROP TABLE IF EXISTS `albumcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `albumcategory` (
  `alb_id` int(11) NOT NULL,
  `cat_id` int(3) NOT NULL,
  PRIMARY KEY (`alb_id`,`cat_id`),
  CONSTRAINT `album_id1` FOREIGN KEY (`alb_id`) REFERENCES `album` (`alb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumcategory`
--

LOCK TABLES `albumcategory` WRITE;
/*!40000 ALTER TABLE `albumcategory` DISABLE KEYS */;
INSERT INTO `albumcategory` VALUES (1,1);
/*!40000 ALTER TABLE `albumcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio`
--

DROP TABLE IF EXISTS `audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `audio` (
  `m_id` int(11) NOT NULL,
  `location` varchar(200) NOT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `musci_id9` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='音频文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio`
--

LOCK TABLES `audio` WRITE;
/*!40000 ALTER TABLE `audio` DISABLE KEYS */;
INSERT INTO `audio` VALUES (1,'adsa'),(7,'audio_location'),(8,'audio_location');
/*!40000 ALTER TABLE `audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `cat_id` int(3) NOT NULL,
  `name` varchar(8) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'情歌'),(3,'抒情'),(1,'摇滚'),(5,'民谣'),(2,'流行');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator`
--

DROP TABLE IF EXISTS `creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creator` (
  `c_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cover` int(11) DEFAULT NULL,
  `gender` char(5) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `view` int(15) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `firstchar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `picture_id_idx` (`cover`),
  CONSTRAINT `picture_id` FOREIGN KEY (`cover`) REFERENCES `picture` (`pic_id`),
  CONSTRAINT `singer_id` FOREIGN KEY (`c_id`) REFERENCES `worker` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='歌手，制作人,特指，较为著名，信息较全';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator`
--

LOCK TABLES `creator` WRITE;
/*!40000 ALTER TABLE `creator` DISABLE KEYS */;
INSERT INTO `creator` VALUES (1,'三猫',5,'女','中国','上海猫猫居',1534,'云爹妈早安午安晚安~','sm'),(2,'花花',4,'男','中国','上海猫猫居',233,'女仆为您服务~','hh'),(5,'mdk',NULL,NULL,NULL,NULL,0,NULL,'mdk'),(7,'test_singer',NULL,NULL,NULL,NULL,0,NULL,'test_singer');
/*!40000 ALTER TABLE `creator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creatorcategory`
--

DROP TABLE IF EXISTS `creatorcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creatorcategory` (
  `c_id` int(11) NOT NULL,
  `cat_id` int(3) NOT NULL,
  PRIMARY KEY (`c_id`,`cat_id`),
  CONSTRAINT `creatorcategory_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `creator` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creatorcategory`
--

LOCK TABLES `creatorcategory` WRITE;
/*!40000 ALTER TABLE `creatorcategory` DISABLE KEYS */;
INSERT INTO `creatorcategory` VALUES (1,3),(2,4);
/*!40000 ALTER TABLE `creatorcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creatormakealbum`
--

DROP TABLE IF EXISTS `creatormakealbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creatormakealbum` (
  `alb_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY (`alb_id`),
  KEY `singer_id_idx` (`c_id`),
  CONSTRAINT `album_id2` FOREIGN KEY (`alb_id`) REFERENCES `album` (`alb_id`),
  CONSTRAINT `singers_id` FOREIGN KEY (`c_id`) REFERENCES `creator` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专辑与制作人的关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creatormakealbum`
--

LOCK TABLES `creatormakealbum` WRITE;
/*!40000 ALTER TABLE `creatormakealbum` DISABLE KEYS */;
INSERT INTO `creatormakealbum` VALUES (2,1),(3,2);
/*!40000 ALTER TABLE `creatormakealbum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creatormakemusic`
--

DROP TABLE IF EXISTS `creatormakemusic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `creatormakemusic` (
  `m_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `arrangement_id` int(11) DEFAULT NULL,
  `lyricist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`m_id`,`c_id`),
  KEY `c_id` (`c_id`),
  KEY `arrangement_id_idx` (`arrangement_id`),
  KEY `lyricist_id_idx` (`lyricist_id`),
  CONSTRAINT `arrangement_id` FOREIGN KEY (`arrangement_id`) REFERENCES `music_worker` (`music_workerID`),
  CONSTRAINT `creatormakemusic_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `creator` (`c_id`),
  CONSTRAINT `lyricist_id` FOREIGN KEY (`lyricist_id`) REFERENCES `music_worker` (`music_workerID`),
  CONSTRAINT `music_id6` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creatormakemusic`
--

LOCK TABLES `creatormakemusic` WRITE;
/*!40000 ALTER TABLE `creatormakemusic` DISABLE KEYS */;
INSERT INTO `creatormakemusic` VALUES (1,1,1,1),(2,1,4,3),(3,2,4,3),(7,7,9,8),(8,7,9,8);
/*!40000 ALTER TABLE `creatormakemusic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback` (
  `pagemark` varchar(20) DEFAULT NULL,
  `contain` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `information_singer`
--

DROP TABLE IF EXISTS `information_singer`;
/*!50001 DROP VIEW IF EXISTS `information_singer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `information_singer` AS SELECT 
 1 AS `singer_name`,
 1 AS `singer_id`,
 1 AS `cover_location`,
 1 AS `gender`,
 1 AS `country`,
 1 AS `area`,
 1 AS `singer_view`,
 1 AS `remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lrc`
--

DROP TABLE IF EXISTS `lrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lrc` (
  `m_id` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `contributor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `music_id5` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lrc`
--

LOCK TABLES `lrc` WRITE;
/*!40000 ALTER TABLE `lrc` DISABLE KEYS */;
INSERT INTO `lrc` VALUES (1,'null',NULL),(2,'C:UsersTongDesktopmiao.lrc','云玩家');
/*!40000 ALTER TABLE `lrc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager` (
  `manage_id` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `manage_level` varchar(45) NOT NULL,
  PRIMARY KEY (`manage_id`),
  CONSTRAINT `checklevel` CHECK (((`manage_level` = _utf8mb4'high') or (`manage_level` = _utf8mb4'middle') or (`manage_level` = _utf8mb4'low')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'123456','high'),(2,'123456','middle'),(3,'123456','low');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_worker`
--

DROP TABLE IF EXISTS `music_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music_worker` (
  `music_workerID` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `music_workerName` varchar(45) NOT NULL,
  PRIMARY KEY (`music_workerID`,`position`),
  KEY `music_workerID_idx` (`music_workerID`),
  KEY `music_workername_idx` (`music_workerName`),
  CONSTRAINT `music_workerID` FOREIGN KEY (`music_workerID`) REFERENCES `worker` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='特指作词作曲等对一首音乐的产生较为重要的人员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_worker`
--

LOCK TABLES `music_worker` WRITE;
/*!40000 ALTER TABLE `music_worker` DISABLE KEYS */;
INSERT INTO `music_worker` VALUES (9,'作曲','testarrangement'),(8,'作词','testlyricist'),(1,'作曲','三猫'),(1,'作词','三猫'),(3,'作词','方文山'),(4,'作曲','韦小宝');
/*!40000 ALTER TABLE `music_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musiccategory`
--

DROP TABLE IF EXISTS `musiccategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `musiccategory` (
  `m_id` int(11) NOT NULL,
  `cat_id` int(3) NOT NULL,
  PRIMARY KEY (`m_id`,`cat_id`),
  CONSTRAINT `music_id3` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musiccategory`
--

LOCK TABLES `musiccategory` WRITE;
/*!40000 ALTER TABLE `musiccategory` DISABLE KEYS */;
INSERT INTO `musiccategory` VALUES (1,1),(2,5),(3,3);
/*!40000 ALTER TABLE `musiccategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicinalbum`
--

DROP TABLE IF EXISTS `musicinalbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `musicinalbum` (
  `alb_id` int(11) NOT NULL DEFAULT '1',
  `m_id` int(11) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `album_id_index` (`alb_id`),
  CONSTRAINT `album_id3` FOREIGN KEY (`alb_id`) REFERENCES `album` (`alb_id`),
  CONSTRAINT `music_id4` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='歌曲与专辑的从属关系，但有些歌曲是单曲，专辑id为NULL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicinalbum`
--

LOCK TABLES `musicinalbum` WRITE;
/*!40000 ALTER TABLE `musicinalbum` DISABLE KEYS */;
INSERT INTO `musicinalbum` VALUES (1,3),(1,7),(1,8),(2,1),(2,2);
/*!40000 ALTER TABLE `musicinalbum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicmessage`
--

DROP TABLE IF EXISTS `musicmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `musicmessage` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(40) NOT NULL,
  `view` int(15) DEFAULT '0',
  `remark` varchar(126) DEFAULT NULL,
  `firstchar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicmessage`
--

LOCK TABLES `musicmessage` WRITE;
/*!40000 ALTER TABLE `musicmessage` DISABLE KEYS */;
INSERT INTO `musicmessage` VALUES (1,'Mr.White',0,'白老师是个呆逼?','MW'),(2,'Mr.Du',0,'妈！头绳有点紧！','MD'),(3,'Mr.Ma',0,'用来测试','MM'),(4,'mdk',0,'nothing',NULL),(5,'test',0,'test',NULL),(6,'test1',0,'',NULL),(7,'testmusic',0,'testremark','testmusic'),(8,'testmusic',0,'testremark','testmusic');
/*!40000 ALTER TABLE `musicmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `picture` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES (1,'C:UsersTongDesktopMr.White.jpg'),(2,'C:UsersTongDesktopMr.Du.jpg'),(3,'C:UsersTongDesktopMr.Cat.jpg'),(4,'C:UsersTongDesktophuahua.jpg'),(5,'C:UsersTongDesktopsanmao.jpg'),(6,'sadasdasd'),(9,'c.location');
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `play_music`
--

DROP TABLE IF EXISTS `play_music`;
/*!50001 DROP VIEW IF EXISTS `play_music`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `play_music` AS SELECT 
 1 AS `music_id`,
 1 AS `video_location`,
 1 AS `accompany_location`,
 1 AS `audio_location`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_albumfirrstchar`
--

DROP TABLE IF EXISTS `search_albumfirrstchar`;
/*!50001 DROP VIEW IF EXISTS `search_albumfirrstchar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_albumfirrstchar` AS SELECT 
 1 AS `album_name`,
 1 AS `album_id`,
 1 AS `album_maker`,
 1 AS `album_remark`,
 1 AS `album_releseDate`,
 1 AS `firstchar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_albumname`
--

DROP TABLE IF EXISTS `search_albumname`;
/*!50001 DROP VIEW IF EXISTS `search_albumname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_albumname` AS SELECT 
 1 AS `album_name`,
 1 AS `album_id`,
 1 AS `album_maker`,
 1 AS `album_remark`,
 1 AS `album_releseDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `search_charamount`
--

DROP TABLE IF EXISTS `search_charamount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `search_charamount` (
  `m_id` int(11) NOT NULL,
  `charAmount` int(2) NOT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `music_id2` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_charamount`
--

LOCK TABLES `search_charamount` WRITE;
/*!40000 ALTER TABLE `search_charamount` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_charamount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `search_musicbyfirstchar`
--

DROP TABLE IF EXISTS `search_musicbyfirstchar`;
/*!50001 DROP VIEW IF EXISTS `search_musicbyfirstchar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_musicbyfirstchar` AS SELECT 
 1 AS `music_name`,
 1 AS `music_id`,
 1 AS `creator_name`,
 1 AS `album_name`,
 1 AS `music_view`,
 1 AS `arrangenment_name`,
 1 AS `lyricist_name`,
 1 AS `music_firstchar`,
 1 AS `music_remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_musicbyname`
--

DROP TABLE IF EXISTS `search_musicbyname`;
/*!50001 DROP VIEW IF EXISTS `search_musicbyname`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_musicbyname` AS SELECT 
 1 AS `music_name`,
 1 AS `music_id`,
 1 AS `creator_name`,
 1 AS `album_name`,
 1 AS `music_view`,
 1 AS `arrangenment_name`,
 1 AS `lyricist_name`,
 1 AS `music_remark`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_singerfirstchar`
--

DROP TABLE IF EXISTS `search_singerfirstchar`;
/*!50001 DROP VIEW IF EXISTS `search_singerfirstchar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_singerfirstchar` AS SELECT 
 1 AS `creator_name`,
 1 AS `creator_id`,
 1 AS `creator_gender`,
 1 AS `creator_country`,
 1 AS `creator_area`,
 1 AS `creator_remark`,
 1 AS `creator_view`,
 1 AS `firstchar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `search_singername`
--

DROP TABLE IF EXISTS `search_singername`;
/*!50001 DROP VIEW IF EXISTS `search_singername`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `search_singername` AS SELECT 
 1 AS `creator_name`,
 1 AS `creator_id`,
 1 AS `creator_gender`,
 1 AS `creator_country`,
 1 AS `creator_area`,
 1 AS `creator_remark`,
 1 AS `creator_view`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `singer_music`
--

DROP TABLE IF EXISTS `singer_music`;
/*!50001 DROP VIEW IF EXISTS `singer_music`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `singer_music` AS SELECT 
 1 AS `singer_name`,
 1 AS `singer_id`,
 1 AS `music_name`,
 1 AS `music_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `VIP` int(11) NOT NULL DEFAULT '0',
  `email_address` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用来储存用户账号密码的表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'madengke','123',0,'2235535203@qq.com'),(3,'ma','123',0,'2235535203@qq.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `video` (
  `m_id` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `fileSize` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  CONSTRAINT `musci_id` FOREIGN KEY (`m_id`) REFERENCES `musicmessage` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'C://',NULL),(7,'video_location',NULL),(8,'video_location',NULL);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `worker` (
  `worker_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`worker_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='从事音乐行业的工作者，泛指';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'三猫'),(2,'花花'),(3,'方文山'),(4,'韦小宝'),(5,'mdk'),(7,'test_singer'),(8,'testlyricist'),(9,'testarrangement');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `album_music`
--

/*!50001 DROP VIEW IF EXISTS `album_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `album_music` (`album_id`,`album_name`,`music_name`,`music_id`,`creator_id`,`creator_name`) AS select `album`.`alb_id` AS `alb_id`,`album`.`alb_name` AS `alb_name`,`musicmessage`.`m_name` AS `m_name`,`musicmessage`.`m_id` AS `m_id`,`creator`.`c_id` AS `c_id`,`creator`.`name` AS `name` from ((((`album` join `musicmessage`) join `creator`) join `musicinalbum`) join `creatormakemusic`) where ((`album`.`alb_id` = `musicinalbum`.`alb_id`) and (`musicinalbum`.`m_id` = `musicmessage`.`m_id`) and (`musicmessage`.`m_id` = `creatormakemusic`.`m_id`) and (`creatormakemusic`.`c_id` = `creator`.`c_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `information_singer`
--

/*!50001 DROP VIEW IF EXISTS `information_singer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `information_singer` (`singer_name`,`singer_id`,`cover_location`,`gender`,`country`,`area`,`singer_view`,`remark`) AS select `creator`.`name` AS `name`,`creator`.`c_id` AS `c_id`,`picture`.`location` AS `location`,`creator`.`gender` AS `gender`,`creator`.`country` AS `country`,`creator`.`area` AS `area`,`creator`.`view` AS `view`,`creator`.`remark` AS `remark` from (`creator` join `picture`) where (`creator`.`cover` = `picture`.`pic_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `play_music`
--

/*!50001 DROP VIEW IF EXISTS `play_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `play_music` (`music_id`,`video_location`,`accompany_location`,`audio_location`) AS select `musicmessage`.`m_id` AS `m_id`,`video`.`location` AS `location`,`accompany`.`location` AS `location`,`audio`.`location` AS `location` from (((`musicmessage` join `video`) join `accompany`) join `audio`) where ((`musicmessage`.`m_id` = `video`.`m_id`) and (`musicmessage`.`m_id` = `audio`.`m_id`) and (`musicmessage`.`m_id` = `accompany`.`m_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_albumfirrstchar`
--

/*!50001 DROP VIEW IF EXISTS `search_albumfirrstchar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_albumfirrstchar` (`album_name`,`album_id`,`album_maker`,`album_remark`,`album_releseDate`,`firstchar`) AS select `album`.`alb_name` AS `alb_name`,`album`.`alb_id` AS `alb_id`,`creator`.`name` AS `name`,`album`.`remark` AS `remark`,`album`.`releaseDate` AS `releaseDate`,`album`.`firstchar` AS `firstchar` from ((`album` join `creator`) join `creatormakealbum`) where ((`album`.`alb_id` = `creatormakealbum`.`alb_id`) and (`creator`.`c_id` = `creatormakealbum`.`c_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_albumname`
--

/*!50001 DROP VIEW IF EXISTS `search_albumname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_albumname` (`album_name`,`album_id`,`album_maker`,`album_remark`,`album_releseDate`) AS select `album`.`alb_name` AS `alb_name`,`album`.`alb_id` AS `alb_id`,`creator`.`name` AS `name`,`album`.`remark` AS `remark`,`album`.`releaseDate` AS `releaseDate` from ((`album` join `creator`) join `creatormakealbum`) where ((`album`.`alb_id` = `creatormakealbum`.`alb_id`) and (`creator`.`c_id` = `creatormakealbum`.`c_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_musicbyfirstchar`
--

/*!50001 DROP VIEW IF EXISTS `search_musicbyfirstchar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_musicbyfirstchar` (`music_name`,`music_id`,`creator_name`,`album_name`,`music_view`,`arrangenment_name`,`lyricist_name`,`music_firstchar`,`music_remark`) AS select `musicmessage`.`m_name` AS `m_name`,`musicmessage`.`m_id` AS `m_id`,`creator`.`name` AS `name`,`album`.`alb_name` AS `alb_name`,`musicmessage`.`view` AS `view`,`a`.`music_workerName` AS `music_workerName`,`l`.`music_workerName` AS `music_workerName`,`musicmessage`.`firstchar` AS `firstchar`,`musicmessage`.`remark` AS `remark` from ((((((`musicmessage` join `creator`) join `album`) join `creatormakemusic`) join `musicinalbum`) join `music_worker` `a`) join `music_worker` `l`) where ((`musicmessage`.`m_id` = `creatormakemusic`.`m_id`) and (`creatormakemusic`.`c_id` = `creator`.`c_id`) and (`musicmessage`.`m_id` = `musicinalbum`.`m_id`) and (`musicinalbum`.`alb_id` = `album`.`alb_id`) and (`creatormakemusic`.`arrangement_id` = `a`.`music_workerID`) and (`a`.`position` = '作曲') and (`creatormakemusic`.`lyricist_id` = `l`.`music_workerID`) and (`l`.`position` = '作词')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_musicbyname`
--

/*!50001 DROP VIEW IF EXISTS `search_musicbyname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_musicbyname` (`music_name`,`music_id`,`creator_name`,`album_name`,`music_view`,`arrangenment_name`,`lyricist_name`,`music_remark`) AS select `musicmessage`.`m_name` AS `m_name`,`musicmessage`.`m_id` AS `m_id`,`creator`.`name` AS `name`,`album`.`alb_name` AS `alb_name`,`musicmessage`.`view` AS `view`,`a`.`music_workerName` AS `music_workerName`,`l`.`music_workerName` AS `music_workerName`,`musicmessage`.`remark` AS `remark` from ((((((`musicmessage` join `creator`) join `album`) join `creatormakemusic`) join `musicinalbum`) join `music_worker` `a`) join `music_worker` `l`) where ((`musicmessage`.`m_id` = `creatormakemusic`.`m_id`) and (`musicmessage`.`m_id` = `musicinalbum`.`m_id`) and (`creatormakemusic`.`c_id` = `creator`.`c_id`) and (`musicinalbum`.`alb_id` = `album`.`alb_id`) and (`creatormakemusic`.`arrangement_id` = `a`.`music_workerID`) and (`a`.`position` = '作曲') and (`creatormakemusic`.`lyricist_id` = `l`.`music_workerID`) and (`l`.`position` = '作词')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_singerfirstchar`
--

/*!50001 DROP VIEW IF EXISTS `search_singerfirstchar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_singerfirstchar` (`creator_name`,`creator_id`,`creator_gender`,`creator_country`,`creator_area`,`creator_remark`,`creator_view`,`firstchar`) AS select `creator`.`name` AS `name`,`creator`.`c_id` AS `c_id`,`creator`.`gender` AS `gender`,`creator`.`country` AS `country`,`creator`.`area` AS `area`,`creator`.`remark` AS `remark`,`creator`.`view` AS `view`,`creator`.`firstchar` AS `firstchar` from `creator` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_singername`
--

/*!50001 DROP VIEW IF EXISTS `search_singername`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_singername` (`creator_name`,`creator_id`,`creator_gender`,`creator_country`,`creator_area`,`creator_remark`,`creator_view`) AS select `creator`.`name` AS `name`,`creator`.`c_id` AS `c_id`,`creator`.`gender` AS `gender`,`creator`.`country` AS `country`,`creator`.`area` AS `area`,`creator`.`remark` AS `remark`,`creator`.`view` AS `view` from `creator` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `singer_music`
--

/*!50001 DROP VIEW IF EXISTS `singer_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `singer_music` (`singer_name`,`singer_id`,`music_name`,`music_id`) AS select `creator`.`name` AS `name`,`creator`.`c_id` AS `c_id`,`musicmessage`.`m_name` AS `m_name`,`musicmessage`.`m_id` AS `m_id` from ((`creator` join `musicmessage`) join `creatormakemusic`) where ((`creator`.`c_id` = `creatormakemusic`.`c_id`) and (`musicmessage`.`m_id` = `creatormakemusic`.`m_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31  9:54:25
