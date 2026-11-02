SELECT
    o.customer_id,
    SUM(p.price * oi.quantity) AS total_spending
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.id
JOIN products p
    ON oi.product_id = p.id
GROUP BY o.customer_id
HAVING SUM(p.price * oi.quantity) > (
    SELECT
        SUM(p2.price * oi2.quantity)
        / COUNT(DISTINCT o2.customer_id)
    FROM order_items oi2
    JOIN orders o2
        ON oi2.order_id = o2.id
    JOIN products p2
        ON oi2.product_id = p2.id
);