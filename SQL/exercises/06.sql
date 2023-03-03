-- Active: 1675368754161@@127.0.0.1@3306@olist

-- Faça uma query que apresente o tamanho médio, máximo e mínimo da descrição do objeto por categoria

SELECT
    product_category_name AS categoria,
    ROUND(
        AVG(product_description_lenght),
        0
    ) AS media,
    MAX(product_description_lenght) AS max,
    MIN(product_description_lenght) AS min
FROM products
WHERE
    product_category_name IS NOT NULL
GROUP BY
    product_category_name;