SELECT
    CASE
        WHEN product_category_name IS NULL THEN 'outros'
        WHEN product_category_name = 'pc_gamer' THEN 'pcs'
        ELSE product_category_name
    END AS categorias,
    COUNT(product_id) AS n_products
FROM products
GROUP BY categorias
ORDER BY categorias;