CREATE TABLE employee (

employee_id BIGSERIAL PRIMARY KEY, 
employee name VARCHAR(100) NOT NULL, 
email VARCHAR(255), 
department id BIGINT REFERENCES department(department_id), 
created at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
