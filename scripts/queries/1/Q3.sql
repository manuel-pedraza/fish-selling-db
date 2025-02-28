--3. Show the number of fishermen that have any catch and after show the list of all of them 
SELECT COUNT(*) AS '# of fishermen w/out catches'
FROM Fishermen AS fm
    FULL OUTER JOIN Catches AS c ON c.fishermanId = fm.id
WHERE c.id IS NULL

SELECT *
FROM Fishermen AS fm
    FULL OUTER JOIN Catches AS c ON c.fishermanId = fm.id
WHERE c.id IS NULL
