DROP TABLE IF EXISTS "service ticket";  
CREATE TABLE "service_ticket"(
    "service_ticket_id" SERIAL NOT NULL,
    "serial_number" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "mechanics_id" INTEGER NOT NULL,
    "service_description" VARCHAR(250) NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    "dealership_id" INTEGER NOT NULL
);
ALTER TABLE
    "service_ticket" ADD PRIMARY KEY("service_ticket_id");
   
   
DROP TABLE IF EXISTS "service records";  
CREATE TABLE "service_records"(
    "service_records_id" SERIAL NOT NULL,
    "used_car_id" INTEGER NULL,
    "new_car_id" INTEGER NULL,
    "service_completed" VARCHAR(250) NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "mechanics_id" INTEGER NOT NULL,
    "service_ticket_id" INTEGER NOT NULL,
    "serial_number" INTEGER NOT NULL,
    "dealership_id" INTEGER NOT NULL
);
ALTER TABLE
    "service_records" ADD PRIMARY KEY("service_records_id");
   
   
CREATE TABLE "dealership"(
    "dealership_id" INTEGER NOT NULL,
    "sales_staff" INTEGER NOT NULL,
    "customers" INTEGER NOT NULL,
    "inventory" INTEGER NOT NULL,
    "service_shop" INTEGER NOT NULL,
    "service_data" INTEGER NOT NULL,
    "service_ticks" INTEGER NOT NULL
);
ALTER TABLE
    "dealership" ADD PRIMARY KEY("dealership_id");
   
DROP TABLE IF EXISTS "service shop";   
CREATE TABLE "service_shop"(
    "service_shop_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "mechanics_id" INTEGER NOT NULL,
    "serial_number" INTEGER NOT NULL,
    "service_records_id" INTEGER NOT NULL,
    "dealership_id" INTEGER NOT NULL
);
ALTER TABLE
    "service_shop" ADD PRIMARY KEY("service_shop_id");
   
   
CREATE TABLE "invoice"(
    "invoice_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    "address" VARCHAR(200) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "salesperson_id" INTEGER NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    "dealership_id" INTEGER NOT NULL
);
ALTER TABLE
    "invoice" ADD PRIMARY KEY("invoice_id");
   
   
DROP TABLE IF EXISTS "new cars";
CREATE TABLE "new_cars"(
    "new_car_id" SERIAL NOT NULL,
    "customer_id" INTEGER NULL,
    "salesperson_id" INTEGER NULL,
    "make" VARCHAR(50) NOT NULL,
    "model" VARCHAR(50) NOT NULL,
    "year" INTEGER NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NULL,
    "serial_number" INTEGER NOT NULL
);
ALTER TABLE
    "new_cars" ADD PRIMARY KEY("new_car_id");
   
   
CREATE TABLE "mechanics"(
    "mechanics_id" SERIAL NOT NULL,
    "serial_number" INTEGER NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "service_records_id" INTEGER NOT NULL,
    "service_ticket_id" INTEGER NOT NULL
);
ALTER TABLE
    "mechanics" ADD PRIMARY KEY("mechanics_id");
   
   
CREATE TABLE "salesperson"(
    "salesperson_id" SERIAL NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "used_car_id" INTEGER NULL,
    "new_car_id" INTEGER NULL,
    "invoice_id" INTEGER NULL,
    "dealership_id" INTEGER NOT NULL
);
ALTER TABLE
    "salesperson" ADD PRIMARY KEY("salesperson_id");
   
   
CREATE TABLE "inventory"(
    "inventory_id" INTEGER NOT NULL,
    "used_car_id" INTEGER NULL,
    "new_car_id" INTEGER NULL,
    "dealership_id" INTEGER NOT NULL,
    "service_ticket_id" INTEGER NULL,
    "serial_number" INTEGER NOT NULL
);
ALTER TABLE
    "inventory" ADD PRIMARY KEY("inventory_id");
   
CREATE TABLE "customer"(
    "customer_id" SERIAL NOT NULL,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    "address" VARCHAR(200) NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "payment_info" VARCHAR(100) NULL,
    "dealership_id" INTEGER NULL
);
ALTER TABLE
    "customer" ADD PRIMARY KEY("customer_id");
   
DROP TABLE IF EXISTS "used cars";   
CREATE TABLE "used_cars"(
    "used_car_id" SERIAL NOT NULL,
    "customer_id" INTEGER NULL,
    "salesperson_id" INTEGER NULL,
    "make" VARCHAR(50) NOT NULL,
    "model" VARCHAR(255) NOT NULL,
    "year" INTEGER NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    "service_records_id" INTEGER NOT NULL,
    "invoice_id" INTEGER NULL,
    "serial_number" INTEGER NOT NULL
);

