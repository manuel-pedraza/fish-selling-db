--10. Show the top 3 fish orders who have the bigest price
SELECT TOP 3 *
FROM FishOrder AS fo
ORDER BY fo.price DESC;
