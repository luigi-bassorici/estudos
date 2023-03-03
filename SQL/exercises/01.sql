-- Active: 1675368754161@@127.0.0.1@3306@olist

-- selecionando os venderdores (seller_id) ...

-- que não venderam (pedidos com status 'delivered') ...

-- durante o mes de dezembro de 2017

SELECT t1.seller_id
FROM (
        SELECT seller_id
        FROM sellers
    ) AS t1
    LEFT JOIN (
        SELECT DISTINCT seller_id AS asd
        FROM order_items
        WHERE order_id IN (
                SELECT order_id
                FROM
                    orders
                WHERE
                    order_status = 'delivered'
                    AND order_approved_at BETWEEN '2017-12-01' AND '2017-12-31'
            )
    ) AS t2 ON t1.seller_id = t2.asd
WHERE t2.asd IS NULL;