
CREATE DATABASE hospital_mgmt_sys;
use hospital_mgmt_sys;

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
  CONSTRAINT FK_docid1 FOREIGN KEY (Doctor_id) REFERENCES hospital_doctor (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_patientid1 FOREIGN KEY (Patient_id) REFERENCES hospital_patient (id) ON DELETE CASCADE ON UPDATE CASCADE
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

SELECT * FROM hospital_patient;


INSERT INTO hospital_appointment VALUES("1",STR_TO_DATE('April 12, 2022','%M %d,%Y'),'16:01:00', "1","1");
INSERT INTO hospital_appointment VALUES("2",STR_TO_DATE('April 13, 2022','%M %d,%Y'),"09:40:00","2","3");
INSERT INTO hospital_appointment VALUES("3",STR_TO_DATE('April 21, 2022','%M %d,%Y'),"12:30:00","3","7");
INSERT INTO hospital_appointment VALUES("4",STR_TO_DATE('April 22, 2022','%M %d,%Y'),"13:45:00","4","11");
INSERT INTO hospital_appointment VALUES("5",STR_TO_DATE('April 18, 2022','%M %d,%Y'),"18:00:00","5","9");
INSERT INTO hospital_appointment VALUES("6",STR_TO_DATE('April 16, 2022','%M %d,%Y'),"16:15:00","6","6");
INSERT INTO hospital_appointment VALUES("7",STR_TO_DATE('April 18, 2022','%M %d,%Y'),"11:00:00","7","4");

SELECT * FROM hospital_appointment;


CREATE VIEW view_appointment AS
SELECT hospital_appointment.id, hospital_doctor.Name as DoctorName, hospital_patient.name as PatientName, hospital_appointment.date, hospital_appointment.time
FROM hospital_appointment
LEFT JOIN hospital_doctor ON hospital_appointment.id = hospital_doctor.id
LEFT JOIN hospital_patient ON hospital_appointment.id = hospital_patient.id;

SELECT * FROM view_appointment;

DELETE FROM hospital_patient WHERE id = 10;

/*
Drop view view_appointment;
Drop table hospital_doctor;
Drop table hospital_patient;
Drop table hospital_appointment;
/*Show tables;
/*Drop database hospital_mgmt_sys;*/

