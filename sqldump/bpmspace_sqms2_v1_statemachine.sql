-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bpmspace_sqms2_v1
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'bpmspace_sqms2_v1'
--

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `form_data` mediumtext CHARACTER SET utf8,
  `entrypoint` tinyint(1) NOT NULL DEFAULT '0',
  `statemachine_id` bigint(20) NOT NULL DEFAULT '1',
  `script_IN` mediumtext CHARACTER SET utf8,
  `script_OUT` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`state_id`),
  KEY `statemachine_id` (`statemachine_id`),
  KEY `state_machine_id_fk` (`statemachine_id`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_10` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_11` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_12` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_13` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_14` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_15` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_2` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_3` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_4` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_5` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_6` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_7` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_8` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_ibfk_9` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`),
  CONSTRAINT `state_machine_id_fk` FOREIGN KEY (`statemachine_id`) REFERENCES `state_machines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7512 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (7457,'new','',1,2246,NULL,NULL),(7458,'active','{\"sqms2_Answer_History\":{\"mode_form\":\"ro\"}}',0,2246,NULL,NULL),(7459,'update','',0,2246,NULL,NULL),(7460,'inactive','{\"sqms2_Answer_History\":{\"mode_form\":\"ro\"}}',0,2246,NULL,NULL),(7461,'new','',1,2247,NULL,NULL),(7462,'ready','{\"sqms2_Syllabus_titel\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_History\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Valid_from\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Valid_to\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Version\":{\"mode_form\":\"ro\"}}',0,2247,'',''),(7463,'update','',0,2247,NULL,NULL),(7464,'published','{\"sqms2_Syllabus_titel\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_History\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Valid_from\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Valid_to\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Version\":{\"mode_form\":\"ro\"}}',0,2247,'',''),(7465,'new','',1,2248,NULL,NULL),(7466,'active','{\"sqms2_SyllabusChapter_titel\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_History\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_ChapterNumber\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_Severity\":{\"mode_form\":\"ro\"}}',0,2248,NULL,NULL),(7467,'update','',0,2248,NULL,NULL),(7468,'inactive','{\"sqms2_SyllabusChapter_titel\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_History\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_ChapterNumber\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_Severity\":{\"mode_form\":\"ro\"}}',0,2248,NULL,NULL),(7469,'new','',1,2249,NULL,NULL),(7470,'active','{\"sqms2_Question_History\":{\"mode_form\":\"ro\"},\"_LIAMUSER_ID\":{\"mode_form\":\"ro\"},\"sqms2_Question_Version\":{\"mode_form\":\"ro\"},\"sqms2_Question_type\":{\"mode_form\":\"ro\"}}',0,2249,NULL,NULL),(7471,'update','',0,2249,NULL,NULL),(7472,'inactive','{\"sqms2_Question_History\":{\"mode_form\":\"ro\"},\"_LIAMUSER_ID\":{\"mode_form\":\"ro\"},\"sqms2_Question_Version\":{\"mode_form\":\"ro\"},\"sqms2_Question_type\":{\"mode_form\":\"ro\"}}',0,2249,NULL,NULL),(7473,'new','',1,2250,NULL,NULL),(7474,'active','{\"sqms2_Text\":{\"mode_form\":\"ro\"},\"sqms2_text_History\":{\"mode_form\":\"ro\"},\"sqms2_language_iso_short\":{\"mode_form\":\"ro\"}}',0,2250,NULL,NULL),(7475,'update','',0,2250,NULL,NULL),(7476,'inactive','{\"sqms2_Text\":{\"mode_form\":\"ro\"},\"sqms2_text_History\":{\"mode_form\":\"ro\"},\"sqms2_language_iso_short\":{\"mode_form\":\"ro\"}}',0,2250,NULL,NULL),(7477,'new','',1,2251,NULL,NULL),(7478,'active','{\"sqms2_Topic_title\":{\"mode_form\":\"ro\"},\"sqms2_Topic_History\":{\"mode_form\":\"ro\"}}',0,2251,NULL,NULL),(7479,'update','',0,2251,NULL,NULL),(7480,'inactive','{\"sqms2_Topic_title\":{\"mode_form\":\"ro\"},\"sqms2_Topic_History\":{\"mode_form\":\"ro\"}}',0,2251,NULL,NULL),(7481,'new','',1,2252,NULL,NULL),(7482,'active','{\"sqms2_ExamSetVersion_title\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_History\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_Version\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_Set\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_SampleSet\":{\"mode_form\":\"ro\"}}',0,2252,NULL,NULL),(7483,'update','',0,2252,NULL,NULL),(7484,'inactive','{\"sqms2_ExamSetVersion_title\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_History\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_Version\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_Set\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_SampleSet\":{\"mode_form\":\"ro\"}}',0,2252,NULL,NULL),(7485,'selected','',1,2253,NULL,NULL),(7486,'unselected','',0,2253,NULL,NULL),(7487,'selected','',1,2254,NULL,NULL),(7488,'unselected','',0,2254,NULL,NULL),(7489,'selected','',1,2255,NULL,NULL),(7490,'unselected','',0,2255,NULL,NULL),(7491,'selected','',1,2256,NULL,NULL),(7492,'unselected','',0,2256,NULL,NULL),(7493,'selected','',1,2257,NULL,NULL),(7494,'unselected','',0,2257,NULL,NULL),(7495,'selected','',1,2258,NULL,NULL),(7496,'unselected','',0,2258,NULL,NULL),(7497,'selected','',1,2259,NULL,NULL),(7498,'unselected','',0,2259,NULL,NULL),(7499,'selected','',1,2260,NULL,NULL),(7500,'unselected','',0,2260,NULL,NULL),(7501,'selected','',1,2261,NULL,NULL),(7502,'unselected','',0,2261,NULL,NULL),(7503,'selected','',1,2262,NULL,NULL),(7504,'unselected','',0,2262,NULL,NULL),(7505,'selected','',1,2263,NULL,NULL),(7506,'unselected','',0,2263,NULL,NULL),(7507,'selected','',1,2264,NULL,NULL),(7508,'unselected','',0,2264,NULL,NULL),(7509,'selected','',1,2265,NULL,NULL),(7510,'unselected','',0,2265,NULL,NULL),(7511,'NOT published','',0,2247,'','');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machines`
--

DROP TABLE IF EXISTS `state_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `transition_script` mediumtext CHARACTER SET utf8,
  `form_data` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2266 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machines`
--

LOCK TABLES `state_machines` WRITE;
/*!40000 ALTER TABLE `state_machines` DISABLE KEYS */;
INSERT INTO `state_machines` VALUES (2246,'sqms2_Answer',NULL,NULL),(2247,'sqms2_Syllabus','','{\n  \"sqms2_Syllabus_Version\": {\"mode_form\": \"hi\"}\n}'),(2248,'sqms2_SyllabusChapter',NULL,NULL),(2249,'sqms2_Question',NULL,NULL),(2250,'sqms2_text',NULL,NULL),(2251,'sqms2_Topic',NULL,NULL),(2252,'sqms2_ExamSetVersion',NULL,NULL),(2253,'sqms2_answer_text',NULL,NULL),(2254,'sqms2_question_answer',NULL,NULL),(2255,'sqms2_question_examsetversion',NULL,NULL),(2256,'sqms2_question_examsetversion_answer',NULL,NULL),(2257,'sqms2_question_text',NULL,NULL),(2258,'sqms2_syllabus_desc',NULL,NULL),(2259,'sqms2_syllabus_syllabuschapter',NULL,NULL),(2260,'sqms2_syllabus_topic',NULL,NULL),(2261,'sqms2_syllabuschapter_desc',NULL,NULL),(2262,'sqms2_syllabuschapter_question',NULL,NULL),(2263,'sqms2_text_text',NULL,NULL),(2264,'sqms2_topic_question',NULL,NULL),(2265,'sqms2_topic_role',NULL,NULL);
/*!40000 ALTER TABLE `state_machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_rules`
--

DROP TABLE IF EXISTS `state_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_rules` (
  `state_rules_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state_id_FROM` bigint(20) NOT NULL,
  `state_id_TO` bigint(20) NOT NULL,
  `transition_script` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`state_rules_id`),
  KEY `state_id_TO` (`state_id_TO`),
  KEY `state_id_FROM` (`state_id_FROM`),
  KEY `state_id_fk1_idx` (`state_id_FROM`),
  KEY `state_id_fk_to_idx` (`state_id_TO`),
  CONSTRAINT `state_id_fk_from` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_to` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_rules_ibfk_1` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_10` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_11` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_12` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_13` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_14` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_15` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_16` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_17` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_18` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_19` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_2` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_20` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_21` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_22` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_23` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_24` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_25` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_26` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_27` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_28` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_29` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_3` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_30` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_31` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_32` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_33` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_34` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_4` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_5` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_6` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_7` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_8` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_rules_ibfk_9` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4456 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_rules`
--

LOCK TABLES `state_rules` WRITE;
/*!40000 ALTER TABLE `state_rules` DISABLE KEYS */;
INSERT INTO `state_rules` VALUES (4387,7457,7457,NULL),(4388,7459,7459,NULL),(4389,7457,7458,NULL),(4390,7458,7459,NULL),(4391,7459,7458,NULL),(4392,7458,7460,NULL),(4393,7461,7461,NULL),(4394,7463,7463,NULL),(4395,7461,7462,NULL),(4396,7462,7463,NULL),(4397,7463,7462,NULL),(4398,7462,7464,NULL),(4399,7465,7465,NULL),(4400,7467,7467,NULL),(4401,7465,7466,NULL),(4402,7466,7467,NULL),(4403,7467,7466,NULL),(4404,7466,7468,NULL),(4405,7469,7469,NULL),(4406,7471,7471,NULL),(4407,7469,7470,NULL),(4408,7470,7471,NULL),(4409,7471,7470,NULL),(4410,7470,7472,NULL),(4411,7473,7473,NULL),(4412,7475,7475,NULL),(4413,7473,7474,NULL),(4414,7474,7475,NULL),(4415,7475,7474,NULL),(4416,7474,7476,NULL),(4417,7477,7477,NULL),(4418,7479,7479,NULL),(4419,7477,7478,'$param[\"row\"][\"sqms2_Topic_title\"] = trim($param[\"row\"][\"sqms2_Topic_title\"]);\n$allow = ( strlen($param[\"row\"][\"sqms2_Topic_title\"]) > 0 );\n\n$script_result = [\n    \"allow_transition\" => $allow,\n    \"show_message\" => !$allow,\n    \"message\" => \"Title is not set.\"\n];\n\n$param[\"row\"][\"sqms2_Topic_History\"] =  date(DATE_RFC822) . \": the status has changed!\\n\" . $param[\"row\"][\"sqms2_Topic_History\"];'),(4420,7478,7479,NULL),(4421,7479,7478,'$param[\"row\"][\"sqms2_Topic_History\"] =  date(DATE_RFC822) . \": the status has changed!\\n\" . $param[\"row\"][\"sqms2_Topic_History\"];'),(4422,7478,7480,NULL),(4423,7481,7481,NULL),(4424,7483,7483,NULL),(4425,7481,7482,NULL),(4426,7482,7483,NULL),(4427,7483,7482,NULL),(4428,7482,7484,NULL),(4429,7485,7486,NULL),(4430,7486,7485,NULL),(4431,7487,7488,NULL),(4432,7488,7487,NULL),(4433,7489,7490,NULL),(4434,7490,7489,NULL),(4435,7491,7492,NULL),(4436,7492,7491,NULL),(4437,7493,7494,NULL),(4438,7494,7493,NULL),(4439,7495,7496,NULL),(4440,7496,7495,NULL),(4441,7497,7498,NULL),(4442,7498,7497,NULL),(4443,7499,7500,NULL),(4444,7500,7499,NULL),(4445,7501,7502,NULL),(4446,7502,7501,NULL),(4447,7503,7504,NULL),(4448,7504,7503,NULL),(4449,7505,7506,NULL),(4450,7506,7505,NULL),(4451,7507,7508,NULL),(4452,7508,7507,NULL),(4453,7509,7510,NULL),(4454,7510,7509,NULL),(4455,7464,7511,'');
/*!40000 ALTER TABLE `state_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-13 11:56:22
