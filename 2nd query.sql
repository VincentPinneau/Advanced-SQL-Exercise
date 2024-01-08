UPDATE Sales.InvoiceLines
SET UnitPrice = UnitPrice + 20
WHERE InvoiceLineID = (SELECT
							MIN(IL.InvoiceLineID)
						FROM
							Sales.Invoices AS I
							,Sales.InvoiceLines AS IL
						WHERE
							I.InvoiceID = IL.InvoiceID
							AND I.CustomerID = 1060)