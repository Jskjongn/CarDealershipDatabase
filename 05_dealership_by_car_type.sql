SELECT
	D.Name
    , D.Address
    , V.VIN
FROM
	dealerships D
    JOIN inventory I ON (D.Dealership_ID = I.Dealership_ID)
    JOIN vehicles V ON (I.VIN = V.VIN)
WHERE
	V.Make = 'Toyota' AND V.Model = 'Tacoma' AND V.Vehicle_Type = 'Truck';