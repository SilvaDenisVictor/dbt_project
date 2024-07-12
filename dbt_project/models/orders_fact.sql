SELECT
    O.OrderID,
    O.OrderDate,
    O.CustomerID,
    O.EmployeeID,
    O.StoreID,
    O.StatusCD,
    O.StatusDesc,
    O.Updated_at,
    Count(Distinct O.OrderID) as OrderCount,
    SUM(OI.TotalPrice) as Revenue
FROM
    {{ ref('orders_stg') }} O
JOIN
    {{ ref('orderitems_stg') }} OI ON O.OrderID = OI.OrderID
GROUP BY
    O.OrderID,
    O.OrderDate,
    O.CustomerID,
    O.EmployeeID,
    O.StoreID,
    O.StatusCD,
    O.StatusDesc,
    O.Updated_at