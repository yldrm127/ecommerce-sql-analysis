--bunu daha sonra kontrol et
SELECT
    c.id AS customer_id,
    c."name" AS customer_name,
    SUM(oi.quantity * p.price) / COUNT( o.id) AS average_order_value
FROM orders o
JOIN order_items oi
    ON oi.order_id = o.id
JOIN products p
    ON oi.product_id = p.id
JOIN customers c
    ON o.customer_id = c.id
GROUP BY c.id, c."name";