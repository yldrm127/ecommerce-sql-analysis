WITH category_ranking AS (
    SELECT
        c.id AS category_id,
        p.id AS product_id,
        p.name,
        p.price,
        RANK() OVER (
            PARTITION BY c.id
            ORDER BY p.price DESC
        ) AS category_rank
    FROM products p
    JOIN categories c
        ON p.category_id = c.id
)

SELECT *
FROM category_ranking
WHERE category_rank <= 3
ORDER BY category_id, category_rank;