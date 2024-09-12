-- Create the orders table
CREATE TABLE restaurant (
    user_id INT,
    item_ordered VARCHAR(512)
);
-- Insert sample data into the orders table
INSERT INTO restaurant VALUES 
('1', 'Pizza'),
('1', 'Burger'),
('2', 'Cold Drink'),
('2', 'Burger'),
('3', 'Burger'),
('3', 'Cold Drink'),
('4', 'Pizza'),
('4', 'Cold Drink'),
('5', 'Cold Drink'),
('6', 'Burger'),
('6', 'Cold Drink'),
('7', 'Pizza'),
('8', 'Burger');

-- Flipkart Data Analyst Interview Questions
-- Question: Write an SQL query to fetch user IDs that have only bought both 'Burger' and 'Cold Drink' items.

with customers_cte as (
	select user_id,
	sum(case when item_ordered in ('Pizza' , 'Burger') then 1 else 0 end) as order_count
	from restaurant
    group by user_id
)
select user_id
from customers_cte 
where order_count = 2;