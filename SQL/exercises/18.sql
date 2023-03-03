-- Active: 1675368754161@@127.0.0.1@3306@olist

-- construa uma tabela rankeando o preço de cada produto pelo qual foi vendido em cada ocasião, sendo o top 1 de produto o que foi vendido mais caro em relação a prodtos semelhantes

WITH rank_diff_prices AS (
        SELECT
            product_id,
            price,
            DENSE_RANK() OVER (
                PARTITION BY product_id
                ORDER BY
                    price DESC
            ) AS ranki
        FROM order_items
        ORDER BY product_id
    )
SELECT *
FROM rank_diff_prices;