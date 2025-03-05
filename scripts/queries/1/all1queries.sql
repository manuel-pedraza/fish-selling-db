USE FishSellingDB
GO
--1. Show all species that live in bays
SELECT sp.id, sp.name AS 'speciesName', waterBodyId, wb.name AS 'waterBoryName', typeId, typeName, size, description
FROM Species AS sp
    INNER JOIN Habitats AS h ON h.speciesId = sp.id
    INNER JOIN WaterBodies AS wb ON wb.id = h.waterBodyId
    INNER JOIN WaterBodyTypes AS wbt ON wbt.id = wb.typeId
WHERE wbt.typeName = 'Bay';
--2. Show all species that don't have a specfied habitat
SELECT sp.id, sp.name AS 'speciesName', waterBodyId, wb.name AS 'wbName', typeId
FROM Species AS sp
    INNER JOIN Habitats AS h ON h.speciesId = sp.id
    FULL OUTER JOIN WaterBodies AS wb ON wb.id = h.waterBodyId
WHERE sp.id IS NULL;
--3. Show the number of fishermen that have any catch and after show the list of all of them 
SELECT COUNT(*) AS '# of fishermen w/out catches'
FROM Fishermen AS fm
    FULL OUTER JOIN Catches AS c ON c.fishermanId = fm.id
WHERE c.id IS NULL

SELECT *
FROM Fishermen AS fm
    FULL OUTER JOIN Catches AS c ON c.fishermanId = fm.id
WHERE c.id IS NULL;
--4. Show the number of fish that have the same color
SELECT f.color, COUNT(*) AS '# of fish'
FROM fish AS f
GROUP BY f.color
ORDER BY '# of fish' DESC;
-- Another way to show the same result
-- SELECT f.color, COUNT(*) AS '# of fish'
-- FROM fish AS f
--     FULL OUTER JOIN species AS s ON s.id = f.speciesId
-- WHERE f.color IS NOT NULL
-- GROUP BY f.color
-- ORDER BY '# of fish' DESC
-- This is the sum of fish by grouping them by color
-- SELECT SUM(colorFish.number) AS sum_of_fish_by_color
-- FROM (SELECT COUNT(*) 'number' FROM Fish GROUP BY color) AS colorFish;--5. Show the sum of all orders selled by a fisherman
SELECT fm.id, fm.firstName, fm.lastName , CONCAT('$ ', SUM(fo.price)) AS 'amount'
FROM Fishermen AS fm
    INNER JOIN Catches AS c ON c.fishermanId = fm.id
    INNER JOIN FishCatch AS fc ON fc.catchId = c.id
    INNER JOIN FishOrder AS fo ON fo.fishCatchId = fc.id
GROUP BY fm.id, fm.firstName, fm.lastName;
--6. Show the fishermen that have gained more money than the average
SELECT fm.id, fm.firstName, fm.lastName , CONCAT('$ ', SUM(fo.price)) AS 'amount'
FROM Fishermen AS fm
    INNER JOIN Catches AS c ON c.fishermanId = fm.id
    INNER JOIN FishCatch AS fc ON fc.catchId = c.id
    INNER JOIN FishOrder AS fo ON fo.fishCatchId = fc.id
GROUP BY fm.id, fm.firstName, fm.lastName
HAVING SUM(fo.price) > (
	SELECT AVG(amount)
    FROM (
    		SELECT SUM(fo2.price) AS 'amount'
            FROM Fishermen AS fm2
            INNER JOIN Catches AS c2 ON c2.fishermanId = fm2.id
            INNER JOIN FishCatch AS fc2 ON fc2.catchId = c2.id
            INNER JOIN FishOrder AS fo2 ON fo2.fishCatchId = fc2.id
            GROUP BY fm2.id
    ) AS tb
)
ORDER BY amount DESC;
--7. Show percentage of the price of an order compared to all the orders
SELECT o.id, SUM(fo.price) /  (SELECT SUM(fo2.price) FROM FishOrder AS fo2) * 100 AS '% of all orders'
FROM Orders AS o
    INNER JOIN FishOrder AS fo ON fo.orderId = o.id
GROUP BY o.id;
--8. Show orders delivered in the year 2012 and after
SELECT *
FROM Orders
WHERE dateToDeliver > '20120101' AND dateToDeliver < '20250225' AND wasDelivered = 1
ORDER BY dateToDeliver;
--9. Show the orders that have more than one fish order
SELECT o.id, dateToDeliver, wasDelivered, customerId, COUNT(o.id) no_fish_orders
FROM Orders AS o
    INNER JOIN FishOrder AS fo ON fo.orderId = o.id
    INNER JOIN FishCatch AS fc ON fc.id = fo.fishCatchId
GROUP BY o.id, dateToDeliver, wasDelivered, customerId
HAVING COUNT(o.id) > 1;
--10. Show the top 3 fish orders who have the bigest price
SELECT TOP 3 *
FROM FishOrder AS fo
ORDER BY fo.price DESC;
--11. Search all fishermen and customers from the USA
SELECT * 
FROM Addresses AS a 
INNER JOIN Customers AS c ON a.id = c.addressId
WHERE a.country = 'United States'

UNION ALL

SELECT * 
FROM Addresses AS a 
INNER JOIN Fishermen AS fm ON a.id = fm.addressId
WHERE a.country = 'United States';
--12. Search all fishermen and customers from the Asia Region
SELECT * 
FROM Addresses AS a 
INNER JOIN Customers AS c ON a.id = c.addressId
WHERE a.worldRegion LIKE '%asia%'

UNION ALL

SELECT * 
FROM Addresses AS a 
INNER JOIN Fishermen AS fm ON a.id = fm.addressId
WHERE a.worldRegion LIKE '%asia%';
--13. Show all sub-species
SELECT *
FROM Species
WHERE parentSpeciesId IS NOT NULL;
--14. Show all main species
SELECT *
FROM Species
WHERE parentSpeciesId IS NULL;
--15. Show all species that have two sub-species
SELECT sp.id, sp.name
FROM Species AS sp
    INNER JOIN Species AS sp2 ON sp.id = sp2.parentSpeciesId
GROUP BY sp.id, sp.name
HAVING COUNT(sp.id) > 1
ORDER BY sp.id;
GO
USE [master]
GO