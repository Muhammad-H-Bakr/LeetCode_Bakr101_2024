WITH HELPER AS(
    SELECT
        ID,
        COUNTRY,
        CASE
            WHEN STATE = 'approved' THEN
                1
            ELSE
                NULL
        END                            AS APPROVAL,
        AMOUNT,
        CASE
            WHEN STATE = 'declined' THEN
                0
            ELSE
                AMOUNT
        END                            AS DECL,
        TO_CHAR(TRANS_DATE, 'YYYY-MM') AS MONTH
    FROM
        TRANSACTIONS
), FILTERER AS(
    SELECT
        MONTH,
        COUNTRY,
        COUNT(*)        AS TRANS_COUNT,
        COUNT(APPROVAL) AS APPROVED_COUNT,
        SUM(AMOUNT)     AS TRANS_TOTAL_AMOUNT,
        SUM(DECL)       AS APPROVED_TOTAL_AMOUNT
    FROM
        HELPER
    GROUP BY
        MONTH,
        COUNTRY
)
SELECT
    *
FROM
    FILTERER;