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
