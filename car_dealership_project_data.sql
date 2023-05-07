

-----------------INSERTED SALESPERSON---------------
SELECT *
FROM salesperson ;

INSERT INTO salesperson (
	first_name,
	last_name,
	dealership_id 
)VALUES(
	'michael',
	'alas',
	700
)

INSERT INTO salesperson (
	first_name,
	last_name,
	dealership_id
)VALUES(
	'noel',
	'baker',
	800
)

INSERT INTO salesperson (
	first_name,
	last_name,
	dealership_id
)VALUES(
	'henry',
	'corrington',
	900
)

INSERT INTO salesperson (
	first_name,
	last_name,
	dealership_id
)VALUES(
	'bridget',
	'roloff',
	300
)
-----------------INSERTED USED CARS---------------
SELECT *
FROM "used_cars";

INSERT INTO "used_cars"(
    "make",
    "model",
    "year",
    "price",
    "service_records_id",
    "serial_number"
)VALUES(
	'Toyota',
	'Accord',
	2022,
	32300,
	404,
	8765444
)

INSERT INTO "used_cars"(
    "make",
    "model",
    "year",
    "price",
    "service_records_id",
    "serial_number"
)VALUES(
	'BMW',
	'X4 xDrive28i',
	2016,
	19700,
	404,
	8777744
)
-----------------INSERTED INVOICE---------------
SELECT *
FROM invoice ;

INSERT INTO invoice (
	customer_id,
	first_name,
	last_name,
	address,
	city,
	salesperson_id,
	price,
	dealership_id 
)VALUES(
	10,
	'toby',
	'que',
	'39 West Street',
	'Oakland',
	4,
	40000.00,
	444
)

INSERT INTO invoice (
	customer_id,
	first_name,
	last_name,
	address,
	city,
	salesperson_id,
	price,
	dealership_id 
)VALUES(
	3,
	'samantha',
	'lee',
	'4848 Elm Street',
	'San Jose',
	5,
	400.00,
	444
)
-----------------INSERTED NEW CARS---------------
SELECT *
FROM "new_cars" ;

INSERT INTO "new_cars" (
    "salesperson_id",
    "make",
    "model",
    "year",
    "price",
    "serial_number" 
)VALUES(
	3,
	'toyota',
	'limited rav4',
	2023,
	40000.00,
	999919999
)

INSERT INTO "new_cars" (
    "salesperson_id",
    "make",
    "model",
    "year",
    "price",
    "serial_number" 
)VALUES(
	4,
	'honda',
	'CRV',
	2020,
	35000.00,
	888919999
)
-----------------INSERTED DEALERSHIP---------------

SELECT *
FROM dealership ;

INSERT INTO dealership (
	"dealership_id",
	"sales_staff",
    "customers",
    "inventory",
    "service_shop",
    "service_data",
    "service_ticks"
)VALUES(
	444,
	10,
	500,
	44,
	3,
	222,
	433
)

INSERT INTO dealership (
	"dealership_id",
	"sales_staff",
    "customers",
    "inventory",
    "service_shop",
    "service_data",
    "service_ticks"
)VALUES(
	333,
	15,
	350,
	30,
	3,
	122,
	233
)

INSERT INTO dealership (
	"dealership_id",
	"sales_staff",
    "customers",
    "inventory",
    "service_shop",
    "service_data",
    "service_ticks"
)VALUES(
	111,
	6,
	35,
	15,
	3,
	80,
	35
)

INSERT INTO dealership (
	"dealership_id",
	"sales_staff",
    "customers",
    "inventory",
    "service_shop",
    "service_data",
    "service_ticks"
)VALUES(
	222,
	18,
	180,
	60,
	3,
	100,
	133
)
-----------------INSERTED CUSTOMERS----------------
SELECT *
FROM customer ;

INSERT INTO customer(
	first_name,
	last_name,
	address,
	city,
	payment_info
)VALUES(
	'sebastian',
	'smith',
	'100 Miracle Drive',
	'San Francisco',
	'3030 4050 7777'
)


INSERT INTO customer(
	first_name,
	last_name,
	address,
	city,
	payment_info
)VALUES(
	'toby',
	'que',
	'39 West Street',
	'Oakland',
	'1203 8760 8777'
)

INSERT INTO customer(
	first_name,
	last_name,
	address,
	city,
	payment_info
)VALUES(
	'samantha',
	'lee',
	'4848 Elm Street',
	'San Jose',
	'2222 5545 9876'
)

INSERT INTO customer(
	first_name,
	last_name,
	address,
	city,
	payment_info
)VALUES(
	'jane',
	'roman',
	'876 Arthur Avenue',
	'Atherton',
	'5555 7777 9899'
)

INSERT INTO customer(
	first_name,
	last_name,
	address,
	city,
	payment_info
)VALUES(
	'tony',
	'williams',
	'5 Oracle Avenue',
	'San Francisco',
	'4342 3111 9977'
)
-----------------INSERTED SERVICE TICKET----------
SELECT *
FROM service_ticket ;

INSERT INTO "service_ticket"(
 	"serial_number",
    "customer_id",
    "mechanics_id",
    "service_description",
    "price",
    "dealership_id"
)VALUES(
	2222876,
	4,
	5,
	'new spark plugs',
	650.00,
	444
)

INSERT INTO "service_ticket"(
 	"serial_number",
    "customer_id",
    "mechanics_id",
    "service_description",
    "price",
    "dealership_id"
)VALUES(
	563829,
	3,
	2,
	'new battery',
	450.00,
	333
)
-----------------INSERTED SERVICE SHOP-----------
SELECT *
FROM "service_shop" ;

INSERT INTO "service_shop"(
    "customer_id",
    "mechanics_id",
    "serial_number",
    "service_records_id",
    "dealership_id"
)VALUES (
	5,
	1,
	987777,
	333377,
	444
)

INSERT INTO "service_shop"(
    "customer_id",
    "mechanics_id",
    "serial_number",
    "service_records_id",
    "dealership_id"
)VALUES (
	4,
	3,
	888855,
	876539,
	333
)
-----------------INSERTED SERVICE RECORDS---------
SELECT *
FROM "service_records";

INSERT INTO "service_records"(
    "service_completed",
    "customer_id",
    "mechanics_id",
    "service_ticket_id",
    "serial_number",
    "dealership_id" 
)VALUES(
	'nail in passenger tire, new tire service',
	4,
	5,
	34567898,
	00005555,
	333
)

INSERT INTO "service_records"(
    "service_completed",
    "customer_id",
    "mechanics_id",
    "service_ticket_id",
    "serial_number",
    "dealership_id" 
)VALUES(
	'oil change',
	1,
	4,
	87654567,
	00004444,
	333
)
-----------------INSERTED MECHANICS---------------
SELECT *
FROM mechanics ;

INSERT INTO mechanics(
	serial_number,
	first_name,
	last_name,
	service_records_id,
	service_ticket_id
)VALUES(
	1234,
	'jonathan',
	'angeles',
	707,
	100707
)

INSERT INTO mechanics(
	serial_number,
	first_name,
	last_name,
	service_records_id,
	service_ticket_id
)VALUES(
	1334,
	'colin',
	'bush',
	808,
	100808
)

INSERT INTO mechanics(
	serial_number,
	first_name,
	last_name,
	service_records_id,
	service_ticket_id
)VALUES(
	9899,
	'james',
	'booth',
	909,
	100909
)

INSERT INTO mechanics(
	serial_number,
	first_name,
	last_name,
	service_records_id,
	service_ticket_id
)VALUES(
	5566,
	'sam',
	'teller',
	505,
	100505
)