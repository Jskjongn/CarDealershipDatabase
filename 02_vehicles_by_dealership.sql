SELECT
	V.VIN
    , V.Make
    , V.Model
    , I.Dealership_ID
FROM
	vehicles V
    JOIN inventory I ON (V.VIN = I.VIN)
WHERE
	I.Dealership_ID = 1;
