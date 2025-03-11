--5. Get the regional numbers of the phone numbers (only work for ### ### ####, ###-###-####)
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
