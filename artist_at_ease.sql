-- MySQL dump 10.13  Distrib 5.6.32, for Linux (x86_64)
--
-- Host: localhost    Database: artist_at_ease
-- ------------------------------------------------------
-- Server version	5.6.32

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
-- Table structure for table `neural_style`
--

DROP TABLE IF EXISTS `neural_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neural_style` (
  `taskid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(80) NOT NULL DEFAULT '',
  `input_path` varchar(1000) NOT NULL,
  `style_path` varchar(1000) NOT NULL,
  `output_name` varchar(1000) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `max_num_epochs` int(10) NOT NULL,
  `uniq_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `uniq_id` (`uniq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=479 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neural_style`
--

LOCK TABLES `neural_style` WRITE;
/*!40000 ALTER TABLE `neural_style` DISABLE KEYS */;
INSERT INTO `neural_style` VALUES (464,'getNeuralStyle','input/dog.jpg','style/vanGogh.jpg','dog_vanGogh','2016-08-27 08:10:31','2016-08-27 08:30:01','finished',20,'20160827_08:10:31_dog_vanGogh_20'),(465,'getNeuralStyle','input/dog.jpg','style/qibaishi.jpg','dog_qibaishi','2016-08-27 08:10:57','2016-08-27 08:30:01','finished',20,'20160827_08:10:56_dog_qibaishi_20'),(466,'getNeuralStyle','input/dog.jpg','style/picasso.jpg','dog_picasso','2016-08-27 08:11:27','2016-08-27 08:30:01','finished',20,'20160827_08:11:27_dog_picasso_20'),(467,'getNeuralStyle','input/bike.jpg','style/picasso.jpg','bike_picasso','2016-08-27 09:44:36','2016-08-27 11:12:01','finished',120,'20160827_09:44:36_bike_picasso_120'),(468,'getNeuralStyle','input/butterfly.jpg','style/vanGogh.jpg','butterfly_vanGogh','2016-08-27 09:47:05','2016-08-27 11:18:01','finished',120,'20160827_09:47:05_butterfly_vanGogh_120'),(469,'getNeuralStyle','input/train.jpg','style/qibaishi.jpg','train_qibaishi','2016-08-27 09:47:38','2016-08-27 11:21:01','finished',120,'20160827_09:47:38_train_qibaishi_120'),(470,'getNeuralStyle','input/sailing.jpg','style/qibaishi.jpg','sailing_qibaishi','2016-08-27 11:41:08','2016-08-27 13:09:01','finished',120,'20160827_11:41:08_sailing_qibaishi_120'),(471,'getNeuralStyle','input/sailing.jpg','style/vanGogh.jpg','sailing_vanGogh','2016-08-27 11:41:42','2016-08-27 13:09:01','finished',120,'20160827_11:41:42_sailing_vanGogh_120'),(472,'getNeuralStyle','input/sunset.jpg','style/vanGogh.jpg','sunset_vanGogh','2016-08-27 11:42:17','2016-08-27 13:00:01','finished',120,'20160827_11:42:17_sunset_vanGogh_120'),(473,'getNeuralStyle','input/sunset.jpg','style/qibaishi.jpg','sunset_qibaishi','2016-08-27 11:42:49','2016-08-27 13:00:01','finished',120,'20160827_11:42:49_sunset_qibaishi_120'),(474,'getNeuralStyle','input/scenary.jpg','style/monai.jpg','scenary_monai','2016-08-27 13:47:36','2016-08-27 16:03:01','finished',120,'20160827_13:47:36_scenary_monai_120'),(475,'getNeuralStyle','input/waterfall.jpg','style/monai.jpg','waterfall_monai','2016-08-27 13:48:03','2016-08-27 15:21:01','finished',120,'20160827_13:48:03_waterfall_monai_120'),(476,'getNeuralStyle','input/waterfall.jpg','style/qibaishi.jpg','waterfall_qibaishi','2016-08-27 13:48:37','1900-01-01 00:00:00','running',120,'20160827_13:48:37_waterfall_qibaishi_120'),(477,'getNeuralStyle','input/dianhua.jpg','style/picassooo.jpg','dianhua_picassooo','2016-08-29 19:45:18','2016-08-29 21:09:01','finished',120,'20160829_19:45:18_dianhua_picassooo_120'),(478,'getNeuralStyle','input/input.jpg','style/bjs.jpg','input_bjs','2016-08-29 19:47:42','2016-08-29 21:12:01','finished',120,'20160829_19:47:42_input_bjs_120');
/*!40000 ALTER TABLE `neural_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neural_style_report`
--

DROP TABLE IF EXISTS `neural_style_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neural_style_report` (
  `reportid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wget_path` varchar(1000) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `uniq_id` varchar(200) DEFAULT NULL,
  `task_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`reportid`),
  KEY `uniq_id` (`uniq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neural_style_report`
--

LOCK TABLES `neural_style_report` WRITE;
/*!40000 ALTER TABLE `neural_style_report` DISABLE KEYS */;
INSERT INTO `neural_style_report` VALUES (36,'http://180.76.146.23:8888/output/dog_vanGogh/dog_vanGogh_20.jpg','2016-08-27 08:10:31','2016-08-27 08:30:01','finished','20160827_08:10:31_dog_vanGogh_20','dog_vanGogh'),(37,'http://180.76.146.23:8888/output/dog_qibaishi/dog_qibaishi_20.jpg','2016-08-27 08:10:57','2016-08-27 08:30:01','finished','20160827_08:10:56_dog_qibaishi_20','dog_qibaishi'),(38,'http://180.76.146.23:8888/output/dog_picasso/dog_picasso_20.jpg','2016-08-27 08:11:27','2016-08-27 08:30:01','finished','20160827_08:11:27_dog_picasso_20','dog_picasso'),(39,'http://180.76.146.23:8888/output/bike_picasso/bike_picasso_120.jpg','2016-08-27 09:44:36','2016-08-27 11:12:01','finished','20160827_09:44:36_bike_picasso_120','bike_picasso'),(40,'http://180.76.146.23:8888/output/butterfly_vanGogh/butterfly_vanGogh_120.jpg','2016-08-27 09:47:05','2016-08-27 11:18:01','finished','20160827_09:47:05_butterfly_vanGogh_120','butterfly_vanGogh'),(41,'http://180.76.146.23:8888/output/train_qibaishi/train_qibaishi_120.jpg','2016-08-27 09:47:38','2016-08-27 11:21:01','finished','20160827_09:47:38_train_qibaishi_120','train_qibaishi'),(42,'http://180.76.146.23:8888/output/sailing_qibaishi/sailing_qibaishi_120.jpg','2016-08-27 11:41:08','2016-08-27 13:09:01','finished','20160827_11:41:08_sailing_qibaishi_120','sailing_qibaishi'),(43,'http://180.76.146.23:8888/output/sailing_vanGogh/sailing_vanGogh_120.jpg','2016-08-27 11:41:42','2016-08-27 13:09:01','finished','20160827_11:41:42_sailing_vanGogh_120','sailing_vanGogh'),(44,'http://180.76.146.23:8888/output/sunset_vanGogh/sunset_vanGogh_120.jpg','2016-08-27 11:42:17','2016-08-27 13:00:01','finished','20160827_11:42:17_sunset_vanGogh_120','sunset_vanGogh'),(45,'http://180.76.146.23:8888/output/sunset_qibaishi/sunset_qibaishi_120.jpg','2016-08-27 11:42:49','2016-08-27 13:00:01','finished','20160827_11:42:49_sunset_qibaishi_120','sunset_qibaishi'),(46,'http://180.76.146.23:8888/output/scenary_monai/scenary_monai_120.jpg','2016-08-27 13:47:36','2016-08-27 16:03:01','finished','20160827_13:47:36_scenary_monai_120','scenary_monai'),(47,'http://180.76.146.23:8888/output/waterfall_monai/waterfall_monai_120.jpg','2016-08-27 13:48:03','2016-08-27 15:21:01','finished','20160827_13:48:03_waterfall_monai_120','waterfall_monai'),(48,'http://180.76.146.23:8888/output/waterfall_qibaishi/waterfall_qibaishi_120.jpg','2016-08-27 13:48:37','1900-01-01 00:00:00','running','20160827_13:48:37_waterfall_qibaishi_120','waterfall_qibaishi'),(49,'http://180.76.146.23:8888/output/dianhua_picassooo/dianhua_picassooo_120.jpg','2016-08-29 19:45:18','2016-08-29 21:09:01','finished','20160829_19:45:18_dianhua_picassooo_120','dianhua_picassooo'),(50,'http://180.76.146.23:8888/output/input_bjs/input_bjs_120.jpg','2016-08-29 19:47:42','2016-08-29 21:12:01','finished','20160829_19:47:42_input_bjs_120','input_bjs');
/*!40000 ALTER TABLE `neural_style_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-29 22:47:18
