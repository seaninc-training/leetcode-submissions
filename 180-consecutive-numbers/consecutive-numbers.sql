# Write your MySQL query statement below
SELECT DISTINCT sq.num AS ConsecutiveNums
FROM (
    SELECT
        num, 
        LEAD(num, 1) OVER (ORDER BY id) AS num2,
        LEAD(num, 2) OVER (ORDER BY id) AS num3
    FROM Logs
) sq
WHERE sq.num = sq.num2 AND sq.num2 = sq.num3