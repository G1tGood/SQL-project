DECLARE
    p_rank VARCHAR2(81);
    p_team_number NUMBER;
    v_rank_stats SYS_REFCURSOR;
    v_avg_soldiers_per_commander NUMBER;
    v_avg_soldier_affection NUMBER;
    v_commander_count NUMBER;
    v_non_commander_count NUMBER;
    v_total_soldiers NUMBER;
    v_team_numbers VARCHAR2(4000);
    
    v_team_avg_age NUMBER;
    v_team_number VARCHAR2(10);
    v_start_pos NUMBER;
    v_end_pos NUMBER;
BEGIN
    p_rank := 'Corporal';
    p_team_number := 32;
    
    -- Get rank statistics
    v_rank_stats := get_rank_statistics(p_rank);
    FETCH v_rank_stats INTO v_avg_soldiers_per_commander, v_avg_soldier_affection, 
                            v_commander_count, v_non_commander_count, 
                            v_total_soldiers, v_team_numbers;
    CLOSE v_rank_stats;
    
    -- Display results for rank statistics
    DBMS_OUTPUT.PUT_LINE('Analysis for rank: ' || p_rank);
    DBMS_OUTPUT.PUT_LINE('Average soldiers per commander: ' || v_avg_soldiers_per_commander);
    DBMS_OUTPUT.PUT_LINE('Average soldier affection: ' || v_avg_soldier_affection);
    DBMS_OUTPUT.PUT_LINE('Number of commanders: ' || v_commander_count);
    DBMS_OUTPUT.PUT_LINE('Number of non-commanders: ' || v_non_commander_count);
    DBMS_OUTPUT.PUT_LINE('Total soldiers: ' || v_total_soldiers);
    DBMS_OUTPUT.PUT_LINE('Team numbers: ' || v_team_numbers);
    
    -- Process each team number
    DBMS_OUTPUT.PUT_LINE('Details for each team:');
    v_start_pos := 1;
    LOOP
        v_end_pos := INSTR(v_team_numbers, ',', v_start_pos);
        IF v_end_pos = 0 THEN
            v_team_number := SUBSTR(v_team_numbers, v_start_pos);
        ELSE
            v_team_number := SUBSTR(v_team_numbers, v_start_pos, v_end_pos - v_start_pos);
        END IF;
        
        -- Get and display team average age
        BEGIN
            v_team_avg_age := get_team_avg_age(TO_NUMBER(v_team_number));
            DBMS_OUTPUT.PUT_LINE('Team ' || v_team_number || ':');
            DBMS_OUTPUT.PUT_LINE('  Average age of soldiers: ' || ROUND(v_team_avg_age, 2) || ' years');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Team ' || v_team_number || ': Error getting average age - ' || SQLERRM);
        END;
        
        EXIT WHEN v_end_pos = 0;
        v_start_pos := v_end_pos + 1;
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
