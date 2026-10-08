SELECT 
    c."name",
    COUNT(o.customer_id) AS total
FROM orders o
JOIN customers c 
    ON o.customer_id = c.id
GROUP BY c."name";