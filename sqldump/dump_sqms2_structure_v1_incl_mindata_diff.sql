 ALTER TABLE `bpmspace_sqms2_v1`.`sqms2_question_text` 
CHANGE COLUMN `sqms2_Question_id_fk_783494` `sqms2_Question_id_fk_783494` BIGINT(20) NULL DEFAULT NULL AFTER `sqms2_Question_Text_id`;

ALTER TABLE `bpmspace_sqms2_v1`.`sqms2_question` 
AUTO_INCREMENT = 85647689 ;

ALTER TABLE `bpmspace_sqms2_v1`.`sqms2_syllabuselement_question` 
AUTO_INCREMENT = 19344784 ;
