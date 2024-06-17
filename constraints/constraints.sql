-- check boolean
ALTER TABLE combat_medic
DROP CONSTRAINT chk_combat_medic_bool;

ALTER TABLE combat_medic
ADD CONSTRAINT chk_combat_medic_bool CHECK (in_training BETWEEN 0 AND 1);

-- make boolean set false
ALTER TABLE team
MODIFY religious DEFAULT 1;

-- check boolean
ALTER TABLE military_rabbi
DROP CONSTRAINT chk_military_rabbi_bool;

ALTER TABLE military_rabbi
ADD CONSTRAINT chk_military_rabbi_bool CHECK (payytan BETWEEN 0 AND 1);
commit;
