--15. Show all species that have two sub-species
SELECT sp.id, sp.name
FROM Species AS sp
    INNER JOIN Species AS sp2 ON sp.id = sp2.parentSpeciesId
GROUP BY sp.id, sp.name
HAVING COUNT(sp.id) > 1
ORDER BY sp.id
