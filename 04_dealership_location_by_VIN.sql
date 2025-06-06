SELECT
	D.Name
    , D.Address
FROM
	dealerships D
    JOIN inventory I ON (D.Dealership_ID = I.Dealership_ID)
WHERE
	I.VIN = 'W9HATVK41KNWB3X0C';
