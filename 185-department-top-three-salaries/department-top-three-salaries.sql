# Write your MySQL query statement below
WITH sal_rnk AS (
    SELECT
        name AS Employee,
        salary AS Salary,
        departmentId,
        DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee
) 

SELECT
    d.name AS Department,
    sr.Employee,
    sr.Salary
FROM sal_rnk sr
JOIN Department d ON sr.departmentId = d.id
WHERE rnk <= 3