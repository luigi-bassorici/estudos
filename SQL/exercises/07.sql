-- Quantos produtos da categoria "beleza_saude" possuem o volume menor que 1L.

SELECT *
FROM products
WHERE
    product_category_name = 'beleza_saude'
)
AND product_length_cm * product_height_cm * product_width_cm < 1000;