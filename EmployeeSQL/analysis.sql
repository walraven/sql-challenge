--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.id as employee_number, e.first_name, e.last_name, e.gender, s.salary
FROM Employee as e , Salaries as s
WHERE e.id = s.emp_id;

--2. List employees who were hired in 1986.

SELECT e.id as employee_number, e.first_name, e.last_name, e.hire_date
FROM employee as e
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

SELECT e.first_name, e.last_name
FROM employee as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT d.name, e.id as employee_number, e.last_name, e.first_name
FROM department as d, employee as e, dept_emp as de
WHERE d.id = de.dept_id AND e.id = de.emp_id AND d.name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.name, e.id as employee_number, e.last_name, e.first_name
FROM department as d, employee as e, dept_emp as de
WHERE d.id = de.dept_id AND e.id = de.emp_id AND (d.name = 'Sales' OR d.name='Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) as lnc
FROM employee
GROUP BY last_name
ORDER BY lnc DESC;
