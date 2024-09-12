USE hr;

SELECT * 
FROM employees;

/* Who get salary less than Diana */
SELECT first_name, salary
FROM employees
WHERE salary < (SELECT salary
				FROM employees
				WHERE employee_id = 107);
                
/* Who get salary like Diana but he/she is not Diana */
SELECT first_name, salary
FROM employees
WHERE employee_id != 107 AND salary =  (SELECT salary
										FROM employees
										WHERE employee_id = 107);
