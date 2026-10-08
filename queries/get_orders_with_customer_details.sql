select orders.id,customers.name,orders.order_date from orders
join customers on orders.customer_id =customers.id 
