WITH HELPER1 AS(
    SELECT
        REQUESTER_ID,
        COUNT (*)    AS REQ
    FROM
        REQUESTACCEPTED
    GROUP BY
        REQUESTER_ID
), HELPER2 AS(
    SELECT
        ACCEPTER_ID,
        COUNT(*)    AS ACC
    FROM
        REQUESTACCEPTED
    GROUP BY
        ACCEPTER_ID
), HELPER3 AS(
    SELECT
        CASE
            WHEN REQUESTER_ID IS NULL THEN
                ACCEPTER_ID
            ELSE
                REQUESTER_ID
        END AS CORRECT1,
        CASE
            WHEN ACCEPTER_ID IS NULL THEN
                REQUESTER_ID
            ELSE
                ACCEPTER_ID
        END AS CORRECT2,
        CASE
            WHEN REQ IS NULL THEN
                0
            ELSE
                REQ
        END AS CORRECT3,
        CASE
            WHEN ACC IS NULL THEN
                0
            ELSE
                ACC
        END AS CORRECT4
    FROM
        HELPER1
        FULL OUTER JOIN HELPER2
        ON (REQUESTER_ID = ACCEPTER_ID)
), HELPER4 AS(
    SELECT
        CORRECT1            AS ID,
        CORRECT3 + CORRECT4 AS NUM
    FROM
        HELPER3
)
SELECT
    ID,
    NUM
FROM
    HELPER4
WHERE
    NUM = (
        SELECT
            MAX(NUM)
        FROM
            HELPER4
    );