SELECT CustomerID, 
       CustomerName, 
	   Sum(TotalNBOrders)                        AS TotalNBOrders,
	   Sum(TotalNBInvoices)                      AS TotalNBInvoices,
	   Sum(OrdersTotalValue)                     AS OrderTotalValue,
       Sum(InvoicesTotalValue)                   AS InvoicesTotalValue,
       Abs(Sum(OrdersTotalValue - InvoicesTotalValue)) AS AbsoluteValueDifference 
FROM   ((SELECT C.CustomerID, 
                C.CustomerName,
				0                               AS TotalNBOrders,
				Count(DISTINCT I.InvoiceID)     AS TotalNBInvoices, 
                0                               AS OrdersTotalValue,
				Sum(IL.Quantity * IL.UnitPrice) AS InvoicesTotalValue
         FROM   Sales.Invoices AS I, 
                Sales.Invoicelines AS IL,
                Sales.Customers AS C
         WHERE  I.InvoiceID = IL.InvoiceID 
                AND I.CustomerID = C.CustomerID 
         GROUP  BY C.CustomerID, 
                   C.CustomerName) 
        UNION 
        (SELECT C.CustomerID, 
                C.CustomerName,
				Count(DISTINCT O.OrderID)       AS TotalNBOrders, 
				0                               AS TotalNBInvoices, 
				Sum(OL.Quantity * OL.UnitPrice) AS OrdersTotalValue,
                0                               AS InvoicesTotalValue 
         FROM   Sales.Customers AS C, 
                Sales.Invoices AS I, 
                Sales.Orders AS O, 
                Sales.OrderLines AS OL 
         WHERE  O.OrderID = OL.OrderID 
                AND O.CustomerID = C.CustomerID 
                AND I.OrderID = O.OrderID    
         GROUP  BY C.CustomerID, 
                   C.CustomerName))AS table1
GROUP  BY CustomerID, 
          CustomerName 
ORDER  BY AbsoluteValueDifference DESC, 
          TotalNBOrders ASC, 
          CustomerName ASC 