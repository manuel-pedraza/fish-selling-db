--8. Show the user code made of the first letter of his last name followed by his first name in lower case
SELECT LOWER(CONCAT(LEFT(c.firstName, 1) , c.lastName)) AS 'User_Code'
FROM Customers AS c;
