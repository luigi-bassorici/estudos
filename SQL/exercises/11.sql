/*
 Qual o valor total de receita gereda por sellers de cada estado?
 Considere a base completa, com apenas pedidos entegue.
 */

SELECT
    seller_state AS estado,
    ROUND(SUM(t1.price), 2) AS receita
FROM (
        SELECT
            seller_id,
            order_id,
            price
        FROM order_items
        WHERE order_id IN (
                SELECT
                    order_id
                FROM orders
                WHERE
                    order_status = 'delivered'
            )
    ) AS t1
    LEFT JOIN (
        SELECT
            seller_id,
            seller_state
        FROM
            sellers
    ) AS t2 ON t1.seller_id = t2.seller_id
GROUP BY t2.seller_state;