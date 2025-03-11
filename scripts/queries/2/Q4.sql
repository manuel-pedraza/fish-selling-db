--4. For each customer, show all of the order's price and show the cumulative total
WITH OrderPrices AS
(
    SELECT o.id, SUM(fo.price) AS total_price
    FROM Orders AS o
        INNER JOIN FishOrder AS fo ON fo.orderId = o.id
    GROUP BY o.id
)

SELECT o.customerId, op.total_price AS 'Order Price',
    SUM(op.total_price) OVER(PARTITION BY CustomerID ORDER BY CustomerID Rows UNBOUNDED PRECEDING) AS 'Cumulative Total client'
FROM Orders AS o
INNER JOIN OrderPrices AS op ON o.id = op.id
ORDER BY o.customerId;
