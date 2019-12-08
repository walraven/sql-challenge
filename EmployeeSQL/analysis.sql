--The assignment calls for each table to have a primary key. These primary keys in dept_emp, dept_mgr, salaries,
--  and titles weren't needed during the analysis, but are required for the assignment. The queries below must be
--  run after importing the Data in pgAdmin. If one were to create the database and include the queries below in
--  the schema.sql file, the import in pgAdmin fails unless you exclude the id column, but, for some reason,
--  pgAdmin doesn't populate the id column when you do this. The queries below will create and populate the 
--  primary key columns for their respective tables as required by the assignment.

ALTER TABLE titles ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE dept_emp ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE dept_mgr ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE salaries ADD COLUMN id SERIAL PRIMARY KEY;

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.id as employee_number, e.first_name, e.last_name, e.gender, s.salary
FROM Employee as e , Salaries as s
WHERE e.id = s.emp_id;

--2. List employees who were hired in 1986.

SELECT id as employee_number, first_name, last_name, hire_date
FROM employee
WHERE hire_date > '12-31-1985'::date AND hire_date < '01-01-1987'::date
ORDER BY hire_date;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.id as dept_id, d.name, e.id as employee_number, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM department as d, employee as e, dept_mgr as dm
WHERE d.id = dm.dept_id AND e.id = dm.emp_id;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.id as employee_number, e.last_name, e.first_name, d.name as department_name
FROM employee as e, department as d, dept_emp as de
WHERE e.id = de.emp_id AND d.id = de.dept_id;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT d.name, e.id as employee_number, e.last_name, e.first_name
FROM department as d, employee as e, dept_emp as de
WHERE d.id = de.dept_id AND e.id = de.emp_id AND d.name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.name, e.id as employee_number, e.last_name, e.first_name
FROM department as d, employee as e, dept_emp as de
WHERE d.id = de.dept_id AND e.id = de.emp_id AND (d.name = 'Sales' OR d.name='Development')
ORDER BY d.name DESC;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) as lnc
FROM employee
GROUP BY last_name
ORDER BY lnc DESC;