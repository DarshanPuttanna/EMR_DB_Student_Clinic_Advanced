 DROP TABLE IF EXISTS audit_trail_medicine;
CREATE TABLE audit_trail_medicine (
	id int primary key AUTO_INCREMENT,
     medicene_name VARCHAR(100),
     amount VARCHAR(100),
     timestamp datetime
);


DROP TABLE IF EXISTS audit_trail_doctor;
CREATE TABLE audit_trail_doctor (
	id int primary key AUTO_INCREMENT,
     old_data VARCHAR(100),
     new_data VARCHAR(100),
     tbl_name VARCHAR(100),
     timestamp datetime

);


DROP TABLE IF EXISTS audit_trail_appointments;
CREATE TABLE audit_trail_appointments (
	id int primary key AUTO_INCREMENT,

     appointment_id VARCHAR(100),
     patient_description VARCHAR(100),
     timestamp datetime
);

DROP TABLE IF EXISTS audit_trail_checkup;
CREATE TABLE audit_trail_checkup (
	 id int primary key AUTO_INCREMENT,
     visitor_id VARCHAR(100),
     symptoms_description VARCHAR(100),
     result VARCHAR(100),
     timestamp datetime
);

DROP TABLE IF EXISTS audit_trail_billing;
CREATE TABLE audit_trail_billing (
	 id int primary key AUTO_INCREMENT,
     visitor_id VARCHAR(50),
     total_bill VARCHAR(100),
     timestamp datetime
);


