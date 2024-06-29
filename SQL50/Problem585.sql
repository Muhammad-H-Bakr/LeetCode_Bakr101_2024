WITH HELPER1 AS (
    SELECT
        TIV_2015,
        COUNT(TIV_2015) AS CNT1
    FROM
        INSURANCE
    GROUP BY
        TIV_2015
), HELPER2 AS(
    SELECT
        LAT,
        LON,
        COUNT(*) AS CNT2
    FROM
        INSURANCE
    GROUP BY
        LAT,
        LON
), HELPER3 AS(
    SELECT
        *
    FROM
        INSURANCE
    WHERE
        TIV_2015 NOT IN (
            SELECT
                TIV_2015
            FROM
                HELPER1
            WHERE
                CNT1 = 1
        )
        AND (LAT, LON) NOT IN (
            SELECT
                LAT,
                LON
            FROM
                HELPER2
            WHERE
                CNT2 > 1
        )
)
SELECT
    ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM
    HELPER3;