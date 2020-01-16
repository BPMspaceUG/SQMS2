CREATE DATABASE bpmspace_sqms2_v1;
CREATE USER 'bpmspace_sqms2_v1'@'localhost' IDENTIFIED BY 'password';
GRANT CREATE, INSERT , SELECT , UPDATE ON bpmspace_sqms2_v1.* TO 'bpmspace_sqms2_v1'@'localhost';
FLUSH PRIVILEGES;
USE bpmspace_sqms2_v1;
