WITH USER_RATE AS(
    SELECT
        USER_ID,
        NAME,
        COUNT(*) AS RATES
    FROM
        MOVIERATING
        NATURAL JOIN USERS
    GROUP BY
        USER_ID,
        NAME
), RATED_MOVIES AS(
    SELECT
        MOVIE_ID,
        TITLE,
        AVG(RATING) AS AVERAGE
    FROM
        MOVIERATING
        NATURAL JOIN MOVIES
    WHERE
        TO_CHAR(CREATED_AT, 'YYYY-MM') = '2020-02'
    GROUP BY
        MOVIE_ID,
        TITLE
)
SELECT
    NAME  AS RESULTS
FROM
    USER_RATE
WHERE
    NAME = (
        SELECT
            MIN(NAME)
        FROM
            USER_RATE
        WHERE
            RATES = (
                SELECT
                    MAX(RATES)
                FROM
                    USER_RATE
            )
    )
UNION
ALL
SELECT
    TITLE AS RESULTS
FROM
    RATED_MOVIES
WHERE
    TITLE = (
        SELECT
            MIN(TITLE)
        FROM
            RATED_MOVIES
        WHERE
            AVERAGE = (
                SELECT
                    MAX(AVERAGE)
                FROM
                    RATED_MOVIES
            )
    );