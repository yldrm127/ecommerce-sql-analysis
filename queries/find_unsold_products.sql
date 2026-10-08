select *  from  products p  
left join order_items oi   on p.id  =oi.product_id 
where oi.product_id  IS NULL