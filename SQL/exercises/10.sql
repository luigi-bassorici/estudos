-- Active: 1675368754161@@127.0.0.1@3306@olist

-- Qual o valor de receita gerada por consumidores de cada estado?

-- Considere a base completa, com apenas pedidos entregues.

WITH delivered_orders AS (
        SELECT order_id, customer_id
        FROM
            orders
        WHERE
            order_status = 'delivered'
    ),
    pago AS (
        SELECT order_id, price
        FROM
            order_items
    )
SELECT
    t1.customer_state,
    ROUND(AVG(t3.price), 2)
FROM customers AS t1
    LEFT JOIN delivered_orders AS t2 ON t1.customer_id = t2.customer_id
    LEFT JOIN pago AS t3 ON t2.order_id = t3.order_id
GROUP BY t1.customer_state;