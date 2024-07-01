-- Declare variables
DECLARE
    v_team_number NUMBER;
BEGIN
    -- First, promote soldiers who participated in recent operations
    DBMS_OUTPUT.PUT_LINE('Executing PromoteSoldiersInRecentOperations:');
    PromoteSoldiersInRecentOperations;
    
    -- Get a team number (you may want to replace this with a specific team number)
    SELECT MIN(team_number) INTO v_team_number FROM team;
    
    -- Then, update ranks and responsibilities for a specific team
    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Executing update_soldier_ranks_and_responsibilities:');
    
    v_team_number := 30;
    update_soldier_ranks_and_responsibilities(v_team_number);
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
