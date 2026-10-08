select order_items.order_id ,products.name,order_items.quantity ,products.price  from order_items 
join products  on order_items.product_id =products.id 