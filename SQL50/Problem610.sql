SELECT
    X,
    Y,
    Z,
    CASE
        WHEN X + Y > Z AND X + Z > Y AND Y + Z > X THEN
            'Yes'
        ELSE
            'No'
    END AS TRIANGLE
FROM
    TRIANGLE