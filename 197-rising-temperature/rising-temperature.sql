# Write your MySQL query statement below
WITH priorTemps AS (
    SELECT 
        id,
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS priorTemp,
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS priorDate
    FROM Weather
)

SELECT w.id 
FROM Weather w
JOIN priorTemps pt on w.id = pt.id
WHERE w.temperature > pt.priorTemp AND DATEDIFF(w.recordDate, pt.priorDate) = 1;