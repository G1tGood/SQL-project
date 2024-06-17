-- Rename all soliders named Goldie to Golada
UPDATE solider
SET first_name = CASE
                    WHEN first_name = 'Goldie' AND EXTRACT(MONTH FROM date_of_birth) = 11 THEN 'Golda'
                    WHEN first_name = 'Golda' AND EXTRACT(MONTH FROM date_of_birth) = 11 THEN 'Goldie'
                 END
WHERE (first_name = 'Goldie' AND EXTRACT(MONTH FROM date_of_birth) = 11)
   OR (first_name = 'Golda' AND EXTRACT(MONTH FROM date_of_birth) = 11);
commit;
