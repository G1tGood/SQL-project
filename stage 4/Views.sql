-- view - yahalom, get all soliders details
CREATE OR REPLACE VIEW soldier_roles_and_operations AS
SELECT 
    s.id,
    s.first_name,
    s.last_name,
    s.rank,
    -- Determine if the soldier is a Commander
    CASE WHEN c.id IS NOT NULL THEN 'Commander' END AS role1,
    -- Determine if the soldier is a Military Rabbi
    CASE WHEN mr.id IS NOT NULL THEN 'Military Rabbi' END AS role2,
    -- Determine if the soldier is a Combat Medic
    CASE WHEN cm.id IS NOT NULL THEN 'Combat Medic' END AS role3,
    -- Calculate total operation count (sum of commander and medic operations)
    NVL(commander_ops.op_count, 0) + NVL(medic_ops.op_count, 0) AS operation_count
FROM 
    combat_solider s
-- Join with commander table to identify commanders
LEFT JOIN commander c ON s.id = c.id
-- Join with military_Rabbi table to identify military rabbis
LEFT JOIN military_Rabbi mr ON s.id = mr.id
-- Join with combat_medic table to identify combat medics
LEFT JOIN combat_medic cm ON s.id = cm.id
-- Subquery to count operations for commanders
LEFT JOIN (
    SELECT commander_id, COUNT(*) as op_count
    FROM operation
    GROUP BY commander_id
) commander_ops ON s.id = commander_ops.commander_id
-- Subquery to count operations for medics
LEFT JOIN (
    SELECT medic_id, COUNT(*) as op_count
    FROM operation
    GROUP BY medic_id
) medic_ops ON s.id = medic_ops.medic_id;

-- see the view
select * from soldier_roles_and_operations;


-----------------------------------------------------------------------------------

-- query 1: to find soldiers with the most roles
SELECT 
    id,
    first_name || ' ' || last_name AS full_name,
    rank,
    -- Count the number of non-null roles
    (CASE WHEN role1 IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN role2 IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN role3 IS NOT NULL THEN 1 ELSE 0 END) AS role_count,
    operation_count
FROM soldier_roles_and_operations
ORDER BY operation_count DESC;

-----------------------------------------------------------------------

-- query 2: find roles with the most amount of operations
WITH unpivoted_roles AS (
    -- Unpivot role1, role2, role3 into separate rows
    SELECT id, first_name, last_name, rank, operation_count, role
    FROM soldier_roles_and_operations
    UNPIVOT (role FOR role_column IN (role1, role2, role3))
    WHERE role IS NOT NULL
    UNION ALL
    -- Add 'Regular Soldier' for those with no special roles
    SELECT id, first_name, last_name, rank, operation_count, 'Regular Soldier' AS role
    FROM soldier_roles_and_operations
    WHERE role1 IS NULL AND role2 IS NULL AND role3 IS NULL
)
-- Main query to find top performer in each role
SELECT *
FROM (
    SELECT 
        role,
        id,
        first_name || ' ' || last_name AS full_name,
        rank,
        operation_count,
        -- Rank soldiers within each role based on operation count
        ROW_NUMBER() OVER (PARTITION BY role ORDER BY operation_count DESC) AS operations_rank
    FROM unpivoted_roles
    WHERE role IN ('Combat Medic', 'Commander', 'Military Rabbi', 'Regular Soldier')
)
WHERE operations_rank = 1  -- first place!
ORDER BY role;

------------------------------------------------------------



------
-- second one --
------
-------------------------------------------------------------------
-- view: see information about all deliveries and drivers of those deliveries
CREATE OR REPLACE VIEW DriverDeliveryInfo AS
SELECT 
    d.ID,
    s.name AS Driver_Name,
    s.Rank AS Driver_Rank,
    d.License AS Driver_License,
    d.License_type,
    v.Model AS Vehicle_Model,
    v.Type AS Vehicle_Type,
    del.Delivery_num,
    del.Status AS DeliveryStatus,
    del.Delivery_date
FROM 
    Driver d
-- Join with non_combat_solider to get driver's personal information
JOIN non_combat_solider s ON d.ID = s.ID
-- Join with Vehicle to get information about the vehicle assigned to the driver
JOIN Vehicle v ON d.License_num = v.License_num
-- Left join with Delivery to include all drivers, even those without deliveries
LEFT JOIN Delivery del ON d.ID = del.ID;

-- Query to select all information from the view
SELECT * FROM DriverDeliveryInfo;
    
-------------------------------------------------------------------

-- query 1: get driver exprerience
SELECT
    Driver_Name,
    Driver_Rank,
    Vehicle_Model,
    COUNT(DISTINCT Delivery_num) AS Total_Deliveries,
    SUM(CASE WHEN DeliveryStatus = 'Completed' THEN 1 ELSE 0 END) AS Completed_Deliveries,
    CASE
        WHEN COUNT(DISTINCT Delivery_num) > 10 THEN 'Experienced'
        WHEN COUNT(DISTINCT Delivery_num) > 5 THEN 'Intermediate'
        ELSE 'Novice'
    END AS Driver_Experience
FROM
    DriverDeliveryInfo
GROUP BY
    Driver_Name, Driver_Rank, Vehicle_Model
HAVING
    COUNT(DISTINCT Delivery_num) > 0
ORDER BY
    COUNT(DISTINCT Delivery_num) DESC;

-------------------------------------------------------------------
-- query 2: get deliveries information
SELECT 
    d.Vehicle_Type,
    MIN(d.Delivery_date) AS first_use,
    COUNT(Delivery_num) AS Total_Deliveries
FROM 
    DriverDeliveryInfo d
GROUP BY 
    Vehicle_Type
HAVING 
    COUNT(Delivery_num) > 0
ORDER BY 
    Total_Deliveries DESC, Vehicle_Type;

-------------------------------------------------------------------
