CREATE OR REPLACE PROCEDURE update_soldier_ranks_and_responsibilities(
    p_team_number IN team.team_number%TYPE
)
IS
    TYPE soldier_record IS RECORD (
        id solider.id%TYPE,
        first_name solider.first_name%TYPE,
        last_name solider.last_name%TYPE,
        current_rank solider.rank%TYPE,
        date_of_birth solider.date_of_birth%TYPE,
        responsibility solider_in.responsibility%TYPE
    );

    TYPE soldier_list IS TABLE OF soldier_record;
    v_soldiers soldier_list;

    v_team_name team.name%TYPE;
    v_commander_id team.commander_id%TYPE;
    v_commander_nickname commander.nickname%TYPE;

    CURSOR c_team_soldiers IS
        SELECT s.id, s.first_name, s.last_name, s.rank,
s.date_of_birth, si.responsibility
        FROM solider s
        JOIN solider_in si ON s.id = si.id
        WHERE si.team_number = p_team_number;

    v_age NUMBER;
    v_new_rank solider.rank%TYPE;
    v_new_responsibility solider_in.responsibility%TYPE;

    e_invalid_team EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_invalid_team, -20001);

BEGIN
    -- Get team information
    SELECT name, commander_id INTO v_team_name, v_commander_id
    FROM team
    WHERE team_number = p_team_number;

    IF v_team_name IS NULL THEN
        RAISE e_invalid_team;
    END IF;

    -- Get commander nickname
    SELECT nickname INTO v_commander_nickname
    FROM commander
    WHERE id = v_commander_id;

    -- Fetch soldiers into collection
    OPEN c_team_soldiers;
    FETCH c_team_soldiers BULK COLLECT INTO v_soldiers;
    CLOSE c_team_soldiers;

    -- Process each soldier
    FOR i IN 1..v_soldiers.COUNT LOOP
        -- Calculate age
        v_age := TRUNC(MONTHS_BETWEEN(SYSDATE,
v_soldiers(i).date_of_birth) / 12);

        -- Determine new rank based on age
        IF v_age < 20 THEN
            v_new_rank := 'Private';
        ELSIF v_age < 25 THEN
            v_new_rank := 'Corporal';
        ELSIF v_age < 30 THEN
            v_new_rank := 'Sergeant';
        ELSE
            v_new_rank := 'Lieutenant';
        END IF;

        -- Determine new responsibility based on new rank
        CASE v_new_rank
            WHEN 'Private' THEN v_new_responsibility := 'Support';
            WHEN 'Corporal' THEN v_new_responsibility := 'Tactical';
            WHEN 'Sergeant' THEN v_new_responsibility := 'Squad Leader';
            WHEN 'Lieutenant' THEN v_new_responsibility := 'Platoon Leader';
            ELSE v_new_responsibility := 'Specialized';
        END CASE;

        -- Update soldier rank and responsibility
        UPDATE solider
        SET rank = v_new_rank
        WHERE id = v_soldiers(i).id;

        UPDATE solider_in
        SET responsibility = v_new_responsibility
        WHERE id = v_soldiers(i).id AND team_number = p_team_number;

        -- Log the update
        DBMS_OUTPUT.PUT_LINE('Updated soldier: ' ||
v_soldiers(i).first_name || ' ' || v_soldiers(i).last_name ||
                             ' - New Rank: ' || v_new_rank || ', New
Responsibility: ' || v_new_responsibility);
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Team ' || v_team_name || ' updated
successfully. Commander: ' || v_commander_nickname);

EXCEPTION
    WHEN e_invalid_team THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid team number provided.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END update_soldier_ranks_and_responsibilities;
/
