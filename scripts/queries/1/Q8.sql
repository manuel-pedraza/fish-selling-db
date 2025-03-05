--8. Show orders delivered in the year 2012 and after
SELECT *
FROM Orders
WHERE dateToDeliver > '20120101' AND dateToDeliver < '20250225' AND wasDelivered = 1
ORDER BY dateToDeliver;
