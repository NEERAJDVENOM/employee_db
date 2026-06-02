CREATE TABLE employee (
    employee_id BIGSERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    department_id BIGINT REFERENCES department(department_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
