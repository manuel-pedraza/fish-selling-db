--6. Show the history of fish catched in a journey for catches that have 2 or more fishCatch
SELECT fc.*
FROM FishCatch AS fc
    INNER JOIN (
	SELECT fc2.catchId AS cId, COUNT(fc2.catchId) AS nb_of_catches
    FROM FishCatch AS fc2
    GROUP BY fc2.catchId
    HAVING COUNT(fc2.catchId) > 1
) AS total_catches ON fc.catchId = total_catches.cId