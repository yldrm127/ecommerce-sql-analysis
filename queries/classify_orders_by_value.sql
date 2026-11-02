select o.id  ,sum(p.price *oi.quantity ),
case 	
   when sum(p.price *oi.quantity ) <=12000 then'low'
   when sum(p.price *oi.quantity ) <=22000 then 'mediım'
   else 'high'
end as order_category
from order_items oi
join orders o  on oi.order_id =o.id
join products p  on oi.product_id =p.id 
group by o.id