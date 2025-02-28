--9. Show the orders that have more than one fish order
SELECT o.id, dateToDeliver, wasDelivered, customerId, COUNT(o.id) no_fish_orders
FROM Orders AS o
    INNER JOIN FishOrder AS fo ON fo.orderId = o.id
    INNER JOIN FishCatch AS fc ON fc.id = fo.fishCatchId
GROUP BY o.id, dateToDeliver, wasDelivered, customerId
HAVING COUNT(o.id) > 1
