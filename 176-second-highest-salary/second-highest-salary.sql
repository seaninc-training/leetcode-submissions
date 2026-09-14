# Write your MySQL query statement below
WITH rankings AS (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS sal_rnk
    FROM Employee
)

SELECT DISTINCT
    MAX(CASE WHEN sal_rnk = 2 THEN salary END) AS SecondHighestSalary 
FROM rankings