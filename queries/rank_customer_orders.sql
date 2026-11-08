WITH customer_orders AS (
    SELECT
        c.id AS customer_id,
        c.name AS customer_name,
        o.id AS order_id,
        SUM(p.price * oi.quantity) AS order_total
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.id
    JOIN orders o
        ON oi.order_id = o.id
    JOIN customers c
        ON o.customer_id = c.id
    GROUP BY c.id, c.name, o.id
)
SELECT
    customer_id,
    customer_name,
    order_id,
    order_total,
    RANK() OVER (
        PARTITION BY customer_id
        ORDER BY order_total DESC
    ) AS order_rank
FROM customer_orders
ORDER BY customer_id, order_rank;