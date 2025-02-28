--5. Show the sum of all orders selled by a fisherman
SELECT fm.id, fm.firstName, fm.lastName , CONCAT('$ ', SUM(fo.price)) AS 'amount'
FROM Fishermen AS fm
    INNER JOIN Catches AS c ON c.fishermanId = fm.id
    INNER JOIN FishCatch AS fc ON fc.catchId = c.id
    INNER JOIN FishOrder AS fo ON fo.fishCatchId = fc.id
GROUP BY fm.id, fm.firstName, fm.lastName