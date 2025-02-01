---Data Analysis
---(1) Employee number, last, first, sex, salary for each employee.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
	LEFT JOIN salaries
	ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

---(2) First, last, and hire date for employees hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

---(3) Manager of each department, dept number, dept name, employee number, last, and first.
SELECT dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_manager
	INNER JOIN departments
		ON (dept_manager.dept_no = departments.dept_no)
	INNER JOIN employees
		ON (dept_manager.emp_no = employees.emp_no);

---(4) Dept number for each employee, employees' numbers, last, first, department name.
SELECT departments.dept_no,
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
	INNER JOIN dept_employee
		ON (employees.emp_no = dept_employee.emp_no)
	INNER JOIN departments
		ON (dept_employee.dept_no = departments.dept_no)
ORDER BY departments.dept_no;

---(5) First, last, sex of each employee whose first name is Hercules and whose last name begins with B. 
SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

---(6) Employees in the Sales department, employee number, last, first.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name
FROM employees
	INNER JOIN dept_employee
		ON (employees.emp_no = dept_employee.emp_no)
	INNER JOIN departments
		ON (dept_employee.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

---(7) Employees in the Sales and Development departments, including emp number, last, first, and dept name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
	INNER JOIN dept_employee
		ON (employees.emp_no = dept_employee.emp_no)
	INNER JOIN departments
		ON (dept_employee.dept_no = departments.dept_no)
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no;

---(8) Frequency counts (descending) of all employee last names (shared).
SELECT last_name,
	COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;