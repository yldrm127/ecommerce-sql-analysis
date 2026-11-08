WITH customer_total_sale AS (
    SELECT
        c.id AS customer_id,
        SUM(oi.quantity * p.price) AS total_spending
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.id
    JOIN orders o
        ON oi.order_id = o.id
    JOIN customers c
        ON o.customer_id = c.id
    GROUP BY c.id
)
SELECT
    customer_id,
    total_spending,
    RANK() OVER (
        ORDER BY total_spending DESC
    ) AS customer_rank
FROM customer_total_sale;