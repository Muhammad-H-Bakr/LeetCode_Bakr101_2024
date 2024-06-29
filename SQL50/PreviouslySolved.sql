-- Problem1757:
SELECT
    PRODUCT_ID "product_id"
FROM
    PRODUCTS
WHERE
    LOW_FATS = 'Y'
    AND RECYCLABLE = 'Y';

-- Problem584:
SELECT
    NAME
FROM
    CUSTOMER
WHERE
    REFEREE_ID != 2
    OR REFEREE_ID IS NULL;

-- Problem595:
SELECT
    NAME,
    POPULATION,
    AREA
FROM
    WORLD
WHERE
    AREA >= 3000000
    OR POPULATION >= 25000000;

-- Problem1148:
SELECT
    DISTINCT AUTHOR_ID "id"
FROM
    VIEWS
WHERE
    AUTHOR_ID = VIEWER_ID
ORDER BY
    1;

-- Problem1683:
SELECT
    TWEET_ID
FROM
    TWEETS
WHERE
    LENGTH(CONTENT) > 15;

-- Problem1378:
SELECT
    UNIQUE_ID,
    NAME
FROM
    EMPLOYEES
    LEFT OUTER JOIN EMPLOYEEUNI
    ON(EMPLOYEES.ID = EMPLOYEEUNI.ID);

-- Problem1068:
SELECT
    PRODUCT_NAME,
    YEAR,
    PRICE
FROM
    SALES
    JOIN PRODUCT
    ON(SALES.PRODUCT_ID = PRODUCT.PRODUCT_ID);

-- Problem1581:
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

-- Problem577:
SELECT
    NAME,
    BONUS
FROM
    EMPLOYEE
    LEFT OUTER JOIN BONUS
    ON EMPLOYEE.EMPID = BONUS.EMPID
WHERE
    NVL(BONUS, 0) < 1000;

-- Problem570:
SELECT
    NAME
FROM
    EMPLOYEE
WHERE
    ID IN (
        SELECT
            MANAGERID
        FROM
            EMPLOYEE
        GROUP BY
            MANAGERID
        HAVING
            COUNT(*) >= 5
    );

-- Problem1934:
SELECT
    USER_ID                                                     "user_id",
    ROUND(SUM(DECODE(ACTION, 'confirmed', 1, 0)) / COUNT(*), 2) "confirmation_rate"
FROM
    SIGNUPS
    LEFT OUTER JOIN CONFIRMATIONS
    USING(USER_ID)
GROUP BY
    USER_ID;

-- Problem1075:
SELECT
    PROJECT_ID                      "project_id",
    ROUND(AVG(EXPERIENCE_YEARS), 2) "average_years"
FROM
    PROJECT
    JOIN EMPLOYEE
    ON(PROJECT.EMPLOYEE_ID = EMPLOYEE.EMPLOYEE_ID)
GROUP BY
    PROJECT_ID;

-- Problem2356:
SELECT
    TEACHER_ID,
    COUNT(DISTINCT SUBJECT_ID) "cnt"
FROM
    TEACHER
GROUP BY
    TEACHER_ID;

-- Problem1141:
SELECT
    TO_CHAR(ACTIVITY_DATE)  AS DAY,
    COUNT(DISTINCT USER_ID) AS ACTIVE_USERS
FROM
    ACTIVITY
WHERE
    TO_DATE('2019-07-27') - ACTIVITY_DATE < 30
    AND TO_DATE('2019-07-27') - ACTIVITY_DATE >= 0
GROUP BY
    ACTIVITY_DATE;

-- Problem596:
SELECT
    CLASS
FROM
    COURSES
GROUP BY
    CLASS
HAVING
    COUNT(STUDENT) >= 5;

-- Problem1729:
SELECT
    USER_ID            "user_id",
    COUNT(FOLLOWER_ID) "followers_count"
FROM
    FOLLOWERS
GROUP BY
    USER_ID
ORDER BY
    1;

-- Problem619:
SELECT
    DECODE(MAX(DECODE(NUM, MAX(NUM), NUM)), 0, NULL, MAX(DECODE(NUM, MAX(NUM), NUM)))+0 "num"
FROM
    MYNUMBERS
GROUP BY
    NUM
HAVING
    COUNT(NUM) = 1;

-- Problem180:
SELECT
    DISTINCT NUM AS CONSECUTIVENUMS
FROM
    (
        SELECT
            NUM,
            LAG(NUM, 1) OVER (ORDER BY ID) AS LAGGER,
            LAG(NUM, 2) OVER (ORDER BY ID) AS LAGGED
        FROM
            LOGS
    )
WHERE
    NUM = LAGGED
    AND NUM = LAGGER;

-- Problem1907:
SELECT
    'Low Salary'     "category",
    COUNT(*)         "accounts_count"
FROM
    ACCOUNTS
WHERE
    INCOME < 20000
UNION
SELECT
    'Average Salary' "category",
    COUNT(*)         "accounts_count"
FROM
    ACCOUNTS
WHERE
    INCOME BETWEEN 20000 AND 50000
UNION
SELECT
    'High Salary'    "category",
    COUNT(*)         "accounts_count"
FROM
    ACCOUNTS
WHERE
    INCOME > 50000;

-- Problem1978:
SELECT
    EMPLOYEE_ID "employee_id"
FROM
    EMPLOYEES
WHERE
    MANAGER_ID NOT IN (
        SELECT
            EMPLOYEE_ID
        FROM
            EMPLOYEES
    )
    AND SALARY < 30000
ORDER BY
    1;

-- Problem185:
SELECT
    DEP_NAME "Department",
    EMP_NAME "Employee",
    SALARY   "Salary"
FROM
    (
        SELECT
            SALARY,
            D.NAME                                                        AS DEP_NAME,
            E.NAME                                                        AS EMP_NAME,
            DENSE_RANK() OVER(PARTITION BY D.NAME ORDER BY E.SALARY DESC) AS RANKED
        FROM
            EMPLOYEE   E
            JOIN DEPARTMENT D
            ON (E.DEPARTMENTID = D.ID)
    )
WHERE
    RANKED <= 3
ORDER BY
    3 DESC;

-- Problem176:
SELECT
    MAX(SALARY) "SecondHighestSalary"
FROM
    EMPLOYEE
WHERE
    SALARY IN (
        SELECT
            SALARY
        FROM
            EMPLOYEE MINUS
            SELECT
                MAX(SALARY)
            FROM
                EMPLOYEE
    );
