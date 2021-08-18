CREATE TABLE dept(dept_no VARCHAR, dept_name VARCHAR);
CREATE TABLE dept_emp(emp_no INT, dept_no VARCHAR);
CREATE TABLE dept_manager(dept_no VARCHAR, emp_no INT);
CREATE TABLE emp (emp_no INT, emp_title_id VARCHAR, birth_date DATE, first_name VARCHAR, last_name VARCHAR, sex VARCHAR, hire_date DATE);
CREATE TABLE salaries(emp_no INT, salary INT);
CREATE TABLE titles (title_id VARCHAR, title VARCHAR);

--1 List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, salaries.salary 
FROM emp
INNER JOIN salaries ON
emp.emp_no=salaries.emp_no;

--2 List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM emp
Where hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, dept.dept_name, dept_manager.emp_no, emp.last_name, emp.first_name 
FROM dept
INNER JOIN dept_manager ON 
dept_manager.dept_no=dept.dept_no
INNER JOIN emp ON
dept_manager.emp_no=emp.emp_no;

--4 List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM dept_emp
INNER JOIN emp ON
emp.emp_no=dept_emp.emp_no
INNER JOIN dept ON
dept.dept_no=dept_emp.dept_no;

--5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM emp
WHERE first_name='Hercules'
AND last_name='B%';

--6 List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept
INNER JOIN dept_emp ON 
dept.dept_no=dept_emp.dept_no
INNER JOIN emp ON
emp.emp_no=dept_emp.emp_no
WHERE dept.dept_name='Sales';

--7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept
INNER JOIN dept_emp ON 
dept.dept_no=dept_emp.dept_no
INNER JOIN emp ON
emp.emp_no=dept_emp.emp_no
WHERE dept.dept_name='Sales' OR dept.dept_name='Development';

--8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "name count"
FROM emp 
GROUP BY last_name
ORDER BY "name count" DESC;

SELECT emp_no, first_name, last_name, sex, birth_date 
FROM emp
WHERE emp_no='499942';

