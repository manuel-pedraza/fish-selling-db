--2. Show the addresses for a fisherman in different lines(USING UNPIVOT)
SELECT fishermanId, address
FROM (
	SELECT fm.id AS fishermanId, addressLine1, addressLine2
    FROM Addresses AS a
        INNER JOIN Fishermen AS fm ON fm.addressId = a.id
) AS data
UNPIVOT(address FOR line IN (addressLine1, addressLine2) ) AS U;
