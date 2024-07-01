CREATE OR REPLACE PROCEDURE PromoteSoldiersInRecentOperations IS
  TYPE solider_rec IS RECORD (
    id solider.id%TYPE,
    rank solider.rank%TYPE,
    first_name solider.first_name%TYPE,
    last_name solider.last_name%TYPE
  );
 
  CURSOR solider_cursor IS
    SELECT DISTINCT s.id, s.rank, s.first_name, s.last_name
    FROM solider s
    JOIN solider_in si ON s.id = si.id
    JOIN operation o ON si.team_number = o.team_number
    WHERE o.operation_date > SYSDATE - 30;
   
  solider_record solider_rec;
  v_updated_count NUMBER := 0;
 
BEGIN
  FOR solider_record IN solider_cursor LOOP
    BEGIN
      UPDATE solider
      SET rank = CASE
                  WHEN rank = 'Private' THEN 'Corporal'
                  WHEN rank = 'Corporal' THEN 'Sergeant'
                  WHEN rank = 'Sergeant' THEN 'Lieutenant'
                  ELSE rank
                END
      WHERE id = solider_record.id
      AND rank IN ('Private', 'Corporal', 'Sergeant');
     
      IF SQL%ROWCOUNT > 0 THEN
        v_updated_count := v_updated_count + 1;
        DBMS_OUTPUT.PUT_LINE('Promoted soldier: ' || solider_record.first_name || ' ' || solider_record.last_name ||
                             ' from ' || solider_record.rank || ' to ' ||
                             CASE
                               WHEN solider_record.rank = 'Private' THEN 'Corporal'
                               WHEN solider_record.rank = 'Corporal' THEN 'Sergeant'
                               WHEN solider_record.rank = 'Sergeant' THEN 'Lieutenant'
                               ELSE solider_record.rank
                             END);
      END IF;
     
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating soldier with ID: ' || solider_record.id || ' - ' || SQLERRM);
    END;
  END LOOP;
 
  DBMS_OUTPUT.PUT_LINE('Total soldiers promoted: ' || v_updated_count);
 
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    RAISE;
END PromoteSoldiersInRecentOperations;
/
