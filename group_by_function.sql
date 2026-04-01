-- =============================================
-- Create Database (safe)
-- =============================================
IF DB_ID('db_for_group_by') IS NOT NULL
    DROP DATABASE db_for_group_by;

CREATE DATABASE db_for_group_by;
GO

USE db_for_group_by;
GO

-- =============================================
-- Create Table (safe)
-- =============================================
IF OBJECT_ID('employees', 'U') IS NOT NULL
    DROP TABLE employees;

CREATE TABLE employees (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

-- =============================================
-- Insert Data (ALL in one go)
-- =============================================
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

-- =============================================
-- View Data
-- =============================================
SELECT * FROM employees;
-- count employees in each department--
select department,count(*) as count_member from employees group by department
--get average salary per department
select department ,avg(salary) as avg_salary from employees  group by department 
--get highest and lowest salary per department--
select department ,max(salary),min(salary) from employees group by department
--count employess per department and per year of joining--
select department,year(joining_date),count(*)  from employees group by department,year(joining_date)
-- Example 5: Order Departments by the Highest Average Salary
select department,avg(salary) as avg_salary from employees group by department order by avg_salary DESC 
--Group by Calculated Salary Range--
select 
 CASE
         
        WHEN salary < 60000 THEN 'Low Salary'
        WHEN salary BETWEEN 60000 AND 70000 THEN 'Medium Salary'
        ELSE 'High Salary'
END as salary_range ,COUNT(*) AS employee_count from employees group by salary
-- Example 7: Find Department with the Maximum Number of Employees
select salary,count(*) as total_employees from employees group by salary order by total_employees DESC
--Count employees per department who joined after 2020
select department,year(joining_date) as join_year  ,count(*)  from employees where year(joining_date) > 2020 group by department ,year(joining_date) 
--Find the average salary per department per joining year
select department,avg(salary) as avg_salary, year(joining_date) ,count(*) from employees group by department,year(joining_date)
--Show departments having more than 2 employees
select department ,count(*) as emp_number from employees  group by department having count(*) >2
--4️⃣ Find the highest salary in each department
select department,max(salary) as high_salary from employees group by department
--Count employees per department who joined in 2020 or 2021, and order by total descending
select department,year(joining_date) as join_date ,count(*) as emp_num from employees where year(joining_date) IN ('2020' , '2021') group by department ,year(joining_date) order by join_date DESC
