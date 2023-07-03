-- List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no , e.last_name, e.first_name , e.sex , s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON
e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name , last_name , hire_date
FROM employees
WHERE hire_date >= '1986-01-01' 
AND  hire_date < '1987-01-01' ;

-- List the manager of each department along with their department number,
-- department name, employee number, last name, and first name (2 points)
SELECT d.dept_no , d.dept_name , e.emp_no , e.last_name, e.first_name
FROM dept_manager AS m
LEFT JOIN employees AS e ON
m.emp_no = e.emp_no
LEFT JOIN departments AS d ON
m.dept_no = d.dept_no ;

-- List the department number for each employee along with that employee’s
-- employee number, last name, first name, and department name (2 points)
SELECT d.dept_no , e.emp_no , e.last_name, e.first_name , departments.dept_name
FROM employees AS e
INNER JOIN dept_emp as d ON
d.emp_no = e.emp_no
LEFT JOIN departments ON
departments.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee
-- whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name , last_name , sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%' ;

-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT d.emp_no , e.first_name , e.last_name
FROM dept_emp AS d
LEFT JOIN employees AS e ON
d.emp_no = e.emp_no
WHERE d.dept_no IN
(	SELECT departments.dept_no
	FROM departments
	WHERE dept_name = 'Sales'
);

-- List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name (4 points)
SELECT d.emp_no , e.first_name , e.last_name , dn.dept_name
FROM dept_emp AS d
LEFT JOIN employees AS e ON
d.emp_no = e.emp_no
LEFT JOIN departments AS dn ON
d.dept_no = dn.dept_no
WHERE d.dept_no IN
(
	SELECT departments.dept_no
	FROM departments
	WHERE dept_name = 'Sales'
	OR dept_name = 'Development'
);

-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;