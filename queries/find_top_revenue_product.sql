SELECT
    oi.product_id,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY oi.product_id
ORDER BY total_revenue DESC
LIMIT 1;