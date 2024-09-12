CREATE TABLE student_names(
    student_id INT,
    name VARCHAR(50)
);

-- Insert the records
INSERT INTO student_names (student_id, name) VALUES
(1, 'RAM'),
(2, 'ROBERT'),
(3, 'ROHIM'),
(4, 'RAM'),
(5, 'ROBERT');


-- Question 


-- Get the count of distint student that are not unique
-- Display only those names which appear once

select 
	count(*) as distinct_students
from (
	select name, count(*) as count_of_names
	from student_names
	group by name
) as subquery
where count_of_names = 1;



