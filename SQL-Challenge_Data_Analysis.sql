--1. List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

--2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >='1986-01-01' AND hire_date <= '1986-12-31';

--3. List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT d.dept_name, s.dept_no, e.first_name, e.last_name
FROM public."Departments" d
JOIN dept_manager s
ON (d.dept_no = s.dept_no)
JOIN employees e
ON (s.emp_no = e.emp_no)

--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT s.dept_no, e.emp_no, e.last_name,e.first_name, d.dept_name 
FROM dept_emp s
JOIN public."Departments" d
ON (s.dept_no = d.dept_no)
JOIN employees e
ON (s.emp_no = e.emp_no)

--5. List first name, last name, and sex of each employee whose first name is Hercules and
--whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT s.dept_name, d.emp_no, e.last_name, e.first_name
FROM public."Departments" s
JOIN dept_emp d
ON (s.dept_no = d.dept_no)
JOIN employees e
ON (d.emp_no = e.emp_no)
WHERE s.dept_name = 'Sales';

--7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT s.dept_name, d.emp_no, e.last_name, e.first_name
FROM public."Departments" s
JOIN dept_emp d
ON (s.dept_no = d.dept_no)
JOIN employees e
ON (d.emp_no = e.emp_no)
WHERE s.dept_name = 'Sales' OR s.dept_name = 'Development'

--8. List the frequency counts, in descending order, of all the employee last names
SELECT e.last_name, COUNT(*)
FROM employees e
GROUP BY last_name
ORDER BY COUNT(*) DESC;