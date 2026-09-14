# Write your MySQL query statement below
WITH subq AS (
    SELECT 
        MIN(id) AS id,
        email
    FROM Person
    GROUP BY email
) 

DELETE FROM Person WHERE id NOT IN (SELECT id FROM subq)