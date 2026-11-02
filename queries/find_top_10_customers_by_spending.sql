select c."name" , sum(oi.quantity *p.price ) as total from orders o
join order_items oi on  oi.order_id =o.id 
join products p  on oi.product_id =p.id 
join customers c  on o.customer_id =c.id 
group  by c."name"  order by total desc limit 10
