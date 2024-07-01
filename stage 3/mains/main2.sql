DECLARE
    p_team_number NUMBER := 101; -- Example team number
    v_avg_age NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting Main Program 2');
    DBMS_OUTPUT.PUT_LINE('---------------------------');

    -- Call the get_team_avg_age function
    v_avg_age := get_team_avg_age(p_team_number);
    
    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Average age of team ' || p_team_number || ': ' || ROUND(v_avg_age, 2) || ' years');
    
    DBMS_OUTPUT.PUT_LINE('---------------------------');

    -- Call the PromoteSoldiersInRecentOperations procedure
    PromoteSoldiersInRecentOperations;

    DBMS_OUTPUT.PUT_LINE('Main Program 2 completed successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred in Main Program 2: ' || SQLERRM);
END;
/
