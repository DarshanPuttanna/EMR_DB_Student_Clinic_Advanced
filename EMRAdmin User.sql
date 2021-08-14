// some of the queries that is supported by USC_Admin

SELECT *  FROM billing_info ;
SELECT * FROM doctor;
SELECT * FROM medicene;
SELECT * FROM visitors_info  ;
SELECT * FROM appointmentdetails_view ;
SELECT * FROM employee_view ;
SELECT * FROM patient_checkup_view;
SELECT * FROM billing_details_view;

insert into appointments values (14,10,'Joe','Bill','2021-04-05 12:30:00',2,'Root Canal');
select * from appointments;

//trigger that shows the changes done in the appointments table
select * from audit_trail_appointments;

SELECT * FROM inventory;

Update inventory
set stock_remaining = '100'
where medicine_id = '1003'

SELECT * FROM inventory;
