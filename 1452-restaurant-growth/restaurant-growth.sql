# Write your MySQL query statement below
WITH daily_sum AS (
    SELECT 
        visited_on, 
        SUM(amount) AS daily_sum
    FROM Customer 
    GROUP BY visited_on
),
sliding_window AS (
    SELECT 
        visited_on,
        SUM(daily_sum) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(daily_sum) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM daily_sum 
)

SELECT
    visited_on,
    amount,
    average_amount
FROM sliding_window
WHERE rn >= 7
ORDER BY visited_on ASC