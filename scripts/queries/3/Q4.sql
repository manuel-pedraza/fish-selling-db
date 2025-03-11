--4. Show all the distinct world regions by their shortened version i.e. North America => NA
SELECT DISTINCT
	CASE 
		WHEN a.worldRegion LIKE 'East Asia and Pacific' THEN 'EAP'
		WHEN a.worldRegion LIKE 'Europe and Central Asia' THEN 'ECA'
		WHEN a.worldRegion LIKE 'Latin America and Caribbean' THEN 'LAC'
		WHEN a.worldRegion LIKE 'Middle East and North Africa' THEN 'MENA'
		WHEN a.worldRegion LIKE 'North America' THEN 'NA'
		WHEN a.worldRegion LIKE 'South Asia' THEN 'SA'
		WHEN a.worldRegion LIKE 'Sub-Saharan Africa' THEN 'SSA'
	END AS Region
FROM Addresses AS a;
    