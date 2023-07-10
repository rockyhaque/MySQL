USE hr;

SELECT * 
FROM employees;

/* Without JOIN Sytax*/
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

/* With Joining - JOIN USING*/
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e JOIN departments d USING (department_id);

/* With Joining - JOIN USING*/
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e JOIN departments d 
ON (e.department_id = d.department_id);
