--1. Show all species that live in bays
SELECT sp.id, sp.name AS 'speciesName', waterBodyId, wb.name AS 'waterBoryName', typeId, typeName, size, description
FROM Species AS sp
    INNER JOIN Habitats AS h ON h.speciesId = sp.id
    INNER JOIN WaterBodies AS wb ON wb.id = h.waterBodyId
    INNER JOIN WaterBodyTypes AS wbt ON wbt.id = wb.typeId
WHERE wbt.typeName = 'Bay';
