WITH feb_totals AS (
    SELECT 
        p.product_name,
        SUM(o.unit) AS unit
    FROM Orders o
    LEFT JOIN Products p ON o.product_id = p.product_id
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY o.product_id
)

SELECT 
    product_name, 
    unit
FROM feb_totals
WHERE unit >= 100