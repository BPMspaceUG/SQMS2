create database bpmspace_sqms2_v1;
use  bpmspace_sqms2_v1;
SET FOREIGN_KEY_CHECKS=0;
-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'state'
-- 
-- ---

DROP TABLE IF EXISTS `state`;
		
CREATE TABLE `state` (
  `state_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `form_data` MEDIUMTEXT NULL DEFAULT NULL,
  `entrypoint` TINYINT(1) NOT NULL DEFAULT 0,
  `statemachine_id` BIGINT(20) NOT NULL DEFAULT 1,
  `script_IN` MEDIUMTEXT NULL DEFAULT NULL,
  `script_OUT` MEDIUMTEXT NULL DEFAULT NULL,
KEY (`statemachine_id`),
  PRIMARY KEY (`state_id`)
);

-- ---
-- Table 'state_rules'
-- 
-- ---

DROP TABLE IF EXISTS `state_rules`;
		
CREATE TABLE `state_rules` (
  `state_rules_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `state_id_FROM` BIGINT(20) NOT NULL,
  `state_id_TO` BIGINT(20) NOT NULL,
  `transition_script` MEDIUMTEXT NULL DEFAULT NULL,
KEY (`state_id_TO`),
  PRIMARY KEY (`state_rules_id`),
KEY (`state_id_FROM`)
);

-- ---
-- Table 'state_machines'
-- 
-- ---

DROP TABLE IF EXISTS `state_machines`;
		
CREATE TABLE `state_machines` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `tablename` VARCHAR(45) NULL DEFAULT NULL,
  `transition_script` MEDIUMTEXT NULL DEFAULT NULL,
  `form_data` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'sqms2_text'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_text`;
		
CREATE TABLE `sqms2_text` (
  `sqms2_Text_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Text` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_text_History` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_language_iso_short` ENUM('DE','EN','FR','SP','IT') NULL DEFAULT NULL,
  `state_id` BIGINT(20) NULL DEFAULT 17,
KEY (`state_id`),
  PRIMARY KEY (`sqms2_Text_id`)
);

-- ---
-- Table 'sqms2_Question'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question`;
		
