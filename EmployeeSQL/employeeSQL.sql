-- Change date format to match csv date format
ALTER DATABASE "EmployeeSQL" SET datestyle = "ISO, MDY";

-- Create employees table with emp_no as PK. Use Table Import/Export to fill table from csv
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id CHAR(10),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex CHAR(1),
	hire_date DATE
);

-- Create salaries table with emp_no as PK and FK linked to employees.emp_no (one to one).
-- Use Table Import/Export to fill table from csv.
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create titles table with title_id as PK. Use Table Import/Export to fill table from csv.
CREATE TABLE titles(
	title_id CHAR(10) PRIMARY KEY,
	title VARCHAR(255)
);

-- Link titles table to employees table one to many on title_id = emp_title_id
ALTER TABLE employees ADD CONSTRAINT fk_emp_title_id
FOREIGN KEY (emp_title_id) REFERENCES titles (title_id);

-- Create departments table with dept_no as PK. Use Table Import/Export to fill table from csv.
CREATE TABLE departments (
	dept_no INT PRIMARY KEY,
	dept_name VARCHAR(255)
);

-- Create the dept_emp junction table with two PKs. Use Table Import/Export to fill table from csv.
CREATE TABLE dept_emp (
  	emp_no INT REFERENCES employees (emp_no),
  	dept_no CHAR(10) REFERENCES departments (dept_no),
  	PRIMARY KEY (emp_no, dept_no)
);

-- Create the dept_manager table with emp_no as PK one to one with employees.emp_no and
-- dept_no many to one with department.dept_no. Use Table Import/Export to fill table from csv.
CREATE TABLE dept_manager (
  	emp_no INT PRIMARY KEY REFERENCES employees (emp_no),
  	dept_no CHAR(10) REFERENCES departments (dept_no)
);

-- List the employee number, last name, first name, sex, and salary of each employee
SELECT emp_no, last_name, first_name, sex,
(SELECT salary FROM salaries WHERE salaries.emp_no = employees.emp_no) AS salary
FROM employees;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
	
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
  	departments.dept_no,
  	departments.dept_name,
  	dept_manager.emp_no AS manager_emp_no, 
  	employees.last_name AS manager_last_name, 
  	employees.first_name AS manager_first_name
FROM departments
  	JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
  	JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY departments.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
  	departments.dept_no,
	employees.emp_no, 
  	employees.last_name, 
  	employees.first_name,
  	departments.dept_name
FROM 
  	departments 
  	JOIN dept_emp ON departments.dept_no = dept_emp.dept_no 
  	JOIN employees ON dept_emp.emp_no = employees.emp_no
ORDER BY departments.dept_no, employees.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT 
  	departments.dept_no,
	employees.emp_no, 
  	employees.last_name, 
  	employees.first_name,
  	departments.dept_name
FROM 
  	departments 
  	JOIN dept_emp ON departments.dept_no = dept_emp.dept_no 
  	JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'
ORDER BY departments.dept_no, employees.emp_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
  	employees.emp_no, 
	departments.dept_no,
  	employees.last_name, 
  	employees.first_name,
  	departments.dept_name
FROM 
  	departments 
  	JOIN dept_emp ON departments.dept_no = dept_emp.dept_no 
  	JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY employees.emp_no, departments.dept_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT last_name, COUNT(emp_no)
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;

