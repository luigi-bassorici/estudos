b-- Active: 1675368754161@@127.0.0.1@3306@olist

-- Quanto cada vendedor vendeu da categoria mais vendida (quantidade)?

WITH vendas AS (
        SELECT
            selle_id,
            product_id,
            category,
            price
        FROM
            order_items
            LEFT JOIN (
                SELECT
                    product_id AS pd_id2,
                    product_category_name AS category
                FROM
                    products
            ) AS products ON order_items.product_id = products.pd_id2
            RIGHT JOIN (
                SELECT
                    DISTINCT seller_id AS selle_id
                FROM
                    sellers
            ) AS sellers ON order_items.seller_id = sellers.selle_id
    ),
    catmask AS (
        SELECT category
        FROM vendas
        GROUP BY
            category
        ORDER BY
            sum(price) DESC
        LIMIT 1
    )
SELECT
    vendas.selle_id,
    sum(vendas.price) as faturamento
FROM vendas, catmask
WHERE
    vendas.category in (catmask.category)
GROUP BY vendas.selle_id
ORDER BY faturamento;

SELECT
    selle_id,
    product_id,
    category,
    price
FROM order_items
    LEFT JOIN (
        SELECT
            product_id AS pd_id2,
            product_category_name AS category
        FROM
            products
    ) AS products ON order_items.product_id = products.pd_id2
    RIGHT JOIN (
        SELECT
            DISTINCT seller_id AS selle_id
        FROM
            sellers
    ) AS sellers ON sellers.selle_id = order_items.seller_id;