CREATE DATABASE payrollAndHrManagement;

USE payrollAndHrManagement;

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
);

CREATE TABLE countries (
	country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40) NOT NULL,
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

DROP TABLE IF EXISTS countries;
ALTER TABLE locations DROP FOREIGN KEY locations_ibfk_1;
DROP TABLE IF EXISTS countries;



CREATE TABLE locations (
	location_id INT PRIMARY KEY,
    street_address VARCHAR(100),
    postal_code VARCHAR(20),
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(50),
    country_id CHAR(2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL,
    min_salary DECIMAL(8,2),
    max_salary DECIMAL(8,2)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id INT,
    salary DECIMAL(8,2) NOT NULL,
    manager_id INT,
    department_id INT,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE job_history (
    employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id INT,
    department_id INT,
    PRIMARY KEY (employee_id, start_date),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


SHOW TABLES;


INSERT INTO regions (region_id, region_name) VALUES 
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia');

INSERT INTO countries (country_id, country_name, region_id) VALUES 
('US', 'United States', 1),
('CA', 'Canada', 1),
('FR', 'France', 2),
('DE', 'Germany', 2),
('BD', 'Bangladesh', 3),  
('IN', 'India', 3);   

DESCRIBE countries;
 

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES 
(1000, '123 Maple Street', '12345', 'New York', 'NY', 'US'),
(1100, '456 Elm Street', '54321', 'Los Angeles', 'CA', 'US'),
(2000, '789 Oak Street', '67890', 'Paris', 'Ile-de-France', 'FR'),
(3000, '321 Pine Street', '09876', 'Berlin', 'Berlin', 'DE'),
(4000, '123 Dhaka Street', '1000', 'Dhaka', 'Dhaka', 'BD'),         
(4100, '456 Chittagong Road', '4000', 'Chittagong', 'Chittagong', 'BD'), 
(5000, '789 Mumbai Lane', '400001', 'Mumbai', 'Maharashtra', 'IN'),  
(5100, '321 Delhi Avenue', '110001', 'New Delhi', 'Delhi', 'IN');  

INSERT INTO departments (department_id, department_name, location_id) VALUES 
(10, 'Administration', 1000),
(20, 'Marketing', 1100),
(30, 'IT', 2000),
(40, 'Sales', 3000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES 
(1, 'President', 20000, 40000),
(2, 'Marketing Manager', 10000, 20000),
(3, 'IT Manager', 9000, 18000),
(4, 'Sales Representative', 6000, 12000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES 
(5, 'President', 20000, 40000),
(6, 'Marketing Manager', 10000, 20000),
(7, 'IT Manager', 9000, 18000),
(8, 'Sales Representative', 6000, 12000);


SELECT * FROM jobs WHERE job_id = 1;


INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES 
(100, 'Rocky', 'Haque', 'rockyhaque99@gmail.com', '+8801742460399', '2023-01-10', 1, 25000.00, NULL, 10),
(101, 'Rakib', 'Hossain', 'rakib.hossain@gmail.com', '+8801772460398', '2023-02-20', 2, 15000.00, 100, 20),
(102, 'Siam', 'Khan', 'siam.khan@gmail.com', '+8801942887399', '2023-03-15', 3, 14000.00, 100, 30),
(103, 'Jafar', 'Ahmed', 'jafarahmed@gmail.com', '+8801442450320', '2023-04-25', 4, 8000.00, 101, 40);

INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id) VALUES 
(101, '2022-01-01', '2023-02-19', 4, 40),
(102, '2021-05-01', '2023-03-14', 2, 20);


SHOW TABLES;

SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM jobs;
SELECT * FROM locations;
SELECT * FROM regions;


-- 1.Single Row Function

SELECT UPPER(first_name), LOWER(last_name) FROM employees WHERE employee_id = 100;

-- 2. Multiple Row Function:

SELECT AVG(salary), MAX(salary), MIN(salary) FROM employees WHERE department_id = 10;

-- 3. Join:

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;







