SELECT
    c.name AS category_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.id
JOIN categories c
    ON p.category_id = c.id
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 1;