CREATE TABLE `sqms2_Question` (
  `sqms2_Question_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Question_History` MEDIUMTEXT NULL DEFAULT NULL,
  `_LIAMUSER_ID` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Question_Version` INT(11) NULL DEFAULT 1,
  `sqms2_Question_type` ENUM('CALCULATED','CALCULATED MULTI-CHOICE','CALCULATED SIMPLE','DESCRIPTION','ESSAY','MATCHING','EMBEDDED ANSWERS','MULTIPLE CHOICE','SHORT ANSWER','NUMERICAL','RANDOM SHORT-ANSWER MATCHING','TRUE/FALSE') NULL DEFAULT NULL,
  `state_id` BIGINT(20) NULL DEFAULT 13,
  PRIMARY KEY (`sqms2_Question_id`),
KEY (`state_id`)
);

-- ---
-- Table 'sqms2_Syllabus'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Syllabus`;
		
CREATE TABLE `sqms2_Syllabus` (
  `sqms2_Syllabus_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Syllabus_titel` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_Syllabus_History` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_Syllabus_Valid_from` DATE NULL DEFAULT NULL,
  `sqms2_Syllabus_Valid_to` DATE NULL DEFAULT NULL,
  `sqms2_Syllabus_Version` INT(11) NULL DEFAULT 1,
  `state_id` BIGINT(20) NULL DEFAULT 5,
KEY (`state_id`),
  PRIMARY KEY (`sqms2_Syllabus_id`)
);

-- ---
-- Table 'Role'
-- 
-- ---

DROP TABLE IF EXISTS `Role`;
		
CREATE TABLE `Role` (
  `Role_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `Role_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Role_id`)
);

-- ---
-- Table 'Role_LIAMUSER'
-- 
-- ---

DROP TABLE IF EXISTS `Role_LIAMUSER`;
		
CREATE TABLE `Role_LIAMUSER` (
  `Role_User_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `Role_id` BIGINT(20) NOT NULL,
  `User_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`Role_User_id`),
KEY (`Role_id`)
);

-- ---
-- Table 'sqms2_SyllabusChapter'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_SyllabusChapter`;
		
CREATE TABLE `sqms2_SyllabusChapter` (
  `sqms2_SyllabusChapter_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_SyllabusChapter_titel` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_SyllabusChapter_History` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_SyllabusChapter_ChapterNumber` INT(11) NULL DEFAULT NULL,
  `sqms2_SyllabusChapter_Severity` INT(11) NULL DEFAULT NULL,
  `state_id` BIGINT(20) NULL DEFAULT 9,
KEY (`state_id`),
  PRIMARY KEY (`sqms2_SyllabusChapter_id`)
);

-- ---
-- Table 'sqms2_Answer'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Answer`;
		
CREATE TABLE `sqms2_Answer` (
  `sqms2_Answer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sqms2_Answer_History` MEDIUMTEXT NULL DEFAULT NULL,
  `state_id` BIGINT(20) NULL DEFAULT 1,
KEY (`state_id`),
  PRIMARY KEY (`sqms2_Answer_id`)
);

-- ---
-- Table 'sqms2_Question_ExamSetVersion'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question_ExamSetVersion`;
		
CREATE TABLE `sqms2_Question_ExamSetVersion` (
  `sqms2_Question_ExamSetVersion_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_ExamSetVersion_id_fk_264577` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Question_id_fk_615560` BIGINT(20) NULL DEFAULT NULL,
KEY (`sqms2_ExamSetVersion_id_fk_264577`),
  PRIMARY KEY (`sqms2_Question_ExamSetVersion_id`),
KEY (`sqms2_Question_id_fk_615560`)
);

-- ---
-- Table 'sqms2_Topic'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Topic`;
		
CREATE TABLE `sqms2_Topic` (
  `sqms2_Topic_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Topic_title` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_Topic_History` MEDIUMTEXT NULL DEFAULT NULL,
  `state_id` BIGINT(20) NULL DEFAULT 21,
KEY (`state_id`),
  PRIMARY KEY (`sqms2_Topic_id`)
);

-- ---
-- Table 'sqms2_Syllabus_desc'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Syllabus_desc`;
		
CREATE TABLE `sqms2_Syllabus_desc` (
  `sqms2_Syllabus_desc_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Syllabus_id_fk_783731` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Text_id_fk_178796` BIGINT(20) NULL DEFAULT NULL,
KEY (`sqms2_Syllabus_id_fk_783731`),
  PRIMARY KEY (`sqms2_Syllabus_desc_id`),
KEY (`sqms2_Text_id_fk_178796`)
);

-- ---
-- Table 'sqms2_Syllabus_Topic'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Syllabus_Topic`;
		
CREATE TABLE `sqms2_Syllabus_Topic` (
  `sqms2_Syllabus_Topic_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Syllabus_id_fk_345197` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Topic_id_fk_945295` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Syllabus_Topic_id`),
KEY (`sqms2_Topic_id_fk_945295`),
KEY (`sqms2_Syllabus_id_fk_345197`)
);

-- ---
-- Table 'sqms2_SyllabusChapter_Question'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_SyllabusChapter_Question`;
		
CREATE TABLE `sqms2_SyllabusChapter_Question` (
  `sqms2_SyllabusChapter_Question_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_SyllabusChapter_id_fk_920241` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Question_id_fk_285826` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_SyllabusChapter_Question_id`),
KEY (`sqms2_Question_id_fk_285826`),
KEY (`sqms2_SyllabusChapter_id_fk_920241`)
);

-- ---
-- Table 'sqms2_Question_Answer'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question_Answer`;
		
CREATE TABLE `sqms2_Question_Answer` (
  `sqms2_Question_Answer_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Question_id_fk_735802` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Answer_id_fk_995603` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Question_Answer_id`),
KEY (`sqms2_Answer_id_fk_995603`),
KEY (`sqms2_Question_id_fk_735802`)
);

-- ---
-- Table 'sqms2_Question_ExamSetVersion_Answer'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question_ExamSetVersion_Answer`;
		
CREATE TABLE `sqms2_Question_ExamSetVersion_Answer` (
  `sqms2_Question_ExamSetVersion_Answer_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Question_ExamSetVersion_id_fk_186326` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Answer_id_fk_507266` INT(11) NULL DEFAULT NULL,
KEY (`sqms2_Question_ExamSetVersion_id_fk_186326`),
  PRIMARY KEY (`sqms2_Question_ExamSetVersion_Answer_id`),
KEY (`sqms2_Answer_id_fk_507266`)
);

-- ---
-- Table 'sqms2_ExamSetVersion'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_ExamSetVersion`;
		
CREATE TABLE `sqms2_ExamSetVersion` (
  `sqms2_ExamSetVersion_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_ExamSetVersion_title` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_ExamSetVersion_History` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_ExamSetVersion_Version` INT(11) NULL DEFAULT 1,
  `sqms2_ExamSetVersion_Set` INT(11) NULL DEFAULT 1,
  `sqms2_ExamSetVersion_SampleSet` TINYINT(4) NULL DEFAULT 0,
  `state_id` BIGINT(20) NULL DEFAULT 25,
  PRIMARY KEY (`sqms2_ExamSetVersion_id`),
KEY (`state_id`)
);

-- ---
-- Table 'sqms2_Syllabus_SyllabusChapter'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Syllabus_SyllabusChapter`;
		
CREATE TABLE `sqms2_Syllabus_SyllabusChapter` (
  `sqms2_Syllabus_SyllabusChapter_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Syllabus_id_fk_870666` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_SyllabusChapter_id_fk_327935` BIGINT(20) NULL DEFAULT NULL,
KEY (`sqms2_SyllabusChapter_id_fk_327935`),
  PRIMARY KEY (`sqms2_Syllabus_SyllabusChapter_id`),
KEY (`sqms2_Syllabus_id_fk_870666`)
);

-- ---
-- Table 'sqms2_Answer_Text'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Answer_Text`;
		
CREATE TABLE `sqms2_Answer_Text` (
  `sqms2_Answer_Text_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Answer_id_fk_154388` INT(11) NULL DEFAULT NULL,
  `sqms2_Text_id_fk_842740` BIGINT(20) NULL DEFAULT NULL,
KEY (`sqms2_Text_id_fk_842740`),
  PRIMARY KEY (`sqms2_Answer_Text_id`),
KEY (`sqms2_Answer_id_fk_154388`)
);

-- ---
-- Table 'sqms2_Topic_Question'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Topic_Question`;
		
CREATE TABLE `sqms2_Topic_Question` (
  `sqms2_Topic_Question_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sqms2_Topic_id_fk_824630` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Question_id_fk_664094` BIGINT(20) NULL DEFAULT NULL,
KEY (`sqms2_Topic_id_fk_824630`),
KEY (`sqms2_Question_id_fk_664094`),
  PRIMARY KEY (`sqms2_Topic_Question_id`)
);

-- ---
-- Table 'sqms2_SyllabusChapter_desc'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_SyllabusChapter_desc`;
		
CREATE TABLE `sqms2_SyllabusChapter_desc` (
  `sqms2_SyllabusChapter_desc_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_SyllabusChapter_id_fk_886795` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Text_id_fk_524933` BIGINT(20) NULL DEFAULT NULL,
KEY (`sqms2_SyllabusChapter_id_fk_886795`),
  PRIMARY KEY (`sqms2_SyllabusChapter_desc_id`),
KEY (`sqms2_Text_id_fk_524933`)
);

-- ---
-- Table 'sqms2_Text_Text'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Text_Text`;
		
CREATE TABLE `sqms2_Text_Text` (
  `sqms2_Text_Text_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Text_id_fk_508677` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Text_id_fk_899589` BIGINT(20) NULL DEFAULT NULL,
KEY (`sqms2_Text_id_fk_508677`),
KEY (`sqms2_Text_id_fk_899589`),
  PRIMARY KEY (`sqms2_Text_Text_id`)
);

