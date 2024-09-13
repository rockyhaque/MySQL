CREATE DATABASE payrollAndHrManagement;

USE payrollAndHrManagement;

-- Regions Table

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
);

INSERT INTO regions (region_id, region_name) VALUES 
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia');

SELECT * FROM regions;


-- Countries Table

CREATE TABLE countries (
	country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40) NOT NULL,
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

INSERT INTO countries (country_id, country_name, region_id) VALUES 
('US', 'United States', 1),
('CA', 'Canada', 1),
('FR', 'France', 2),
('DE', 'Germany', 2),
('BD', 'Bangladesh', 3),  
('IN', 'India', 3);   

DESCRIBE countries;

SELECT * FROM countries;

-- Locations Table

CREATE TABLE locations (
	location_id INT PRIMARY KEY,
    street_address VARCHAR(100),
    postal_code VARCHAR(20),
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(50),
    country_id CHAR(2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES 
(1000, '123 Maple Street', '12345', 'New York', 'NY', 'US'),
(1100, '456 Elm Street', '54321', 'Los Angeles', 'CA', 'US'),
(2000, '789 Oak Street', '67890', 'Paris', 'Ile-de-France', 'FR'),
(3000, '321 Pine Street', '09876', 'Berlin', 'Berlin', 'DE'),
(4000, '123 Dhaka Street', '1000', 'Dhaka', 'Dhaka', 'BD'),         
(4100, '456 Chittagong Road', '4000', 'Chittagong', 'Chittagong', 'BD'), 
(5000, '789 Mumbai Lane', '400001', 'Mumbai', 'Maharashtra', 'IN'),  
(5100, '321 Delhi Avenue', '110001', 'New Delhi', 'Delhi', 'IN');  

SELECT * FROM locations;

-- Departments Table

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

INSERT INTO departments (department_id, department_name, location_id) VALUES 
(10, 'Administration', 1000),
(20, 'Marketing', 1100),
(30, 'IT', 2000),
(40, 'Sales', 3000);

SELECT * FROM departments;

-- Jobs Table

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL,
    min_salary INT,
    max_salary INT
);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
(1, 'President', 20000, 40000),
(2, 'Marketing Manager', 10000, 20000),
(3, 'IT Manager', 9000, 18000),
(4, 'Sales Representative', 6000, 12000),
(5, 'HR Manager', 8000, 16000);

SELECT * FROM jobs;


-- Employees Table

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

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES 
(100, 'Rocky', 'Haque', 'rockyhaque99@gmail.com', '+8801742460399', '2023-01-10', 1, 25000.00, NULL, 10),
(101, 'Rakib', 'Hossain', 'rakib.hossain@gmail.com', '+8801772460398', '2023-02-20', 2, 15000.00, 100, 20),
(102, 'Siam', 'Khan', 'siam.khan@gmail.com', '+8801942887399', '2023-03-15', 3, 14000.00, 100, 30),
(103, 'Jafar', 'Ahmed', 'jafarahmed@gmail.com', '+8801442450320', '2023-04-25', 4, 8000.00, 101, 40);

SELECT * FROM employees;


-- Job History Table

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

INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id) VALUES 
(101, '2022-01-01', '2023-02-19', 4, 40),
(102, '2021-05-01', '2023-03-14', 2, 20);

SELECT * FROM job_history;

SHOW TABLES;

SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM jobs;
SELECT * FROM locations;
SELECT * FROM regions;


-- i.Single Row Function

SELECT UPPER(first_name), LOWER(last_name) FROM employees WHERE employee_id = 100;


-- ii. Multiple Row Function:

SELECT AVG(salary), MAX(salary), MIN(salary) FROM employees WHERE department_id = 10;


-- iii. View:

CREATE VIEW employee_details AS
SELECT e.first_name, e.last_name, j.job_title, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id;


-- iv. Creating a benefits Table with Auto-Increment

CREATE TABLE benefits(
	benefit_id INT AUTO_INCREMENT PRIMARY KEY,
    benefit_name VARCHAR(100) NOT NULL,
    benefit_description TEXT,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO benefits(benefit_name, benefit_description, employee_id) VALUES
('Health Insurance','Retirement Plan', 100),
('Retirement Plan', 'Employer-matched retirement savings plan', 101),
('Paid Vacation', 'Two weeks paid vacation annually', 102);

SELECT * FROM benefits;

-- Showing Final Table (8)

SHOW TABLES;


-- 1. Simple Query: Get Employees with Specific Jobs

SELECT e.first_name, e.last_name, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title = "IT Manager";


-- 2. Subquery: Find Employees Earning Above Average Salary

SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);



-- 3. Subquery: Find Departments with More Than 2 Employee

-- NOTE: To show employee count check out 10 no query

-- Adding more employees to department 10 (Administration)
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES 
(104, 'Rafid', 'Ahmed', 'rafid@gmail.com', '+8801542450320', '2023-05-10', 2, 16000.00, 100, 10),
(105, 'Jamal', 'Mia', 'jamal@gmail.com', '+8801842650399', '2023-06-10', 3, 18000.00, 100, 10);

-- Adding more employees to department 30 (IT)
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES 
(106, 'Charly', 'Davis', 'charlie.davis@gmail.com', '+8801542450325', '2023-05-18', 3, 14000.00, 102, 30);


SELECT department_name
FROM departments
WHERE department_id IN (
	SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 2
);


-- 4. Join with Subquery: Employees with Benefits

SELECT e.first_name, e.last_name, b.benefit_name, b.benefit_description
FROM employees e
JOIN benefits b ON e.employee_id = b.employee_id;


-- 5. Subquery: Find the Highest Paid Employee in Each Department

SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE salary = (
	SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);


-- 6. Subquery with Aggregation: Average Salary by Department

-- NOTE: Find the average salary of employees in each department and list departments with an average salary higher than 15,000.


SELECT department_name, AVG(salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY department_name
HAVING AVG(salary) > 15000;


-- 7. Subquery: Find the Number of Employees in Each Department

-- NOTE: Find employees who have not been assigned any benefits.

SELECT department_name, (
		SELECT COUNT(*)
		FROM employees e
		WHERE e.department_id = d.department_id
    ) AS employee_count
FROM departments d;


-- 8. Subquery: Find Employees Who Joined Recently

-- NOTE: List the employees who were hired in the last 6 months.

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES 
(107, 'Rayan', 'Fakir', 'rayan@gmail.com', '+880142460379', '2024-03-10', 1, 25000.00, NULL, 10),
(108, 'Prince', 'Mahmud', 'prince@gmail.com', '+8801772260100', '2024-06-15', 2, 15000.00, 100, 20);


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (SELECT DATE_SUB(CURDATE(), INTERVAL 6 MONTH));

SELECT * FROM employees;


-- 9. LEFT JOIN

SELECT * FROM employees;
SELECT * FROM departments;

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;


-- 10. RIGHT JOIN

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;


-- 11. Find Employees with the Highest Salary

SELECT first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);


-- 12. Find Employees Earning More Than the Average Salary

SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


-- 13. Group Employees by Salary Range

SELECT 
  CASE 
    WHEN salary < 10000 THEN 'Below 10K'
    WHEN salary BETWEEN 10000 AND 20000 THEN '10K-20K'
    WHEN salary > 20000 THEN 'Above 20K'
  END AS salary_range,
  COUNT(*) AS employee_count
FROM employees
GROUP BY salary_range;


-- 14. Top 3 Highest Paid Employees

SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;



-- 15. Find the Maximum and Minimum Salaries

SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary
FROM employees;





