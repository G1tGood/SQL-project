CREATE OR REPLACE FUNCTION get_team_avg_age(p_team_number IN NUMBER)
RETURN NUMBER
IS
    v_avg_age NUMBER;
    v_count NUMBER := 0;
    v_total_age NUMBER := 0;
    
    -- Cursor to get soldier birthdates in the team
    CURSOR c_soldier_ages IS
        SELECT s.date_of_birth
        FROM solider s
        JOIN solider_in si ON s.id = si.id
        WHERE si.team_number = p_team_number;
    
    -- Record to store soldier birthdate
    r_soldier_birth DATE;
    
    -- Exception for when no soldiers are found in the team
    no_soldiers_exception EXCEPTION;
BEGIN
    -- Loop through soldier birthdates
    OPEN c_soldier_ages;
    LOOP
        FETCH c_soldier_ages INTO r_soldier_birth;
        EXIT WHEN c_soldier_ages%NOTFOUND;
        
        v_total_age := v_total_age + TRUNC(MONTHS_BETWEEN(SYSDATE, r_soldier_birth) / 12);
        v_count := v_count + 1;
    END LOOP;
    CLOSE c_soldier_ages;
    
    -- Check if any soldiers were found
    IF v_count = 0 THEN
        RAISE no_soldiers_exception;
    END IF;
    
    -- Calculate average age
    v_avg_age := v_total_age / v_count;
    
    RETURN v_avg_age;
EXCEPTION
    WHEN no_soldiers_exception THEN
        RAISE_APPLICATION_ERROR(-20001, 'No soldiers found in the specified team');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;
/
