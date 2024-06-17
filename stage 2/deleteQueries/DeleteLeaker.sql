-- delete leakers: named David, and participated in the last operation)
DELETE FROM solider
WHERE id IN (
    SELECT s.id
    FROM solider s
    JOIN solider_in si ON s.id = si.id
    JOIN operation o ON si.team_number = o.team_number
    JOIN commander c ON o.commander_id = c.id
    WHERE s.first_name = 'Maury'
      AND s.rank = 'Major'
      AND o.operation_date = (
          SELECT MAX(o2.operation_date)
          FROM operation o2
      )
);
commit;
