CREATE TABLE Transactions_Data (
    id INT PRIMARY KEY,
    country VARCHAR(255),
    state VARCHAR(100),
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions_Data (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

/*
Write an SQL query to find for each month and country, 
the number of transactions and their total amount, 
*/

select *
from transactions_data;

select 
	month(trans_date) as month,
    country,
    count(*) as trans_count,
    count(case when state = 'approved' then 1 end) as approved_count,
    sum(amount) as transaction_total_amount,
    sum(case when state = 'approved' then amount end) as total_amount
from transactions_data
group by 1,2;
