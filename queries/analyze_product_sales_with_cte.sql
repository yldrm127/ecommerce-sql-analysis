with product_sale as(
select p.id as id ,sum(oi.quantity) as quantity ,sum(p.price *oi.quantity ) as total from order_items oi 
join products p  on oi.product_id =p.id 
group by p.id 
)
select ps.id ,ps.quantity ,ps.total  from product_sale ps
order by ps.id asc 