-- Active: 1675368754161@@127.0.0.1@3306@olist

SELECT t1.seller_id
FROM sellers AS t1
    LEFT JOIN (
        SELECT DISTINCT seller_id AS vqv
        FROM
            order_items
        WHERE
            shipping_limit_date > '2018-01-01'
    ) AS t2 on t1.seller_id = t2.vqv
WHERE t2.vqv IS NULL;