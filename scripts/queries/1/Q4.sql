--4. Show the number of fish that have the same color
SELECT f.color, COUNT(*) AS '# of fish'
FROM fish AS f
GROUP BY f.color
ORDER BY '# of fish' DESC
-- Another way to show the same result
-- SELECT f.color, COUNT(*) AS '# of fish'
-- FROM fish AS f
--     FULL OUTER JOIN species AS s ON s.id = f.speciesId
-- WHERE f.color IS NOT NULL
-- GROUP BY f.color
-- ORDER BY '# of fish' DESC
-- This is the sum of fish by grouping them by color
-- SELECT SUM(colorFish.number) AS sum_of_fish_by_color
-- FROM (SELECT COUNT(*) 'number' FROM Fish GROUP BY color) AS colorFish
