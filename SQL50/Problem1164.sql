WITH HELPER AS(
    SELECT
        PRODUCT_ID,
        NEW_PRICE,
        CHANGE_DATE
    FROM
        PRODUCTS
    WHERE
        CHANGE_DATE <= TO_DATE('2019-08-16')
)
SELECT
    PRODUCT_ID,
    NEW_PRICE        AS PRICE
FROM
    HELPER
WHERE
    (PRODUCT_ID, CHANGE_DATE) = ANY (
        SELECT
            PRODUCT_ID,
            MAX(CHANGE_DATE)
        FROM
            HELPER
        GROUP BY
            PRODUCT_ID
    )
UNION
SELECT
    PRODUCT_ID,
    10 AS PRICE
FROM
    PRODUCTS
WHERE
    PRODUCT_ID NOT IN (
        SELECT
            PRODUCT_ID
        FROM
            HELPER
    );