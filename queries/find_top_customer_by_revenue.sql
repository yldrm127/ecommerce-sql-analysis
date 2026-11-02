SELECT 
    o.customer_id,
    SUM(p.price * oi.quantity) AS total
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.id
JOIN orders o 
    ON oi.order_id = o.id
GROUP BY o.customer_id
ORDER BY total DESC
LIMIT 1;