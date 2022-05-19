-- 9 SQL Homework
-- Rice University Data Analytics and Visualization Boot Camp 2020
-- This repository contains the following scenario:

-- Employee Database: A Mystery in Two Parts
-- In this repository, the major task is a research project on employees of a corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

-- We will design the tables to hold data in the CSVs, import the CSVs into a SQL database (Postgres), and answer questions about the data. The two major tasks are:

-- Data Engineering / Data Modeling

-- Data Analysis

-- Data Modeling
-- Inspect the CSVs and sketch out an ERD of the tables. We use the Quick Database Diagrams.

-- Data Engineering
-- Create a table schema for each of the six CSV files.

-- For the primary keys check to see if the column is unique, otherwise create a composite key. Which takes to primary keys in order to uniquely identify a row.
-- Create tables in the correct order to handle foreign keys.
-- Import each CSV file into the corresponding SQL table. Note be sure to import the data in the same order that the tables were created and account for the headers when importing to avoid errors.

--  CREATE TABLE "employees" (
--     "emp_no" int   NOT NULL,
--     "emp_title_id" varchar(10)   NOT NULL,
--     "birth_date" date   NOT NULL,
--     "first_name" varchar(25)   NOT NULL,
--     "last_name" varchar(25)   NOT NULL,
--     "sex" varchar(10)   NOT NULL,
--     "hire_date" date   NOT NULL,
--     CONSTRAINT "pk_employees" PRIMARY KEY (
--         "emp_no","emp_title_id"
--      )
-- );

-- CREATE TABLE "departments" (
--     "dept_no" varchar(5)   NOT NULL,
--     "dept_name" varchar(25)   NOT NULL,
--     CONSTRAINT "pk_departments" PRIMARY KEY (
--         "dept_no"
--      )
-- );

-- CREATE TABLE "salaries" (
--     "emp_no" int   NOT NULL,
--     "salary" int   NOT NULL,
--     CONSTRAINT "pk_salaries" PRIMARY KEY (
--         "emp_no"
--      )
-- );

-- -- Table documentation comment 1 (try the PDF/RTF export)
-- CREATE TABLE "dept_manager" (
--     "dept_no" varchar(10)   NOT NULL,
--     "emp_no" int   NOT NULL,
--     CONSTRAINT "pk_dept_manager" PRIMARY KEY (
--         "dept_no","emp_no"
--      )
-- );

-- CREATE TABLE "dept_emp" (
--     "emp_no" int  NOT NULL,
--     "dept_no" varchar(10)   NOT NULL,
--     CONSTRAINT "pk_dept_emp" PRIMARY KEY (
--         "emp_no","dept_no"
--      )
-- );

-- CREATE TABLE "titles" (
--     "title_id" varchar(10)   NOT NULL,
--     "title" varchar(25)   NOT NULL,
--     CONSTRAINT "pk_titles" PRIMARY KEY (
--         "title_id"
--      )
-- );

-- ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
-- REFERENCES "titles" ("title_id");

-- ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "departments" ("dept_no");

-- ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "departments" ("dept_no");

-- Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- select employees.emp_no as Employee_number, employees.last_name, employees.first_name, employees.seX, salaries.salary 
-- FROM employees
-- join salaries on employeeS.emp_no = salaries.emp_no
-- ;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- select employees.first_name, employees.last_name, employees.hire_Date 
-- from employees
-- where employees.hire_date > '12/31/1985' :: date and employees.hire_date < '1/1/1987;':: date
-- ;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee
-- number, last name, first name.

-- select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no as Employee_number, employees.first_name, employees.last_name
-- from dept_manager
-- join departments on dept_manager.dept_no = departments.dept_no
-- join employees on dept_manager.emp_no = employees.emp_no
-- ;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

-- select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
-- from employees
-- join dept_emp 
-- on employees.emp_no = dept_emp.emp_no
-- join departments 
-- on dept_emp.dept_no = departments.dept_no
-- ;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

-- select employees.first_name, employees.last_name, employees.sex
-- from employees
-- where employees.first_name = 'Hercules' and employees.last_name like 'B%'
-- ;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name. 

-- select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
-- from employees
-- join dept_emp on employees.emp_no = dept_emp.emp_no
-- join departments on dept_emp.dept_no = departments.dept_no 
-- where departments.dept_name = 'Sales'
-- ;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and
-- department name.

-- select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
-- from employees
-- join dept_emp on employees.emp_no = dept_emp.emp_no
-- join departments on dept_emp.dept_no = departments.dept_no 
-- where departments.dept_name = 'Sales' or departments.dept_name = 'Development'
-- ;

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

-- select employees.last_name, count (*)
-- from employees
-- group by employees.last_name
-- order by count (*) desc
-- ;
