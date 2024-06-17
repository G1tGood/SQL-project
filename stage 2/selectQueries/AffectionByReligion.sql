-- get average affection towards commanders
-- correlated with age and religion of commander,
-- commander between ages 25 and 65
-- and pluralism between their's soliders
SELECT 
    cs.religion AS commander_religion,
    ROUND(AVG(EXTRACT(YEAR FROM cs.date_of_birth)) - 1975) AS avg_commander_age,
    ROUND(AVG(c.soliders_affection),3) AS avg_soldier_affection,
    CASE WHEN COUNT(DISTINCT s.id) >= 30 THEN 'Yes' ELSE 'No' END AS statisticaly_significant
FROM 
    commander c
JOIN
    solider cs ON c.id = cs.id
JOIN 
    team t ON c.id = t.commander_id
JOIN 
    solider_in si ON t.team_number = si.team_number
JOIN 
    solider s ON si.id = s.id
WHERE 
    cs.date_of_birth BETWEEN TO_DATE('01/01/1990', 'DD/MM/YYYY') AND TO_DATE('31/12/2020', 'DD/MM/YYYY')
    AND EXISTS ( -- commands on soliders with at least two different religions
        SELECT *
        FROM 
            solider_in si2 
        JOIN 
            solider s2 ON si2.id = s2.id
        WHERE 
            si2.team_number = t.team_number 
            AND EXISTS (
                SELECT *
                FROM
                    solider_in si3
                JOIN
                    solider s3 ON si3.id = s3.id
                WHERE
                    s3.religion <> s2.religion
            )
    )
GROUP BY 
    cs.religion
ORDER BY
    avg_soldier_affection DESC;
