--bunu baska bir yöntem ile çöz
SELECT
    o.id AS order_id,
    SUM(oi.quantity * p.price) AS order_total
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY o.id
HAVING SUM(oi.quantity * p.price) > (
    SELECT AVG(order_total)
    FROM (
        SELECT
            oi2.order_id,
            SUM(oi2.quantity * p2.price) AS order_total
        FROM order_items oi2
        JOIN products p2 ON oi2.product_id = p2.id
        GROUP BY oi2.order_id
    ) AS order_totals
)
ORDER BY order_total DESC;