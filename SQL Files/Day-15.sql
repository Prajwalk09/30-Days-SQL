CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    Region VARCHAR(50),
    Amount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales (Region, Amount, SaleDate) VALUES
('North', 5000.00, '2024-02-01'),
('South', 6000.00, '2024-02-02'),
('East', 4500.00, '2024-02-03'),
('West', 7000.00, '2024-02-04'),
('North', 5500.00, '2024-02-05'),
('South', 6500.00, '2024-02-06'),
('East', 4800.00, '2024-02-07'),
('West', 7200.00, '2024-02-08'),
('North', 5200.00, '2024-02-09'),
('South', 6200.00, '2024-02-10'),
('East', 4700.00, '2024-02-11'),
('West', 7100.00, '2024-02-12'),
('North', 5300.00, '2024-02-13'),
('South', 6300.00, '2024-02-14'),
('East', 4600.00, '2024-02-15'),
('West', 7300.00, '2024-02-16'),
('North', 5400.00, '2024-02-17'),
('South', 6400.00, '2024-02-18'),
('East', 4900.00, '2024-02-19'),
('West', 7400.00, '2024-02-20'),
('North', 5600.00, '2024-02-21'),
('South', 6600.00, '2024-02-22'),
('East', 5000.00, '2024-02-23'),
('West', 7500.00, '2024-02-24'),
('North', 5700.00, '2024-02-25'),
('South', 6700.00, '2024-02-26'),
('East', 5100.00, '2024-02-27'),
('West', 7600.00, '2024-02-28'); 

-- Flipkart Business Analyst entry level SQL question
/*
Identify the region with the lowest sales amount for the previous month. 
return region name and total_sale amount.
*/

select 
	region,
	sum(amount) as total_sales
from sales
where SaleDate between '2024-02-01' and '2024-02-29'
group by 1
order by 2
limit 1;

