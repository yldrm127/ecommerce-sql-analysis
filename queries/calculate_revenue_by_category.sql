select categories."name"  ,sum(order_items.quantity * products.price ) as total_revenue from order_items
join products  on order_items.product_id =products.id 
join categories on products.category_id =categories.id 
group  by categories."name"  