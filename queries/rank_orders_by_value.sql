WITH order_totals AS (
    SELECT
        o.id AS order_id,
        SUM(p.price * oi.quantity) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.id = oi.order_id
    JOIN products p
        ON oi.product_id = p.id
    GROUP BY o.id
)
SELECT
    order_id,
    order_total,
    RANK() OVER (
        ORDER BY order_total DESC
    ) AS order_ranking
FROM order_totals;