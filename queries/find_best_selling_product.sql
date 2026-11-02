SELECT
    oi.product_id,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
GROUP BY oi.product_id
ORDER BY total_quantity DESC
LIMIT 1;