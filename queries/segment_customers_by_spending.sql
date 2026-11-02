select c.id ,c."name"  ,sum(p.price *oi.quantity ),
case 
	when sum(p.price *oi.quantity ) <= 20000 then 'low_value'
	when sum(p.price *oi.quantity ) <= 60000 then 'medium_value'
	else 'high_value'
	end  as customer_category from order_items oi 
join orders o on oi.order_id =o.id 
join  products p  on oi.product_id =p.id 
join  customers c on o.customer_id =c.id 
group  by c.id 
