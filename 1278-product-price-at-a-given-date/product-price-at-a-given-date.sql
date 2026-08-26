# Write your MySQL query statement below
WITH all_products AS (
    SELECT DISTINCT 
        product_ID, 
        10 AS price
    FROM Products
), 

price_change_rank AS (
SELECT
    product_id,
    new_price AS price,
    RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS price_rank_desc
FROM Products
WHERE change_date <= '2019-08-16'
)

SELECT 
    pcr.product_id,
    pcr.price
FROM price_change_rank pcr
WHERE price_rank_desc = 1

UNION 

SELECT
    ap.product_id,
    ap.price
FROM all_products ap
WHERE ap.product_id NOT IN (SELECT DISTINCT product_id FROM price_change_rank)