select
    customers.name as customers_name,
    sum(products.price * order_items.quantity) AS total_price,count(DISTINCT orders.id  )
FROM order_items
JOIN products
    ON order_items.product_id = products.id
JOIN orders
    ON order_items.order_id = orders.id
    JOIN customers 
    ON orders.customer_id  = customers.id 
group by customers_name
