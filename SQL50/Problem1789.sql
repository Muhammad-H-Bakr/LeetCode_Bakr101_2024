WITH WORK AS(
    SELECT
        EMPLOYEE_ID,
        COUNT(*)    AS DEPS_CNT
    FROM
        EMPLOYEE
    GROUP BY
        EMPLOYEE_ID
), CHANGE AS(
    SELECT
        EMPLOYEE_ID,
        DEPARTMENT_ID,
        CASE
            WHEN DEPS_CNT = 1 THEN
                'Y'
            ELSE
                PRIMARY_FLAG
        END           AS CORRECT
    FROM
        EMPLOYEE
        NATURAL JOIN WORK
)
SELECT
    EMPLOYEE_ID,
    DEPARTMENT_ID
FROM
    CHANGE
WHERE
    CORRECT = 'Y';