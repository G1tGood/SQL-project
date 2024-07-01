DECLARE
    p_rank VARCHAR2(20) := 'Sergeant'; -- Example rank
    p_team_number NUMBER := 101; -- Example team number
    v_result SYS_REFCURSOR;
    v_avg_soldiers_per_commander NUMBER;
    v_avg_soldier_affection NUMBER;
    v_commander_count NUMBER;
    v_non_commander_count NUMBER;
    v_total_soldiers NUMBER;
    v_team_numbers VARCHAR2(4000);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting Main Program 1');
    DBMS_OUTPUT.PUT_LINE('---------------------------');

    -- Call the get_rank_statistics function
    v_result := get_rank_statistics(p_rank);
    
    -- Fetch the results from the cursor
    FETCH v_result INTO 
        v_avg_soldiers_per_commander, 
        v_avg_soldier_affection, 
        v_commander_count, 
        v_non_commander_count, 
        v_total_soldiers, 
        v_team_numbers;
    
    -- Display the results
    DBMS_OUTPUT.PUT_LINE('Rank Statistics for ' || p_rank || ':');
    DBMS_OUTPUT.PUT_LINE('Average soldiers per commander: ' || v_avg_soldiers_per_commander);
    DBMS_OUTPUT.PUT_LINE('Average soldier affection: ' || v_avg_soldier_affection);
    DBMS_OUTPUT.PUT_LINE('Number of commanders: ' || v_commander_count);
    DBMS_OUTPUT.PUT_LINE('Number of non-commanders: ' || v_non_commander_count);
    DBMS_OUTPUT.PUT_LINE('Total soldiers: ' || v_total_soldiers);
    DBMS_OUTPUT.PUT_LINE('Team numbers: ' || v_team_numbers);
    
    DBMS_OUTPUT.PUT_LINE('---------------------------');

    -- Call the update_soldier_ranks_and_responsibilities procedure
    update_soldier_ranks_and_responsibilities(p_team_number);

    DBMS_OUTPUT.PUT_LINE('Main Program 1 completed successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred in Main Program 1: ' || SQLERRM);
END;
/
