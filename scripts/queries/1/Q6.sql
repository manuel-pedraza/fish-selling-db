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
