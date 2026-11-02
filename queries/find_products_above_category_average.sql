     SELECT
    p.id,
    p."name",
    p.price,
    p.category_id
FROM products p
WHERE p.price > (
    SELECT AVG(p1.price)
    FROM products p1
    WHERE p1.category_id = p.category_id
);