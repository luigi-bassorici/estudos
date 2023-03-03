-- Active: 1675368754161@@127.0.0.1@3306@olist

-- Quanto o melhor vendedor (da categoria menos faturou) vendeu?

WITH vendas AS (
        SELECT
            seller_id,
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
    ),
    catmask AS (
        SELECT category
        FROM vendas
        GROUP BY
            category
        ORDER BY
            sum(price) ASC
        LIMIT 2
    )
SELECT
    vendas.seller_id,
    sum(vendas.price) as faturamento
FROM vendas, catmask
WHERE
    vendas.category in (catmask.category)
GROUP BY vendas.seller_id
ORDER BY faturamento DESC
LIMIT 1;