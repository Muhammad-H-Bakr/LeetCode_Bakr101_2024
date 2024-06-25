SELECT
    CUSTOMER_ID "customer_id",
    COUNT(*)    "count_no_trans"
FROM
    VISITS
WHERE
    VISIT_ID NOT IN (
        SELECT
            VISIT_ID
        FROM
            TRANSACTIONS
    )
GROUP BY
    CUSTOMER_ID;