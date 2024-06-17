-- Get details of soldiers born between 2001 and 2007 that participated in an operation with their commander being the highest-ranking commanders, and the operation was in Iran. Also, count the number of operations each soldier participated in.
SELECT 
    s.id AS soldier_id,
    s.first_name,
    s.last_name,
    s.date_of_birth,
    s.rank AS soldier_rank,
    COUNT(o.operation_id) AS num_operations,  -- Count the number of operations each soldier participated in
    o.location
FROM 
    (SELECT 
         * 
     FROM 
         solider 
     WHERE 
         date_of_birth 
         BETWEEN TO_DATE('01/01/1995', 'DD/MM/YYYY') 
         AND 
         TO_DATE('01/01/2006', 'DD/MM/YYYY')
      ) s  -- Soldiers born between 2001 and 2007
JOIN 
    solider_in si ON s.id = si.id
JOIN 
    operation o ON si.team_number = o.team_number
JOIN 
    commander cm ON o.commander_id = cm.id   
JOIN 
    solider c ON cm.id = c.id                
WHERE 
    c.rank = 'General'                       
GROUP BY 
    s.id, s.first_name, s.last_name, s.date_of_birth, s.rank, o.location  -- Grouping by soldier details and operation location
ORDER BY 
    num_operations DESC, s.date_of_birth DESC;                      -- Ordering results by soldier's date of birth and amount of operations
