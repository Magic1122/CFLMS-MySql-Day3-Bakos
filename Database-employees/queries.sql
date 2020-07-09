--  How many rows do we have in each table in the employees database?

SELECT COUNT(*)
FROM employees;

SELECT COUNT(*)
FROM departments;

SELECT COUNT(*)
FROM dept_emp;

SELECT COUNT(*)
FROM dept_manager;

SELECT COUNT(*)
FROM salaries;

SELECT COUNT(*)
FROM titles;


-- How many employees with the first name "Mark" do we have in our company?

SELECT COUNT(*) as total_number
FROM employees
WHERE employees.first_name = 'Mark';


-- How many employees with the first name "Eric" and the last name beginning with "A" do we have in our company?

SELECT COUNT(*) as total_number
FROM employees
WHERE employees.first_name = 'Eric' AND employees.last_name LIKE 'A%';


--  How many employees do we have that are working for us since 1985 and who are they?

SELECT *
FROM employees
WHERE hire_date LIKE '1985%';

SELECT COUNT(*)
FROM employees
WHERE hire_date LIKE '1985%';


--  How many employees got hired from 1990 until 1997 and who are they?

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1996-12-31';

SELECT COUNT(*)
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1996-12-31';


--  How many employees have salaries higher than EUR 70 000,00 and who are they?

SELECT DISTINCT employees.emp_no, employees.first_name, employees.last_name, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salaries.salary > 70000;

SELECT employees.emp_no, employees.first_name, employees.last_name, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE 70000 < (
SELECT AVG(salaries.salary)
   FROM salaries
   WHERE employees.emp_no = salaries.emp_no
);

SELECT DISTINCT COUNT(employees.first_name) 
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salaries.salary > 70000;


--  How many employees do we have in the Research Department, who are working for us since 1992 and who are they?

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Research';

SELECT COUNT(employees.emp_no)
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Research';


-- How many employees do we have in the Finance Department, who are working for us since 1985 until now and who have salaries higher than EUR 75 000,00 - who are they?



-- We need a table with employees, who are working for us at this moment: first and last name, date of birth, gender, hire_date, title and salary.

SELECT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, titles.title, salaries.salary
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE titles.to_date = '9999-01-01';



-- We need a table with managers, who are working for us at this moment: first and last name, date of birth, gender, hire_date, title, department name and salary.





-- Create a query which will join all tables and show all data from all tables.

SELECT *
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN titles ON titles.emp_no = employees.emp_no;

-- Now you should create at least 5 queries on your own, try to use data from more than 2 tables.


