select orders.customer_id ,sum(order_items.quantity *products.price ) as total from orders 
join order_items on orders.id =order_items.order_id 
join products  on order_items.product_id =products.id 
group by orders.customer_id 
order by total desc
