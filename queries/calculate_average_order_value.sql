SELECT
    SUM(quantity * products.price) / COUNT(DISTINCT orders.id) AS average_order_value
FROM order_items
JOIN products
    ON order_items.product_id = products.id
JOIN orders
    ON order_items.order_id = orders.id;