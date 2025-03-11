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
