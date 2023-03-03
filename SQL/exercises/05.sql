-- Active: 1675368754161@@127.0.0.1@3306@olist

-- Converter o volume calculado no ex passado de cm³ para m³.

SELECT
    product_length_cm * product_height_cm * product_width_cm / 1000000 as vol
FROM products
WHERE
    product_length_cm * product_height_cm * product_width_cm / 1000000 > 0.005;