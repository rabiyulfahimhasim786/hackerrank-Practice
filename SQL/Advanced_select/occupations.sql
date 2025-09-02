SELECT COALESCE(MAX(Doctor), 'NULL')    AS Doctor,
       COALESCE(MAX(Professor), 'NULL') AS Professor,
       COALESCE(MAX(Singer), 'NULL')    AS Singer,
       COALESCE(MAX(Actor), 'NULL')     AS Actor
FROM (
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn,
        CASE WHEN Occupation = 'Doctor'    THEN Name END AS Doctor,
        CASE WHEN Occupation = 'Professor' THEN Name END AS Professor,
        CASE WHEN Occupation = 'Singer'    THEN Name END AS Singer,
        CASE WHEN Occupation = 'Actor'     THEN Name END AS Actor
    FROM OCCUPATIONS
) t
GROUP BY rn
ORDER BY rn;
