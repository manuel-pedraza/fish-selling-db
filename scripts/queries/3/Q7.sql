--7. Show first and last name of the customers with their two phone numbers, if the two are equal show null
SELECT c.FirstName, c.LastName, con.phoneNumber1,
    NULLIF(con.phoneNumber1, con.phoneNumber2)
FROM Customers AS c
    INNER JOIN Contacts AS con ON con.id = c.contactId
