-- ---
-- Globals
-- ---

create database bpmspace_sqms2_v1;
use  bpmspace_sqms2_v1;

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'sqms2_Syllabus'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Syllabus`;
		
CREATE TABLE `sqms2_Syllabus` (
  `sqms2_Syllabus_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Syllabus_titel` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Syllabus_id`)
);

-- ---
-- Table 'sqms2_Syllabus_desc'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Syllabus_desc`;
		
CREATE TABLE `sqms2_Syllabus_desc` (
  `sqms2_Syllabus_desc_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Syllabus_id_fk_783731` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Text_id_fk_178796` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Syllabus_desc_id`)
);

-- ---
-- Table 'sqms2_text'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_text`;
		
CREATE TABLE `sqms2_text` (
  `sqms2_Text_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Text` MEDIUMTEXT NULL DEFAULT NULL,
  `sqms2_language_iso_short` ENUM('de','en','fr','sp','it') NULL,
  PRIMARY KEY (`sqms2_Text_id`)
);

-- ---
-- Table 'sqms2_Syllabus_SyllabusElement'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Syllabus_SyllabusElement`;
		
CREATE TABLE `sqms2_Syllabus_SyllabusElement` (
  `sqms2_Syllabus_SyllabusElement_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Syllabus_id_fk_870666` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_SyllabusElement_id_fk_327935` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Syllabus_SyllabusElement_id`)
);

-- ---
-- Table 'sqms2_SyllabusElement'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_SyllabusElement`;
		
CREATE TABLE `sqms2_SyllabusElement` (
  `sqms2_SyllabusElement_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_SyllabusElement_titel` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_SyllabusElement_id`)
);

-- ---
-- Table 'sqms2_Text_Text'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Text_Text`;
		
CREATE TABLE `sqms2_Text_Text` (
  `sqms2_Text_Text_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Text_id_fk_508677` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Text_id_fk_899589` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Text_Text_id`)
);

-- ---
-- Table 'sqms2_SyllabusElement_desc'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_SyllabusElement_desc`;
		
CREATE TABLE `sqms2_SyllabusElement_desc` (
  `sqms2_SyllabusElement_desc_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_SyllabusElement_id_fk_886795` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Text_id_fk_524933` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_SyllabusElement_desc_id`)
);

-- ---
-- Table 'sqms2_Topic'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Topic`;
		
CREATE TABLE `sqms2_Topic` (
  `sqms2_Topic_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Topic_title` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Topic_id`)
);

-- ---
-- Table 'sqms2_Syllabus_Topic'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Syllabus_Topic`;
		
CREATE TABLE `sqms2_Syllabus_Topic` (
  `sqms2_Syllabus_Topic_id` BIGINT NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Syllabus_id_fk_345197` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Topic_id_fk_945295` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Syllabus_Topic_id`)
);

-- ---
-- Table 'sqms2_SyllabusElement_Question'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_SyllabusElement_Question`;
		
CREATE TABLE `sqms2_SyllabusElement_Question` (
  `sqms2_SyllabusElement_Question_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_SyllabusElement_id_fk_920241` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Question_id_fk_285826` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_SyllabusElement_Question_id`)
);

-- ---
-- Table 'sqms2_Question'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question`;
		
CREATE TABLE `sqms2_Question` (
  `sqms2_Question_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`sqms2_Question_id`)
);

-- ---
-- Table 'sqms2_Question_Text'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question_Text`;
		
CREATE TABLE `sqms2_Question_Text` (
  `sqms2_Question_Text_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Text_id_fk_559100` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Question_id_fk_783494` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Question_Text_id`)
);

-- ---
-- Table 'sqms2_Question_Answer'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question_Answer`;
		
CREATE TABLE `sqms2_Question_Answer` (
  `sqms2_Question_Answer_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Question_id_fk_735802` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Answer_id_fk_995603` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Question_Answer_id`)
);

-- ---
-- Table 'sqms2_Answer'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Answer`;
		
CREATE TABLE `sqms2_Answer` (
  `sqms2_Answer_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`sqms2_Answer_id`)
);

-- ---
-- Table 'sqms2_Answer_Text'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Answer_Text`;
		
CREATE TABLE `sqms2_Answer_Text` (
  `sqms2_Answer_Text_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Answer_id_fk_154388` INTEGER NULL DEFAULT NULL,
  `sqms2_Text_id_fk_842740` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Answer_Text_id`)
);

