--2. Show all species that don't have a specfied habitat
SELECT sp.id, sp.name AS 'speciesName', waterBodyId, wb.name AS 'wbName', typeId
FROM Species AS sp
    INNER JOIN Habitats AS h ON h.speciesId = sp.id
    FULL OUTER JOIN WaterBodies AS wb ON wb.id = h.waterBodyId
WHERE sp.id IS NULL;
