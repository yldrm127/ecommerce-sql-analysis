select  c."name"   ,sum(oi.quantity *p.price ) as total from order_items oi 
join orders o  on oi.order_id =o.id 
join products p  on oi.product_id =p.id 
join customers c  on o.customer_id =c.id 
group by c."name" order by total desc limit 1