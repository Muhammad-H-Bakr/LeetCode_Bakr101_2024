SELECT
    ID          "id",
    MOVIE       "movie",
    DESCRIPTION "description",
    RATING      "rating"
FROM
    CINEMA
WHERE
    MOD(ID, 2) = 1
    AND DESCRIPTION != 'boring'
ORDER BY
    RATING DESC;