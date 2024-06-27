WITH HELPER AS(
    SELECT
        SALE_ID,
        PRODUCT_ID,
        YEAR,
        QUANTITY,
        PRICE,
        ROW_NUMBER() OVER (PARTITION BY PRODUCT_ID ORDER BY PRODUCT_ID, YEAR) AS APPEAR
    FROM
        SALES
)
SELECT
    PRODUCT_ID AS "product_id",
    YEAR       AS "first_year",
    QUANTITY   AS "quantity",
    PRICE      AS "price"
FROM
    HELPER
WHERE
    APPEAR = 1;