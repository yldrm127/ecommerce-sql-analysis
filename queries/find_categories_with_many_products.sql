SELECT 
    p.category_id,
    COUNT(p.id) AS total
FROM products p
GROUP BY p.category_id
HAVING COUNT(p.id) > 5;