-- Active: 1675368754161@@127.0.0.1@3306@olist

--O chefe quer saber quantos produtos possuem o volume maior que 5L.

SELECT *
FROM products
WHERE
    product_length_cm * product_height_cm * product_width_cm > 5000;