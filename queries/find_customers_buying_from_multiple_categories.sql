SELECT
    c.id AS customer_id,
    c."name" AS customer_name,
    COUNT(DISTINCT p.category_id) AS category_count
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.id
JOIN products p
    ON oi.product_id = p.id
JOIN customers c
    ON o.customer_id = c.id
GROUP BY c.id, c."name"
HAVING COUNT(DISTINCT p.category_id) > 1;