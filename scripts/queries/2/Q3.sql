--3. Show the revenue of each FishOrder without doing any group by.
SELECT fo.price,
    100 * fo.price / SUM(fo.price) OVER() AS 'Percentage'
FROM FishOrder AS fo;