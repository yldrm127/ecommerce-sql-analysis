select
    orders.customer_id as customer,
    sum(products.price * order_items.quantity) AS total_price
FROM order_items
JOIN products
    ON order_items.product_id = products.id
JOIN orders
    ON order_items.order_id = orders.id
group by customer
