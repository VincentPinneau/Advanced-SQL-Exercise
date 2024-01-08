CREATE PROCEDURE ReportCustomerTurnover
	@Choice int = 1, 
	@Year int = 2013
AS
BEGIN
    SET NOCOUNT ON;

If @Choice = 1
    SELECT
        C.CustomerName
        , ISNULL(Jan, 0) AS Jan
        , ISNULL(Feb, 0) AS Feb
        , ISNULL(Mar, 0) AS Mar
        , ISNULL(Apr, 0) AS Apr
        , ISNULL(May, 0) AS May
        , ISNULL(Jun, 0) AS Jun
        , ISNULL(Jul, 0) AS Jul
        , ISNULL(Aug, 0) AS Aug
        , ISNULL(Sep, 0) AS Sep
        , ISNULL(Oct, 0) AS Oct
        , ISNULL(Nov, 0) AS Nov
        , ISNULL(Dec, 0) AS Dec
    FROM 
        Sales.Customers AS C
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Jan
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 01
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Jan
    ON 
    C.CustomerID = Jan.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Feb
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 02
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Feb
    ON 
    C.CustomerID = Feb.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Mar
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 03
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Mar
    ON 
    C.CustomerID = Mar.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Apr
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 04
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Apr
    ON 
    C.CustomerID = Apr.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS May
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 05
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS May
    ON 
    C.CustomerID = May.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Jun
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 06
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Jun
    ON 
    C.CustomerID = Jun.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Jul
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 07
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Jul
    ON 
    C.CustomerID = Jul.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Aug
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 08
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Aug
    ON 
    C.CustomerID = Aug.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Sep
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 09
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Sep
    ON 
    C.CustomerID = Sep.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Oct
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 10
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Oct
    ON 
    C.CustomerID = Oct.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Nov
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 11
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Nov
    ON 
    C.CustomerID = Nov.CustomerID
    LEFT JOIN
        (SELECT
            I.CustomerID
            , SUM(IL.UnitPrice * IL.Quantity) AS Dec
        FROM
            Sales.Invoices AS I
            , Sales.InvoiceLines AS IL
        WHERE
            I.InvoiceID = IL.InvoiceID
            AND MONTH(I.InvoiceDate) = 12
            AND YEAR(I.InvoiceDate) = @Year
        GROUP BY
            I.CustomerID) AS Dec
    ON 
    C.CustomerID = Dec.CustomerID
    ORDER BY C.CustomerName

ELSE
BEGIN
    IF @Choice = 2
        SELECT 
            C.CustomerName
            , ISNULL(Q1, 0) AS Q1
            , ISNULL(Q2, 0) AS Q2
            , ISNULL(Q3, 0) AS Q3
            , ISNULL(Q4, 0) AS Q4
        FROM 
            Sales.Customers AS C
        LEFT JOIN
            (SELECT
                I.CustomerID
                , SUM(IL.UnitPrice * IL.Quantity) AS Q1
            FROM
                Sales.Invoices AS I
                , Sales.InvoiceLines AS IL
            WHERE
                I.InvoiceID = IL.InvoiceID
                AND YEAR(I.InvoiceDate) = @Year
                AND MONTH(I.InvoiceDate) BETWEEN 1 AND 3
            GROUP BY
                I.CustomerID) AS Q1
        ON 
        C.CustomerID = Q1.CustomerID
        LEFT JOIN
            (SELECT
                I.CustomerID
                , SUM(IL.UnitPrice * IL.Quantity) AS Q2
            FROM
                Sales.Invoices AS I
                , Sales.InvoiceLines AS IL
            WHERE
                I.InvoiceID = IL.InvoiceID
                AND YEAR(I.InvoiceDate) = @Year
                AND MONTH(I.InvoiceDate) BETWEEN 4 AND 6
            GROUP BY
                I.CustomerID) AS Q2
        ON 
        C.CustomerID = Q2.CustomerID
        LEFT JOIN
            (SELECT
                I.CustomerID
                , SUM(IL.UnitPrice * IL.Quantity) AS Q3
            FROM
                Sales.Invoices AS I
                , Sales.InvoiceLines AS IL
            WHERE
                I.InvoiceID = IL.InvoiceID
                AND YEAR(I.InvoiceDate) = @Year
                AND MONTH(I.InvoiceDate) BETWEEN 7 AND 9
            GROUP BY
                I.CustomerID) AS Q3
        ON 
        C.CustomerID = Q3.CustomerID
        LEFT JOIN
            (SELECT
                I.CustomerID
                , SUM(IL.UnitPrice * IL.Quantity) AS Q4
            FROM
                Sales.Invoices AS I
                , Sales.InvoiceLines AS IL
            WHERE
                I.InvoiceID = IL.InvoiceID
                AND YEAR(I.InvoiceDate) = @Year
                AND MONTH(I.InvoiceDate) BETWEEN 10 AND 12
            GROUP BY
                I.CustomerID) AS Q4
        ON 
        C.CustomerID = Q4.CustomerID
        ORDER BY C.CustomerName

     ELSE
        SELECT
            C.CustomerName
            , ISNULL([2013], 0) AS [2013]
            , ISNULL([2014], 0) AS [2014]
            , ISNULL([2015], 0) AS [2015]
            , ISNULL([2016], 0) AS [2016]
        FROM 
            Sales.Customers AS C
        LEFT JOIN
            (SELECT
                I.CustomerID
                , SUM(IL.UnitPrice * IL.Quantity) AS [2013]
            FROM
                Sales.Invoices AS I
                , Sales.InvoiceLines AS IL
            WHERE
                I.InvoiceID = IL.InvoiceID
                AND YEAR(I.InvoiceDate) = 2013
            GROUP BY
                I.CustomerID) AS [2013]
        ON 
        C.CustomerID = [2013].CustomerID
        LEFT JOIN
            (SELECT
                I.CustomerID
                , SUM(IL.UnitPrice * IL.Quantity) AS [2014]
            FROM
                Sales.Invoices AS I
                , Sales.InvoiceLines AS IL
            WHERE
                I.InvoiceID = IL.InvoiceID
                AND YEAR(I.InvoiceDate) = 2014
            GROUP BY
                I.CustomerID) AS [2014]
        ON
        C.CustomerID = [2014].CustomerID
        LEFT JOIN
            (SELECT
                I.CustomerID
                , SUM(IL.UnitPrice * IL.Quantity) AS [2015]
            FROM
                Sales.Invoices AS I
                , Sales.InvoiceLines AS IL
            WHERE
                I.InvoiceID = IL.InvoiceID
                AND YEAR(I.InvoiceDate) = 2015
            GROUP BY
                I.CustomerID) AS [2015]
        ON
        C.CustomerID = [2015].CustomerID
        LEFT JOIN
            (SELECT
                I.CustomerID
                , SUM(IL.UnitPrice * IL.Quantity) AS [2016]
            FROM
                Sales.Invoices AS I
                , Sales.InvoiceLines AS IL
            WHERE
                I.InvoiceID = IL.InvoiceID
                AND YEAR(I.InvoiceDate) = 2016
            GROUP BY
                I.CustomerID) AS [2016]
        ON
        C.CustomerID = [2016].CustomerID
        ORDER BY C.CustomerName
END
END