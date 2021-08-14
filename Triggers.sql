#Trigger 1 and audit-update

DELIMITER //
DROP TRIGGER IF EXISTS UPDATE_MEDICINE_AMOUNT;
DELIMITER //
CREATE TRIGGER UPDATE_MEDICINE_AMOUNT
AFTER UPDATE ON MEDICENE
FOR EACH ROW
BEGIN	
INSERT INTO audit_trail_medicine VALUES (DEFAULT, NEW.medicene_name, NEW.amount, now() );
END;

# Trigger 2 and audit-update


DELIMITER //
DROP TRIGGER IF EXISTS UPDATE_doctor;
DELIMITER //
CREATE TRIGGER UPDATE_doctor
BEFORE UPDATE ON doctors
FOR EACH ROW
BEGIN	
INSERT INTO audit_trail_doctor VALUES (DEFAULT, OLD.contact_number, NEW.contact_number, "doctor", now() );
END;


## Trigger 3 and audit-insert

DELIMITER //
DROP TRIGGER IF EXISTS insert_appointments;
DELIMITER //
CREATE TRIGGER insert_appointments
AFTER INSERT ON appointments
FOR EACH ROW
BEGIN	
INSERT INTO audit_trail_appointments VALUES (DEFAULT, NEW.appointment_id, NEW.patient_description, now() );
END;		


##Trigger 4: Visit Information

DELIMITER //
DROP TRIGGER IF EXISTS insert_visitinformation;
DELIMITER //
CREATE TRIGGER insert_visitinformation
AFTER INSERT ON checkup
FOR EACH ROW
BEGIN	
INSERT INTO visit_information VALUES (DEFAULT, NEW.visitor_id, New.symptoms_desc, NEW.result, now() );
END;

select * from checkUp;

select * from visitors_info;



##Trigger 5: Billing details
	
DELIMITER //
DROP TRIGGER IF EXISTS insert_billing_details;
DELIMITER //
CREATE TRIGGER insert_billing_details
AFTER INSERT ON billing_info
FOR EACH ROW
BEGIN	
INSERT INTO audit_trail_billing VALUES (DEFAULT, NEW.visitor_id, New.total_bill);
END;
	

select * from audit_trail_billing;




##Trigger 6 and audit-delete

DELIMITER //
DROP TRIGGER IF EXISTS delete_appointments;
DELIMITER //
CREATE TRIGGER delete_appointments
AFTER DELETE ON appointments
FOR EACH ROW
BEGIN	
INSERT INTO audit_trail_appointments VALUES (DEFAULT, NEW.appointment_id, NEW.patient_description, now() );
END;		









