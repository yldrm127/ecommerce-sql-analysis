SELECT 
    o.customer_id,
    SUM(oi.quantity * p.price) AS total
FROM order_items oi
JOIN orders o 
    ON oi.order_id = o.id
JOIN products p 
    ON oi.product_id = p.id
GROUP BY o.customer_id
HAVING SUM(oi.quantity * p.price) >= 5000;