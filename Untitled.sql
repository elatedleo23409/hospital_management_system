# Table, Create Table

CREATE DATABASE test_proj;
use test_proj;

CREATE TABLE hospital_doctor (
  id BIGINT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL,
  mobile INT NOT NULL,
  special VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);
DESCRIBE hospital_doctor;
SELECT * FROM hospital_doctor;


CREATE TABLE hospital_patient (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  mobile INT DEFAULT NULL,
  address LONGTEXT NOT NULL,
  PRIMARY KEY (id)
);
DESCRIBE hospital_patient;
SELECT * FROM hospital_patient;


CREATE TABLE hospital_appointment (
  id BIGINT NOT NULL AUTO_INCREMENT,
  date DATE NOT NULL,
  time TIME(6) NOT NULL,
  Doctor_id BIGINT NOT NULL,
  Patient_id BIGINT NOT NULL,
  PRIMARY KEY (id),
  KEY K_docid1 (Doctor_id),
  KEY K_patientid1 (Patient_id),
  CONSTRAINT FK_docid1 FOREIGN KEY (Doctor_id) REFERENCES hospital_doctor (id),
  CONSTRAINT FK_patientid1 FOREIGN KEY (Patient_id) REFERENCES hospital_patient (id)
);
DESCRIBE hospital_appointment;
SELECT * FROM hospital_appointment;


INSERT INTO hospital_doctor VALUES("1","Aryan Desai","86366603","Heart");
INSERT INTO hospital_doctor VALUES("2","Ramakant Talankar","88888888","Blood");
INSERT INTO hospital_doctor VALUES("3","Murliprasad Sharma","77777777","Brain");
INSERT INTO hospital_doctor VALUES("4","Suman Asthana","66666666","Heart");
INSERT INTO hospital_doctor VALUES("5","J.C. Asthana","55555555","Psychiatrist");
INSERT INTO hospital_doctor VALUES("6","Rustom Pavri","44444444","Spine");
INSERT INTO hospital_doctor VALUES("7","Vikram Singh","32232323","Joints");

SELECT * FROM hospital_doctor;


INSERT INTO hospital_patient VALUES("1","Aryan Barapatre","Male","91249749","Ram 2119");
INSERT INTO hospital_patient VALUES("2","Dhiren Hajare","Male","655656565","Ram 2119");
INSERT INTO hospital_patient VALUES("3","Chinmay Anand","Male","65643744","Ram 2120");
INSERT INTO hospital_patient VALUES("4","Raunak Bhalla","Male","78787234","Ram 2120");
INSERT INTO hospital_patient VALUES("5","Rushikesh Deotale","Male","94343423","Ram 2121");
INSERT INTO hospital_patient VALUES("6","Jash Naik","Male","81400851","Ram 2122");
INSERT INTO hospital_patient VALUES("7","Taresh Bansal","Male","76987691","Ram 2123");
INSERT INTO hospital_patient VALUES("8","Pulkit Gahlawat","Male","46324451","Ram 2123");
INSERT INTO hospital_patient VALUES("9","Ojas Sultanpure","Male","87786787","Ram 4139");
INSERT INTO hospital_patient VALUES("11","Rajeshwari Chauhan","Female","29492792","Meera Bhawan");
INSERT INTO hospital_patient VALUES("12","Anika Chhabra","Female","29292720","Meera Bhawan");
INSERT INTO hospital_patient VALUES("13","Pallika Khosla","Female","29729712","Meera Bhawan");

SELECT * FROM hospital_appointment;


INSERT INTO hospital_appointment VALUES();




use birla_hms;
show tables;

describe hospital_patient;
describe hospital_doctor;
describe hospital_appointment;
select * from hospital_patient;
select * from hospital_appointment;

show create table hospital_appointment;

INSERT INTO hospital_patient VALUES("14","Rohan","Male","62622626","Buddh 4139");

INSERT INTO hospital_appointment VALUES("8",STR_TO_DATE('April 15, 2022','%M %d,%Y'),'17:00:00', "1","3");


