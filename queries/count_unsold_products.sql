SELECT COUNT(*)
FROM order_items oi
RIGHT JOIN products p
    ON oi.product_id = p.id
WHERE oi.product_id IS NULL;