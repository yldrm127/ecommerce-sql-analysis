select c.id , c."name",  count(o.id ),
case 
	when count(o.id ) <= 2 then'inactive'
	when count(o.id ) <=4  then'regular'
	else 'frequent'
end as orders_category
from orders o
join customers c  on o.customer_id =c.id 
group by c.id 