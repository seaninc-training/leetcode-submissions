# Write your MySQL query statement below
SELECT 
    e.employee_id,
    e.name, 
    COUNT(e2.reports_to) AS reports_count,
    ROUND(AVG(e2.age)) AS average_age
FROM Employees e
INNER JOIN Employees e2 ON e.employee_id = e2.reports_to
GROUP BY e.employee_id
ORDER BY e.employee_id