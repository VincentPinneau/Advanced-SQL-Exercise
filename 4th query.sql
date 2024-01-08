SELECT
    CustomerCategoryName
    , MaxLoss
    , CustomerName
    , CustomerID
FROM
    (SELECT
        CustomerCategoryName
        ,Max(Loss) AS MaxLoss
    FROM
        (SELECT
            CC.CustomerCategoryName
            ,SUM(OL.UnitPrice*OL.Quantity) AS Loss
            , C.CustomerID
        FROM 
            Sales.Customers AS C
            , Sales.CustomerCategories AS CC
            , Sales.Orders AS O
            , Sales.OrderLines AS OL
        WHERE
        C.CustomerCategoryID = CC.CustomerCategoryID
        AND C.CustomerID = O.CustomerID
        AND O.OrderID = OL.OrderID
        AND O.OrderID NOT IN(SELECT I.OrderID
                            FROM
                                Sales.Invoices AS I
                            )
        GROUP BY
            CC.CustomerCategoryName, C.CustomerID) AS TABLE1
    GROUP BY CustomerCategoryName) AS TABLE2
    ,(SELECT
            SUM(OL.UnitPrice*OL.Quantity) AS Loss
            , C.CustomerName
            , C.CustomerID
        FROM 
            Sales.Customers AS C
            , Sales.CustomerCategories AS CC
            , Sales.Orders AS O
            , Sales.OrderLines AS OL
        WHERE
        C.CustomerCategoryID = CC.CustomerCategoryID
        AND C.CustomerID = O.CustomerID
        AND O.OrderID = OL.OrderID
        AND O.OrderID NOT IN(SELECT I.OrderID
                            FROM
                                Sales.Invoices AS I
                            )
        GROUP BY
            C.CustomerName, C.CustomerID) AS TABLE3
WHERE
    MaxLoss = Loss
ORDER BY
	MaxLoss DESC