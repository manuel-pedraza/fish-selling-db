--1. Show the average price for a FishOrder by color (Using PIVOT())
--SELECT f.color, AVG(fo.price) AS AVG_BY_COLOR
--FROM Fish AS f
--INNER JOIN FishCatch AS fc ON fc.fishId = f.id
--INNER JOIN FishOrder AS fo ON fo.fishCatchId = fc.id
--WHERE f.color IS NOT NULL
--GROUP BY f.color;

SELECT 'AVG_BY_COLOR' AS Color, 
    [Black], [Blue], [Grey], [Multi], [Red], [Silver], [Silver/Black], [White], [Yellow], [Crimson], [Aquamarine],
    [Fuscia], [Goldenrod], [Green], [Indigo], [Khaki], [Maroon], [Mauve], [Pink], [Puce], [Purple], [Teal], [Turquoise], [Violet]
FROM (
	SELECT f.color, fo.price
    FROM Fish AS f
    INNER JOIN FishCatch AS fc ON fc.fishId = f.id
    INNER JOIN FishOrder AS fo ON fo.fishCatchId = fc.id
) AS dataToTreat
PIVOT (AVG(price) FOR Color IN (
    [Black], [Blue], [Grey], [Multi], [Red], [Silver], [Silver/Black], [White], [Yellow], [Crimson], [Aquamarine],
    [Fuscia], [Goldenrod], [Green], [Indigo], [Khaki], [Maroon], [Mauve], [Pink], [Puce], [Purple], [Teal], [Turquoise], [Violet]
)) AS pivot_table;