-- ---
-- Table 'sqms2_ExamSetVersion'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_ExamSetVersion`;
		
CREATE TABLE `sqms2_ExamSetVersion` (
  `sqms2_ExamSetVersion_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_ExamSetVersion_title` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_ExamSetVersion_id`)
);

-- ---
-- Table 'sqms2_Question_ExamSetVersion'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question_ExamSetVersion`;
		
CREATE TABLE `sqms2_Question_ExamSetVersion` (
  `sqms2_Question_ExamSetVersion_id` BIGINT NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_ExamSetVersion_id_fk_264577` BIGINT(20) NULL DEFAULT NULL,
  `sqms2_Question_id_fk_615560` BIGINT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Question_ExamSetVersion_id`)
);

-- ---
-- Table 'sqms2_Question_ExamSetVersion_Answer'
-- 
-- ---

DROP TABLE IF EXISTS `sqms2_Question_ExamSetVersion_Answer`;
		
CREATE TABLE `sqms2_Question_ExamSetVersion_Answer` (
  `sqms2_Question_ExamSetVersion_Answer_id` BIGINT(20) NULL AUTO_INCREMENT DEFAULT NULL,
  `sqms2_Question_ExamSetVersion_id_fk_186326` BIGINT NULL DEFAULT NULL,
  `sqms2_Answer_id_fk_507266` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`sqms2_Question_ExamSetVersion_Answer_id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `sqms2_Syllabus_desc` ADD FOREIGN KEY (sqms2_Syllabus_id_fk_783731) REFERENCES `sqms2_Syllabus` (`sqms2_Syllabus_id`);