ALTER TABLE "used_cars" ADD PRIMARY KEY("used_car_id");


------USED CAR
ALTER TABLE	"used_cars" ADD CONSTRAINT "used_cars_used_car_id_foreign" FOREIGN KEY("used_car_id") REFERENCES "customer"("customer_id");
------INVENTORY
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_used_car_id_foreign" FOREIGN KEY("used_car_id") REFERENCES "used_cars"("used_car_id");
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_new_car_id_foreign" FOREIGN KEY("new_car_id") REFERENCES "new_cars"("new_car_id");
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_dealership_id_foreign" FOREIGN KEY("dealership_id") REFERENCES "dealership"("dealership_id");
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_serial_number_foreign" FOREIGN KEY("serial_number") REFERENCES "used_cars"("serial_number");

-----SERVICE TICKET
ALTER TABLE "service_ticket" ADD CONSTRAINT "service_ticket_service_ticket_id_foreign" FOREIGN KEY("service_ticket_id") REFERENCES "customer"("customer_id");
ALTER TABLE "service_ticket" ADD CONSTRAINT "service_ticket_mechanics_id_foreign" FOREIGN KEY("mechanics_id") REFERENCES "mechanics"("service_ticket_id"); X
------MECHANICS
ALTER TABLE "mechanics" ADD CONSTRAINT "mechanics_serial_number_foreign" FOREIGN KEY("serial_number") REFERENCES "service_ticket"("mechanics_id"); X

--INVOICE
ALTER TABLE "invoice" ADD CONSTRAINT "invoice_dealership_id_foreign" FOREIGN KEY("dealership_id") REFERENCES "dealership"("dealership_id");
ALTER TABLE "invoice" ADD CONSTRAINT "invoice_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "used_cars"("used_car_id"); X
ALTER TABLE "invoice" ADD CONSTRAINT "invoice_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "salesperson"("salesperson_id");
ALTER TABLE "invoice" ADD CONSTRAINT "invoice_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "new_cars"("new_car_id");X
ALTER TABLE "invoice" ADD CONSTRAINT "invoice_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "customer"("customer_id"); X
---SERVICE RECORDS
ALTER TABLE "service_records" ADD CONSTRAINT "service_records_serial_number_foreign" FOREIGN KEY("serial_number") REFERENCES "used_cars"("used_car_id"); X
ALTER TABLE "service_records" ADD CONSTRAINT "service_records_service_records_id_foreign" FOREIGN KEY("service_records_id") REFERENCES "mechanics"("mechanics_id");
ALTER TABLE "service_records" ADD CONSTRAINT "service_records_serial_number_foreign" FOREIGN KEY("serial_number") REFERENCES "new_cars"("new_car_id"); X
ALTER TABLE "service_records" ADD CONSTRAINT "service records_mechanics_id_foreign" FOREIGN KEY("mechanics_id") REFERENCES "mechanics"("mechanics_id"); X
X
---SERVICE SHOP

ALTER TABLE "service_shop" ADD CONSTRAINT "service_shop_dealership_id_foreign" FOREIGN KEY("dealership_id") REFERENCES "dealership"("dealership_id");
ALTER TABLE "service_shop" ADD CONSTRAINT "service_shop_serial_number_foreign" FOREIGN KEY("serial_number") REFERENCES "service_records"("service_records_id"); X
ALTER TABLE "service_shop" ADD CONSTRAINT "service_shop_serial_number_foreign" FOREIGN KEY("serial_number") REFERENCES "service_ticket"("service_ticket_id"); X

----SALESPERSON
ALTER TABLE "salesperson" ADD CONSTRAINT "salesperson_dealership_id_foreign" FOREIGN KEY("dealership_id") REFERENCES "dealership"("dealership_id"); X

--------NEW CARS
 X
ALTER TABLE "new_cars" ADD CONSTRAINT "new_cars_new_car_id_foreign" FOREIGN KEY("new_car_id") REFERENCES "customer"("customer_id");

-------------DEALERSHIP
ALTER TABLE "dealership" ADD CONSTRAINT "dealership_customers_foreign" FOREIGN KEY("customers") REFERENCES "customer"("customer_id"); X
ALTER TABLE "dealership" ADD CONSTRAINT "dealership_service_ticks_foreign" FOREIGN KEY("service_ticks") REFERENCES "service_ticket"("dealership_id"); X
ALTER TABLE "dealership" ADD CONSTRAINT "dealership_service_data_foreign" FOREIGN KEY("service_data") REFERENCES "service_records"("service_records_id"); X
