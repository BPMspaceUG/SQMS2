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
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (7457,'new',1,2246,NULL,NULL),(7458,'active',0,2246,NULL,NULL),(7459,'update',0,2246,NULL,NULL),(7460,'inactive',0,2246,NULL,NULL),(7461,'new',1,2247,NULL,NULL),(7462,'ready',0,2247,NULL,NULL),(7463,'update',0,2247,NULL,NULL),(7464,'published',0,2247,NULL,NULL),(7465,'new',1,2248,NULL,NULL),(7466,'active',0,2248,NULL,NULL),(7467,'update',0,2248,NULL,NULL),(7468,'inactive',0,2248,NULL,NULL),(7469,'new',1,2249,NULL,NULL),(7470,'active',0,2249,NULL,NULL),(7471,'update',0,2249,NULL,NULL),(7472,'inactive',0,2249,NULL,NULL),(7473,'new',1,2250,NULL,NULL),(7474,'active',0,2250,NULL,NULL),(7475,'update',0,2250,NULL,NULL),(7476,'inactive',0,2250,NULL,NULL),(7477,'new',1,2251,NULL,NULL),(7478,'active',0,2251,NULL,NULL),(7479,'update',0,2251,NULL,NULL),(7480,'inactive',0,2251,NULL,NULL),(7481,'new',1,2252,NULL,NULL),(7482,'active',0,2252,NULL,NULL),(7483,'update',0,2252,NULL,NULL),(7484,'inactive',0,2252,NULL,NULL),(7485,'selected',1,2253,'// Relation #20\n$myAnswerID = $param[\"row\"][\"sqms2_Answer_id_fk_154388\"];\n$myTextID = $param[\"row\"][\"sqms2_Text_id_fk_842740\"];\n// 1. Find all related texts which are selected!\n$json = json_decode(api([\"cmd\"=>\"read\",\"param\"=>[\"table\"=>\"sqms2_answer_text\",\n\"filter\"=>\'{\"and\":[{\"=\":[\"sqms2_Answer_id_fk_154388\",\'.$myAnswerID.\']},{\"=\":[\"`sqms2_answer_text`.state_id\",7485]}]}\'\n]]), true);\n$recs = $json[\"records\"];\n$conc = \"\";\n// Created the First answertext\nforeach($recs as $rec) {\n    $textID = $rec[\"sqms2_Text_id_fk_842740\"][\"sqms2_Text_id\"];\n    $answer = $rec[\"sqms2_Text_id_fk_842740\"][\"sqms2_Text\"];\n    $conc .= \'<a href=\"javascript:void(0);\" onclick=\"location.assign(location.hash+\\\'/sqms2_text/\'.$textID.\'\\\')\">\'.$answer.\'</a>\';\n}\n// Update Answer not this table\n$resp = api([\"cmd\"=>\"makeTransition\",\"param\"=>[\"table\"=>\"sqms2_answer\",\n\"row\"=>[\"sqms2_Answer_id\"=>$myAnswerID, \"sqms2_titleofanswers\"=>$conc]]]);',NULL),(7486,'unselected',0,2253,'// Relation #20\n$myAnswerID = $param[\"row\"][\"sqms2_Answer_id_fk_154388\"];\n$myTextID = $param[\"row\"][\"sqms2_Text_id_fk_842740\"];\n// 1. Find all related texts which are selected!\n$json = json_decode(api([\"cmd\"=>\"read\",\"param\"=>[\"table\"=>\"sqms2_answer_text\",\n\"filter\"=>\'{\"and\":[{\"=\":[\"sqms2_Answer_id_fk_154388\",\'.$myAnswerID.\']},{\"=\":[\"`sqms2_answer_text`.state_id\",7485]}]}\'\n]]), true);\n$recs = $json[\"records\"];\n$conc = \"\";\n// Created the First answertext\nforeach($recs as $rec) {\n    $textID = $rec[\"sqms2_Text_id_fk_842740\"][\"sqms2_Text_id\"];\n    $answer = $rec[\"sqms2_Text_id_fk_842740\"][\"sqms2_Text\"];\n    $conc .= \'<a href=\"javascript:void(0);\" onclick=\"location.assign(location.hash+\\\'/sqms2_text/\'.$textID.\'\\\')\">\'.$answer.\'</a>\';\n}\n// Update Answer not this table\n$resp = api([\"cmd\"=>\"makeTransition\",\"param\"=>[\"table\"=>\"sqms2_answer\",\n\"row\"=>[\"sqms2_Answer_id\"=>$myAnswerID, \"sqms2_titleofanswers\"=>$conc]]]);',NULL),(7487,'selected',1,2254,NULL,NULL),(7488,'unselected',0,2254,NULL,NULL),(7489,'selected',1,2255,NULL,NULL),(7490,'unselected',0,2255,NULL,NULL),(7491,'selected',1,2256,NULL,NULL),(7492,'unselected',0,2256,NULL,NULL),(7493,'selected',1,2257,NULL,NULL),(7494,'unselected',0,2257,NULL,NULL),(7495,'selected',1,2258,NULL,NULL),(7496,'unselected',0,2258,NULL,NULL),(7497,'selected',1,2259,NULL,NULL),(7498,'unselected',0,2259,NULL,NULL),(7499,'selected',1,2260,NULL,NULL),(7500,'unselected',0,2260,NULL,NULL),(7501,'selected',1,2261,NULL,NULL),(7502,'unselected',0,2261,NULL,NULL),(7503,'selected',1,2262,NULL,NULL),(7504,'unselected',0,2262,NULL,NULL),(7505,'selected',1,2263,NULL,NULL),(7506,'unselected',0,2263,NULL,NULL),(7507,'selected',1,2264,NULL,NULL),(7508,'unselected',0,2264,NULL,NULL),(7509,'selected',1,2265,NULL,NULL),(7510,'unselected',0,2265,NULL,NULL),(7511,'NOT published',0,2247,NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2266 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machines`
--

LOCK TABLES `state_machines` WRITE;
/*!40000 ALTER TABLE `state_machines` DISABLE KEYS */;
INSERT INTO `state_machines` VALUES (2246,'sqms2_Answer','include_once(__DIR__.\'/../_state_machines/2246/create.php\');'),(2247,'sqms2_Syllabus','include_once(__DIR__.\'/../_state_machines/2247/create.php\');'),(2248,'sqms2_SyllabusChapter','include_once(__DIR__.\'/../_state_machines/2248/create.php\');'),(2249,'sqms2_Question','include_once(__DIR__.\'/../_state_machines/2249/create.php\');'),(2250,'sqms2_text','include_once(__DIR__.\'/../_state_machines/2250/create.php\');'),(2251,'sqms2_Topic','include_once(__DIR__.\'/../_state_machines/2251/create.php\');'),(2252,'sqms2_ExamSetVersion','include_once(__DIR__.\'/../_state_machines/2252/create.php\');'),(2253,'sqms2_answer_text','include_once(__DIR__.\'/../_state_machines/2253/create.php\');'),(2254,'sqms2_question_answer','include_once(__DIR__.\'/../_state_machines/2254/create.php\');'),(2255,'sqms2_question_examsetversion','include_once(__DIR__.\'/../_state_machines/2255/create.php\');'),(2256,'sqms2_question_examsetversion_answer','include_once(__DIR__.\'/../_state_machines/2256/create.php\');'),(2257,'sqms2_question_text','include_once(__DIR__.\'/../_state_machines/2257/create.php\');'),(2258,'sqms2_syllabus_desc','include_once(__DIR__.\'/../_state_machines/2258/create.php\');'),(2259,'sqms2_syllabus_syllabuschapter','include_once(__DIR__.\'/../_state_machines/2259/create.php\');'),(2260,'sqms2_syllabus_topic','include_once(__DIR__.\'/../_state_machines/2260/create.php\');'),(2261,'sqms2_syllabuschapter_desc','include_once(__DIR__.\'/../_state_machines/2261/create.php\');'),(2262,'sqms2_syllabuschapter_question','include_once(__DIR__.\'/../_state_machines/2262/create.php\');'),(2263,'sqms2_text_text','include_once(__DIR__.\'/../_state_machines/2263/create.php\');'),(2264,'sqms2_topic_question','include_once(__DIR__.\'/../_state_machines/2264/create.php\');'),(2265,'sqms2_topic_role','include_once(__DIR__.\'/../_state_machines/2265/create.php\');');
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
INSERT INTO `state_rules` VALUES (4387,7457,7457,'include_once(__DIR__.\'/../_state_rules/4387.php\');'),(4388,7459,7459,'include_once(__DIR__.\'/../_state_rules/4388.php\');'),(4389,7457,7458,'// #27\n$allow = false;\n$path = $param[\"path\"];\nif ($path != \'i_am_your_father\') {\n  $pathparts = explode(\'/\', $path);\n  $plen = count($pathparts);\n  $parentTbl = $pathparts[$plen-4];\n  $parentID = $pathparts[$plen-3];\n  $parentTblPriColname = Config::getPrimaryColNameByTablename($parentTbl);\n  // Check state of Parent?\n  $res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>$parentTbl,\n      \"filter\"=>\'{\"=\":[\"\'.$parentTblPriColname.\'\",\'.$parentID.\']}\'\n  ]]), true);\n  $parentStateID = (int)$res[\"records\"][0][\"state_id\"];\n  $allowedStateIDs = [7462, 7466, 7470, 7458];\n  $allow = in_array($parentStateID, $allowedStateIDs);\n}\nelse {\n	$allow = true;\n}\n//========================================\n$script_result = [\n    \"allow_transition\" => $allow,\n    \"show_message\" => !$allow,\n    \"message\" => \"This is only possible if Parent is active!\"\n];'),(4390,7458,7459,'include_once(__DIR__.\'/../_state_rules/4390.php\');'),(4391,7459,7458,'include_once(__DIR__.\'/../_state_rules/4391.php\');'),(4392,7458,7460,'include_once(__DIR__.\'/../_state_rules/4392.php\');'),(4393,7461,7461,'include_once(__DIR__.\'/../_state_rules/4393.php\');'),(4394,7463,7463,'include_once(__DIR__.\'/../_state_rules/4394.php\');'),(4395,7461,7462,'// #25\n$allow = false;\n$msg = \"\";\n$myID = $param[\"row\"][\"sqms2_Syllabus_id\"];\n$syCDesc = []; $syC = []; $syD = [];\n\n//============================ CHECKS (?)\n\n//-------------------- 1. Check if Syllabus is related and selected to exactly 1 active Topic\n//---  else show Error \"No active Topic selected\"\n$res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>\"sqms2_syllabus_topic\",\n   \"filter\"=>\'{\"and\":[\n         {\"=\":[\"sqms2_Syllabus_id\",\'.$myID.\']},\n         {\"=\":[\"`sqms2_syllabus_topic`.state_id\",7499]},\n         {\"=\":[\"`sqms2_syllabus_topic/sqms2_Topic_id_fk_945295`.state_id\",7478]}\n   ]}\'\n]]), true);\n$allow = ($res[\"count\"] == 1);\n$msg .= $allow ? \"\" : \"<li>No active Topic selected!</li>\";\n\n//------------------ 2. Check if Syllabus is at least related and selected to 1 or N SyllabusDescription\n//--- else show Error \"No Syllabus Description selected\"\n$res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>\"sqms2_syllabus_desc\",\n   \"filter\"=>\'{\"and\":[\n         {\"=\":[\"sqms2_Syllabus_id\",\'.$myID.\']},\n         {\"=\":[\"`sqms2_syllabus_desc`.state_id\",7495]}\n   ]}\'\n]]), true);\n$allow = $allow && ($res[\"count\"] >= 1);\n$msg .= $allow ? \"\" : \"<li>No Syllabus Description selected!</li>\";\nif ($allow) foreach($res[\"records\"] as $el)\n	$syD[] = $el[\"sqms2_Text_id_fk_178796\"][\"sqms2_Text_id\"];\n\n//------------------ 3. Check if Syllabus is at least related and selected to 1 or N SyllabusChapters\n//--- else show Error \"No Syllabus Chapter selected\"\n$res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>\"sqms2_syllabus_syllabuschapter\",\n   \"filter\"=>\'{\"and\":[\n         {\"=\":[\"sqms2_Syllabus_id\",\'.$myID.\']},\n         {\"=\":[\"`sqms2_syllabus_syllabuschapter`.state_id\",7497]}\n   ]}\'\n]]), true);\n$chapters = [];\nif ($res[\"count\"] >= 1) {\n	$allow = $allow && true;\n    foreach($res[\"records\"] as $rels) {\n    	$chapters[] = $rels[\"sqms2_SyllabusChapter_id_fk_327935\"];\n        $syC[] = $rels[\"sqms2_SyllabusChapter_id_fk_327935\"][\"sqms2_SyllabusChapter_id\"];\n    }  \n}\nelse {\n	$allow = false;\n  	$msg .= $allow ? \"\" : \"<li>No Syllabus Chapter selected!</li>\";\n}\n\n//------------------ 3.1 For each Chapter check if it has at least 1 or N SyllabusChapterDescriptions\n//--- else show Error \"At least one of the selected SyllabusChapters has no Description\"\n$severitySum = 0;\nforeach ($chapters as $chapter) {\n    $chaptID = $chapter[\"sqms2_SyllabusChapter_id\"];\n    $severitySum += $chapter[\"sqms2_SyllabusChapter_Severity\"];\n	$res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>\"sqms2_syllabuschapter_desc\",\n      \"filter\"=>\'{\"and\":[\n          {\"=\":[\"sqms2_SyllabusChapter_id\",\'.$chaptID.\']},\n          {\"=\":[\"`sqms2_syllabuschapter_desc`.state_id\",7501]}\n      ]}\'\n 	]]), true);\n	$allow = $allow && ($res[\"count\"] >= 1);\n    if ($allow)\n    	foreach($res[\"records\"] as $el)\n        	$syCDesc[] = $el[\"sqms2_Text_id_fk_524933\"][\"sqms2_Text_id\"];\n    else {\n		$msg .= \"<li>At least one of the selected SyllabusChapters has no Description!</li>\";\n        break;\n    }\n}\n//------------------ 4. Check if Sum of Severity is exactly 100%\n//--- else show Error \"Sum of Severity of Chapters is not 100%\"\n$allow = ($allow && $severitySum == 100);\n$msg .= $allow ? \"\" : \"<li>Total Severity of selected Chapters is not 100%! ($severitySum%)</li>\";\n\n\n//============================ OPERATIONS (!)\nif ($allow) {\n	//$allow = false; // only for testing\n    \n	//-- 1. set related and selected SyllabusChapterDescriptions to active\n    //$msg .= \'<p>Syllabus-Chapter-Descriptions</p>\';\n    foreach($syCDesc as $id){\n      $res = json_decode(api([\"cmd\"=>\"makeTransition\",\"param\"=>[\n      	\"table\"=>\"sqms2_text\",\"path\"=>\"i_am_your_father\",\"row\"=>[\n          \"sqms2_Text_id\"=>$id, \"state_id\"=>7474\n      ]]]), true);\n      //$msg .= \'<pre>\'.var_export($res, true).\'</pre>\';\n    }\n    \n    //-- 2. set related and selected SyllabusChapters to active\n    //$msg .= \'<p>Syllabus-Chapters</p>\';\n    foreach($syC as $id){\n      $res = json_decode(api([\"cmd\"=>\"makeTransition\",\"param\"=>[\n      	\"table\"=>\"sqms2_syllabuschapter\",\"path\"=>\"i_am_your_father\",\"row\"=>[\n          \"sqms2_SyllabusChapter_id\"=>$id, \"state_id\"=>7466\n      ]]]), true);\n      //$msg .= \'<pre>\'.var_export($res, true).\'</pre>\';\n    }\n    \n    //-- 3. set related and selected SyllabusDescriptions to active\n    //$msg .= \'<p>Syllabus-Descriptions</p>\';\n    foreach($syD as $id){\n      $res = json_decode(api([\"cmd\"=>\"makeTransition\",\"param\"=>[\n      	\"table\"=>\"sqms2_text\",\"path\"=>\"i_am_your_father\",\"row\"=>[\n          \"sqms2_Text_id\"=>$id, \"state_id\"=>7474\n      ]]]), true);\n      //$msg .= \'<pre>\'.var_export($res, true).\'</pre>\';\n    }\n}\n//----------------------------------------------------\n$script_result = [\n    \"allow_transition\" => $allow,\n    \"show_message\" => $msg != \"\",\n    \"message\" => \"<ul>$msg</ul>\"\n];'),(4396,7462,7463,'include_once(__DIR__.\'/../_state_rules/4396.php\');'),(4397,7463,7462,'include_once(__DIR__.\'/../_state_rules/4397.php\');'),(4398,7462,7464,'include_once(__DIR__.\'/../_state_rules/4398.php\');'),(4399,7465,7465,'include_once(__DIR__.\'/../_state_rules/4399.php\');'),(4400,7467,7467,'include_once(__DIR__.\'/../_state_rules/4400.php\');'),(4401,7465,7466,'// #27\n$allow = false;\n$path = $param[\"path\"];\nif ($path != \'i_am_your_father\') {\n  $pathparts = explode(\'/\', $path);\n  $plen = count($pathparts);\n  $parentTbl = $pathparts[$plen-4];\n  $parentID = $pathparts[$plen-3];\n  $parentTblPriColname = Config::getPrimaryColNameByTablename($parentTbl);\n  // Check state of Parent?\n  $res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>$parentTbl,\n      \"filter\"=>\'{\"=\":[\"\'.$parentTblPriColname.\'\",\'.$parentID.\']}\'\n  ]]), true);\n  $parentStateID = (int)$res[\"records\"][0][\"state_id\"];\n  $allowedStateIDs = [7462, 7466, 7470, 7458];\n  $allow = in_array($parentStateID, $allowedStateIDs);\n}\nelse {\n	$allow = true;\n}\n//========================================\n$script_result = [\n    \"allow_transition\" => $allow,\n    \"show_message\" => !$allow,\n    \"message\" => \"This is only possible if Parent is active!\"\n];'),(4402,7466,7467,'include_once(__DIR__.\'/../_state_rules/4402.php\');'),(4403,7467,7466,'include_once(__DIR__.\'/../_state_rules/4403.php\');'),(4404,7466,7468,'include_once(__DIR__.\'/../_state_rules/4404.php\');'),(4405,7469,7469,'include_once(__DIR__.\'/../_state_rules/4405.php\');'),(4406,7471,7471,'include_once(__DIR__.\'/../_state_rules/4406.php\');'),(4407,7469,7470,'// #23\n$allow = false;\n$msg = \"\";\n$myID = $param[\"row\"][\"sqms2_Question_id\"];\n$answerIDs = [];\n$qTxts = [];\n$answerTextIDs = [];\n//============================ CHECKS (?)\n\n//-------------------- 1. Check if Question has >= 2 Answers\n$res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>\"sqms2_question_answer\",\n   \"filter\"=>\'{\"and\":[\n         {\"=\":[\"sqms2_Question_id\",\'.$myID.\']},\n         {\"=\":[\"`sqms2_question_answer`.state_id\",7487]}\n   ]}\'\n]]), true);\n$allowThis = ($res[\"count\"] >= 2);\n$msg .= $allowThis ? \"\" : \"<li>Question needs minimum 2 Answers!</li>\";\n$allow = $allowThis; // overwrite because 1. Check\n\n//--- Check if at least one Answer is correct!\n$atLeast1Correct = false;\nif ($allow) {\n	foreach ($res[\"records\"] as $qa) {\n    	$answerIDs[] = $qa[\"sqms2_Answer_id_fk_995603\"][\"sqms2_Answer_id\"];\n    	if ($qa[\"sqms2_Answer_id_fk_995603\"][\"sqms2_correct\"] == 1)\n        	$atLeast1Correct = true;\n    }\n}\n$allowThis = $atLeast1Correct;\n$msg .= $allowThis ? \"\" : \"<li>At least 1 Answer needs to be correct!</li>\";\n$allow = $allow && $allowThis;\n\n//-------------------- 2. \"Question\" must be related to at least one \"SyllabusChapter\"\n$res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>\"sqms2_syllabuschapter_question\",\n   \"filter\"=>\'{\"and\":[\n         {\"=\":[\"sqms2_Question_id\",\'.$myID.\']},\n         {\"=\":[\"`sqms2_syllabuschapter_question`.state_id\",7503]},\n		 {\"=\":[\"`sqms2_syllabuschapter_question/sqms2_SyllabusChapter_id_fk_920241`.state_id\",7466]}\n   ]}\'\n]]), true);\n$allowThis = ($res[\"count\"] >= 1);\n$msg .= $allowThis ? \"\" : \"<li>Question must be related to at least one active SyllabusChapter!</li>\";\n$allow = $allow && $allowThis;\n\n//-------------------- 3. number of Answers created per each language hast to be the same\n//--- (i.e 3 in emglish, 3 in german)\n$counts = [];\nforeach ($answerIDs as $aID) {\n  $res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>\"sqms2_answer_text\",\n     \"filter\"=>\'{\"and\":[\n           {\"=\":[\"sqms2_Answer_id\",\'.$aID.\']},\n           {\"=\":[\"`sqms2_answer_text`.state_id\",7485]}\n     ]}\'\n  ]]), true);\n  $counts[] = $res[\"count\"];\n  foreach ($res[\"records\"] as $r)\n  	$answerTextIDs[] = $r[\"sqms2_Text_id_fk_842740\"][\"sqms2_Text_id\"];\n}\n$allowThis = (count(array_unique($counts)) === 1);\n$msg .= $allowThis ? \"\" : \"<li>Answers must have equal number of Language-Texts!</li>\";\n$allow = $allow && $allowThis;\n\n//============================ OPERATIONS (!)\nif ($allow) {  \n    //-- 1. set related and selected QuestionTexts to active\n    //$msg .= \'<p>QuestionTexts</p>\';\n    $res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>\"sqms2_question_text\",\n       \"filter\"=>\'{\"and\":[\n             {\"=\":[\"sqms2_Question_id\",\'.$myID.\']},\n             {\"=\":[\"`sqms2_question_text`.state_id\",7493]}\n       ]}\'\n    ]]), true);\n    foreach($res[\"records\"] as $r)\n    	$qTxts[] = $r[\"sqms2_Text_id_fk_559100\"][\"sqms2_Text_id\"];    \n    foreach($qTxts as $id){\n      $res = json_decode(api([\"cmd\"=>\"makeTransition\",\"param\"=>[\n      	\"table\"=>\"sqms2_text\",\"path\"=>\"i_am_your_father\",\"row\"=>[\n          \"sqms2_Text_id\"=>$id, \"state_id\"=>7474\n      ]]]), true);\n      //$msg .= \'<pre>\'.var_export($res, true).\'</pre>\';\n    }\n    \n 	//-- 2. set related and selected Answer-Texts\n    //$msg .= \'<p>Answer-Texts</p>\';\n    foreach($answerTextIDs as $id){\n      $res = json_decode(api([\"cmd\"=>\"makeTransition\",\"param\"=>[\n      	\"table\"=>\"sqms2_text\",\"path\"=>\"i_am_your_father\",\"row\"=>[\n          \"sqms2_Text_id\"=>$id, \"state_id\"=>7474\n      ]]]), true);\n      //$msg .= \'<pre>\'.var_export($res, true).\'</pre>\';\n    }\n    \n    //-- 3. set related and selected Answers\n    //$msg .= \'<p>Answers</p>\';\n    foreach($answerIDs as $id){\n      $res = json_decode(api([\"cmd\"=>\"makeTransition\",\"param\"=>[\n      	\"table\"=>\"sqms2_answer\",\"path\"=>\"i_am_your_father\",\"row\"=>[\n          \"sqms2_Answer_id\"=>$id, \"state_id\"=>7458\n      ]]]), true);\n      //$msg .= \'<pre>\'.var_export($res, true).\'</pre>\';\n    }\n}\n//----------------------------------------------------\n$script_result = [\n    \"allow_transition\" => $allow,\n    \"show_message\" => $msg != \"\",\n    \"message\" => \"<ul>$msg</ul>\"\n];'),(4408,7470,7471,'include_once(__DIR__.\'/../_state_rules/4408.php\');'),(4409,7471,7470,'include_once(__DIR__.\'/../_state_rules/4409.php\');'),(4410,7470,7472,'include_once(__DIR__.\'/../_state_rules/4410.php\');'),(4411,7473,7473,'include_once(__DIR__.\'/../_state_rules/4411.php\');'),(4412,7475,7475,'include_once(__DIR__.\'/../_state_rules/4412.php\');'),(4413,7473,7474,'// #26\n$allow = false;\n$path = $param[\"path\"];\nif ($path != \'i_am_your_father\') {\n  $pathparts = explode(\'/\', $path);\n  $plen = count($pathparts);\n  $parentTbl = $pathparts[$plen-4];\n  $parentID = $pathparts[$plen-3];\n  $parentTblPriColname = Config::getPrimaryColNameByTablename($parentTbl);\n  // Check state of Parent?\n  $res = json_decode(api([\"cmd\"=>\"read\", \"param\"=>[\"table\"=>$parentTbl,\n      \"filter\"=>\'{\"=\":[\"\'.$parentTblPriColname.\'\",\'.$parentID.\']}\'\n  ]]), true);\n  $parentStateID = (int)$res[\"records\"][0][\"state_id\"];\n  $allowedStateIDs = [7462, 7466, 7470, 7458];\n  $allow = in_array($parentStateID, $allowedStateIDs);\n}\nelse {\n	$allow = true;\n}\n//========================================\n$script_result = [\n    \"allow_transition\" => $allow,\n    \"show_message\" => !$allow,\n    \"message\" => \"This is only possible if Parent is active!\"\n];'),(4414,7474,7475,'include_once(__DIR__.\'/../_state_rules/4414.php\');'),(4415,7475,7474,'include_once(__DIR__.\'/../_state_rules/4415.php\');'),(4416,7474,7476,'include_once(__DIR__.\'/../_state_rules/4416.php\');'),(4417,7477,7477,'include_once(__DIR__.\'/../_state_rules/4417.php\');'),(4418,7479,7479,'include_once(__DIR__.\'/../_state_rules/4418.php\');'),(4419,7477,7478,'// #21\n$who = trim($param[\"token\"]->firstname . \" \" . $param[\"token\"]->lastname);\n$param[\"row\"][\"sqms2_Topic_title\"] = trim($param[\"row\"][\"sqms2_Topic_title\"]);\n\n// Checks\n$allow = ( strlen($param[\"row\"][\"sqms2_Topic_title\"]) > 0 );\n$newval = $param[\"row\"][\"sqms2_Topic_title\"];\nif ($allow) {\n   $param[\"row\"][\"sqms2_Topic_History\"] = \"[\" . date(\"Y-m-d H:i:s\") . \"]: $who activated Topic-Title \\\"$newval\\\"!\\n\".\n   $param[\"row\"][\"sqms2_Topic_History\"];\n}\n\n$script_result = [\n    \"allow_transition\" => $allow,\n    \"show_message\" => !$allow,\n    \"message\" => \"Title is not set.\"\n];'),(4420,7478,7479,'include_once(__DIR__.\'/../_state_rules/4420.php\');'),(4421,7479,7478,'// #21\n$who = trim($param[\"token\"]->firstname . \" \" . $param[\"token\"]->lastname);\n$param[\"row\"][\"sqms2_Topic_title\"] = trim($param[\"row\"][\"sqms2_Topic_title\"]);\n$myID = $param[\"row\"][\"sqms2_Topic_id\"];\n\n// Checks\n$allow = ( strlen($param[\"row\"][\"sqms2_Topic_title\"]) > 0 );\n$resp = json_decode(api([\"cmd\"=>\"read\",\"param\"=>[\"table\"=>\"sqms2_topic\",\"filter\"=>\'{\"=\":[\"sqms2_Topic_id\",\'.$myID.\']}\']]), true);\n$myObjOld = $resp[\"records\"][0];\n\n$oldval = $myObjOld[\"sqms2_Topic_title\"];\n$newval = $param[\"row\"][\"sqms2_Topic_title\"];\n\nif ($allow) {\n   $param[\"row\"][\"sqms2_Topic_History\"] = \"[\" . date(\"Y-m-d H:i:s\") . \"]: $who updated Topic-Title from \\\"$oldval\\\" to \\\"$newval\\\"!\\n\".\n   $param[\"row\"][\"sqms2_Topic_History\"];\n}\n\n$script_result = [\n    \"allow_transition\" => $allow,\n    \"show_message\" => !$allow,\n    \"message\" => \"Title is not set.\"\n];'),(4422,7478,7480,'include_once(__DIR__.\'/../_state_rules/4422.php\');'),(4423,7481,7481,'include_once(__DIR__.\'/../_state_rules/4423.php\');'),(4424,7483,7483,'include_once(__DIR__.\'/../_state_rules/4424.php\');'),(4425,7481,7482,'include_once(__DIR__.\'/../_state_rules/4425.php\');'),(4426,7482,7483,'include_once(__DIR__.\'/../_state_rules/4426.php\');'),(4427,7483,7482,'include_once(__DIR__.\'/../_state_rules/4427.php\');'),(4428,7482,7484,'include_once(__DIR__.\'/../_state_rules/4428.php\');'),(4429,7485,7486,'include_once(__DIR__.\'/../_state_rules/4429.php\');'),(4430,7486,7485,'include_once(__DIR__.\'/../_state_rules/4430.php\');'),(4431,7487,7488,'include_once(__DIR__.\'/../_state_rules/4431.php\');'),(4432,7488,7487,'include_once(__DIR__.\'/../_state_rules/4432.php\');'),(4433,7489,7490,'include_once(__DIR__.\'/../_state_rules/4433.php\');'),(4434,7490,7489,'include_once(__DIR__.\'/../_state_rules/4434.php\');'),(4435,7491,7492,'include_once(__DIR__.\'/../_state_rules/4435.php\');'),(4436,7492,7491,'include_once(__DIR__.\'/../_state_rules/4436.php\');'),(4437,7493,7494,'include_once(__DIR__.\'/../_state_rules/4437.php\');'),(4438,7494,7493,'include_once(__DIR__.\'/../_state_rules/4438.php\');'),(4439,7495,7496,'include_once(__DIR__.\'/../_state_rules/4439.php\');'),(4440,7496,7495,'include_once(__DIR__.\'/../_state_rules/4440.php\');'),(4441,7497,7498,'include_once(__DIR__.\'/../_state_rules/4441.php\');'),(4442,7498,7497,'include_once(__DIR__.\'/../_state_rules/4442.php\');'),(4443,7499,7500,'include_once(__DIR__.\'/../_state_rules/4443.php\');'),(4444,7500,7499,'include_once(__DIR__.\'/../_state_rules/4444.php\');'),(4445,7501,7502,'include_once(__DIR__.\'/../_state_rules/4445.php\');'),(4446,7502,7501,'include_once(__DIR__.\'/../_state_rules/4446.php\');'),(4447,7503,7504,'include_once(__DIR__.\'/../_state_rules/4447.php\');'),(4448,7504,7503,'include_once(__DIR__.\'/../_state_rules/4448.php\');'),(4449,7505,7506,'include_once(__DIR__.\'/../_state_rules/4449.php\');'),(4450,7506,7505,'include_once(__DIR__.\'/../_state_rules/4450.php\');'),(4451,7507,7508,'include_once(__DIR__.\'/../_state_rules/4451.php\');'),(4452,7508,7507,'include_once(__DIR__.\'/../_state_rules/4452.php\');'),(4453,7509,7510,'include_once(__DIR__.\'/../_state_rules/4453.php\');'),(4454,7510,7509,'include_once(__DIR__.\'/../_state_rules/4454.php\');'),(4455,7464,7511,'include_once(__DIR__.\'/../_state_rules/4455.php\');');
/*!40000 ALTER TABLE `state_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bpmspace_sqms2_v1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-14 10:33:09
