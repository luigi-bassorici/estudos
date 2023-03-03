-- Active: 1675368754161@@127.0.0.1@3306@olist
-- escreva uma query que mostre todos os preços de todos os produtos, mostre ao lado mum campo que se referencie ao maior preço pelo qual tal produto tenha sido vendido

WITH rank_diff_prices AS (
        SELECT
            product_id,
            price,
            MAX(price) OVER (PARTITION BY product_id) AS max_price
        FROM order_items
        ORDER BY product_id
    )
SELECT *
FROM rank_diff_prices;