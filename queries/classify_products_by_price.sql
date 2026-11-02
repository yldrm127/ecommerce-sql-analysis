SELECT
    p.id,
    p.name,
    p.price,
    CASE
        WHEN p.price < 500 THEN 'Ucuz'
        WHEN p.price <= 1500 THEN 'Orta'
        ELSE 'Pahalı'
    END AS price_category
FROM products p
ORDER BY p.price ASC;