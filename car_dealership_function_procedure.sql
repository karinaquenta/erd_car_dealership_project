--Function: Updating a customers last name

SELECT *
FROM customer ;

CREATE OR REPLACE FUNCTION change_customer_ln(
	_customer_id INTEGER,
	_first_name VARCHAR(100),
	_last_name VARCHAR(100),
	new_last_name VARCHAR(100)
)
RETURNS VARCHAR(50) AS 
$function$
--$$
	BEGIN 
	UPDATE customer 
	SET last_name = new_last_name
	WHERE customer_id = _customer_id;
	RETURN CONCAT(_first_name,' ', new_last_name) AS full_name;
	END;
$function$
--$$
LANGUAGE plpgsql;

SELECT *
FROM customer ;

SELECT change_customer_ln(2, 'jane', 'roman', 'keke');

--Procedure: Add a new car to database

SELECT *
FROM inventory ;

CREATE OR REPLACE PROCEDURE add_car(
	_make VARCHAR(50),
	_model VARCHAR(50),
	_year INTEGER,
	_price DECIMAL(8,2),
	_serial_number INTEGER
)AS 
$$
	BEGIN 
		INSERT INTO "new_cars"(
			"make",
			"model",
			"year",
			"price",
			"serial_number"
		) VALUES (
			_make,
			_model,
			_year,
			_price,
			_serial_number
		);
		COMMIT;
	END
$$	
LANGUAGE plpgsql;

CALL add_car('Toyota', '4runner', 2024, 40155, 16191919)


SELECT *
FROM "new_cars" 
WHERE serial_number = 16191919;
	