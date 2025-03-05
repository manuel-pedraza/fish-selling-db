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
