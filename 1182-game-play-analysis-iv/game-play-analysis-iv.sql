# Write your MySQL query statement below
WITH logins AS (
    SELECT 
        player_id,
        event_date,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date ASC) AS rn,
        LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date ASC) AS next_event
    FROM Activity
)
SELECT
   ROUND(
        COUNT(player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM logins
WHERE rn = 1 AND next_event = DATE_ADD(event_date, INTERVAL 1 DAY)