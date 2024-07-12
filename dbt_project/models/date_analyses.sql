SELECT O.StoreID, O.OrderDate, SUM(O.Revenue) AS total_income
FROM {{ ref('orders_fact') }} O
GROUP BY O.StoreID, O.OrderDate
ORDER BY O.OrderDate