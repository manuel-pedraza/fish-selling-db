--3. Show the orders and the buyers, show the date with the next format: dd/MM/yyyy
SELECT o.id, FORMAT(o.dateToDeliver, 'dd/MM/yyyy') AS Date_To_Deliver, o.wasDelivered, c.*
FROM Orders AS o
INNER JOIN Customers AS c ON c.id = o.customerId;
