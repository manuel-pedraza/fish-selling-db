USE FishSellingDB
GO
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
--2. Show the addresses for a fisherman in different lines(USING UNPIVOT)
SELECT fishermanId, address
FROM (
	SELECT fm.id AS fishermanId, addressLine1, addressLine2
    FROM Addresses AS a
        INNER JOIN Fishermen AS fm ON fm.addressId = a.id
) AS data
UNPIVOT(address FOR line IN (addressLine1, addressLine2) ) AS U;
--3. Show the orders and the buyers, show the date with the next format: dd/MM/yyyy
SELECT o.id, FORMAT(o.dateToDeliver, 'dd/MM/yyyy') AS Date_To_Deliver, o.wasDelivered, c.*
FROM Orders AS o
INNER JOIN Customers AS c ON c.id = o.customerId;
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
    --5. Get the regional numbers of the phone numbers (only work for ### ### ####, ###-###-####) 
-- NOTE: THIS COULD BE BETTER
SELECT con.phoneNumber1, con.phoneNumber2,
	CASE 
		WHEN LEN(phoneNumber1) = 12 THEN LEFT(phoneNumber1, 3)
		WHEN LEN(phoneNumber1) = 19 THEN SUBSTRING(phoneNumber1, 8, 3)
		WHEN LEN(phoneNumber1) = 14 THEN SUBSTRING(phoneNumber1, 2, 3)
		ELSE NULL
	END AS Indicative1,
	CASE 
		WHEN LEN(phoneNumber2) = 12 THEN LEFT(phoneNumber2, 3)
		WHEN LEN(phoneNumber2) = 19 THEN SUBSTRING(phoneNumber2, 8, 3)
		WHEN LEN(phoneNumber2) = 14 THEN SUBSTRING(phoneNumber2, 2, 3)
		ELSE NULL
	END AS Indicative2
FROM Contacts AS con;
--6. Show the first and last name for the customers with their contact informations
SELECT c.firstName, c.lastName,
    COALESCE(con.email, con.phoneNumber1, con.phoneNumber2, 'Bad Client') AS 'Contact Types'
FROM Customers AS c
    INNER JOIN Contacts AS con ON con.id = c.contactId
--7. Show first and last name of the customers with their two phone numbers, if the two are equal show null
SELECT c.FirstName, c.LastName, con.phoneNumber1,
    NULLIF(con.phoneNumber1, con.phoneNumber2)
FROM Customers AS c
    INNER JOIN Contacts AS con ON con.id = c.contactId
--8. Show the user code made of the first letter of his last name followed by his first name in lower case
SELECT LOWER(CONCAT(LEFT(c.firstName, 1) , c.lastName)) AS 'User_Code'
FROM Customers AS c;
--9. Show the list of orders with their total due (US dollar format) with the due date of the order // other formats i.e. 'fr-ca','es-co'
WITH OrderPrices AS
(
    SELECT o.id, SUM(fo.price) AS total_due
    FROM Orders AS o
    INNER JOIN FishOrder AS fo ON fo.orderId = o.id
    GROUP BY o.id
)

SELECT o.id AS orderId, FORMAT(o.dateToDeliver, 'dd/MM/yyyy') AS date_due, FORMAT(total_due, 'C', 'en-us') AS total_due
FROM Customers AS c
INNER JOIN Orders AS o ON o.customerId = c.id
INNER JOIN OrderPrices AS op ON op.id = o.id
ORDER BY o.id;
GO
USE [master]
GO