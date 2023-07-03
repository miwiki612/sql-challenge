-- table for each department info
CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(100) NOT NULL
);

-- job title
CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(100) NOT NULL
);

-- table for each department info
CREATE TABLE employees (
	emp_no SERIAL PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	sex VARCHAR(1),
	hire_date DATE NOT NULL
);

-- employees working in which department
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- managers in each department
CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- employee salary
CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER NOT NULL
);


-- check unique for primary key;

-- departments

SELECT CASE WHEN count(distinct dept_no)= count(dept_no)
THEN 'column values are unique' ELSE 'column values are NOT unique' END
FROM departments;

-- employees

SELECT CASE WHEN count(distinct emp_no)= count(emp_no)
THEN 'column values are unique' ELSE 'column values are NOT unique' END
FROM employees;

-- titles

SELECT CASE WHEN count(distinct title_id)= count(title_id)
THEN 'column values are unique' ELSE 'column values are NOT unique' END
FROM titles;
