--7. Show percentage of the price of an order compared to all the orders
SELECT o.id, SUM(fo.price) /  (SELECT SUM(fo2.price) FROM FishOrder AS fo2) * 100 AS '% of all orders'
FROM Orders AS o
    INNER JOIN FishOrder AS fo ON fo.orderId = o.id
GROUP BY o.id
