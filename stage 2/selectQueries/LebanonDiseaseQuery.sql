-- operations in Lebanon between the specified dates (when the disease happened)
WITH lebanon_operations AS (
    SELECT 
        o.team_number,
        o.operation_date
    FROM 
        operation o
    WHERE 
        o.location = 'Lebanon'  -- Where the location is Lebanon
        AND o.operation_date BETWEEN TO_DATE('01/01/1999', 'DD/MM/YYYY') AND TO_DATE('01/01/2005', 'DD/MM/YYYY')  -- And the operation date is between January 1, 1999, and January 1, 2005
),
-- get number of relevant operations every solider was part of
soldiers_in_operations AS (
    SELECT 
        si.id AS solider_id,
        COUNT(*) AS number_of_operations  -- Counting the number of operations for each soldier
    -- from natural join of solider-in and lebanon operations to match the team numbers
    FROM 
        solider_in si
    JOIN 
        lebanon_operations lo ON si.team_number = lo.team_number
    GROUP BY 
        si.id  -- Grouping by soldier's ID to count the operations per soldier
)
-- retrieve soldier details along with the number of operations they were involved in
SELECT 
    s.id AS solider_id,
    s.first_name,
    s.last_name, 
    s.rank,  
    s.date_of_birth,  
    sio.number_of_operations
FROM 
    solider s  -- From the join of solider and sio to get view with details of soliders in operation
JOIN 
    soldiers_in_operations sio ON s.id = sio.solider_id;
