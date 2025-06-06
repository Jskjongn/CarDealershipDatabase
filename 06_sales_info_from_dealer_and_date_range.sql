SELECT
	SC.*
    , D.Dealership_ID
FROM
	sales_contracts SC
    JOIN inventory I ON (SC.VIN = I.VIN)
    JOIN dealerships D ON (I.Dealership_ID = D.Dealership_ID)
WHERE
	D.Dealership_ID = 1 AND SC.Date BETWEEN '2024-01-01' AND '2025-01-01';