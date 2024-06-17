
    SELECT mr.id, s.first_name, s.last_name, mr.sector, o.operation_id, o.operation_date, o.location
    FROM military_Rabbi mr
    JOIN solider s ON mr.id = s.id
    Join solider_in si on si.id = s.id
    JOIN operation o ON si.team_number = o.team_number
    WHERE mr.certified_Rabbi = 1
      AND mr.preacher = 1
      AND mr.sector = (&<name = "Sector"
                            type = "String"
                            List = "SELECT DISTINCT sector FROM military_Rabbi"
                            required = "true">)
    ORDER BY s.last_name, o.operation_date
