SELECT
    SUM(quantity * products.price) AS total_revenue
FROM order_items
JOIN products
    ON order_items.product_id = products.id;