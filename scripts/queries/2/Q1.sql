--1. Show the number of carps for each of their color possible
WITH SpeciesRecursive AS
(
    SELECT sp.id, sp.parentSpeciesId, sp.name
    FROM Species AS sp
    WHERE sp.name LIKE '%carp%'

    UNION ALL
    
    SELECT sp2.id, sp2.parentSpeciesId, sp2.name
    FROM Species AS sp2
    INNER JOIN SpeciesRecursive AS sr ON sr.id = sp2.parentSpeciesId
)

SELECT color, COUNT(*)
FROM Fish AS f
WHERE f.speciesId IN (SELECT sr.id
FROM SpeciesRecursive AS sr)
GROUP BY color;
