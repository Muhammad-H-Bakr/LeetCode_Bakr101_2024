WITH ORD AS(
    SELECT
        PERSON_NAME,
        WEIGHT,
        TURN,
        SUM(WEIGHT) OVER (ORDER BY TURN) AS HOLD
    FROM
        QUEUE
), CAP AS(
    SELECT
        *
    FROM
        ORD
    WHERE
        HOLD <= 1000
), CALC AS(
    SELECT
        PERSON_NAME
    FROM
        CAP
    WHERE
        TURN = (
            SELECT
                MAX(TURN)
            FROM
                CAP
        )
)
SELECT
    *
FROM
    CALC;