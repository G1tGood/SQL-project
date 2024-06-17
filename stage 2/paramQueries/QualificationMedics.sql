
    SELECT o.operation_id, o.operation_date, o.location, cm.qualification, t.name AS team_name
    FROM operation o
    JOIN combat_medic cm ON o.medic_id = cm.id
    JOIN team t ON o.team_number = t.team_number
    WHERE 
    o.operation_date
    between
    (&<name = "First Date"
    type = "date"
    default = "sysdate"
    list = "select operation_date from operation"
    required = "true">)
    AND
        (&<name = "Last Date"
    type = "date"
    default = "sysdate"
    list = "select operation_date from operation"
    required = "true">)
      AND cm.qualification In (&<name = "Qualification"
                                   type = "String"
                                   List = "SELECT DISTINCT qualification FROM combat_medic"
                                   required = "true"
                                   multiselect = "true">)
    ORDER BY o.operation_date ASC
