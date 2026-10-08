SELECT 
    oi.product_id,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
GROUP BY oi.product_id
HAVING SUM(oi.quantity) > 20;