CREATE TABLE department(
department_id BIGSERIAL PRIMARY key,
department_name VARCHAR(100) not null,
created_at TIMESTAMP Default CURRENT_TIMESTAMP);
