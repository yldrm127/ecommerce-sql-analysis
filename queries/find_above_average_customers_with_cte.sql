WITH customer_sale AS (
    SELECT
        c.id,
        SUM(p.price * oi.quantity) AS total_spending
    FROM order_items oi
    JOIN products p ON oi.product_id = p.id
    JOIN orders o ON oi.order_id = o.id
    JOIN customers c ON o.customer_id = c.id
    GROUP BY c.id
)
SELECT
    cs.id,
    cs.total_spending
FROM customer_sale cs
WHERE cs.total_spending > (
    SELECT AVG(total_spending)
    FROM customer_sale
);