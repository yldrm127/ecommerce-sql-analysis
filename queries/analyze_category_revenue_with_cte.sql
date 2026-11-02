with category_sale_tatal as (
select c.id  as id, sum(p.price *oi.quantity )as total_sum from products p 
join categories c  on p.category_id =c.id 
join order_items oi  on p.id =oi.product_id 
group by c.id
)
select * from category_sale_tatal cst
order by cst.id asc