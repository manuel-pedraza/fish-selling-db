USE FishSellingDB
GO
--1. Show all species that live in bays
SELECT sp.id, sp.name AS 'speciesName', waterBodyId, wb.name AS 'waterBoryName', typeId, typeName, size, description
FROM Species AS sp
    INNER JOIN Habitats AS h ON h.speciesId = sp.id
    INNER JOIN WaterBodies AS wb ON wb.id = h.waterBodyId
    INNER JOIN WaterBodyTypes AS wbt ON wbt.id = wb.typeId
WHERE wbt.typeName = 'Bay'
--2. Show all species that don't have a specfied habitat
SELECT sp.id, sp.name AS 'speciesName', waterBodyId, wb.name AS 'wbName', typeId
FROM Species AS sp
    INNER JOIN Habitats AS h ON h.speciesId = sp.id
    FULL OUTER JOIN WaterBodies AS wb ON wb.id = h.waterBodyId
WHERE sp.id IS NULL
--3. Show the number of fishermen that have any catch and after show the list of all of them 
SELECT COUNT(*) AS '# of fishermen w/out catches'
FROM Fishermen AS fm
    FULL OUTER JOIN Catches AS c ON c.fishermanId = fm.id
WHERE c.id IS NULL

SELECT *
FROM Fishermen AS fm
    FULL OUTER JOIN Catches AS c ON c.fishermanId = fm.id
WHERE c.id IS NULL--4. Show the number of fish that have the same color
SELECT f.color, COUNT(*) AS '# of fish'
FROM fish AS f
GROUP BY f.color
ORDER BY '# of fish' DESC
-- This is the sum of fish by group by color
-- SELECT SUM(colorFish.number) AS sum_of_fish_by_color
-- FROM (SELECT COUNT(*) 'number' FROM Fish GROUP BY color) AS colorFish