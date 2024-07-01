CREATE OR REPLACE FUNCTION get_rank_statistics(p_rank IN VARCHAR2)
RETURN SYS_REFCURSOR
IS
    v_result SYS_REFCURSOR;
    v_commander_count NUMBER := 0;
    v_non_commander_count NUMBER := 0;
    v_total_soldiers NUMBER := 0;
    v_total_affection NUMBER := 0;
    v_affection NUMBER := 0;
    v_avg_soldiers_per_commander NUMBER;
    v_avg_soldier_affection NUMBER;
    v_team_numbers VARCHAR2(4000) := '';
    
    -- Record to store soldier information
    TYPE soldier_record IS RECORD (
        id NUMBER,
        is_commander NUMBER
    );
    v_soldier soldier_record;
    
    -- Exception for when no soldiers with the given rank exist
    no_soldiers_exception EXCEPTION;
    
    -- Cursor to get soldiers with the given rank
    CURSOR c_soldiers IS
        SELECT s.id, 
               CASE WHEN c.id IS NOT NULL THEN 1 ELSE 0 END AS is_commander
        FROM solider s
        LEFT JOIN commander c ON s.id = c.id
        WHERE s.rank = p_rank;
    
BEGIN
    -- Open the cursor and fetch soldiers
    OPEN c_soldiers;
    LOOP
        FETCH c_soldiers INTO v_soldier;
        EXIT WHEN c_soldiers%NOTFOUND;
        
        v_total_soldiers := v_total_soldiers + 1;
        
        -- Branching to count commanders and non-commanders
        IF v_soldier.is_commander = 1 THEN
            v_commander_count := v_commander_count + 1;
            -- Get soldier affection for commanders
            SELECT soliders_affection 
            INTO v_affection
            FROM commander 
            WHERE id = v_soldier.id;
            
            v_total_affection := v_total_affection + v_affection;
        ELSE
            v_non_commander_count := v_non_commander_count + 1;
        END IF;
        
        -- Get team numbers for this soldier
        FOR team_rec IN (SELECT DISTINCT team_number 
                         FROM solider_in 
                         WHERE id = v_soldier.id) LOOP
            v_team_numbers := v_team_numbers || team_rec.team_number || ',';
        END LOOP;
    END LOOP;
    CLOSE c_soldiers;
    
    -- Check if any soldiers were found
    IF v_total_soldiers = 0 THEN
        RAISE no_soldiers_exception;
    END IF;
    
    -- Calculate averages
    v_avg_soldiers_per_commander := CASE WHEN v_commander_count > 0 
                                         THEN v_total_soldiers / v_commander_count 
                                         ELSE 0 END;
    v_avg_soldier_affection := CASE WHEN v_commander_count > 0 
                                    THEN v_total_affection / v_commander_count 
                                    ELSE 0 END;
    
    -- Remove trailing comma from team numbers
    v_team_numbers := RTRIM(v_team_numbers, ',');
    
    -- Prepare the result cursor
    OPEN v_result FOR
        SELECT v_avg_soldiers_per_commander AS avg_soldiers_per_commander,
               v_avg_soldier_affection AS avg_soldier_affection,
               v_commander_count AS commander_count,
               v_non_commander_count AS non_commander_count,
               v_total_soldiers AS total_soldiers,
               v_team_numbers AS team_numbers
        FROM dual;
    
    -- Example DML command (update): Increase security clearance for commanders of this rank
    UPDATE commander c
    SET c.security_clearance = LEAST(c.security_clearance + 1, 5)
    WHERE c.id IN (SELECT s.id FROM solider s WHERE s.rank = p_rank);
    
    RETURN v_result;

EXCEPTION
    WHEN no_soldiers_exception THEN
        RAISE_APPLICATION_ERROR(-20001, 'No soldiers with this rank exist');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;
/
