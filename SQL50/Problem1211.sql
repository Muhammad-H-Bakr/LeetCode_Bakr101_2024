WITH QUERY AS (
    SELECT
        QUERY_NAME,
        POSITION,
        RATING,
        RATING/POSITION AS RATIO,
        CASE
            WHEN RATING >= 3 THEN
                NULL
            ELSE
                1
        END             AS POOR
    FROM
        QUERIES
)
SELECT
    QUERY_NAME,
    ROUND(AVG(RATIO), 2)                  AS QUALITY,
    ROUND((COUNT(POOR)/COUNT(*)) *100, 2) AS POOR_QUERY_PERCENTAGE
FROM
    QUERY
WHERE
    QUERY_NAME IS NOT NULL
GROUP BY
    QUERY_NAME;