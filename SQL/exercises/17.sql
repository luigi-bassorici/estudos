-- Active: 1675368754161@@127.0.0.1@3306@olist

-- mostrar todos os vendedores que foram campeoes de vendas com x meio de pagamento

WITH faturamento_gateway AS (
        SELECT
            t2.seller_id,
            t3.payment_type,
            ROUND(SUM(t2.price)) as faturamento,
            COUNT(t1.ref_id) as num_vendas
        FROM
            delivered_orders AS t1
            LEFT JOIN order_items AS t2 ON t1.ref_id = t2.order_id
            LEFT JOIN payments AS t3 ON t1.ref_id = t3.order_id
        WHERE
            t3.payment_type IS NOT NULL
        GROUP BY
            t2.seller_id,
            t3.payment_type
    ),
    rank_faturamento_gateway AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY payment_type
                ORDER BY
                    faturamento DESC,
                    num_vendas DESC
            ) AS rank_gateway
        FROM
            faturamento_gateway
    )
SELECT
    seller_id,
    payment_type,
    faturamento
FROM rank_faturamento_gateway
WHERE rank_gateway = '1'
ORDER BY faturamento DESC;