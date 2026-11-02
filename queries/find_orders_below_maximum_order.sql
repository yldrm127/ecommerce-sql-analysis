SELECT
    oi.order_id,
    SUM(p.price * oi.quantity) AS order_total
FROM order_items oi
JOIN products p
    ON oi.product_id = p.id
GROUP BY oi.order_id
HAVING SUM(p.price * oi.quantity) < (
    SELECT MAX(order_total)
    FROM (
        SELECT SUM(p2.price * oi2.quantity) AS order_total
        FROM order_items oi2
        JOIN products p2
            ON oi2.product_id = p2.id
        GROUP BY oi2.order_id
    ) AS order_totals
)
ORDER BY order_total DESC;