# Write your MySQL query statement below
# weight <= 1000
SELECT person_name 
FROM (
    SELECT 
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn ASC) AS current_weight
    FROM QUEUE
) AS full_queue
WHERE current_weight <= 1000
ORDER BY turn DESC
LIMIT 1