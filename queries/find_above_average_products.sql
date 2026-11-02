SELECT p."name", p.price
FROM products p
WHERE p.price > (
    SELECT AVG(price)
    FROM products
);