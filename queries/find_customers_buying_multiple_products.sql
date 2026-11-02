SELECT
    c.id AS customer_id,
    c.name AS customer_name,
    COUNT(DISTINCT oi.product_id) AS product_count
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.id
JOIN customers c
    ON o.customer_id = c.id
GROUP BY c.id, c.name
HAVING COUNT(DISTINCT oi.product_id) > 1;