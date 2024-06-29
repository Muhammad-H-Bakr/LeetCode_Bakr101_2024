SELECT
    SELL_DATE,
    COUNT(PRODUCT)                                        AS NUM_SOLD,
    LISTAGG(PRODUCT, ',') WITHIN GROUP (ORDER BY PRODUCT) AS PRODUCTS
FROM
    (
        SELECT
            TO_CHAR(SELL_DATE) AS SELL_DATE,
            PRODUCT
        FROM
            ACTIVITIES
        GROUP BY
            TO_CHAR(SELL_DATE),
            PRODUCT
    ) SUBQUERY
GROUP BY
    SELL_DATE
ORDER BY
    SELL_DATE;