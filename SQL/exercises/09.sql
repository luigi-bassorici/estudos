-- Active: 1675368754161@@127.0.0.1@3306@olist

-- Faça uma query que apresente o tamanho médio, máximo e

-- mínimo do nome do objeto por categoria. Considere apenas

-- os objetos que tenham a descrição maior que 50.

-- Exiba apenas as categorias com tamanho médio de descrição

-- do objeto maior que 100 caracteres

SELECT
    product_category_name AS categoria,
    ROUND(AVG(product_name_lenght), 0) AS avg_,
    MAX(product_name_lenght) AS max,
    MIN(product_name_lenght) AS min
FROM products
WHERE
    product_name_lenght > 50
    AND product_description_lenght > 100
GROUP BY
    product_category_name;