-- Create database
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    emp_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

CREATE TABLE contractors (
    cont_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    hourly_rate DECIMAL(10,2),
    joining_date DATE
);

-- Insert employees
INSERT INTO employees (name, department, salary, joining_date) VALUES
('Alice', 'HR', 50000, '2020-06-15'),
('Bob', 'HR', 55000, '2019-08-20'),
('Charlie', 'IT', 70000, '2018-03-25'),
('David', 'IT', 72000, '2017-07-10'),
('Eve', 'IT', 73000, '2021-02-15'),
('Frank', 'Finance', 60000, '2020-11-05'),
('Grace', 'Finance', 65000, '2019-05-30'),
('Hannah', 'Finance', 62000, '2021-01-12'),
('Tim', 'HR', 65000, '2019-05-30'),
('Tom', 'IT', 62000, '2021-01-12');

-- Insert contractors
INSERT INTO contractors (name, department, hourly_rate, joining_date) VALUES
('Ian', 'HR', 50, '2021-03-10'),
('Jack', 'IT', 60, '2020-05-15'),
('Karen', 'Finance', 55, '2021-06-20'),
('Leo', 'IT', 65, '2019-12-10'),
('Mona', 'HR', 45, '2020-08-01');
select * from contractors
--union List all names (employees + contractors) without duplicates
select * from employees union select * from contractors
--List all departments where either employees or contractors work.
select department from employees union select department from contractors
--Combine employee salaries and contractor hourly_rate into one column, remove duplicates.
select salary  from employees union select hourly_rate from contractors 
--List names of employees and contractors who joined in 2021.
select name from employees union select name from contractors where joining_date='2021'
--Combine employee IDs and contractor IDs into one column (distinct IDs only).
select * from employees
select emp_id from employees union select  cont_id from contractors
--UNION ALL
--List all names (employees + contractors), including duplicates if any.
--Combine employee salaries and contractor hourly_rate into one column (show all values).
--List all departments including duplicates from both tables.
--Combine joining_date of employees and contractors, keeping all duplicates.
--List names and departments of all people in a single result (duplicates allowed).


--subquries..............

--Top-paid employees per department who joined after 2019
--Clauses: WHERE, GROUP BY, HAVING, ORDER BY
--Hint:
--Filter employees by joining date (WHERE)
--Group by department
--Use MAX(salary)
--Use HAVING to optionally filter groups with >1 employee
--Order by highest salary
select * from employees
select department ,count(*) as member_name ,max(salary)
as max_salary,year(joining_date) as join_year from employees 
where year(joining_date)>2019 group by department,year(joining_date)  order by max_salary DESC

--Departments with average salary > 60000 and employee count > 2

--Clauses: GROUP BY, HAVING, ORDER BY
--Hint:

--GROUP BY department
--Calculate AVG(salary) and COUNT(*)
--HAVING filters departments meeting both conditions
--Order by department name or avg salary
select department ,avg(salary)  as avergae_salary,count(*) as emp_number
from employees  group by department having count(*) >2


--Find employees whose salary is greater than the average salary of all employees.(use subqureis)
select  * from employees  where salary > (select avg(salary)  from employees) 
--List names of employees who work in the same department as  Eve .
 select name ,department from employees where department=(select department  from employees where name='Eve')
 --Show departments where the total employee salary is higher than the total contractor hourly_rate   1000 (or some unit).

 
