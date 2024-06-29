SELECT
    USER_ID,
    NAME,
    MAIL
FROM
    USERS
WHERE
    REGEXP_LIKE(MAIL, '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\.com$')