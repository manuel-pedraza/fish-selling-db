USE FishSellingDB
GO
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
--2.	Show the revenue of all the FishOrderDB made by each of the states of the US or by each province of Canada
SELECT a.stateProvince,
    (SUM(fo.price) / (
		SELECT SUM (fo2.price)
    FROM FishOrder AS fo2
	) * 100) AS '% of sales'
FROM FishOrder AS fo
INNER JOIN FishCatch AS fc ON fc.id = fo.fishCatchId
INNER JOIN Catches AS c ON c.id = fc.catchId
INNER JOIN Fishermen AS fm ON fm.id = c.fishermanId
INNER JOIN Addresses AS a ON a.id = fm.addressId
INNER JOIN Orders AS o ON o.id = fo.orderId
WHERE a.country = 'United States' OR a.country = 'Canada'
GROUP BY a.stateProvince;
--3. Show the revenue of each FishOrder without doing any group by.
SELECT fo.price,
    100 * fo.price / SUM(fo.price) OVER() AS 'Percentage'
FROM FishOrder AS fo;--4. For each customer, show all of the order's price and show the cumulative total
WITH OrderPrices AS
(
    SELECT o.id, SUM(fo.price) AS total_price
    FROM Orders AS o
        INNER JOIN FishOrder AS fo ON fo.orderId = o.id
    GROUP BY o.id
)

SELECT o.customerId, op.total_price AS 'Order Price',
    SUM(op.total_price) OVER(PARTITION BY CustomerID ORDER BY CustomerID Rows UNBOUNDED PRECEDING) AS 'Cumulative Total client'
FROM Orders AS o
INNER JOIN OrderPrices AS op ON o.id = op.id
ORDER BY o.customerId;
--5. Show all the North Americans who have bought other fish than Sturgeon (Using except)
WITH SpeciesRecursive AS
(
    SELECT id, parentSpeciesId, name
    FROM Species AS sp
    WHERE sp.name LIKE '%Sturgeon%'

    UNION ALL

    SELECT sp2.id, sp2.parentSpeciesId, sp2.name
    FROM Species AS sp2
    INNER JOIN SpeciesRecursive AS sr ON sr.id = sp2.parentSpeciesId
)

SELECT DISTINCT c.*, a.*
FROM Customers AS c
INNER JOIN Addresses AS a ON a.id = c.addressId
INNER JOIN Orders AS o ON o.customerId = c.id
INNER JOIN FishOrder AS fo ON fo.orderId = o.id
INNER JOIN FishCatch AS fc ON fo.fishCatchId = fc.id
INNER JOIN Fish AS f ON f.id = fc.fishId
WHERE a.worldRegion LIKE 'North America'

EXCEPT

SELECT DISTINCT c.*, a.*
FROM Customers AS c
INNER JOIN Addresses AS a ON a.id = c.addressId
INNER JOIN Orders AS o ON o.customerId = c.id
INNER JOIN FishOrder AS fo ON fo.orderId = o.id
INNER JOIN FishCatch AS fc ON fo.fishCatchId = fc.id
INNER JOIN Fish AS f ON f.id = fc.fishId
INNER JOIN SpeciesRecursive AS sr ON sr.id = f.speciesId
WHERE a.worldRegion LIKE 'North America';
--6. Show the history of fish catched in a journey for catches that have 2 or more fishCatch
SELECT fc.*
FROM FishCatch AS fc
    INNER JOIN (
	SELECT fc2.catchId AS cId, COUNT(fc2.catchId) AS nb_of_catches
    FROM FishCatch AS fc2
    GROUP BY fc2.catchId
    HAVING COUNT(fc2.catchId) > 1
) AS total_catches ON fc.catchId = total_catches.cIdGO
USE [master]
GO