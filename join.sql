-- Create Database with new name
CREATE DATABASE company_db2;
USE company_db2;

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Projects Table
CREATE TABLE projects (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(50),
    dept_id INT
);

-- Insert Employees
INSERT INTO employees VALUES
(1, 'Ali', 101, 50000),
(2, 'Sara', 102, 60000),
(3, 'Ahmed', 103, 55000),
(4, 'Zara', NULL, 45000),
(5, 'Usman', 101, 70000);

-- Insert Departments
INSERT INTO departments VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');

-- Insert Projects
INSERT INTO projects VALUES
(1, 'Recruitment System', 101),
(2, 'Website Development', 102),
(3, 'Budget Analysis', 103),
(4, 'Ad Campaign', 104);
select * from employees
select * from departments
select * from projects
--Show all combinations of employees and departments
select * from employees cross join departments 
--Show employee name with every project
select e.name, p.proj_name  from employees e cross join  projects p
--Count total combinations between employees and departments
select count(*) as total_combination from employees cross join projects 
--Filter cross join where salary > 55000
select * from employees cross join projects where salary>55000 
--left join 
--Display all employees and their department names. Include employees who don t belong to any department.
select e.name ,d.dept_name from employees e left join departments d ON e.dept_id=d.dept_id
--List all employees with salary > 50000 along with their department names. Include employees without a department.
select e.name ,e.salary , d.dept_name from employees e left join departments d ON salary >5000
--right join 
--Display all departments and employee names. Include departments that currently have no employees.
select d.dept_name , e.name from departments d right join employees e ON name is null
select e.name,d.dept_id from employees e left OUTER join departments d ON e.dept_id=d.dept_id


