--14. Show all main species
SELECT *
FROM Species
WHERE parentSpeciesId IS NULL
