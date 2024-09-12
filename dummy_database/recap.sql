/* 
Employees Table has the following columns: 
  employee_id
  first_name
  last_name
  email
  phone_number
  hire_date
  job_id
  salary

Ans the following questions according to this.

1. Create the employee table without constraints
2. Create the employee table with proper constraints
3. Show all of employee table
4. Show the first names and salaries of employee who has last name “king”
5. Show the first names and last names of the employees who has salary greater than 2000
6. Show the employee names and salaries who earns more than average salary.
7. Group the employees using job id and show the average and max salary of each job id.
8. Sort the employee table ascending order according to salary and show 5th to 10th rows
9. Count the employees and total salary
10. Draw an ERD of the HR database
*/ 

USE phitron;

DROP TABLE employees;

/* 1. Create the employee table without constraints*/
CREATE TABLE employees (
  employee_id INT,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  email VARCHAR(30),
  phone_number VARCHAR(30),
  hire_date DATE,
  job_id VARCHAR(30),
  salary INT
);

/* 2. Create the employee table with proper constraints */
CREATE TABLE employees (
  employee_id INT NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  email VARCHAR(30),
  phone_number VARCHAR(30),
  hire_date DATE,
  job_id VARCHAR(30) NOT NULL,
  salary INT NOT NULL,
  PRIMARY KEY (employee_id),
  UNIQUE (email)
);

/* 3. Show all of employee table*/
SELECT * FROM employees;

/* 4. Show the first names and salaries of employee who has last name “king”*/
SELECT first_name, salary
FROM employees
WHERE last_name = 'King';

/* 5. Show the first names and last names of the employees who has salary greater than 2000
*/
SELECT first_name, last_name
FROM employees
WHERE salary > 2000;

/* 6. Show the employee names and salaries who earns more than average salary. */
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

/* 7. Group the employees using job id and show the average and max salary of each job id.*/
SELECT job_id, AVG(salary) AS average_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id;

/* 8. Sort the employee table ascending order according to salary and show 5th to 10th rows */
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 5, 5;

/* 9. Count the employees and total salary*/
SELECT COUNT(*) AS total_employees, SUM(salary) AS total_salary
FROM employees;

/* 10. Draw an ERD of the HR database */
entity employees {
  id: integer PK
  first_name: string
  last_name: string
  email: string
  phone_number: string
  hire_date: date
  job_id: string
  salary: integer
}

entity departments {
  id: integer PK
  department_name: string
  manager_id: integer FK references employees(id)
}

entity jobs {
  id: integer PK
  job_title: string
  description: string
}

relationship "1-to-1" {
  employees {
    department_id: integer
  }
  departments {
    id: integer
  }
}

relationship "1-to-many" {
  employees {
    job_id: integer
  }
  jobs {
    id: integer
  }
}






