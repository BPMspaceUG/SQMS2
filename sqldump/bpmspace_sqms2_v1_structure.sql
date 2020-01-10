-- MySQL dump 10.16  Distrib 10.1.33-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: bpmspace_sqms2_v1
-- ------------------------------------------------------
-- Server version	10.1.33-MariaDB

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
-- Temporary table structure for view `_edges`
--

DROP TABLE IF EXISTS `_edges`;
/*!50001 DROP VIEW IF EXISTS `_edges`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_edges` (
  `EdgeType` tinyint NOT NULL,
  `EdgeID` tinyint NOT NULL,
  `EdgePartner` tinyint NOT NULL,
  `EdgeStateID` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `_nodes`
--

DROP TABLE IF EXISTS `_nodes`;
/*!50001 DROP VIEW IF EXISTS `_nodes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_nodes` (
  `ObjectType` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL,
  `ObjectStateID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `_orphans`
--

DROP TABLE IF EXISTS `_orphans`;
/*!50001 DROP VIEW IF EXISTS `_orphans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `_orphans` (
  `ObjectType` tinyint NOT NULL,
  `ObjectID` tinyint NOT NULL,
  `ObjectStateID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  `ConfigDiff` longtext,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_liamuser`
--

DROP TABLE IF EXISTS `role_liamuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_liamuser` (
  `Role_User_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Role_id` bigint(20) NOT NULL,
  `User_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Role_User_id`),
  KEY `Role_id` (`Role_id`),
  CONSTRAINT `role_liamuser_ibfk_1` FOREIGN KEY (`Role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_liamuser_ibfk_2` FOREIGN KEY (`Role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_liamuser_ibfk_3` FOREIGN KEY (`Role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_liamuser_ibfk_4` FOREIGN KEY (`Role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `role_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_user_id`),
  KEY `role_id_fk` (`role_id`),
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_answer`
--

DROP TABLE IF EXISTS `sqms2_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_answer` (
  `sqms2_Answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `sqms2_Answer_History` mediumtext CHARACTER SET utf8,
  `state_id` bigint(20) DEFAULT '1',
  `sqms2_correct` tinyint(1) DEFAULT '0',
  `sqms2_titleofanswers` longtext COLLATE utf8_bin,
  PRIMARY KEY (`sqms2_Answer_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `sqms2_answer_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_id_6430a55a` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78442160 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_answer_text`
--

DROP TABLE IF EXISTS `sqms2_answer_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_answer_text` (
  `sqms2_Answer_Text_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Answer_id_fk_154388` int(11) DEFAULT NULL,
  `sqms2_Text_id_fk_842740` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7485',
  PRIMARY KEY (`sqms2_Answer_Text_id`),
  KEY `sqms2_Text_id_fk_842740` (`sqms2_Text_id_fk_842740`),
  KEY `sqms2_Answer_id_fk_154388` (`sqms2_Answer_id_fk_154388`),
  KEY `state_id_2da22e8a` (`state_id`),
  CONSTRAINT `sqms2_answer_text_ibfk_1` FOREIGN KEY (`sqms2_Answer_id_fk_154388`) REFERENCES `sqms2_answer` (`sqms2_Answer_id`),
  CONSTRAINT `sqms2_answer_text_ibfk_2` FOREIGN KEY (`sqms2_Text_id_fk_842740`) REFERENCES `sqms2_text` (`sqms2_Text_id`),
  CONSTRAINT `state_id_2da22e8a` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45040030 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_examsetversion`
--

DROP TABLE IF EXISTS `sqms2_examsetversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_examsetversion` (
  `sqms2_ExamSetVersion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_ExamSetVersion_title` mediumtext CHARACTER SET utf8,
  `sqms2_ExamSetVersion_History` mediumtext CHARACTER SET utf8,
  `sqms2_ExamSetVersion_Version` int(11) DEFAULT '1',
  `sqms2_ExamSetVersion_Set` int(11) DEFAULT '1',
  `sqms2_ExamSetVersion_SampleSet` tinyint(4) DEFAULT '0',
  `state_id` bigint(20) DEFAULT '25',
  PRIMARY KEY (`sqms2_ExamSetVersion_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `sqms2_examsetversion_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_id_ef8c669a` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=883 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_question`
--

DROP TABLE IF EXISTS `sqms2_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_question` (
  `sqms2_Question_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Question_History` mediumtext CHARACTER SET utf8,
  `_LIAMUSER_ID` bigint(20) DEFAULT NULL,
  `sqms2_Question_Version` int(11) DEFAULT '1',
  `sqms2_Question_type` enum('CALCULATED','CALCULATED MULTI-CHOICE','CALCULATED SIMPLE','DESCRIPTION','ESSAY','MATCHING','EMBEDDED ANSWERS','MULTIPLE CHOICE','SHORT ANSWER','NUMERICAL','RANDOM SHORT-ANSWER MATCHING','TRUE/FALSE') CHARACTER SET utf8 DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '13',
  PRIMARY KEY (`sqms2_Question_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `sqms2_question_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_id_c8e133bc` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85648727 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_question_answer`
--

DROP TABLE IF EXISTS `sqms2_question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_question_answer` (
  `sqms2_Question_Answer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Question_id_fk_735802` bigint(20) DEFAULT NULL,
  `sqms2_Answer_id_fk_995603` int(11) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7487',
  PRIMARY KEY (`sqms2_Question_Answer_id`),
  KEY `sqms2_Answer_id_fk_995603` (`sqms2_Answer_id_fk_995603`),
  KEY `sqms2_Question_id_fk_735802` (`sqms2_Question_id_fk_735802`),
  KEY `state_id_0f4d6485` (`state_id`),
  CONSTRAINT `sqms2_question_answer_ibfk_1` FOREIGN KEY (`sqms2_Question_id_fk_735802`) REFERENCES `sqms2_question` (`sqms2_Question_id`),
  CONSTRAINT `sqms2_question_answer_ibfk_2` FOREIGN KEY (`sqms2_Answer_id_fk_995603`) REFERENCES `sqms2_answer` (`sqms2_Answer_id`),
  CONSTRAINT `state_id_0f4d6485` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6506089 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_question_examsetversion`
--

DROP TABLE IF EXISTS `sqms2_question_examsetversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_question_examsetversion` (
  `sqms2_Question_ExamSetVersion_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_ExamSetVersion_id_fk_264577` bigint(20) DEFAULT NULL,
  `sqms2_Question_id_fk_615560` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7489',
  PRIMARY KEY (`sqms2_Question_ExamSetVersion_id`),
  KEY `sqms2_ExamSetVersion_id_fk_264577` (`sqms2_ExamSetVersion_id_fk_264577`),
  KEY `sqms2_Question_id_fk_615560` (`sqms2_Question_id_fk_615560`),
  KEY `state_id_876b567a` (`state_id`),
  CONSTRAINT `sqms2_question_examsetversion_ibfk_1` FOREIGN KEY (`sqms2_ExamSetVersion_id_fk_264577`) REFERENCES `sqms2_examsetversion` (`sqms2_ExamSetVersion_id`),
  CONSTRAINT `sqms2_question_examsetversion_ibfk_2` FOREIGN KEY (`sqms2_Question_id_fk_615560`) REFERENCES `sqms2_question` (`sqms2_Question_id`),
  CONSTRAINT `state_id_876b567a` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_question_examsetversion_answer`
--

DROP TABLE IF EXISTS `sqms2_question_examsetversion_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_question_examsetversion_answer` (
  `sqms2_Question_ExamSetVersion_Answer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Question_ExamSetVersion_id_fk_186326` bigint(20) DEFAULT NULL,
  `sqms2_Answer_id_fk_507266` int(11) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7491',
  PRIMARY KEY (`sqms2_Question_ExamSetVersion_Answer_id`),
  KEY `sqms2_Question_ExamSetVersion_id_fk_186326` (`sqms2_Question_ExamSetVersion_id_fk_186326`),
  KEY `sqms2_Answer_id_fk_507266` (`sqms2_Answer_id_fk_507266`),
  KEY `state_id_d1166126` (`state_id`),
  CONSTRAINT `sqms2_question_examsetversion_answer_ibfk_1` FOREIGN KEY (`sqms2_Question_ExamSetVersion_id_fk_186326`) REFERENCES `sqms2_question_examsetversion` (`sqms2_Question_ExamSetVersion_id`),
  CONSTRAINT `sqms2_question_examsetversion_answer_ibfk_2` FOREIGN KEY (`sqms2_Answer_id_fk_507266`) REFERENCES `sqms2_answer` (`sqms2_Answer_id`),
  CONSTRAINT `state_id_d1166126` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_question_text`
--

DROP TABLE IF EXISTS `sqms2_question_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_question_text` (
  `sqms2_Question_Text_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Question_id_fk_783494` bigint(20) DEFAULT NULL,
  `sqms2_Text_id_fk_559100` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7493',
  PRIMARY KEY (`sqms2_Question_Text_id`),
  KEY `sqms2_Text_id_fk_559100` (`sqms2_Text_id_fk_559100`),
  KEY `sqms2_Question_id_fk_783494` (`sqms2_Question_id_fk_783494`),
  KEY `state_id_1438cb88` (`state_id`),
  CONSTRAINT `sqms2_question_text_ibfk_1` FOREIGN KEY (`sqms2_Text_id_fk_559100`) REFERENCES `sqms2_text` (`sqms2_Text_id`),
  CONSTRAINT `sqms2_question_text_ibfk_2` FOREIGN KEY (`sqms2_Question_id_fk_783494`) REFERENCES `sqms2_question` (`sqms2_Question_id`),
  CONSTRAINT `state_id_1438cb88` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=75036166 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_syllabus`
--

DROP TABLE IF EXISTS `sqms2_syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_syllabus` (
  `sqms2_Syllabus_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Syllabus_titel` mediumtext CHARACTER SET utf8,
  `sqms2_Syllabus_History` mediumtext CHARACTER SET utf8,
  `sqms2_Syllabus_Valid_from` date DEFAULT NULL,
  `sqms2_Syllabus_Valid_to` date DEFAULT NULL,
  `sqms2_Syllabus_Version` int(11) DEFAULT '1',
  `state_id` bigint(20) DEFAULT '5',
  `sqms2_ExamVersionPlannedDuration` int(11) DEFAULT '45',
  `sqms2_CourseDuration` int(11) DEFAULT '720',
  `sqms2_Exam_QuestionsTotal` int(11) DEFAULT '30',
  PRIMARY KEY (`sqms2_Syllabus_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `sqms2_syllabus_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_id_0bc4d1a1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34704 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_syllabus_desc`
--

DROP TABLE IF EXISTS `sqms2_syllabus_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_syllabus_desc` (
  `sqms2_Syllabus_desc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Syllabus_id_fk_783731` bigint(20) DEFAULT NULL,
  `sqms2_Text_id_fk_178796` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7495',
  PRIMARY KEY (`sqms2_Syllabus_desc_id`),
  KEY `sqms2_Syllabus_id_fk_783731` (`sqms2_Syllabus_id_fk_783731`),
  KEY `sqms2_Text_id_fk_178796` (`sqms2_Text_id_fk_178796`),
  KEY `state_id_ade6fcec` (`state_id`),
  CONSTRAINT `sqms2_syllabus_desc_ibfk_1` FOREIGN KEY (`sqms2_Syllabus_id_fk_783731`) REFERENCES `sqms2_syllabus` (`sqms2_Syllabus_id`),
  CONSTRAINT `sqms2_syllabus_desc_ibfk_2` FOREIGN KEY (`sqms2_Text_id_fk_178796`) REFERENCES `sqms2_text` (`sqms2_Text_id`),
  CONSTRAINT `state_id_ade6fcec` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80035381 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_syllabus_syllabuschapter`
--

DROP TABLE IF EXISTS `sqms2_syllabus_syllabuschapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_syllabus_syllabuschapter` (
  `sqms2_Syllabus_SyllabusChapter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Syllabus_id_fk_870666` bigint(20) DEFAULT NULL,
  `sqms2_SyllabusChapter_id_fk_327935` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7497',
  PRIMARY KEY (`sqms2_Syllabus_SyllabusChapter_id`),
  KEY `sqms2_SyllabusChapter_id_fk_327935` (`sqms2_SyllabusChapter_id_fk_327935`),
  KEY `sqms2_Syllabus_id_fk_870666` (`sqms2_Syllabus_id_fk_870666`),
  KEY `state_id_e8dbebbc` (`state_id`),
  CONSTRAINT `sqms2_syllabus_syllabuschapter_ibfk_1` FOREIGN KEY (`sqms2_Syllabus_id_fk_870666`) REFERENCES `sqms2_syllabus` (`sqms2_Syllabus_id`),
  CONSTRAINT `sqms2_syllabus_syllabuschapter_ibfk_2` FOREIGN KEY (`sqms2_SyllabusChapter_id_fk_327935`) REFERENCES `sqms2_syllabuschapter` (`sqms2_SyllabusChapter_id`),
  CONSTRAINT `state_id_e8dbebbc` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_syllabus_topic`
--

DROP TABLE IF EXISTS `sqms2_syllabus_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_syllabus_topic` (
  `sqms2_Syllabus_Topic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Syllabus_id_fk_345197` bigint(20) DEFAULT NULL,
  `sqms2_Topic_id_fk_945295` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7499',
  PRIMARY KEY (`sqms2_Syllabus_Topic_id`),
  KEY `sqms2_Topic_id_fk_945295` (`sqms2_Topic_id_fk_945295`),
  KEY `sqms2_Syllabus_id_fk_345197` (`sqms2_Syllabus_id_fk_345197`),
  KEY `state_id_8e195a84` (`state_id`),
  CONSTRAINT `sqms2_syllabus_topic_ibfk_1` FOREIGN KEY (`sqms2_Syllabus_id_fk_345197`) REFERENCES `sqms2_syllabus` (`sqms2_Syllabus_id`),
  CONSTRAINT `sqms2_syllabus_topic_ibfk_2` FOREIGN KEY (`sqms2_Topic_id_fk_945295`) REFERENCES `sqms2_topic` (`sqms2_Topic_id`),
  CONSTRAINT `state_id_8e195a84` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10035042 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_syllabuschapter`
--

DROP TABLE IF EXISTS `sqms2_syllabuschapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_syllabuschapter` (
  `sqms2_SyllabusChapter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_SyllabusChapter_titel` mediumtext CHARACTER SET utf8,
  `sqms2_SyllabusChapter_History` mediumtext CHARACTER SET utf8,
  `sqms2_SyllabusChapter_ChapterNumber` int(11) DEFAULT NULL,
  `sqms2_SyllabusChapter_Severity` int(11) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '9',
  PRIMARY KEY (`sqms2_SyllabusChapter_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `sqms2_syllabuschapter_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_id_6c68c041` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1234565636 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_syllabuschapter_desc`
--

DROP TABLE IF EXISTS `sqms2_syllabuschapter_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_syllabuschapter_desc` (
  `sqms2_SyllabusChapter_desc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_SyllabusChapter_id_fk_886795` bigint(20) DEFAULT NULL,
  `sqms2_Text_id_fk_524933` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7501',
  PRIMARY KEY (`sqms2_SyllabusChapter_desc_id`),
  KEY `sqms2_SyllabusChapter_id_fk_886795` (`sqms2_SyllabusChapter_id_fk_886795`),
  KEY `sqms2_Text_id_fk_524933` (`sqms2_Text_id_fk_524933`),
  KEY `state_id_6059d74e` (`state_id`),
  CONSTRAINT `sqms2_syllabuschapter_desc_ibfk_1` FOREIGN KEY (`sqms2_SyllabusChapter_id_fk_886795`) REFERENCES `sqms2_syllabuschapter` (`sqms2_SyllabusChapter_id`),
  CONSTRAINT `sqms2_syllabuschapter_desc_ibfk_2` FOREIGN KEY (`sqms2_Text_id_fk_524933`) REFERENCES `sqms2_text` (`sqms2_Text_id`),
  CONSTRAINT `state_id_6059d74e` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_syllabuschapter_question`
--

DROP TABLE IF EXISTS `sqms2_syllabuschapter_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_syllabuschapter_question` (
  `sqms2_SyllabusChapter_Question_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_SyllabusChapter_id_fk_920241` bigint(20) DEFAULT NULL,
  `sqms2_Question_id_fk_285826` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7503',
  PRIMARY KEY (`sqms2_SyllabusChapter_Question_id`),
  KEY `sqms2_Question_id_fk_285826` (`sqms2_Question_id_fk_285826`),
  KEY `sqms2_SyllabusChapter_id_fk_920241` (`sqms2_SyllabusChapter_id_fk_920241`),
  KEY `state_id_aa13ed26` (`state_id`),
  CONSTRAINT `sqms2_syllabuschapter_question_ibfk_1` FOREIGN KEY (`sqms2_SyllabusChapter_id_fk_920241`) REFERENCES `sqms2_syllabuschapter` (`sqms2_SyllabusChapter_id`),
  CONSTRAINT `sqms2_syllabuschapter_question_ibfk_2` FOREIGN KEY (`sqms2_Question_id_fk_285826`) REFERENCES `sqms2_question` (`sqms2_Question_id`),
  CONSTRAINT `state_id_aa13ed26` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=849 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_text`
--

DROP TABLE IF EXISTS `sqms2_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_text` (
  `sqms2_Text_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Text` mediumtext CHARACTER SET utf8,
  `sqms2_text_History` mediumtext CHARACTER SET utf8,
  `sqms2_language_iso_short` enum('DE','EN','FR','SP','IT') CHARACTER SET utf8 DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '17',
  PRIMARY KEY (`sqms2_Text_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `sqms2_text_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_id_8c14317f` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70042446 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_text_text`
--

DROP TABLE IF EXISTS `sqms2_text_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_text_text` (
  `sqms2_Text_Text_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Text_id_fk_508677` bigint(20) DEFAULT NULL,
  `sqms2_Text_id_fk_899589` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7505',
  PRIMARY KEY (`sqms2_Text_Text_id`),
  KEY `sqms2_Text_id_fk_508677` (`sqms2_Text_id_fk_508677`),
  KEY `sqms2_Text_id_fk_899589` (`sqms2_Text_id_fk_899589`),
  KEY `state_id_ee13fde4` (`state_id`),
  CONSTRAINT `sqms2_text_text_ibfk_1` FOREIGN KEY (`sqms2_Text_id_fk_508677`) REFERENCES `sqms2_text` (`sqms2_Text_id`),
  CONSTRAINT `sqms2_text_text_ibfk_2` FOREIGN KEY (`sqms2_Text_id_fk_899589`) REFERENCES `sqms2_text` (`sqms2_Text_id`),
  CONSTRAINT `state_id_ee13fde4` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_topic`
--

DROP TABLE IF EXISTS `sqms2_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_topic` (
  `sqms2_Topic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Topic_title` mediumtext CHARACTER SET utf8,
  `sqms2_Topic_History` mediumtext CHARACTER SET utf8,
  `state_id` bigint(20) DEFAULT '21',
  PRIMARY KEY (`sqms2_Topic_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `sqms2_topic_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `state_id_ed734481` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3453561 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_topic_question`
--

DROP TABLE IF EXISTS `sqms2_topic_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_topic_question` (
  `sqms2_Topic_Question_id` int(11) NOT NULL AUTO_INCREMENT,
  `sqms2_Topic_id_fk_824630` bigint(20) DEFAULT NULL,
  `sqms2_Question_id_fk_664094` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '7507',
  PRIMARY KEY (`sqms2_Topic_Question_id`),
  KEY `sqms2_Topic_id_fk_824630` (`sqms2_Topic_id_fk_824630`),
  KEY `sqms2_Question_id_fk_664094` (`sqms2_Question_id_fk_664094`),
  KEY `state_id_a2dda30c` (`state_id`),
  CONSTRAINT `sqms2_topic_question_ibfk_1` FOREIGN KEY (`sqms2_Topic_id_fk_824630`) REFERENCES `sqms2_topic` (`sqms2_Topic_id`),
  CONSTRAINT `sqms2_topic_question_ibfk_2` FOREIGN KEY (`sqms2_Question_id_fk_664094`) REFERENCES `sqms2_question` (`sqms2_Question_id`),
  CONSTRAINT `state_id_a2dda30c` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sqms2_topic_role`
--

DROP TABLE IF EXISTS `sqms2_topic_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqms2_topic_role` (
  `sqms2_Topic_Role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Topic_id_fk_811732` bigint(20) NOT NULL,
  `Role_id_fk_928470` bigint(20) NOT NULL,
  `state_id` bigint(20) DEFAULT '7509',
  PRIMARY KEY (`sqms2_Topic_Role_id`),
  KEY `sqms2_Topic_id_fk_811732` (`sqms2_Topic_id_fk_811732`),
  KEY `Role_id_fk_928470` (`Role_id_fk_928470`),
  KEY `state_id_a8ee9313` (`state_id`),
  CONSTRAINT `sqms2_topic_role_ibfk_1` FOREIGN KEY (`sqms2_Topic_id_fk_811732`) REFERENCES `sqms2_topic` (`sqms2_Topic_id`),
  CONSTRAINT `sqms2_topic_role_ibfk_2` FOREIGN KEY (`Role_id_fk_928470`) REFERENCES `role` (`role_id`),
  CONSTRAINT `state_id_a8ee9313` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
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
-- Table structure for table `state_machines`
--

DROP TABLE IF EXISTS `state_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `transition_script` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2266 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Final view structure for view `_edges`
--

/*!50001 DROP TABLE IF EXISTS `_edges`*/;
/*!50001 DROP VIEW IF EXISTS `_edges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_edges` AS select 'sqms2_answer_text' AS `EdgeType`,`sqms2_answer_text`.`sqms2_Answer_Text_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_answer_text`.`state_id` AS `EdgeStateID`,`sqms2_answer_text`.`sqms2_Answer_id_fk_154388` AS `ObjectID` from `sqms2_answer_text` union select 'sqms2_answer_text' AS `EdgeType`,`sqms2_answer_text`.`sqms2_Answer_Text_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_answer_text`.`state_id` AS `EdgeStateID`,`sqms2_answer_text`.`sqms2_Text_id_fk_842740` AS `ObjectID` from `sqms2_answer_text` union select 'sqms2_question_answer' AS `EdgeType`,`sqms2_question_answer`.`sqms2_Question_Answer_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_question_answer`.`state_id` AS `EdgeStateID`,`sqms2_question_answer`.`sqms2_Question_id_fk_735802` AS `ObjectID` from `sqms2_question_answer` union select 'sqms2_question_answer' AS `EdgeType`,`sqms2_question_answer`.`sqms2_Question_Answer_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_question_answer`.`state_id` AS `EdgeStateID`,`sqms2_question_answer`.`sqms2_Answer_id_fk_995603` AS `ObjectID` from `sqms2_question_answer` union select 'sqms2_question_examsetversion' AS `EdgeType`,`sqms2_question_examsetversion`.`sqms2_Question_ExamSetVersion_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_question_examsetversion`.`state_id` AS `EdgeStateID`,`sqms2_question_examsetversion`.`sqms2_ExamSetVersion_id_fk_264577` AS `ObjectID` from `sqms2_question_examsetversion` union select 'sqms2_question_examsetversion' AS `EdgeType`,`sqms2_question_examsetversion`.`sqms2_Question_ExamSetVersion_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_question_examsetversion`.`state_id` AS `EdgeStateID`,`sqms2_question_examsetversion`.`sqms2_Question_id_fk_615560` AS `ObjectID` from `sqms2_question_examsetversion` union select 'sqms2_question_examsetversion_answer' AS `EdgeType`,`sqms2_question_examsetversion_answer`.`sqms2_Question_ExamSetVersion_Answer_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_question_examsetversion_answer`.`state_id` AS `EdgeStateID`,`sqms2_question_examsetversion_answer`.`sqms2_Question_ExamSetVersion_id_fk_186326` AS `ObjectID` from `sqms2_question_examsetversion_answer` union select 'sqms2_question_examsetversion_answer' AS `EdgeType`,`sqms2_question_examsetversion_answer`.`sqms2_Question_ExamSetVersion_Answer_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_question_examsetversion_answer`.`state_id` AS `EdgeStateID`,`sqms2_question_examsetversion_answer`.`sqms2_Answer_id_fk_507266` AS `ObjectID` from `sqms2_question_examsetversion_answer` union select 'sqms2_question_text' AS `EdgeType`,`sqms2_question_text`.`sqms2_Question_Text_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_question_text`.`state_id` AS `EdgeStateID`,`sqms2_question_text`.`sqms2_Question_id_fk_783494` AS `ObjectID` from `sqms2_question_text` union select 'sqms2_question_text' AS `EdgeType`,`sqms2_question_text`.`sqms2_Question_Text_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_question_text`.`state_id` AS `EdgeStateID`,`sqms2_question_text`.`sqms2_Text_id_fk_559100` AS `ObjectID` from `sqms2_question_text` union select 'sqms2_syllabus_desc' AS `EdgeType`,`sqms2_syllabus_desc`.`sqms2_Syllabus_desc_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_syllabus_desc`.`state_id` AS `EdgeStateID`,`sqms2_syllabus_desc`.`sqms2_Syllabus_id_fk_783731` AS `ObjectID` from `sqms2_syllabus_desc` union select 'sqms2_syllabus_desc' AS `EdgeType`,`sqms2_syllabus_desc`.`sqms2_Syllabus_desc_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_syllabus_desc`.`state_id` AS `EdgeStateID`,`sqms2_syllabus_desc`.`sqms2_Text_id_fk_178796` AS `ObjectID` from `sqms2_syllabus_desc` union select 'sqms2_syllabus_syllabuschapter' AS `EdgeType`,`sqms2_syllabus_syllabuschapter`.`sqms2_Syllabus_SyllabusChapter_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_syllabus_syllabuschapter`.`state_id` AS `EdgeStateID`,`sqms2_syllabus_syllabuschapter`.`sqms2_Syllabus_id_fk_870666` AS `ObjectID` from `sqms2_syllabus_syllabuschapter` union select 'sqms2_syllabus_syllabuschapter' AS `EdgeType`,`sqms2_syllabus_syllabuschapter`.`sqms2_Syllabus_SyllabusChapter_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_syllabus_syllabuschapter`.`state_id` AS `EdgeStateID`,`sqms2_syllabus_syllabuschapter`.`sqms2_SyllabusChapter_id_fk_327935` AS `ObjectID` from `sqms2_syllabus_syllabuschapter` union select 'sqms2_syllabus_topic' AS `EdgeType`,`sqms2_syllabus_topic`.`sqms2_Syllabus_Topic_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_syllabus_topic`.`state_id` AS `EdgeStateID`,`sqms2_syllabus_topic`.`sqms2_Syllabus_id_fk_345197` AS `ObjectID` from `sqms2_syllabus_topic` union select 'sqms2_syllabus_topic' AS `EdgeType`,`sqms2_syllabus_topic`.`sqms2_Syllabus_Topic_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_syllabus_topic`.`state_id` AS `EdgeStateID`,`sqms2_syllabus_topic`.`sqms2_Topic_id_fk_945295` AS `ObjectID` from `sqms2_syllabus_topic` union select 'sqms2_syllabuschapter_desc' AS `EdgeType`,`sqms2_syllabuschapter_desc`.`sqms2_SyllabusChapter_desc_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_syllabuschapter_desc`.`state_id` AS `EdgeStateID`,`sqms2_syllabuschapter_desc`.`sqms2_SyllabusChapter_id_fk_886795` AS `ObjectID` from `sqms2_syllabuschapter_desc` union select 'sqms2_syllabuschapter_desc' AS `EdgeType`,`sqms2_syllabuschapter_desc`.`sqms2_SyllabusChapter_desc_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_syllabuschapter_desc`.`state_id` AS `EdgeStateID`,`sqms2_syllabuschapter_desc`.`sqms2_Text_id_fk_524933` AS `ObjectID` from `sqms2_syllabuschapter_desc` union select 'sqms2_syllabuschapter_question' AS `EdgeType`,`sqms2_syllabuschapter_question`.`sqms2_SyllabusChapter_Question_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_syllabuschapter_question`.`state_id` AS `EdgeStateID`,`sqms2_syllabuschapter_question`.`sqms2_SyllabusChapter_id_fk_920241` AS `ObjectID` from `sqms2_syllabuschapter_question` union select 'sqms2_syllabuschapter_question' AS `EdgeType`,`sqms2_syllabuschapter_question`.`sqms2_SyllabusChapter_Question_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_syllabuschapter_question`.`state_id` AS `EdgeStateID`,`sqms2_syllabuschapter_question`.`sqms2_Question_id_fk_285826` AS `ObjectID` from `sqms2_syllabuschapter_question` union select 'sqms2_text_text' AS `EdgeType`,`sqms2_text_text`.`sqms2_Text_Text_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_text_text`.`state_id` AS `EdgeStateID`,`sqms2_text_text`.`sqms2_Text_id_fk_508677` AS `ObjectID` from `sqms2_text_text` union select 'sqms2_text_text' AS `EdgeType`,`sqms2_text_text`.`sqms2_Text_Text_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_text_text`.`state_id` AS `EdgeStateID`,`sqms2_text_text`.`sqms2_Text_id_fk_899589` AS `ObjectID` from `sqms2_text_text` union select 'sqms2_topic_question' AS `EdgeType`,`sqms2_topic_question`.`sqms2_Topic_Question_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_topic_question`.`state_id` AS `EdgeStateID`,`sqms2_topic_question`.`sqms2_Topic_id_fk_824630` AS `ObjectID` from `sqms2_topic_question` union select 'sqms2_topic_question' AS `EdgeType`,`sqms2_topic_question`.`sqms2_Topic_Question_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_topic_question`.`state_id` AS `EdgeStateID`,`sqms2_topic_question`.`sqms2_Question_id_fk_664094` AS `ObjectID` from `sqms2_topic_question` union select 'sqms2_topic_role' AS `EdgeType`,`sqms2_topic_role`.`sqms2_Topic_Role_id` AS `EdgeID`,0 AS `EdgePartner`,`sqms2_topic_role`.`state_id` AS `EdgeStateID`,`sqms2_topic_role`.`sqms2_Topic_id_fk_811732` AS `ObjectID` from `sqms2_topic_role` union select 'sqms2_topic_role' AS `EdgeType`,`sqms2_topic_role`.`sqms2_Topic_Role_id` AS `EdgeID`,1 AS `EdgePartner`,`sqms2_topic_role`.`state_id` AS `EdgeStateID`,`sqms2_topic_role`.`Role_id_fk_928470` AS `ObjectID` from `sqms2_topic_role` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `_nodes`
--

/*!50001 DROP TABLE IF EXISTS `_nodes`*/;
/*!50001 DROP VIEW IF EXISTS `_nodes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_nodes` AS select 'sqms2_syllabus' AS `ObjectType`,`sqms2_syllabus`.`sqms2_Syllabus_id` AS `ObjectID`,`sqms2_syllabus`.`state_id` AS `ObjectStateID` from `sqms2_syllabus` union select 'sqms2_syllabuschapter' AS `ObjectType`,`sqms2_syllabuschapter`.`sqms2_SyllabusChapter_id` AS `ObjectID`,`sqms2_syllabuschapter`.`state_id` AS `ObjectStateID` from `sqms2_syllabuschapter` union select 'sqms2_question' AS `ObjectType`,`sqms2_question`.`sqms2_Question_id` AS `ObjectID`,`sqms2_question`.`state_id` AS `ObjectStateID` from `sqms2_question` union select 'sqms2_answer' AS `ObjectType`,`sqms2_answer`.`sqms2_Answer_id` AS `ObjectID`,`sqms2_answer`.`state_id` AS `ObjectStateID` from `sqms2_answer` union select 'sqms2_text' AS `ObjectType`,`sqms2_text`.`sqms2_Text_id` AS `ObjectID`,`sqms2_text`.`state_id` AS `ObjectStateID` from `sqms2_text` union select 'sqms2_examsetversion' AS `ObjectType`,`sqms2_examsetversion`.`sqms2_ExamSetVersion_id` AS `ObjectID`,`sqms2_examsetversion`.`state_id` AS `ObjectStateID` from `sqms2_examsetversion` union select 'sqms2_topic' AS `ObjectType`,`sqms2_topic`.`sqms2_Topic_id` AS `ObjectID`,`sqms2_topic`.`state_id` AS `ObjectStateID` from `sqms2_topic` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `_orphans`
--

/*!50001 DROP TABLE IF EXISTS `_orphans`*/;
/*!50001 DROP VIEW IF EXISTS `_orphans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_orphans` AS select `n`.`ObjectType` AS `ObjectType`,`n`.`ObjectID` AS `ObjectID`,`n`.`ObjectStateID` AS `ObjectStateID` from (`_nodes` `n` left join `_edges` `e` on((`e`.`ObjectID` = `n`.`ObjectID`))) where isnull(`e`.`EdgeType`) */;
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

-- Dump completed on 2020-01-10 12:00:43
