-- Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria.

-- Considere apenas os objetos que tenham a descrição maior que 50.

SELECT
    t1.product_category_name AS categoria,
    ROUND(
        avg(
            t1.product_description_lenght
        ),
        0
    ) AS avg,
    MAX(
        t1.product_description_lenght
    ) AS max,
    MIN(
        t1.product_description_lenght
    ) AS min
FROM (
        SELECT *
        FROM products
        WHERE
            product_description_lenght > 50
    ) AS t1
WHERE
    t1.product_category_name IS NOT NULL
GROUP BY
    t1.product_category_name;