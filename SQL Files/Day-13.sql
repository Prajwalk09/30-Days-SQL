CREATE TABLE fb_posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    likes INT,
    comments INT,
    post_date DATE
);


INSERT INTO fb_posts (post_id, user_id, likes, comments, post_date) VALUES
(1, 101, 50, 20, '2024-02-27'),
(2, 102, 30, 15, '2024-02-28'),
(3, 103, 70, 25, '2024-02-29'),
(4, 101, 80, 30, '2024-03-01'),
(5, 102, 40, 10, '2024-03-02'),
(6, 103, 60, 20, '2024-03-03'),
(7, 101, 90, 35, '2024-03-04'),
(8, 101, 90, 35, '2024-03-05'),
(9, 102, 50, 15, '2024-03-06'),
(10, 103, 30, 10, '2024-03-07'),
(11, 101, 60, 25, '2024-03-08'),
(12, 102, 70, 30, '2024-03-09'),
(13, 103, 80, 35, '2024-03-10'),
(14, 101, 40, 20, '2024-03-11'),
(15, 102, 90, 40, '2024-03-12'),
(16, 103, 20, 5, '2024-03-13'),
(17, 101, 70, 25, '2024-03-14'),
(18, 102, 50, 15, '2024-03-15'),
(19, 103, 30, 10, '2024-03-16'),
(20, 101, 60, 20, '2024-03-17');

/*
-- Q.1
Question: Identify the top 3 posts with the highest engagement 
(likes + comments) for each user on a Facebook page. Display 
the user ID, post ID, engagement count, and rank for each post.
*/

select user_id, post_id, engagement ,
dense_rank() over ( order by engagement desc) as rankings
from (
	select 
		user_id,
		post_id,
		sum(likes+comments)as engagement,
        row_number() over(partition by user_id order by sum(likes+comments) desc) as user_rank
	from fb_posts
	group by user_id, post_id
) X1
where user_rank <=3;


with facebook_posts as (
select 
	user_id, 
    post_id,
    sum(likes+comments) as engagement,
    row_number() over (partition by user_id order by sum(likes+comments) desc) as user_ranking
from fb_posts
group by 1,2
)
select user_id,post_id, engagement,
	dense_rank() over (order by engagement desc) as rankings
from facebook_posts
where user_ranking<=3
order by 1, 3 desc;

    