
DROP PROCEDURE IF EXISTS insertPatientDetails;
DELIMITER //;
Create PROCEDURE insertPatientDetails( 
						first_name_param VARCHAR(45), 
                        last_name_param VARCHAR(45),
                        gender_param varchar(45),
						contact_number_param VARCHAR(45),
						email_id_param VARCHAR(255),
                        address_param varchar (255),
                        social_security_number_param varchar (255),
                        emergency_contact_name_param varchar(50),
                        emergency_contact_number_param varchar(50),
                        insurance_number_param varchar(50),
                        insurance_company_id varchar(50)
						)
BEGIN
DECLARE s VARCHAR(20) ;
IF exists (select patient_id from patients p where p.email_id = email_id_param)
THEN SET s = 'User already exists';
SIGNAL SQLSTATE '22003' SET message_text=s, mysql_errno=1264;
else
Insert into patients (patient_id,first_name, last_name, gender, email_id, contact_number)
values(DEFAULT,first_name_param, last_name_param, gender_param, email_id_param,contact_number_param) ;
set @patient_id = LAST_INSERT_ID();
Insert into patient_information (patient_id, address, social_security_number,emergencycontact_name, emergency_contact_number, insurance_number, insurance_company_id)
values(@patient_id, address_param, social_security_number_param, emergency_contact_name_param,emergency_contact_number_param, insurance_number_param, insurance_company_id) ;
end if;
END;


CAll insertPatientDetails ('Mill','Biden','Male','(179) 555-9375' ,'mbiden@gmail.com','9543 UTD APT H, Charlotte, North Carolina, US, 28262','224466','Albert','(811) 555-1205','test12388456','1');


select * from patients;
select * from patient_information;



## procedure to update procedure list

DROP PROCEDURE IF EXISTS procedure_name_change;
DELIMITER //
CREATE PROCEDURE procedure_name_change (
proc_id_var int,
proc_status_var varchar(50)
)
BEGIN
DECLARE sql_error tinytext DEFAULT FALSE;
declare proc_name_var varchar(50);
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION

START TRANSACTION;
select procedure_name into proc_name_var from procedure_list where procedure_id=proc_id_var;
UPDATE procedure_details
SET procedure_name = proc_status_var
WHERE procedure_id = proc_id_var;

IF sql_error = FALSE THEN
COMMIT;
SELECT CONCAT('Procedure  ',proc_name_var, '  name changed to   ',proc_status_var );

ELSE
ROLLBACK;
select ('Procedure name is not updated as error occured' );
END IF;
END//
DELIMITER ;

select * from procedure_list;
call procedure_name_change(7,'Tooth Fillings');


#### book appointments


drop procedure if exists book_appointment;
 DELIMITER //;
Create PROCEDURE book_appointment(patient_id_param int,
                        patient_fname_param varchar(30),
                        patient_lname_param varchar(30),
                       appointment_time_param datetime,
                       doctor_id_param int,
                       patient_desc_param varchar(50))
 BEGIN
DECLARE s VARCHAR(40);
 IF exists (select appointment_id from appointments a where a.appointment_time=appointment_time_param )
THEN SET s = 'Appointment already exists';
SIGNAL SQLSTATE '22003' SET message_text=s, mysql_errno=1264;
else
Insert into appointments values(DEFAULT,patient_id_param,patient_fname_param, patient_lname_param, appointment_time_param, doctor_id_param,patient_desc_param ) ;
end if;
END;

 CALL book_appointment('6','Dirk','Nannes',"10:00:00","4",'Body Pain');
 
 
 select * from appointments;
 
 ##calculate billing details
 drop procedure if exists calculatebillingdetails;
DELIMITER //
create procedure calculatebillingdetails( visitor_id_param int )
begin
select total_bill, concat (a.patient_fname, " ", a.patient_lname ) as patient_name
 from billing_info b
inner join visitors_info v on b.visitor_id=v.visitor_id
inner join appointments a on v.appointment_id = a.appointment_id
where v.visitor_id=visitor_id_param;
end;

call calculatebillingdetails('2');


#### Retriving patients doctor details using visitor_id

drop procedure if exists employee_doctor_info;
DELIMITER //
create procedure employee_doctor_info(visitor_id_param int)
begin
select CONCAT( p.first_name,' ', p.last_name) as Patient_Name,
concat(d.first_name,' ',d.last_name) as Doctor_Name,
pr.procedure_name as Procedure_Done
FROM
  visitors_info v join appointments a on v.appointment_id= a.appointment_id
  join patients p on p.patient_id=a.patient_id
  join doctors  d on d.doctor_id=a.doctor_id 
  join checkup  c on c.visitor_id=v.visitor_id
  join procedure_list  pr on pr.procedure_id=c.procedure_id
  where v.visitor_id=visitor_id_param;
end;

call employee_doctor_info(2);


## deleting appointments

drop procedure if exists delete_appointments;
DELIMITER //
create procedure delete_appointments ( appointment_id_param int)
begin
delete  from appointments where appointment_id = appointment_id_param ;
end;

call delete_appointments('13');
select * from appointments;


## update employee details
drop procedure if exists updateEmployeeDetails;
DELIMITER //
create procedure updateEmployeeDetails(doctor_id_param int, contact_number_param varchar(45) , email_param varchar(255), specialization_param varchar(255) )
begin
update doctors set contact_number = contact_number_param, email_id = email_param , specialization = specialization_param 
where doctor_id= doctor_id_param;
end;

CALL updateEmployeeDetails(6, "(998) 988-7655" , "jtrott@gmail.com", "Neurologist");

select * from doctors

### get appointmentDetails By PatientId

drop procedure if exists get_appointmentDetailsByPatientId;
DELIMITER //
create procedure get_appointmentDetailsByPatientId ( patient_id_param int)
begin
select * from appointmentdetails_view where patient_id = patient_id_param ;
end;

select * from appointmentdetails_view;