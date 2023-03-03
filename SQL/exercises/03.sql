-- Active: 1675368754161@@127.0.0.1@3306@olist

-- O chefe que saber quantas categorias de produtos (unicas) ...

-- temos cadastro na base de dados.

SELECT
    DISTINCT product_category_name
FROM products
WHERE
    product_category_name IS NOT NULL;