CREATE TABLE departments(
	dept_no CHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50)
);

CREATE TABLE dept_emp(
	emp_no INT PRIMARY KEY NOT NULL,
	dept_no INT
);

CREATE TABLE dept_manager(
	dept_no CHAR(4) PRIMARY KEY
	emp_no INT 
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY
	emp_title_id CHAR(5)
	birth_date date
	first_name VARCHAR(50)
	last_name VARCHAR(50)
	sex CHAR(1)
	hire_date date	
);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY
	salary INT
);

CREATE TABLE titles(
	title_id CHAR(5) PRIMARY KEY
	title VARCHAR(50)
);

SELECT * FROM departments;

-- Data Analysis
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	a.emp_no, a.last_name, a.first_name, a.sex,
	b.salary
FROM
	employees AS a
LEFT JOIN
	salaries AS b ON a.emp_no=b.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	a.dept_no, a.emp_no,
	b.dept_name,
	c.first_name, c.last_name
FROM
	dept_manager AS a
LEFT JOIN
	departments AS b ON a.dept_no=b.dept_no
LEFT JOIN
	employees AS c ON a.emp_no=c.emp_no;


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	a.emp_no, a.last_name, a.first_name,
	b.dept_no,
	c.dept_name
FROM
	employees AS a
INNER JOIN
	dept_emp AS b ON a.emp_no=b.emp_no
INNER JOIN
	departments AS c ON b.dept_no=c.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees WHERE first_name='Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	a.emp_no, a.last_name, a.first_name,
	b.dept_no,
	c.dept_name
FROM
	employees AS a
INNER JOIN
	dept_emp AS b ON a.emp_no=b.emp_no
INNER JOIN
	departments AS c ON b.dept_no=c.dept_no
WHERE
	c.dept_name='Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	a.emp_no, a.last_name, a.first_name,
	b.dept_no,
	c.dept_name
FROM
	employees AS a
INNER JOIN
	dept_emp AS b ON a.emp_no=b.emp_no
INNER JOIN
	departments AS c ON b.dept_no=c.dept_no
WHERE
	c.dept_name='Sales' OR c.dept_name='Development'

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Last Name Frecuency" FROM employees GROUP BY last_name ORDER BY "Last Name Frecuency" DESC;