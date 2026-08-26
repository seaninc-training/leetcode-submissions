# Write your MySQL query statement below
WITH all_friend_ids AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) 

SELECT id, num
FROM (
    SELECT 
        id,
        COUNT(id) AS num,
        RANK () OVER (ORDER BY COUNT(ID) DESC) AS rnk
    FROM all_friend_ids
    GROUP BY id
) id_rnk
WHERE rnk = 1
