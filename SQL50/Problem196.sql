DELETE FROM PERSON
WHERE
    ID NOT IN (
        SELECT
            MIN(ID)
        FROM
            PERSON
        GROUP BY
            EMAIL
    );