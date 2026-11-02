WITH customer_sales AS (
    SELECT
        c.id AS customer_id,
        c.name AS customer_name,
        SUM(oi.quantity * p.price) AS total_sales
    FROM customers c
    JOIN orders o
        ON c.id = o.customer_id
    JOIN order_items oi
        ON o.id = oi.order_id
    JOIN products p
        ON oi.product_id = p.id
    GROUP BY c.id, c.name
)
SELECT
    customer_id,
    customer_name,
    total_sales
FROM customer_sales
WHERE total_sales > 20000
ORDER BY total_sales DESC;