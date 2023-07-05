SELECT * FROM employees;

/*  How many job_id are there? */
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

/* Highest Salary in each job_id */
SELECT job_id, MAX(salary)
FROM employees
GROUP BY job_id;