-- ---
-- Table 'sqms2_Question_Text'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question_Text`;
		
CREATE TABLE `sqms2_Question_Text` (
  `sqms2_Question_Text_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Text_id_fk_559100` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Question_id_fk_783494` BIGINT(20) NULL DEFAULT NULL,
KEY (`sqms2_Text_id_fk_559100`),
  PRIMARY KEY (`sqms2_Question_Text_id`),
KEY (`sqms2_Question_id_fk_783494`)
);

-- ---
-- Table 'sqms2_Topic_Role'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Topic_Role`;
		
CREATE TABLE `sqms2_Topic_Role` (
  `sqms2_Topic_Role_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sqms2_Topic_id_fk_811732` BIGINT(20) NOT NULL,
  `Role_id_fk_928470` BIGINT(20) NOT NULL,
  PRIMARY KEY (`sqms2_Topic_Role_id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state` ADD FOREIGN KEY (statemachine_id) REFERENCES `state_machines` (`id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_FROM) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `state_rules` ADD FOREIGN KEY (state_id_TO) REFERENCES `state` (`state_id`);
ALTER TABLE `sqms2_text` ADD FOREIGN KEY (state_id) REFERENCES `state` (`state_id`);
ALTER TABLE `sqms2_Question` ADD FOREIGN KEY (state_id) REFERENCES `state` (`state_id`);
ALTER TABLE `sqms2_Syllabus` ADD FOREIGN KEY (state_id) REFERENCES `state` (`state_id`);
ALTER TABLE `Role_LIAMUSER` ADD FOREIGN KEY (Role_id) REFERENCES `Role` (`Role_id`);
ALTER TABLE `Role_LIAMUSER` ADD FOREIGN KEY (Role_id) REFERENCES `Role` (`Role_id`);
ALTER TABLE `Role_LIAMUSER` ADD FOREIGN KEY (Role_id) REFERENCES `Role` (`Role_id`);
ALTER TABLE `Role_LIAMUSER` ADD FOREIGN KEY (Role_id) REFERENCES `Role` (`Role_id`);
ALTER TABLE `sqms2_SyllabusChapter` ADD FOREIGN KEY (state_id) REFERENCES `state` (`state_id`);
ALTER TABLE `sqms2_Answer` ADD FOREIGN KEY (state_id) REFERENCES `state` (`state_id`);
ALTER TABLE `sqms2_Question_ExamSetVersion` ADD FOREIGN KEY (sqms2_ExamSetVersion_id_fk_264577) REFERENCES `sqms2_ExamSetVersion` (`sqms2_ExamSetVersion_id`);
ALTER TABLE `sqms2_Question_ExamSetVersion` ADD FOREIGN KEY (sqms2_Question_id_fk_615560) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_Topic` ADD FOREIGN KEY (state_id) REFERENCES `state` (`state_id`);
ALTER TABLE `sqms2_Syllabus_desc` ADD FOREIGN KEY (sqms2_Syllabus_id_fk_783731) REFERENCES `sqms2_Syllabus` (`sqms2_Syllabus_id`);
ALTER TABLE `sqms2_Syllabus_desc` ADD FOREIGN KEY (sqms2_Text_id_fk_178796) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Syllabus_Topic` ADD FOREIGN KEY (sqms2_Syllabus_id_fk_345197) REFERENCES `sqms2_Syllabus` (`sqms2_Syllabus_id`);
ALTER TABLE `sqms2_Syllabus_Topic` ADD FOREIGN KEY (sqms2_Topic_id_fk_945295) REFERENCES `sqms2_Topic` (`sqms2_Topic_id`);
ALTER TABLE `sqms2_SyllabusChapter_Question` ADD FOREIGN KEY (sqms2_SyllabusChapter_id_fk_920241) REFERENCES `sqms2_SyllabusChapter` (`sqms2_SyllabusChapter_id`);
ALTER TABLE `sqms2_SyllabusChapter_Question` ADD FOREIGN KEY (sqms2_Question_id_fk_285826) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_Question_Answer` ADD FOREIGN KEY (sqms2_Question_id_fk_735802) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_Question_Answer` ADD FOREIGN KEY (sqms2_Answer_id_fk_995603) REFERENCES `sqms2_Answer` (`sqms2_Answer_id`);
ALTER TABLE `sqms2_Question_ExamSetVersion_Answer` ADD FOREIGN KEY (sqms2_Question_ExamSetVersion_id_fk_186326) REFERENCES `sqms2_Question_ExamSetVersion` (`sqms2_Question_ExamSetVersion_id`);
ALTER TABLE `sqms2_Question_ExamSetVersion_Answer` ADD FOREIGN KEY (sqms2_Answer_id_fk_507266) REFERENCES `sqms2_Answer` (`sqms2_Answer_id`);
ALTER TABLE `sqms2_ExamSetVersion` ADD FOREIGN KEY (state_id) REFERENCES `state` (`state_id`);
ALTER TABLE `sqms2_Syllabus_SyllabusChapter` ADD FOREIGN KEY (sqms2_Syllabus_id_fk_870666) REFERENCES `sqms2_Syllabus` (`sqms2_Syllabus_id`);
ALTER TABLE `sqms2_Syllabus_SyllabusChapter` ADD FOREIGN KEY (sqms2_SyllabusChapter_id_fk_327935) REFERENCES `sqms2_SyllabusChapter` (`sqms2_SyllabusChapter_id`);
ALTER TABLE `sqms2_Answer_Text` ADD FOREIGN KEY (sqms2_Answer_id_fk_154388) REFERENCES `sqms2_Answer` (`sqms2_Answer_id`);
ALTER TABLE `sqms2_Answer_Text` ADD FOREIGN KEY (sqms2_Text_id_fk_842740) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Topic_Question` ADD FOREIGN KEY (sqms2_Topic_id_fk_824630) REFERENCES `sqms2_Topic` (`sqms2_Topic_id`);
ALTER TABLE `sqms2_Topic_Question` ADD FOREIGN KEY (sqms2_Question_id_fk_664094) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_SyllabusChapter_desc` ADD FOREIGN KEY (sqms2_SyllabusChapter_id_fk_886795) REFERENCES `sqms2_SyllabusChapter` (`sqms2_SyllabusChapter_id`);
ALTER TABLE `sqms2_SyllabusChapter_desc` ADD FOREIGN KEY (sqms2_Text_id_fk_524933) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Text_Text` ADD FOREIGN KEY (sqms2_Text_id_fk_508677) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Text_Text` ADD FOREIGN KEY (sqms2_Text_id_fk_899589) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Question_Text` ADD FOREIGN KEY (sqms2_Text_id_fk_559100) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Question_Text` ADD FOREIGN KEY (sqms2_Question_id_fk_783494) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_Topic_Role` ADD FOREIGN KEY (sqms2_Topic_id_fk_811732) REFERENCES `sqms2_Topic` (`sqms2_Topic_id`);
ALTER TABLE `sqms2_Topic_Role` ADD FOREIGN KEY (Role_id_fk_928470) REFERENCES `Role` (`Role_id`);
-- ---
-- Table Properties
-- ---

ALTER TABLE `sqms2_Syllabus` ENGINE=InnoDB AUTO_INCREMENT=90034785 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Syllabus_desc` ENGINE=InnoDB AUTO_INCREMENT=80034995 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_text` ENGINE=InnoDB AUTO_INCREMENT=70034123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Syllabus_SyllabusChapter` ENGINE=InnoDB AUTO_INCREMENT=60034345 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_SyllabusChapter` ENGINE=InnoDB AUTO_INCREMENT=50034898 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Text_Text` ENGINE=InnoDB AUTO_INCREMENT=40034221 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_SyllabusChapter_desc` ENGINE=InnoDB AUTO_INCREMENT=30034956 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Topic` ENGINE=InnoDB AUTO_INCREMENT=20034856 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Syllabus_Topic` ENGINE=InnoDB AUTO_INCREMENT=10034772 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_SyllabusChapter_Question` ENGINE=InnoDB AUTO_INCREMENT=95034435 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Question` ENGINE=InnoDB AUTO_INCREMENT=85034964 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Question_Text` ENGINE=InnoDB AUTO_INCREMENT=75034123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Question_Answer` ENGINE=InnoDB AUTO_INCREMENT=6503445 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Answer` ENGINE=InnoDB AUTO_INCREMENT=55038778 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Answer_Text` ENGINE=InnoDB AUTO_INCREMENT=45034439 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_ExamSetVersion` ENGINE=InnoDB AUTO_INCREMENT=35034823 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Question_ExamSetVersion` ENGINE=InnoDB AUTO_INCREMENT=25034234 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Question_ExamSetVersion_Answer` ENGINE=InnoDB AUTO_INCREMENT=15034485 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Topic_Question` ENGINE=InnoDB AUTO_INCREMENT=05034926 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `state` ENGINE=InnoDB AUTO_INCREMENT=7456 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `state_rules` ENGINE=InnoDB AUTO_INCREMENT=4386 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `state_machines` ENGINE=InnoDB AUTO_INCREMENT=2245 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `sqms2_Topic_Role` ENGINE=InnoDB AUTO_INCREMENT=3322321 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `sqms2_Syllabus` (`sqms2_Syllabus_id`,`sqms2_Syllabus_titel`,`sqms2_Syllabus_History`,`sqms2_Syllabus_Valid_from`,`sqms2_Syllabus_Valid_to`,`sqms2_Syllabus_Version`) VALUES
-- ('','','','','','');
-- INSERT INTO `sqms2_Syllabus_desc` (`sqms2_Syllabus_desc_id`,`sqms2_Syllabus_id_fk_783731`,`sqms2_Text_id_fk_178796`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_text` (`sqms2_Text_id`,`sqms2_Text`,`sqms2_text_History`,`sqms2_language_iso_short`) VALUES
-- ('','','','');
-- INSERT INTO `sqms2_Syllabus_SyllabusChapter` (`sqms2_Syllabus_SyllabusChapter_id`,`sqms2_Syllabus_id_fk_870666`,`sqms2_SyllabusChapter_id_fk_327935`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_SyllabusChapter` (`sqms2_SyllabusChapter_id`,`sqms2_SyllabusChapter_titel`,`sqms2_SyllabusChapter_History`,`sqms2_SyllabusChapter_ChapterNumber`,`sqms2_SyllabusChapter_Severity`) VALUES
-- ('','','','','');
-- INSERT INTO `sqms2_Text_Text` (`sqms2_Text_Text_id`,`sqms2_Text_id_fk_508677`,`sqms2_Text_id_fk_899589`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_SyllabusChapter_desc` (`sqms2_SyllabusChapter_desc_id`,`sqms2_SyllabusChapter_id_fk_886795`,`sqms2_Text_id_fk_524933`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Topic` (`sqms2_Topic_id`,`sqms2_Topic_title`,`sqms2_Topic_History`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Syllabus_Topic` (`sqms2_Syllabus_Topic_id`,`sqms2_Syllabus_id_fk_345197`,`sqms2_Topic_id_fk_945295`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_SyllabusChapter_Question` (`sqms2_SyllabusChapter_Question_id`,`sqms2_SyllabusChapter_id_fk_920241`,`sqms2_Question_id_fk_285826`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Question` (`sqms2_Question_id`,`sqms2_Question_History`,`_LIAMUSER_ID`,`sqms2_Question_Version`,`sqms2_Question_type`) VALUES
-- ('','','','','');
-- INSERT INTO `sqms2_Question_Text` (`sqms2_Question_Text_id`,`sqms2_Text_id_fk_559100`,`sqms2_Question_id_fk_783494`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Question_Answer` (`sqms2_Question_Answer_id`,`sqms2_Question_id_fk_735802`,`sqms2_Answer_id_fk_995603`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Answer` (`sqms2_Answer_id`,`sqms2_Answer_History`) VALUES
-- ('','');
-- INSERT INTO `sqms2_Answer_Text` (`sqms2_Answer_Text_id`,`sqms2_Answer_id_fk_154388`,`sqms2_Text_id_fk_842740`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_ExamSetVersion` (`sqms2_ExamSetVersion_id`,`sqms2_ExamSetVersion_title`,`sqms2_ExamSetVersion_History`,`sqms2_ExamSetVersion_Version`,`sqms2_ExamSetVersion_Set`,`sqms2_ExamSetVersion_SampleSet`) VALUES
-- ('','','','','','');
-- INSERT INTO `sqms2_Question_ExamSetVersion` (`sqms2_Question_ExamSetVersion_id`,`sqms2_ExamSetVersion_id_fk_264577`,`sqms2_Question_id_fk_615560`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Question_ExamSetVersion_Answer` (`sqms2_Question_ExamSetVersion_Answer_id`,`sqms2_Question_ExamSetVersion_id_fk_186326`,`sqms2_Answer_id_fk_507266`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Topic_Question` (`sqms2_Topic_Question_id`,`sqms2_Topic_id_fk_824630`,`sqms2_Question_id_fk_664094`) VALUES
-- ('','','');

/*
-- Query: SELECT state_id + 7456 AS state_id, name, form_data, entrypoint, statemachine_id + 2245 AS statemachine_id, script_IN, script_OUT FROM bpmspace_sqms2_v1.state
-- Date: 2019-06-03 15:52
*/
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7457,'new','',1,2246,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7458,'active','{\"sqms2_Answer_History\":{\"mode_form\":\"ro\"}}',0,2246,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7459,'update','',0,2246,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7460,'inactive','{\"sqms2_Answer_History\":{\"mode_form\":\"ro\"}}',0,2246,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7461,'new','',1,2247,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7462,'active','{\"sqms2_Syllabus_titel\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_History\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Valid_from\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Valid_to\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Version\":{\"mode_form\":\"ro\"}}',0,2247,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7463,'update','',0,2247,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7464,'inactive','{\"sqms2_Syllabus_titel\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_History\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Valid_from\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Valid_to\":{\"mode_form\":\"ro\"},\"sqms2_Syllabus_Version\":{\"mode_form\":\"ro\"}}',0,2247,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7465,'new','',1,2248,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7466,'active','{\"sqms2_SyllabusChapter_titel\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_History\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_ChapterNumber\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_Severity\":{\"mode_form\":\"ro\"}}',0,2248,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7467,'update','',0,2248,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7468,'inactive','{\"sqms2_SyllabusChapter_titel\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_History\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_ChapterNumber\":{\"mode_form\":\"ro\"},\"sqms2_SyllabusChapter_Severity\":{\"mode_form\":\"ro\"}}',0,2248,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7469,'new','',1,2249,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7470,'active','{\"sqms2_Question_History\":{\"mode_form\":\"ro\"},\"_LIAMUSER_ID\":{\"mode_form\":\"ro\"},\"sqms2_Question_Version\":{\"mode_form\":\"ro\"},\"sqms2_Question_type\":{\"mode_form\":\"ro\"}}',0,2249,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7471,'update','',0,2249,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7472,'inactive','{\"sqms2_Question_History\":{\"mode_form\":\"ro\"},\"_LIAMUSER_ID\":{\"mode_form\":\"ro\"},\"sqms2_Question_Version\":{\"mode_form\":\"ro\"},\"sqms2_Question_type\":{\"mode_form\":\"ro\"}}',0,2249,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7473,'new','',1,2250,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7474,'active','{\"sqms2_Text\":{\"mode_form\":\"ro\"},\"sqms2_text_History\":{\"mode_form\":\"ro\"},\"sqms2_language_iso_short\":{\"mode_form\":\"ro\"}}',0,2250,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7475,'update','',0,2250,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7476,'inactive','{\"sqms2_Text\":{\"mode_form\":\"ro\"},\"sqms2_text_History\":{\"mode_form\":\"ro\"},\"sqms2_language_iso_short\":{\"mode_form\":\"ro\"}}',0,2250,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7477,'new','',1,2251,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7478,'active','{\"sqms2_Topic_title\":{\"mode_form\":\"ro\"},\"sqms2_Topic_History\":{\"mode_form\":\"ro\"}}',0,2251,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7479,'update','',0,2251,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7480,'inactive','{\"sqms2_Topic_title\":{\"mode_form\":\"ro\"},\"sqms2_Topic_History\":{\"mode_form\":\"ro\"}}',0,2251,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7481,'new','',1,2252,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7482,'active','{\"sqms2_ExamSetVersion_title\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_History\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_Version\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_Set\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_SampleSet\":{\"mode_form\":\"ro\"}}',0,2252,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7483,'update','',0,2252,NULL,NULL);
INSERT INTO `state` (`state_id`,`name`,`form_data`,`entrypoint`,`statemachine_id`,`script_IN`,`script_OUT`) VALUES (7484,'inactive','{\"sqms2_ExamSetVersion_title\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_History\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_Version\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_Set\":{\"mode_form\":\"ro\"},\"sqms2_ExamSetVersion_SampleSet\":{\"mode_form\":\"ro\"}}',0,2252,NULL,NULL);



/*
-- Query: SELECT id + 2245 as id  , tablename, transition_script, form_data FROM bpmspace_sqms2_v1.state_machines
-- Date: 2019-06-03 15:56
*/
INSERT INTO `state_machines` (`id`,`tablename`,`transition_script`,`form_data`) VALUES (2246,'sqms2_Answer',NULL,NULL);
INSERT INTO `state_machines` (`id`,`tablename`,`transition_script`,`form_data`) VALUES (2247,'sqms2_Syllabus','','{\n  \"sqms2_Syllabus_Version\": {\"mode_form\": \"hi\"}\n}');
INSERT INTO `state_machines` (`id`,`tablename`,`transition_script`,`form_data`) VALUES (2248,'sqms2_SyllabusChapter',NULL,NULL);
INSERT INTO `state_machines` (`id`,`tablename`,`transition_script`,`form_data`) VALUES (2249,'sqms2_Question',NULL,NULL);
INSERT INTO `state_machines` (`id`,`tablename`,`transition_script`,`form_data`) VALUES (2250,'sqms2_text',NULL,NULL);
INSERT INTO `state_machines` (`id`,`tablename`,`transition_script`,`form_data`) VALUES (2251,'sqms2_Topic',NULL,NULL);
INSERT INTO `state_machines` (`id`,`tablename`,`transition_script`,`form_data`) VALUES (2252,'sqms2_ExamSetVersion',NULL,NULL);


/*
-- Query: SELECT state_rules_id + 4386 AS state_rules_id, state_id_FROM + 7456 AS state_id_FROM, state_id_TO + 7456 AS state_id_TO, transition_script FROM bpmspace_sqms2_v1.state_rules
-- Date: 2019-06-03 15:59
*/
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4387,7457,7457,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4388,7459,7459,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4389,7457,7458,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4390,7458,7459,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4391,7459,7458,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4392,7458,7460,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4393,7461,7461,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4394,7463,7463,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4395,7461,7462,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4396,7462,7463,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4397,7463,7462,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4398,7462,7464,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4399,7465,7465,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4400,7467,7467,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4401,7465,7466,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4402,7466,7467,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4403,7467,7466,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4404,7466,7468,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4405,7469,7469,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4406,7471,7471,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4407,7469,7470,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4408,7470,7471,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4409,7471,7470,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4410,7470,7472,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4411,7473,7473,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4412,7475,7475,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4413,7473,7474,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4414,7474,7475,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4415,7475,7474,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4416,7474,7476,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4417,7477,7477,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4418,7479,7479,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4419,7477,7478,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4420,7478,7479,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4421,7479,7478,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4422,7478,7480,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4423,7481,7481,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4424,7483,7483,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4425,7481,7482,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4426,7482,7483,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4427,7483,7482,NULL);
INSERT INTO `state_rules` (`state_rules_id`,`state_id_FROM`,`state_id_TO`,`transition_script`) VALUES (4428,7482,7484,NULL);


SET FOREIGN_KEY_CHECKS=1;