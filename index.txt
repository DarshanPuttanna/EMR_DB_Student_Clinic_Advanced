CREATE INDEX idx_medicene_name
ON medicene (medicene_name);

select medicene_name from medicene;

CREATE INDEX idx_stock_remaining
ON inventory (stock_remaining);

select stock_remaining from inventory;

CREATE INDEX idx_insurrance_plan
ON insurance_company (insurance_plan);


select insurance_plan from insurance_company;


CREATE INDEX idx_symptoms_desc
ON checkup (symptoms_desc);

select symptoms_desc from checkup;


CREATE INDEX idx_visited_time
ON visitors_info(visited_time);

select visited_time from visitors_info;