ALTER TABLE `sqms2_Syllabus_desc` ADD FOREIGN KEY (sqms2_Text_id_fk_178796) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Syllabus_SyllabusElement` ADD FOREIGN KEY (sqms2_Syllabus_id_fk_870666) REFERENCES `sqms2_Syllabus` (`sqms2_Syllabus_id`);
ALTER TABLE `sqms2_Syllabus_SyllabusElement` ADD FOREIGN KEY (sqms2_SyllabusElement_id_fk_327935) REFERENCES `sqms2_SyllabusElement` (`sqms2_SyllabusElement_id`);
ALTER TABLE `sqms2_Text_Text` ADD FOREIGN KEY (sqms2_Text_id_fk_508677) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Text_Text` ADD FOREIGN KEY (sqms2_Text_id_fk_899589) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_SyllabusElement_desc` ADD FOREIGN KEY (sqms2_SyllabusElement_id_fk_886795) REFERENCES `sqms2_SyllabusElement` (`sqms2_SyllabusElement_id`);
ALTER TABLE `sqms2_SyllabusElement_desc` ADD FOREIGN KEY (sqms2_Text_id_fk_524933) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Syllabus_Topic` ADD FOREIGN KEY (sqms2_Syllabus_id_fk_345197) REFERENCES `sqms2_Syllabus` (`sqms2_Syllabus_id`);
ALTER TABLE `sqms2_Syllabus_Topic` ADD FOREIGN KEY (sqms2_Topic_id_fk_945295) REFERENCES `sqms2_Topic` (`sqms2_Topic_id`);
ALTER TABLE `sqms2_SyllabusElement_Question` ADD FOREIGN KEY (sqms2_SyllabusElement_id_fk_920241) REFERENCES `sqms2_SyllabusElement` (`sqms2_SyllabusElement_id`);
ALTER TABLE `sqms2_SyllabusElement_Question` ADD FOREIGN KEY (sqms2_Question_id_fk_285826) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_Question_Text` ADD FOREIGN KEY (sqms2_Text_id_fk_559100) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Question_Text` ADD FOREIGN KEY (sqms2_Question_id_fk_783494) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_Question_Answer` ADD FOREIGN KEY (sqms2_Question_id_fk_735802) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_Question_Answer` ADD FOREIGN KEY (sqms2_Answer_id_fk_995603) REFERENCES `sqms2_Answer` (`sqms2_Answer_id`);
ALTER TABLE `sqms2_Answer_Text` ADD FOREIGN KEY (sqms2_Answer_id_fk_154388) REFERENCES `sqms2_Answer` (`sqms2_Answer_id`);
ALTER TABLE `sqms2_Answer_Text` ADD FOREIGN KEY (sqms2_Text_id_fk_842740) REFERENCES `sqms2_text` (`sqms2_Text_id`);
ALTER TABLE `sqms2_Question_ExamSetVersion` ADD FOREIGN KEY (sqms2_ExamSetVersion_id_fk_264577) REFERENCES `sqms2_ExamSetVersion` (`sqms2_ExamSetVersion_id`);
ALTER TABLE `sqms2_Question_ExamSetVersion` ADD FOREIGN KEY (sqms2_Question_id_fk_615560) REFERENCES `sqms2_Question` (`sqms2_Question_id`);
ALTER TABLE `sqms2_Question_ExamSetVersion_Answer` ADD FOREIGN KEY (sqms2_Question_ExamSetVersion_id_fk_186326) REFERENCES `sqms2_Question_ExamSetVersion` (`sqms2_Question_ExamSetVersion_id`);
ALTER TABLE `sqms2_Question_ExamSetVersion_Answer` ADD FOREIGN KEY (sqms2_Answer_id_fk_507266) REFERENCES `sqms2_Answer` (`sqms2_Answer_id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `sqms2_Syllabus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Syllabus_desc` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_text` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Syllabus_SyllabusElement` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_SyllabusElement` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Text_Text` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_SyllabusElement_desc` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Topic` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Syllabus_Topic` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_SyllabusElement_Question` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Question` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Question_Text` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Question_Answer` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Answer` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Answer_Text` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_ExamSetVersion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Question_ExamSetVersion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sqms2_Question_ExamSetVersion_Answer` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `sqms2_Syllabus` (`sqms2_Syllabus_id`,`sqms2_Syllabus_titel`) VALUES
-- ('','');
-- INSERT INTO `sqms2_Syllabus_desc` (`sqms2_Syllabus_desc_id`,`sqms2_Syllabus_id_fk_783731`,`sqms2_Text_id_fk_178796`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_text` (`sqms2_Text_id`,`sqms2_Text`,`sqms2_language_iso_short`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Syllabus_SyllabusElement` (`sqms2_Syllabus_SyllabusElement_id`,`sqms2_Syllabus_id_fk_870666`,`sqms2_SyllabusElement_id_fk_327935`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_SyllabusElement` (`sqms2_SyllabusElement_id`,`sqms2_SyllabusElement_titel`) VALUES
-- ('','');
-- INSERT INTO `sqms2_Text_Text` (`sqms2_Text_Text_id`,`sqms2_Text_id_fk_508677`,`sqms2_Text_id_fk_899589`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_SyllabusElement_desc` (`sqms2_SyllabusElement_desc_id`,`sqms2_SyllabusElement_id_fk_886795`,`sqms2_Text_id_fk_524933`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Topic` (`sqms2_Topic_id`,`sqms2_Topic_title`) VALUES
-- ('','');
-- INSERT INTO `sqms2_Syllabus_Topic` (`sqms2_Syllabus_Topic_id`,`sqms2_Syllabus_id_fk_345197`,`sqms2_Topic_id_fk_945295`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_SyllabusElement_Question` (`sqms2_SyllabusElement_Question_id`,`sqms2_SyllabusElement_id_fk_920241`,`sqms2_Question_id_fk_285826`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Question` (`sqms2_Question_id`) VALUES
-- ('');
-- INSERT INTO `sqms2_Question_Text` (`sqms2_Question_Text_id`,`sqms2_Text_id_fk_559100`,`sqms2_Question_id_fk_783494`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Question_Answer` (`sqms2_Question_Answer_id`,`sqms2_Question_id_fk_735802`,`sqms2_Answer_id_fk_995603`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Answer` (`sqms2_Answer_id`) VALUES
-- ('');
-- INSERT INTO `sqms2_Answer_Text` (`sqms2_Answer_Text_id`,`sqms2_Answer_id_fk_154388`,`sqms2_Text_id_fk_842740`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_ExamSetVersion` (`sqms2_ExamSetVersion_id`,`sqms2_ExamSetVersion_title`) VALUES
-- ('','');
-- INSERT INTO `sqms2_Question_ExamSetVersion` (`sqms2_Question_ExamSetVersion_id`,`sqms2_ExamSetVersion_id_fk_264577`,`sqms2_Question_id_fk_615560`) VALUES
-- ('','','');
-- INSERT INTO `sqms2_Question_ExamSetVersion_Answer` (`sqms2_Question_ExamSetVersion_Answer_id`,`sqms2_Question_ExamSetVersion_id_fk_186326`,`sqms2_Answer_id_fk_507266`) VALUES
-- ('','','');