select products."name"  ,sum(order_items.quantity)  from order_items
join products  on order_items.product_id =products.id 
group by products."name" 