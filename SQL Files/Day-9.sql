-- Create Department table
CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert values into Department table
INSERT INTO Department (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

-- Create Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);

-- Insert additional records into Employee table
INSERT INTO Employee (id, name, salary, departmentId) VALUES
(8, 'Alice', 75000, 2),
(9, 'Bob', 82000, 2),
(10, 'Carol', 78000, 1),
(11, 'David', 70000, 1),
(12, 'Eva', 85000, 2),
(13, 'Frank', 72000, 1),
(14, 'Gina', 83000, 1),
(15, 'Hank', 68000, 1),
(16, 'Irene', 76000, 2),
(17, 'Jack', 74000, 2),
(18, 'Kelly', 79000, 1),
(19, 'Liam', 71000, 1),
(20, 'Molly', 77000, 2),
(21, 'Nathan', 81000, 1),
(22, 'Olivia', 73000, 2),
(23, 'Peter', 78000, 1),
(24, 'Quinn', 72000, 1),
(25, 'Rachel', 80000, 2),
(26, 'Steve', 75000, 2),
(27, 'Tina', 79000, 1);

with employee_salaries as (
select e.name as employee_name,salary,d.name as department_name,
dense_rank() over (partition by d.name order by e.salary desc) as salary_ranking_in_department
from employee as e 
join department as d on e.departmentId = d.id
)
select 
	department_name,
	employee_name, 
    salary
from employee_salaries
where salary_ranking_in_department <=3;




