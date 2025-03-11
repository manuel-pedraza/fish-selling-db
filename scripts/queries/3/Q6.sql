--6. Show the first and last name for the customers with their contact informations
SELECT c.firstName, c.lastName,
    COALESCE(con.email, con.phoneNumber1, con.phoneNumber2, 'Bad Client') AS 'Contact Types'
FROM Customers AS c
    INNER JOIN Contacts AS con ON con.id = c.contactId
