
    SELECT c.id, c.nickname, s.first_name, s.last_name, c.soliders_affection, s.rank
    FROM commander c
    JOIN team t ON c.id = t.commander_id
    JOIN solider_in si ON t.team_number = si.team_number
    JOIN solider s ON si.id = s.id
    WHERE c.soliders_affection > (&<name = "Affection Rating"
                             list = "select distinct soliders_affection from commander"
                             type = "integer"
                             required = "true">)
    ORDER BY c.soliders_affection DESC
