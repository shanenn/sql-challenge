drop table if exists dept_manager;
drop table if exists dept_emp;
drop table if exists salaries;
drop table if exists employees;
drop table if exists titles;
drop table if exists departments;
create table departments (
	dept_no varchar(4) primary key,
	dept_name varchar(255) NOT NULL);

create table titles (
	title_id varchar(5) primary key,
	title varchar(255) NOT NULL);
	
create table employees (
	emp_no int primary key,
	emp_title varchar(5) NOT NULL,
	birth_date varchar(10) NOT NULL,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	sex varchar(1) NOT NULL,
	hire_date varchar(10) NOT NULL,
	foreign key (emp_title) references titles(title_id));

create table salaries (
	emp_no int NOT NULL,
	salary int NOT NULL,
	foreign key (emp_no) references employees(emp_no));

create table dept_emp (
	emp_no int,
	dept_no varchar(4),
	primary key (emp_no,dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no));
	
create table dept_manager (
	dept_no varchar(4) NOT NULL,
	emp_no int NOT NULL,
	foreign key (emp_no,dept_no) references dept_emp (emp_no,dept_no));

-- Relative paths to import csv files
copy departments (dept_no, dept_name) FROM '.\EmployeeSQL\data\departments.csv' DELIMITER ',' CSV HEADER;
copy titles (title_id, title) FROM '.\EmployeeSQL\data\titles.csv' DELIMITER ',' CSV HEADER;
copy employees (emp_no, emp_title, birth_date, first_name, last_name, sex, hire_date) FROM '.\EmployeeSQL\data\employees.csv' DELIMITER ',' CSV HEADER;
copy salaries (emp_no, salary) FROM '.\EmployeeSQL\data\salaries.csv' DELIMITER ',' CSV HEADER;
copy dept_emp (emp_no, dept_no) FROM '.\EmployeeSQL\data\dept_emp.csv' DELIMITER ',' CSV HEADER;
copy dept_manager (dept_no,emp_no) FROM '.\data\dept_manager.csv' DELIMITER ',' CSV HEADER;