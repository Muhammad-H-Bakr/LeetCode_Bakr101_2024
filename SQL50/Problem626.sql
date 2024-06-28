WITH SWITCHER AS(
    SELECT
        ID,
        CASE
            WHEN MOD(ID, 2) = 1 THEN
                LEAD(STUDENT, 1, STUDENT) OVER (ORDER BY ID)
            ELSE
                LAG(STUDENT) OVER (ORDER BY ID)
        END AS STU
    FROM
        SEAT
)
SELECT
    ID,
    STU AS STUDENT
FROM
    SWITCHER;