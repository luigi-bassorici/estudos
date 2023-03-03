-- Active: 1675368754161@@127.0.0.1@3306@olist

-- O chefe pediu para o tempo entre vendas dos sellers em dias

WITH seller_orders AS (
        SELECT
            t2.seller_id,
            t1.ref_id,
            DATE(t1.order_approved_at) AS date_sale
        FROM
            delivered_orders AS t1
            LEFT JOIN order_items AS t2 ON t1.ref_id = t2.order_id
    ),
    days_seller_sold AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY date_sale,
                seller_id
            ) AS row_num
        FROM
            seller_orders
    ),
    laged_dates AS (
        SELECT
            *,
            LAG(date_sale) OVER (
                PARTITION BY seller_id
                ORDER BY
                    date_sale
            ) AS date_sale_lag
        FROM days_seller_sold
        WHERE
            row_num = '1'
    ),
    date_diff_sales AS (
        SELECT
            seller_id,
            date_sale,
            date_sale_lag,
            DATEDIFF(date_sale, date_sale_lag) AS date_diff
        FROM laged_dates
        WHERE
            date_sale IS NOT NULL
            AND date_sale_lag IS NOT NULL
    ),
    avg_date_diff AS (
        SELECT
            seller_id,
            AVG(date_diff)
        FROM date_diff_sales
        GROUP BY seller_id
    )
SELECT *
FROM avg_date_diff;