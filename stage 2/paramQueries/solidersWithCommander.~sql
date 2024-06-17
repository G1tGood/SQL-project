  -- Query 1: List all soldiers who are part of a team commanded by a specific commander and have a rank equal to given rank.
    SELECT s.id, s.first_name, s.last_name, s.rank, t.name AS team_name
    FROM solider s
    JOIN solider_in si ON s.id = si.id
    JOIN team t ON si.team_number = t.team_number
    JOIN commander c ON t.commander_id = c.id
    WHERE c.id = (&<name = "Commander_ID"
                         List = "Select ID from Commander"
                         type = "integer"
                         required = "true">) 
                         AND 
                         s.rank in (&<name = "Rank"
                          type = "String"
                          List = "SELECT DISTINCT rank FROM solider"
                          required = "true"
                          multiselect = "true">)
    ORDER BY s.rank DESC;
