with category_rank as(  SELECT
    c.id AS category_id,
    p.id AS product_id,
    p.name,
    p.price,
    RANK() OVER (
        PARTITION BY c.id
        ORDER BY p.price desc 
    ) AS category_rank
FROM products p
JOIN categories c
    ON p.category_id = c.id)
select * from category_rank cr
where cr.category_rank =1