DELETE FROM solider
WHERE id IN (
    SELECT s.id
    FROM solider s
    JOIN solider_in si ON s.id = si.id
    JOIN operation o ON si.team_number = o.team_number
    WHERE o.operation_id = 721577260 AND s.id != o.commander_id
);
commit;
