CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);

-- DML for Salaries table
INSERT INTO Salaries (emp_name, 
					  department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);

SELECT 
ABS(MAX(CASE WHEN DEPARTMENT = 'ENGINEERING' THEN SALARY END)-MAX(CASE WHEN DEPARTMENT = 'MARKETING' THEN SALARY END)) AS SALARY_DIFFERENCE
FROM SALARIES;


WITH SALARY_CTE AS (
SELECT *, 
RANK() OVER (partition by DEPARTMENT ORDER BY SALARY DESC) AS SALARY_RANKINGS
FROM SALARIES
)
select max(salary) - min(salary) 
AS SALARY_DIFFERENCE 
FROM SALARY_CTE
where salary_rankings = 1;

select 
	abs(max(case when department = 'marketing' then salary end) - max(case when department = 'engineering' then salary end))
    as salary_diff
from salaries;

select 
max(case when department = "marketing" then salary end) as marketing_salary,
max(case when department = "engineering" then salary end) as engineering_salary
from salaries;



