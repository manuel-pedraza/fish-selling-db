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
