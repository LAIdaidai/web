-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: web
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backup_backup_videos`
--

DROP TABLE IF EXISTS `backup_backup_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_backup_videos` (
  `id` int NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `average_rating` double DEFAULT '0',
  `region` varchar(100) NOT NULL DEFAULT '未知',
  `cover_image_path` varchar(255) NOT NULL DEFAULT 'default_cover.jpg',
  `type` varchar(50) DEFAULT '动漫'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_backup_videos`
--

LOCK TABLES `backup_backup_videos` WRITE;
/*!40000 ALTER TABLE `backup_backup_videos` DISABLE KEYS */;
INSERT INTO `backup_backup_videos` VALUES (1,'仙逆','/videos/仙逆.mp4',7.8571,'中国','images/仙逆.jpg','动漫'),(2,'剑来','/videos/剑来.mp4',8.6364,'中国','images/剑来.jpg','动漫'),(3,'斗破苍穹','/videos/斗破苍穹.mp4',9.2,'中国','images/斗破苍穹.png','动漫'),(4,'吞噬星空剧场版 血洛大陆','/videos/吞噬星空剧场版 血洛大陆.mp4',6.3,'中国','images/吞噬星空剧场版 血洛大陆.jpg','电影'),(5,'蜡笔小新：风起云涌的丛林冒险','/video/蜡笔小新：风起云涌的丛林冒险.mp4',9.3333,'日本','images/蜡笔小新：风起云涌的丛林冒险.png','电影'),(6,'蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～','/video/蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～.mp4',8.6667,'日本','images/蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～.png','电影'),(7,'蜡笔小新：幽灵忍者珍风传','/video/蜡笔小新：幽灵忍者珍风传.mp4',8,'日本','images/蜡笔小新：幽灵忍者珍风传.png','电影'),(8,'蜡笔小新：我的超时空新娘','/video/蜡笔小新：我的超时空新娘.mp4',8.5,'日本','images/蜡笔小新：我的超时空新娘.png','电影'),(9,'完美世界','/video/完美世界.mp4',8,'欧美','images/完美世界.png','动漫'),(10,'诛仙','/videos/诛仙.mp4',8,'中国','images/诛仙.png','动漫'),(11,'百变小樱','/videos/百变小樱.mp4',9,'日本','images/百变小樱.png','动漫'),(12,'寻梦环游记','/videos/寻梦环游记.mp4',0,'欧美','images/寻梦环游记.png','动漫'),(13,'海底总动员','/videos/海底总动员.mp4',0,'欧美','images/海底总动员.jpg','电影'),(14,'玩具总动员','/videos/玩具总动员.mp4',0,'欧美','images/玩具总动员.png','电影'),(15,'疯狂元素城','/videos/疯狂元素城.mp4',0,'欧美','images/疯狂元素城.png','电影'),(16,'赛车总动员','/videos/赛车总动员.mp4',0,'欧美','images/赛车总动员.png','电影'),(19,'徐一铚蓄意谋杀','/videos/徐一铚蓄意谋杀.mp4',8,'日本','/images/徐一铚蓄意谋杀.png','动漫'),(20,'徐一铚蓄意谋杀杨冉123','/videos/徐一铚蓄意谋杀杨冉123.mp4',0,'中国','/images/徐一铚蓄意谋杀杨冉123.png','动漫'),(21,'雪中悍刀行','/videos/雪中悍刀行.mp4',8,'中国','/images/雪中悍刀行.png','电视剧'),(22,'龙族','/videos/龙族.mp4',0,'中国','/images/龙族.png','动漫'),(23,'123','/videos/123.mp4',0,'中国','/images/123.png','动漫'),(24,'123123','/videos/123123.mp4',0,'中国','/images/123123.png','动漫');
/*!40000 ALTER TABLE `backup_backup_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_comments`
--

DROP TABLE IF EXISTS `backup_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_comments` (
  `id` int NOT NULL DEFAULT '0',
  `video_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_comments`
--

LOCK TABLES `backup_comments` WRITE;
/*!40000 ALTER TABLE `backup_comments` DISABLE KEYS */;
INSERT INTO `backup_comments` VALUES (1,1,'张三','这部影片非常好看！','2024-12-15 14:06:59'),(2,1,'赖俞慈','确实非常好看！','2024-12-15 15:53:38'),(3,2,'admin','国漫巅峰无疑！','2024-12-15 15:54:51'),(4,2,'admin','国漫巅峰无疑！','2024-12-15 23:24:00'),(5,2,'admin','国漫巅峰无疑！','2024-12-15 17:13:52'),(6,1,'匿名','好看吗','2024-12-15 18:07:49'),(7,1,'赖俞慈','相当好看啊','2024-12-15 18:08:31'),(8,1,'赖俞慈','','2024-12-15 18:09:06'),(10,1,'匿名','好腿','2024-12-15 18:12:50'),(11,1,'匿名','                   1                                                 ','2024-12-15 18:23:19'),(12,1,'匿名',' 1 2 3','2024-12-15 18:23:33'),(13,1,'匿名','哈哈哈服主太帅了666','2024-12-15 18:35:09'),(14,2,'匿名','怎么你们看到的是国漫 我看的不一样啊','2024-12-15 18:36:03'),(15,1,'匿名','徐一铚太帅了','2024-12-15 18:36:25'),(16,3,'匿名','斗破苍穹是什么动漫','2024-12-15 20:45:14'),(17,5,'匿名','这是什么电影？','2024-12-15 21:42:10'),(18,1,'1937444162','老蛇皮赖','2024-12-16 08:35:04'),(19,2,'YANGLINGXIN','国漫巅峰无疑！','2024-12-16 20:43:45'),(20,1,'匿名','什么鬼','2024-12-17 11:11:56'),(22,6,'匿名','我爱广智','2024-12-17 11:14:31'),(23,1,'徐可莉','赖哥今天穿的不错啊','2024-12-19 09:52:46'),(24,9,'赖俞慈','完美世界是什么动漫','2024-12-19 09:53:04'),(25,2,'徐可莉','感动哭了😭','2024-12-19 09:53:07'),(26,10,'徐可莉','承包评论区','2024-12-19 09:53:42'),(28,2,'赖俞慈','改好了吗','2024-12-20 15:30:55'),(30,2,'赖俞慈','好看','2024-12-20 15:41:10'),(31,2,'赖俞慈','怎么看','2024-12-20 15:55:45'),(33,2,'赖俞慈','怎么看','2024-12-20 15:59:25'),(34,2,'赖俞慈','这是一条评论','2024-12-20 19:31:45'),(36,3,'匿名','111','2024-12-21 22:56:30'),(37,1,'匿名','111','2024-12-21 23:03:49'),(39,3,'匿名','111','2024-12-22 10:49:46'),(40,7,'匿名','111','2024-12-22 12:22:43'),(41,19,'admin','111','2024-12-22 12:31:12'),(44,5,'admin','这是一条评论','2024-12-25 16:03:10'),(45,11,'匿名','好看','2024-12-27 14:22:09'),(46,1,'test','这个视频很好看','2024-12-27 18:13:46'),(47,3,'匿名','这是一条评论','2024-12-27 18:19:29');
/*!40000 ALTER TABLE `backup_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_play_history`
--

DROP TABLE IF EXISTS `backup_play_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_play_history` (
  `id` int NOT NULL DEFAULT '0',
  `video_id` int NOT NULL,
  `play_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_play_history`
--

LOCK TABLES `backup_play_history` WRITE;
/*!40000 ALTER TABLE `backup_play_history` DISABLE KEYS */;
INSERT INTO `backup_play_history` VALUES (1,2,'2024-12-23 20:41:30','admin'),(2,3,'2024-12-28 17:36:05','admin'),(3,6,'2024-12-22 18:56:42','admin'),(4,8,'2024-12-21 23:16:55','admin'),(5,4,'2024-12-25 15:37:22','admin'),(6,6,'2024-12-22 13:17:06','赖俞慈'),(7,7,'2024-12-18 10:47:52','admin'),(8,1,'2024-12-22 12:52:06','admin'),(9,19,'2024-12-22 12:31:12','admin'),(10,21,'2024-12-22 12:32:31','赖俞慈'),(11,19,'2024-12-22 12:36:00','匿名'),(12,16,'2024-12-22 12:36:19','赖俞慈'),(13,21,'2024-12-22 18:56:50','admin'),(14,3,'2024-12-28 16:37:55','匿名'),(15,6,'2024-12-22 14:05:30','匿名'),(16,21,'2024-12-22 14:07:45','匿名'),(17,1,'2024-12-22 14:08:17','匿名'),(18,11,'2024-12-22 14:40:36','admin'),(19,5,'2024-12-25 16:03:11','admin'),(20,2,'2024-12-28 16:25:14','匿名'),(21,22,'2024-12-22 19:35:20','admin'),(22,23,'2024-12-22 19:33:58','admin'),(23,24,'2024-12-22 19:35:12','admin'),(24,5,'2024-12-23 20:44:39','匿名'),(25,2,'2024-12-23 20:45:54','乞丐'),(26,8,'2024-12-23 20:46:01','乞丐'),(27,22,'2024-12-25 15:35:28','匿名'),(28,7,'2024-12-28 16:21:43','匿名'),(29,13,'2024-12-28 17:32:16','admin');
/*!40000 ALTER TABLE `backup_play_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_ratings`
--

DROP TABLE IF EXISTS `backup_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_ratings` (
  `id` int NOT NULL DEFAULT '0',
  `video_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `rating` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_ratings`
--

LOCK TABLES `backup_ratings` WRITE;
/*!40000 ALTER TABLE `backup_ratings` DISABLE KEYS */;
INSERT INTO `backup_ratings` VALUES (1,1,'匿名',6),(2,1,'匿名',8),(3,1,'匿名',10),(4,1,'匿名',6),(5,1,'匿名',2),(6,1,'匿名',8),(7,2,'匿名',10),(8,1,'赖俞慈',8),(9,1,'赖俞慈',8),(10,3,'匿名',10),(11,2,'匿名',8),(12,5,'赖俞慈',10),(13,3,'赖俞慈',8),(14,1,'1937444162',10),(15,2,'赖俞慈',10),(16,2,'赖俞慈',8),(17,1,'匿名',10),(18,7,'赖俞慈',8),(19,9,'赖俞慈',8),(20,5,'徐可莉',10),(21,5,'徐可莉',10),(22,5,'徐可莉',10),(23,4,'赖俞慈',10),(24,10,'赖俞慈',8),(25,4,'匿名',8),(26,4,'匿名',8),(27,4,'匿名',8),(28,4,'匿名',4),(29,4,'匿名',2),(30,4,'匿名',3),(31,4,'匿名',5),(32,4,'匿名',5),(33,2,'admin',5),(34,1,'匿名',8),(35,1,'匿名',8),(36,1,'匿名',8),(37,2,'匿名',10),(38,2,'匿名',10),(39,5,'匿名',8),(40,2,'匿名',10),(41,3,'匿名',10),(42,6,'admin',10),(43,7,'admin',10),(44,7,'admin',4),(45,7,'匿名',10),(46,19,'admin',8),(47,19,'匿名',8),(48,6,'赖俞慈',8),(49,2,'admin',8),(50,2,'admin',8),(51,2,'admin',8),(52,6,'匿名',8),(53,3,'admin',10),(54,21,'匿名',8),(55,4,'admin',10),(56,11,'admin',10),(57,21,'admin',8),(58,5,'admin',8),(59,11,'匿名',8),(60,1,'test',10),(61,3,'test',8);
/*!40000 ALTER TABLE `backup_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_users`
--

DROP TABLE IF EXISTS `backup_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_users` (
  `id` int NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `phoneNumber` varchar(15) DEFAULT '13634273770'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_users`
--

LOCK TABLES `backup_users` WRITE;
/*!40000 ALTER TABLE `backup_users` DISABLE KEYS */;
INSERT INTO `backup_users` VALUES (1,'admin','123','2024-12-16 08:38:46','13634273770'),(2,'赖俞慈','123','2024-12-16 08:38:46','13634273770'),(3,'laiyuci','1','2024-12-16 08:38:46','13634273770'),(4,'xjl','qqq111ww','2024-12-16 08:38:46','13634273770'),(5,'1937444162','qqq111ww','2024-12-16 08:38:46','13634273770'),(6,'哇哈哈','666','2024-12-16 08:40:44','13634273770'),(7,'YANGLINGXIN','yang20050825','2024-12-16 20:36:51','13634273770'),(8,'徐可莉','123','2024-12-19 09:52:10','13634273770'),(9,'admin','123','2024-12-20 15:33:10','13634273770'),(10,'laiyuci1','123','2024-12-22 13:38:53','13634273771'),(11,'乞丐','123','2024-12-23 20:45:33','15279831909'),(12,'test','123','2024-12-27 18:13:00','13634273770');
/*!40000 ALTER TABLE `backup_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `video_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'张三','这部影片非常好看！','2024-12-15 14:06:59'),(2,1,'赖俞慈','确实非常好看！','2024-12-15 15:53:38'),(3,2,'admin','国漫巅峰无疑！','2024-12-15 15:54:51'),(4,2,'admin','国漫巅峰无疑！','2024-12-15 23:24:00'),(5,2,'admin','国漫巅峰无疑！','2024-12-15 17:13:52'),(6,1,'匿名','好看吗','2024-12-15 18:07:49'),(7,1,'赖俞慈','相当好看啊','2024-12-15 18:08:31'),(8,1,'赖俞慈','','2024-12-15 18:09:06'),(9,1,'匿名','好腿','2024-12-15 18:12:50'),(10,1,'匿名','                   1                                                 ','2024-12-15 18:23:19'),(11,1,'匿名',' 1 2 3','2024-12-15 18:23:33'),(12,1,'匿名','哈哈哈服主太帅了666','2024-12-15 18:35:09'),(13,2,'匿名','怎么你们看到的是国漫 我看的不一样啊','2024-12-15 18:36:03'),(14,1,'匿名','徐一铚太帅了','2024-12-15 18:36:25'),(15,3,'匿名','斗破苍穹是什么动漫','2024-12-15 20:45:14'),(16,5,'匿名','这是什么电影？','2024-12-15 21:42:10'),(17,1,'1937444162','老蛇皮赖','2024-12-16 08:35:04'),(18,2,'YANGLINGXIN','国漫巅峰无疑！','2024-12-16 20:43:45'),(19,1,'匿名','什么鬼','2024-12-17 11:11:56'),(20,6,'匿名','我爱广智','2024-12-17 11:14:31'),(21,1,'徐可莉','赖哥今天穿的不错啊','2024-12-19 09:52:46'),(22,9,'赖俞慈','完美世界是什么动漫','2024-12-19 09:53:04'),(23,2,'徐可莉','感动哭了😭','2024-12-19 09:53:07'),(24,10,'徐可莉','承包评论区','2024-12-19 09:53:42'),(25,2,'赖俞慈','改好了吗','2024-12-20 15:30:55'),(26,2,'赖俞慈','好看','2024-12-20 15:41:10'),(27,2,'赖俞慈','怎么看','2024-12-20 15:55:45'),(28,2,'赖俞慈','怎么看','2024-12-20 15:59:25'),(29,2,'赖俞慈','这是一条评论','2024-12-20 19:31:45'),(30,3,'匿名','111','2024-12-21 22:56:30'),(31,1,'匿名','111','2024-12-21 23:03:49'),(32,3,'匿名','111','2024-12-22 10:49:46'),(33,7,'匿名','111','2024-12-22 12:22:43'),(35,5,'admin','这是一条评论','2024-12-25 16:03:10'),(36,11,'匿名','好看','2024-12-27 14:22:09'),(37,1,'test','这个视频很好看','2024-12-27 18:13:46'),(38,3,'匿名','这是一条评论','2024-12-27 18:19:29');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_history`
--

DROP TABLE IF EXISTS `play_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `play_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `video_id` int NOT NULL,
  `play_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `play_history_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_history`
--

LOCK TABLES `play_history` WRITE;
/*!40000 ALTER TABLE `play_history` DISABLE KEYS */;
INSERT INTO `play_history` VALUES (1,'admin',2,'2024-12-23 20:41:30'),(2,'admin',3,'2024-12-28 17:36:05'),(3,'admin',6,'2024-12-22 18:56:42'),(4,'admin',8,'2024-12-21 23:16:55'),(5,'admin',4,'2024-12-25 15:37:22'),(6,'赖俞慈',6,'2024-12-22 13:17:06'),(7,'admin',7,'2024-12-18 10:47:52'),(8,'admin',1,'2024-12-22 12:52:06'),(12,'赖俞慈',16,'2024-12-22 12:36:19'),(14,'匿名',3,'2024-12-28 16:37:55'),(15,'匿名',6,'2024-12-22 14:05:30'),(17,'匿名',1,'2024-12-22 14:08:17'),(18,'admin',11,'2024-12-22 14:40:36'),(19,'admin',5,'2024-12-25 16:03:11'),(20,'匿名',2,'2024-12-28 16:25:14'),(24,'匿名',5,'2024-12-23 20:44:39'),(25,'乞丐',2,'2024-12-23 20:45:54'),(26,'乞丐',8,'2024-12-23 20:46:01'),(28,'匿名',7,'2024-12-28 16:21:43'),(29,'admin',13,'2024-12-28 17:32:16');
/*!40000 ALTER TABLE `play_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `video_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,'匿名',6),(2,1,'匿名',8),(3,1,'匿名',10),(4,1,'匿名',6),(5,1,'匿名',2),(6,1,'匿名',8),(7,2,'匿名',10),(8,1,'赖俞慈',8),(9,1,'赖俞慈',8),(10,3,'匿名',10),(11,2,'匿名',8),(12,5,'赖俞慈',10),(13,3,'赖俞慈',8),(14,1,'1937444162',10),(15,2,'赖俞慈',10),(16,2,'赖俞慈',8),(17,1,'匿名',10),(18,7,'赖俞慈',8),(19,9,'赖俞慈',8),(20,5,'徐可莉',10),(21,5,'徐可莉',10),(22,5,'徐可莉',10),(23,4,'赖俞慈',10),(24,10,'赖俞慈',8),(25,4,'匿名',8),(26,4,'匿名',8),(27,4,'匿名',8),(28,4,'匿名',4),(29,4,'匿名',2),(30,4,'匿名',3),(31,4,'匿名',5),(32,4,'匿名',5),(33,2,'admin',5),(34,1,'匿名',8),(35,1,'匿名',8),(36,1,'匿名',8),(37,2,'匿名',10),(38,2,'匿名',10),(39,5,'匿名',8),(40,2,'匿名',10),(41,3,'匿名',10),(42,6,'admin',10),(43,7,'admin',10),(44,7,'admin',4),(45,7,'匿名',10),(48,6,'赖俞慈',8),(49,2,'admin',8),(50,2,'admin',8),(51,2,'admin',8),(52,6,'匿名',8),(53,3,'admin',10),(55,4,'admin',10),(56,11,'admin',10),(58,5,'admin',8),(59,11,'匿名',8),(60,1,'test',10),(61,3,'test',8);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `register_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','13634273770','2024-12-16 08:38:46'),(2,'赖俞慈','123','13634273770','2024-12-16 08:38:46'),(3,'laiyuci','1','13634273770','2024-12-16 08:38:46'),(4,'xjl','qqq111ww','13634273770','2024-12-16 08:38:46'),(5,'1937444162','qqq111ww','13634273770','2024-12-16 08:38:46'),(6,'哇哈哈','666','13634273770','2024-12-16 08:40:44'),(7,'YANGLINGXIN','yang20050825','13634273770','2024-12-16 20:36:51'),(8,'徐可莉','123','13634273770','2024-12-19 09:52:10'),(9,'admin','123','13634273770','2024-12-20 15:33:10'),(10,'laiyuci1','123','13634273771','2024-12-22 13:38:53'),(11,'乞丐','123','15279831909','2024-12-23 20:45:33'),(12,'test','123','13634273770','2024-12-27 18:13:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `average_rating` double DEFAULT '0',
  `region` varchar(100) NOT NULL DEFAULT '未知',
  `cover_image_path` varchar(255) NOT NULL DEFAULT 'default_cover.jpg',
  `type` varchar(50) NOT NULL DEFAULT '动漫',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'仙逆','/videos/仙逆.mp4',7.8571,'中国','images/仙逆.jpg','动漫'),(2,'剑来','/videos/剑来.mp4',8.6364,'中国','images/剑来.jpg','动漫'),(3,'斗破苍穹','/videos/斗破苍穹.mp4',9.2,'中国','images/斗破苍穹.png','动漫'),(4,'吞噬星空剧场版 血洛大陆','/videos/吞噬星空剧场版 血洛大陆.mp4',6.3,'中国','images/吞噬星空剧场版 血洛大陆.jpg','电影'),(5,'蜡笔小新：风起云涌的丛林冒险','/video/蜡笔小新：风起云涌的丛林冒险.mp4',9.3333,'日本','images/蜡笔小新：风起云涌的丛林冒险.png','电影'),(6,'蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～','/video/蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～.mp4',8.6667,'日本','images/蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～.png','电影'),(7,'蜡笔小新：幽灵忍者珍风传','/video/蜡笔小新：幽灵忍者珍风传.mp4',8,'日本','images/蜡笔小新：幽灵忍者珍风传.png','电影'),(8,'蜡笔小新：我的超时空新娘','/video/蜡笔小新：我的超时空新娘.mp4',8.5,'日本','images/蜡笔小新：我的超时空新娘.png','电影'),(9,'完美世界','/video/完美世界.mp4',8,'欧美','images/完美世界.png','动漫'),(10,'诛仙','/videos/诛仙.mp4',8,'中国','images/诛仙.png','动漫'),(11,'百变小樱','/videos/百变小樱.mp4',9,'日本','images/百变小樱.png','动漫'),(12,'寻梦环游记','/videos/寻梦环游记.mp4',0,'欧美','images/寻梦环游记.png','电影'),(13,'海底总动员','/videos/海底总动员.mp4',0,'欧美','images/海底总动员.jpg','电影'),(14,'玩具总动员','/videos/玩具总动员.mp4',0,'欧美','images/玩具总动员.png','电影'),(15,'疯狂元素城','/videos/疯狂元素城.mp4',0,'欧美','images/疯狂元素城.png','电影'),(16,'赛车总动员','/videos/赛车总动员.mp4',0,'欧美','images/赛车总动员.png','电影');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-28 19:07:07
