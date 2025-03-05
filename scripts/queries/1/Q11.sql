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
