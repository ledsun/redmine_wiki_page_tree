--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'wiki');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  `default_version_id` int(11) DEFAULT NULL,
  `default_assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'魔神英雄伝ワタルシリーズ','','',1,NULL,'2017-11-13 10:30:19','2017-11-13 10:30:19','wataru',1,1,2,0,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `comments` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
INSERT INTO `wiki_content_versions` VALUES (1,1,1,1,'h1. Wiki','','','2017-11-13 10:30:47',1),(2,2,2,1,'h1. 魔神英雄伝ワタルシリーズ','','','2017-11-13 10:30:55',1),(3,3,3,1,'h1. OVA','','','2017-11-13 10:31:11',1),(4,4,4,1,'h1. 真 魔神英雄伝ワタル','','','2017-11-13 10:31:23',1),(5,5,5,1,'h1. 魔神英雄伝ワタル 終わりなき時の物語','','','2017-11-13 10:31:39',1),(6,6,6,1,'h1. TVアニメ','','','2017-11-13 10:32:12',1),(7,7,7,1,'h1. 超魔神英雄伝ワタル','','','2017-11-13 10:32:27',1),(8,8,8,1,'h1. 魔神英雄伝ワタル','','','2017-11-13 10:32:39',1),(9,9,9,1,'h1. 魔神英雄伝ワタル2','','','2017-11-13 10:32:48',1),(10,10,10,1,'h1. ラジメーション','','','2017-11-13 10:34:29',1),(11,11,11,1,'h1. 魔神英雄伝ワタル3','','','2017-11-13 10:34:40',1),(12,12,12,1,'h1. 魔神英雄伝ワタル3 虎王物語','','','2017-11-13 10:35:02',1),(13,13,13,1,'h1. 魔神英雄伝ワタル4','','','2017-11-13 10:35:15',1),(14,14,14,1,'h1. 魔神英雄伝ワタル外伝 ピュアピュアヒミコ','','','2017-11-13 10:35:25',1),(15,15,15,1,'h1. 玩具','','','2017-11-13 10:35:56',1),(16,16,16,1,'h1. ROBOT魂','','','2017-11-13 10:36:03',1),(17,17,17,1,'h1. プラクション','','','2017-11-13 10:36:24',1),(18,18,18,1,'h1. 魔神大集合','','','2017-11-13 10:36:54',1),(19,19,19,1,'h1. 復刻版魔神大集合','','','2017-11-13 10:37:01',1),(20,20,20,1,'h1. 超力魔神大系','','','2017-11-13 10:37:25',1),(21,21,21,1,'h1. 登場人物','','','2017-11-13 10:37:43',1),(22,22,22,1,'h1. 関連作品','','','2017-11-13 10:38:03',1),(23,23,23,1,'h1. パロ伝','','','2017-11-13 10:38:15',1),(24,24,24,1,'h1. 超魔神伝説','','','2017-11-13 10:38:22',1);
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `comments` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
INSERT INTO `wiki_contents` VALUES (1,1,1,'h1. Wiki','','2017-11-13 10:30:47',1),(2,2,1,'h1. 魔神英雄伝ワタルシリーズ','','2017-11-13 10:30:55',1),(3,3,1,'h1. OVA','','2017-11-13 10:31:11',1),(4,4,1,'h1. 真 魔神英雄伝ワタル','','2017-11-13 10:31:23',1),(5,5,1,'h1. 魔神英雄伝ワタル 終わりなき時の物語','','2017-11-13 10:31:39',1),(6,6,1,'h1. TVアニメ','','2017-11-13 10:32:12',1),(7,7,1,'h1. 超魔神英雄伝ワタル','','2017-11-13 10:32:27',1),(8,8,1,'h1. 魔神英雄伝ワタル','','2017-11-13 10:32:39',1),(9,9,1,'h1. 魔神英雄伝ワタル2','','2017-11-13 10:32:48',1),(10,10,1,'h1. ラジメーション','','2017-11-13 10:34:29',1),(11,11,1,'h1. 魔神英雄伝ワタル3','','2017-11-13 10:34:40',1),(12,12,1,'h1. 魔神英雄伝ワタル3 虎王物語','','2017-11-13 10:35:02',1),(13,13,1,'h1. 魔神英雄伝ワタル4','','2017-11-13 10:35:15',1),(14,14,1,'h1. 魔神英雄伝ワタル外伝 ピュアピュアヒミコ','','2017-11-13 10:35:25',1),(15,15,1,'h1. 玩具','','2017-11-13 10:35:56',1),(16,16,1,'h1. ROBOT魂','','2017-11-13 10:36:03',1),(17,17,1,'h1. プラクション','','2017-11-13 10:36:24',1),(18,18,1,'h1. 魔神大集合','','2017-11-13 10:36:54',1),(19,19,1,'h1. 復刻版魔神大集合','','2017-11-13 10:37:01',1),(20,20,1,'h1. 超力魔神大系','','2017-11-13 10:37:25',1),(21,21,1,'h1. 登場人物','','2017-11-13 10:37:43',1),(22,22,1,'h1. 関連作品','','2017-11-13 10:38:03',1),(23,23,1,'h1. パロ伝','','2017-11-13 10:38:15',1),(24,24,1,'h1. 超魔神伝説','','2017-11-13 10:38:22',1);
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
INSERT INTO `wiki_pages` VALUES (1,1,'Wiki','2017-11-13 10:30:47',0,NULL),(2,1,'魔神英雄伝ワタルシリーズ','2017-11-13 10:30:55',0,NULL),(3,1,'OVA','2017-11-13 10:31:11',0,2),(4,1,'真_魔神英雄伝ワタル','2017-11-13 10:31:23',0,3),(5,1,'魔神英雄伝ワタル_終わりなき時の物語','2017-11-13 10:31:39',0,3),(6,1,'TVアニメ','2017-11-13 10:32:12',0,2),(7,1,'超魔神英雄伝ワタル','2017-11-13 10:32:27',0,6),(8,1,'魔神英雄伝ワタル','2017-11-13 10:32:39',0,6),(9,1,'魔神英雄伝ワタル2','2017-11-13 10:32:48',0,6),(10,1,'ラジメーション','2017-11-13 10:34:29',0,2),(11,1,'魔神英雄伝ワタル3','2017-11-13 10:34:40',0,10),(12,1,'魔神英雄伝ワタル3_虎王物語','2017-11-13 10:35:02',0,10),(13,1,'魔神英雄伝ワタル4','2017-11-13 10:35:15',0,10),(14,1,'魔神英雄伝ワタル外伝_ピュアピュアヒミコ','2017-11-13 10:35:25',0,10),(15,1,'玩具','2017-11-13 10:35:56',0,2),(16,1,'ROBOT魂','2017-11-13 10:36:03',0,15),(17,1,'プラクション','2017-11-13 10:36:24',0,15),(18,1,'魔神大集合','2017-11-13 10:36:54',0,17),(19,1,'復刻版魔神大集合','2017-11-13 10:37:01',0,17),(20,1,'超力魔神大系','2017-11-13 10:37:25',0,15),(21,1,'登場人物','2017-11-13 10:37:43',0,2),(22,1,'関連作品','2017-11-13 10:38:03',0,15),(23,1,'パロ伝','2017-11-13 10:38:15',0,22),(24,1,'超魔神伝説','2017-11-13 10:38:22',0,22);
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--
