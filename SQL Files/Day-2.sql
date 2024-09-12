CREATE TABLE pages (
    page_id INTEGER PRIMARY KEY,
    page_name VARCHAR(255)
);

-- Insert data into pages table
INSERT INTO pages (page_id, page_name) VALUES
(20001, 'SQL Solutions'),
(20045, 'Brain Exercises'),
(20701, 'Tips for Data Analysts');

-- Create page_likes table
CREATE TABLE page_likes (
    user_id INTEGER,
    page_id INTEGER,
    liked_date DATETIME,
    FOREIGN KEY (page_id) REFERENCES pages(page_id)
);

-- Insert data into page_likes table
INSERT INTO page_likes (user_id, page_id, liked_date) VALUES
(111, 20001, '2022-04-08 00:00:00'),
(121, 20045, '2022-03-12 00:00:00'),
(156, 20001, '2022-07-25 00:00:00');



/*
Question 1:
Write a SQL query to retrieve the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs.
*/

-- Question 1 link ::  https://datalemur.com/questions/sql-page-with-no-likes
SELECT *
FROM PAGES;
SELECT *
FROM PAGE_LIKES;

SELECT PAGE_ID 
FROM PAGES
WHERE PAGE_ID NOT IN (SELECT PAGE_ID FROM PAGE_LIKES)
ORDER BY PAGE_ID;

SELECT P1.PAGE_ID, COUNT(P2.PAGE_ID) AS TOTAL_LIKES
FROM PAGES AS P1
LEFT JOIN PAGE_LIKES AS P2 ON P1.PAGE_ID = P2.PAGE_ID
GROUP BY P1.PAGE_ID
HAVING TOTAL_LIKES = 0;


-- Create the events table
CREATE TABLE events (
    app_id INTEGER,
    event_type VARCHAR(10),
    timestamp DATETIME
);

-- Insert records into the events table
INSERT INTO events (app_id, event_type, timestamp) VALUES
(123, 'impression', '2022-07-18 11:36:12'),
(123, 'impression', '2022-07-18 11:37:12'),
(123, 'click', '2022-07-18 11:37:42'),
(234, 'impression', '2022-07-18 14:15:12'),
(234, 'click', '2022-07-18 14:16:12');

/*
Question 2: 
Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
Definition and note:
Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.
Expected Output Columns: app_id, ctr
*/
SELECT *
FROM EVENTS;

SELECT APP_ID ,
	ROUND(100*(SUM(CASE WHEN EVENT_TYPE = 'CLICK' THEN 1 ELSE 0 END)/COUNT(*)), 2) AS CTR
FROM EVENTS
WHERE YEAR(TIMESTAMP) = 2022
GROUP BY APP_ID;

SELECT APP_ID,
    ROUND(100*(SUM(CASE WHEN EVENT_TYPE = 'CLICK' THEN 1 ELSE 0 END)/SUM(CASE WHEN EVENT_TYPE = 'IMPRESSION' THEN 1 ELSE 0 END)),2) AS CTR
FROM EVENTS
GROUP BY APP_ID;

WITH CTE AS (
SELECT APP_ID,
CASE WHEN EVENT_TYPE = 'CLICK' THEN 1 ELSE 0 END AS CLICK,
CASE WHEN EVENT_TYPE = 'IMPRESSION' THEN 1 ELSE 0 END AS IMPRESSION
FROM EVENTS
)
SELECT APP_ID, ROUND(100*(SUM(CLICK)/SUM(IMPRESSION)),2) AS CTR
FROM CTE
GROUP BY APP_ID;










