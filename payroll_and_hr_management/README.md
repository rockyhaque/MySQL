# Payroll and HR Management System

<img src="https://i.ibb.co.com/37qnDCB/database-management.png" align="right" width="110" height="110" />

![GitHub repo size](https://img.shields.io/github/repo-size/rockyhaque/MySQL)
![GitHub stars](https://img.shields.io/github/stars/rockyhaque/MySQL?style=social)
![GitHub forks](https://img.shields.io/github/forks/rockyhaque/rockyhaque?style=social)
[![Follow me on LinkedIn](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=linkedin&logoColor=white&link=https://www.linkedin.com/in/your-linkedin-handle/)](https://www.linkedin.com/in/your-linkedin-handle/)

Welcome to the Payroll and HR Management System repository!

The Payroll and HR Management System is designed to fully automate and streamline payroll and human resources processes within a company. The system aims to efficiently manage employee information, payroll routines, job roles, and departmental tasks. It leverages database management concepts to facilitate the seamless sharing of employee details, monitoring payroll activities, and overseeing departmental functions.

## Table of Contents

- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Features](#features)
- [ER Diagram](#er-diagram)
- [Tables Creation & Data Insertion](#tables-creation-&_data-insertion)
- [Basic Queries](#basic-queries)
- [More Queries](#more-queries)
- [Aggregation and Sorting](#aggregation-&-sorting)
- [Normalization](#normalization)
- [Conclusion](#conclusion)

### Project Overview

`Project Name:` Payroll and HR Management System

`Description:` The Payroll and HR Management System is designed to fully automate and streamline payroll and human resources processes within a company. The system aims to efficiently manage employee information, payroll routines, job roles, and departmental tasks. It leverages database management concepts to facilitate the seamless sharing of employee details, monitoring payroll activities, and overseeing departmental functions.


### Objectives

- `Apply Database Management Principles:` Implement a real-world database application utilizing the concepts learned in the Database Management System course.

- `Manage Employee Information:` Create a centralized database for maintaining detailed employee records.

- `Track Employee Job History and Performance:` Maintain records of employee job changes, performance reviews, and promotions.


### Features

- Employee Management:

    - Store and manage employee details, including personal information, job roles, salaries, and contact information.

    - Track employee job history and departmental changes.

- Payroll Management:

    - Calculate and manage salaries, including handling benefits and deductions.
    
- Job and Department Management:

    - Define and manage job roles, including titles, descriptions, and salary.

- Location and Country Management::

    - Store and manage location details, including addresses, postal codes, and associated countries.

- More Queries:

    - Perform complex queries to find high-paid employees, average salaries by department, and employees with specific benefits.

    - Use subqueries and joins to extract detailed insights into employee data and departmental performance.


### ER Diagram

<img src="https://i.ibb.co.com/jhfjj4Y/er-diagram.png" width="" height="" />


### Tables Creation & Data Insertion
Inserted data into regions, countries, locations, departments, jobs, employees, job_history, and benefits.


### Basic Queries

- Single Row Function: Convert ***first_name*** to uppercase and ***last_name*** to lowercase for a specific employee.

- Multiple Row Function: Calculate average, maximum, and minimum salary for a specific department.

### More Queries

- Subqueries:
    - Retrieve employees earning above the average salary.
    - Find departments with more than 2 employees.
    - Find the highest-paid employee in each department.
    - Calculate average salary by department.
    - Count employees in each department.
    - List employees who joined recently.

- Joins:
    - Use ***LEFT JOIN*** and ***RIGHT JOIN*** to list employees with their departments.


### Aggregation and Sorting

- `Group by:` Group employees by salary ranges and count them.

- `Top 3 Highest Paid:` Retrieve the top 3 highest-paid employees

- `Maximum and Minimum Salaries:` Find the highest and lowest salaries.


### Normalization

`1st Normal Form (1NF):` Each table has organized data without repeating information. For example, the **employees** table ensures each row is unique with atomic values like employee_id, **first_name**, and **last_name**, meaning there are no duplicate entries or groupings.

`2nd Normal Form (2NF):` All non-primary key information in a table depends entirely on the primary key. For instance, in the **employees** table, details like **email** and **salary** are fully related to the **employee_id**, ensuring no unnecessary data is stored multiple times.

`3rd Normal Form (3NF):` There are no indirect relationships between non-key attributes. In other words, things like **salary** depend only on the **employee_id** and not on anything else, like the employee's job title. This avoids unnecessary redundancy and keeps the database clean and efficient.

> Therefore, 3NF is the form your project adheres to, ensuring efficient data structure with minimal redundancy.


### Conclusion

The Payroll and HR Management System efficiently automates HR and payroll tasks using a 3rd Normal Form (3NF) database structure. This ensures data integrity, reduces redundancy, and maintains clear relationships between employees, jobs, and departments. The system demonstrates effective use of database principles for streamlined and scalable HR operations.






