select orders.customer_id ,count(orders.customer_id) as total from orders 
group by orders.customer_id 
order by total
