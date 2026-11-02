select * from products p
where p.price >(select avg(p.price ) from products p)