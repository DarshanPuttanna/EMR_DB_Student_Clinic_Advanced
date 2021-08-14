DROP VIEW IF EXISTS appointmentdetails_view;

CREATE VIEW appointmentdetails_view AS
SELECT a.appointment_id, a.patient_id, a.appointment_time, concat(p.first_name,' ',p.last_name) AS "Patient_name",
concat(d.first_name,' ',d.last_name) AS "Doctor_name" from appointments a
INNER JOIN patients p
ON a.patient_id=p.PATIENT_ID
INNER JOIN doctors d
ON d.doctor_id=a.doctor_id;

SELECT * FROM appointmentdetails_view;


DROP VIEW IF EXISTS employee_view;
CREATE VIEW employee_view AS
SELECT doctor_id, concat(first_name,' ',last_name),contact_number, email_id, specialization
FROM doctors;

SELECT * FROM employee_view;

DROP VIEW IF EXISTS stock_remaining_view;

CREATE VIEW stock_remaining_view AS
select medicene.medicene_name, inventory.stock_remaining
 from medicene inner join inventory 
 on medicene.medicene_id=inventory.medicine_id;
 
 select * from stock_remaining_view;
 
 DROP VIEW IF EXISTS patient_checkup_view;

CREATE VIEW patient_checkup_view AS
 select CONCAT( p.first_name,' ', p.last_name) as Patient_Name,
concat(d.first_name,' ',d.last_name) as Doctor_Name,
pr.procedure_name as Procedure_Done
FROM
  visitors_info v join appointments a on v.appointment_id= a.appointment_id
  join patients p on p.patient_id=a.patient_id
  join doctors  d on d.doctor_id=a.doctor_id 
  join checkup  c on c.visitor_id=v.visitor_id
  join procedure_list  pr on pr.procedure_id=c.procedure_id;

Select * from patient_checkup_view;




DROP VIEW IF EXISTS billing_details_view;

CREATE VIEW billing_details_view AS
select total_bill, concat (a.patient_fname, " ", a.patient_lname ) as patient_name
 from billing_info b
inner join visitors_info v on b.visitor_id=v.visitor_id
inner join appointments a on v.appointment_id = a.appointment_id;

select * from billing_details_view;

