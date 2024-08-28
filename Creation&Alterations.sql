-----------------------------------------------------------------------
--------TABLE CREATION AND ALLTERATIONS--------------------------------
-----------------------------------------------------------------------

-- [CA01]
-- Setting up database tables
CREATE TABLE student.ctt_p1_datadynamo (
	id INT,
	purchase_date VARCHAR(30),
	"date" date,
	"time" time,
	quarter VARCHAR(20),
	qtr INT,
	"year" INT,
	"month" INT,
	"day" INT,
	special_day INT,
	online_sale_offers INT,
	weekday INT,
	weekend INT,
	morning INT,
	afternoon INT,
	evening INT,
	night INT,
	gender_bool INT,
	customer VARCHAR(20),
	gender VARCHAR(10),
	product_name VARCHAR(200),
	item_status VARCHAR(15),
	quantity INT,
	currency VARCHAR(10),
	item_price NUMERIC(10,2),
	shipping_price NUMERIC(10,2),
	ship_city VARCHAR(50),
	ship_state VARCHAR(50),
	ship_postal_code INT,
	category VARCHAR(15),
	total_amount NUMERIC(10,2),
	author VARCHAR(70),
	"publication" VARCHAR(100),
	profit_percentage NUMERIC(5,2),
	profit_inr NUMERIC(10,5),
	cost_price NUMERIC(10,5)
);


-- [CA02] 
-- Altering table to set boolean values to bool data type 
ALTER TABLE student.ctt_p1_datadynamo  --- WILL ALTER TABLE
ALTER COLUMN online_sale_offers
TYPE BOOL USING
		CASE online_sale_offers
			WHEN 1 THEN TRUE
			WHEN 0 THEN FALSE
		END ;
		
ALTER TABLE student.ctt_p1_datadynamo  --- WILL ALTER TABLE
ALTER COLUMN special_day
TYPE BOOL USING
		CASE special_day
			WHEN 1 THEN TRUE
			WHEN 0 THEN FALSE
		END ;
		
ALTER TABLE student.ctt_p1_datadynamo  --- WILL ALTER TABLE
ALTER COLUMN weekend
TYPE BOOL USING
		CASE weekend
			WHEN 1 THEN TRUE
			WHEN 0 THEN FALSE
		END ;
		
ALTER TABLE student.ctt_p1_datadynamo  --- WILL ALTER TABLE
ALTER COLUMN morning
TYPE BOOL USING
		CASE morning
			WHEN 1 THEN TRUE
			WHEN 0 THEN FALSE
		END ;

ALTER TABLE student.ctt_p1_datadynamo  --- WILL ALTER TABLE
ALTER COLUMN evening
TYPE BOOL USING
		CASE evening
			WHEN 1 THEN TRUE
			WHEN 0 THEN FALSE
		END ;

ALTER TABLE student.ctt_p1_datadynamo  --- WILL ALTER TABLE
ALTER COLUMN night
TYPE BOOL USING
		CASE night
			WHEN 1 THEN TRUE
			WHEN 0 THEN FALSE
		END ;
		
ALTER TABLE student.ctt_p1_datadynamo  --- WILL ALTER TABLE
ALTER COLUMN gender_bool
TYPE BOOL USING
		CASE gender_bool
			WHEN 1 THEN TRUE
			WHEN 0 THEN FALSE
		END ;
	
ALTER TABLE student.ctt_p1_datadynamo  --- WILL ALTER TABLE
ALTER COLUMN afternoon
TYPE BOOL USING
		CASE afternoon
			WHEN 1 THEN TRUE
			WHEN 0 THEN FALSE
		END ;	
		


-- [CA03]
-- Altering purchase date to set data type to timestamp
ALTER TABLE student.ctt_p1_datadynamo
ADD COLUMN purchase_date_2 timestamp;

UPDATE student.ctt_p1_datadynamo
SET purchase_date_2 = to_timestamp(concat("date", ' ', "time"), 'yyyy-mm-dd hh24-mi');

UPDATE student.ctt_p1_datadynamo
SET purchase_date = purchase_date_2 ;


-- [CA04]
-- Setting capitalisation correctly
UPDATE student.ctt_p1_datadynamo 
SET
	ship_city = upper(ship_city),
	ship_state = upper(ship_state),
	product_name = initcap(product_name),
	author = initcap(author),
	"publication" = initcap("publication"),
	category = lower(category)


-- [CA05]
-- Set primary key to ID
ALTER TABLE student.ctt_p1_datadynamo
ADD PRIMARY KEY (id)

