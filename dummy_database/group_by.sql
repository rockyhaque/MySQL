SELECT * FROM employees;

/*  How many job_id are there? */
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

/* Highest Salary in each job_id */
SELECT job_id, MAX(salary)
FROM employees
GROUP BY job_id;



/* Group the employees using job_id when minimum salary is more than 5000 */

SELECT * FROM employees;

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id
HAVING MIN(salary) > 5000;
