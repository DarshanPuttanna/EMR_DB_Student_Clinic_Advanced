select * FROM medicene;

select * FROM appointments
WHERE doctor_id='1';

select * FROM doctor_schedule
WHERE doctor_id=2;
SELECT * FROM doctor
WHERE doctor_id=2;

UPDATE doctor
SET contact_number='9013368648'
WHERE doctor_id=2;

select * FROM checkup
WHERE visitor_id='3';


insert into checkup values (11,11,'Body Pain','1','4','Fever','take mentioned medicenes')


SELECT * FROM appointmentdeatils_view
WHERE doctor_id=1;

SELECT * FROM doctor_view 
WHERE doctor_id=1;


-- Trigger 2 and Audit-insert
UPDATE doctor
SET doctor_id='9013368648'
WHERE doctor_id=1;

-- Trigger 4 and Audit- insert
insert into checkup values (12,12,'Body Pain','1','4','Fever','take mentioned medicenes')

