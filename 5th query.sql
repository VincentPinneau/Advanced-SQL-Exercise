SELECT
    *
FROM
    dbo.Customer AS C
WHERE
    C.CustomerID IN (SELECT
                        CustomerID
                    FROM
                        (SELECT 
                            CustomerID
                            , sum(Qty) as TotalQuantity
                        FROM
                            dbo.Purchase AS P
                        WHERE
                            P.CustomerID IN (SELECT C.CustomerID
                                            FROM dbo.Customer AS C
                                            WHERE NOT EXISTS
                                            (
                                                SELECT *
                                                FROM dbo.Product AS P 
                                                WHERE NOT EXISTS
                                                (
                                                    SELECT *
                                                    FROM dbo.Purchase AS Pu
                                                    WHERE Pu.CustomerID = C.CustomerID
                                                    AND	Pu.ProductID = P.ProductID
                                                )
                                            ))
                        GROUP BY
                            CustomerID) AS CustGroup
                    WHERE TotalQuantity > 50)