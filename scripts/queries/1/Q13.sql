--13. Show all sub-species
SELECT *
FROM Species
WHERE parentSpeciesId IS NOT NULL
