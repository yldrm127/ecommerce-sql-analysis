WITH customer_total AS (
    SELECT
        c.id AS customer_id,
        c.name AS customer_name,
        SUM(p.price * oi.quantity) AS total
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.id
    JOIN orders o
        ON oi.order_id = o.id
    JOIN customers c
        ON o.customer_id = c.id
    GROUP BY c.id, c.name
)
SELECT
    customer_id,
    customer_name,
    total
FROM customer_total
ORDER BY total DESC
LIMIT 10;