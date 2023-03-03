-- Active: 1675368754161@@127.0.0.1@3306@olist

-- O objetivo é saber qual o produto campeção de vendas de cada vendedor

-- jeito difícil sem usar windows functions ...

WITH todos AS (
        SELECT
            seller_id,
            product_id,
            count(order_id) AS nv
        FROM order_items
        GROUP BY
            seller_id,
            product_id
        ORDER BY
            seller_id
    ),
    campeao AS (
        SELECT
            seller_id,
            MAX(nv) AS nvc
        FROM todos
        GROUP BY seller_id
    )
SELECT
    t1.seller_id as 'vendedor',
    t2.product_id as 'podruto champion',
    t1.nvc as 'numero de vendas'
FROM campeao as t1
    JOIN (
        select
            product_id,
            seller_id,
            nv
        from
            todos
    ) as t2 ON t1.nvc = t2.nv
    and t1.seller_id = t2.seller_id
ORDER BY t1.nvc desc;

-- com window function para criar um rank dos produtos mais vendidos de acordo com particionamento e ordenação de uma tabela só

WITH tbl AS (
        SELECT
            seller_id AS vendedor,
            product_id AS produto,
            COUNT(order_id) AS nvendas,
            SUM(price) AS faturamento,
            ROW_NUMBER() OVER (
                PARTITION BY seller_id
                ORDER BY
                    COUNT(order_id) DESC,
                    SUM(price) DESC
            ) AS rank_seller
        FROM (
                SELECT
                    *
                FROM
                    order_items
                WHERE
                    order_id in (
                        SELECT
                            order_id
                        FROM
                            orders
                        WHERE
                            order_status = 'delivered'
                    )
            ) AS order_items
        GROUP BY
            seller_id,
            product_id
        ORDER BY seller_id
    )
SELECT
    vendedor,
    produto,
    nvendas,
    faturamento
FROM tbl
WHERE rank_seller = '1';

WITH tbl AS (
        SELECT
            seller_id AS vendedor,
            product_id AS produto,
            COUNT(order_id) AS nvendas,
            SUM(price) AS faturamento,
            ROW_NUMBER() OVER (
                PARTITION BY seller_id
                ORDER BY
                    COUNT(order_id) DESC,
                    SUM(price) DESC
            ) AS rank_seller
        FROM order_items AS t1
            LEFT JOIN (
                SELECT
                    order_id AS ponte,
                    order_status
                from
                    orders
            ) AS t2 ON order_id = ponte
        WHERE
            order_status = 'delivered'
        GROUP BY
            seller_id,
            product_id
        ORDER BY seller_id
    )
SELECT
    vendedor,
    produto,
    nvendas,
    faturamento
FROM tbl
WHERE rank_seller = '1';