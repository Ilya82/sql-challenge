-- Create tables and import data

CREATE TABLE departments  (
  dept_no VARCHAR PRIMARY KEY NOT NULL,
  dept_name VARCHAR (30)NOT NULL
);

COPY departments 
FROM '/tmp/data/departments.csv' 
CSV HEADER;

SELECT * FROM departments;

CREATE TABLE employees (
  emp_no INTEGER PRIMARY KEY NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR (30) NOT NULL,
  last_name VARCHAR (30) NOT NULL,
  gender VARCHAR (1)NOT NULL,
  hire_date DATE NOT NULL
);

COPY employees 
FROM '/tmp/data/employees.csv'
CSV HEADER;

SELECT * FROM employees;

CREATE TABLE dept_emp(
  emp_no INTEGER NOT NULL,
  dept_no VARCHAR NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

COPY dept_emp 
FROM '/tmp/data/dept_emp.csv' 
CSV HEADER;

SELECT * FROM dept_emp;

CREATE TABLE dept_manager(
  dept_no VARCHAR NOT NULL,
  emp_no INTEGER NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

COPY dept_manager 
FROM '/tmp/data/dept_manager.csv' 
CSV HEADER;

SELECT * FROM dept_manager;

CREATE TABLE salaries(
  emp_no INTEGER NOT NULL,
  salary INTEGER NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

COPY salaries 
FROM '/tmp/data/salaries.csv' 
CSV HEADER;

SELECT * FROM salaries;

CREATE TABLE titles(
  emp_no INTEGER NOT NULL,
  title VARCHAR (30) NOT NULL,
  from_date DATE NOT NULL, 
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

COPY titles 
FROM '/tmp/data/titles.csv'
CSV HEADER;

SELECT * FROM titles;