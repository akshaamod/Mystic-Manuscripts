-----------------------------------------------------------------------
--------QUALITY CONTROL CHECKS-----------------------------------------
-----------------------------------------------------------------------

-- [QC01]
-- Checking number of rows in database
SELECT count(*) FROM student.ctt_p1_datadynamo cpd;


-- [QC02] Q03
-- Checking gender columns are consistent
SELECT 
	* 
FROM 
	student.ctt_p1_datadynamo cpd 
WHERE 
	gender_bool = 1 AND gender = 'M' OR
	gender_bool = 0 AND gender = 'F';


-- [QC03]
-- Checking quarter columns are consistent with year and qtr
SELECT 
	*
FROM 
	student.ctt_p1_datadynamo cpd 
WHERE
	cpd.quarter NOT LIKE CONCAT(cpd.year, ' - Q',  cpd.qtr);


-- [QC04]
-- Checking number of distinct rows
SELECT
	count (DISTINCT (id))
FROM 
	student.ctt_p1_datadynamo cpd;


-- [QC05]
-- Count columns
SELECT 
	count(*)
FROM 
	information_schema.COLUMNS
WHERE 
	table_name = 'ctt_p1_datadynamo';


-- [QC06]
-- Eyeball Check
SELECT 
	*
FROM student.ctt_p1_datadynamo cpd 
WHERE id = 2026 OR id = 2956 OR id = 3188 OR id = 472 OR id = 365


-- [QC09]
-- Sum of Column sums
SELECT 
	sum(cpd.id) + sum(cpd.qtr) + sum(cpd.year) + sum(cpd.month) + sum(cpd.day) + sum(cpd.special_day) + sum(cpd.online_sale_offers) + sum(cpd.weekday) + sum(cpd.weekend) + sum(cpd.morning) + sum(cpd.afternoon) + sum(cpd.evening) + sum(cpd.night) + sum(cpd.gender_bool) + sum(cpd.item_price) + sum(cpd.quantity) + sum(cpd.shipping_price) + sum(cpd.ship_postal_code) + sum(cpd.total_amount) + sum(cpd.profit_percentage) + sum(cpd.profit_inr) + sum(cpd.cost_price)
FROM 
	student.ctt_p1_datadynamo cpd;


-- [QC10]
-- Sum of row sums
SELECT 
	sum(cpd.id + cpd.qtr + cpd.year + cpd.month + cpd.day + cpd.special_day + cpd.online_sale_offers + cpd.weekday + cpd.weekend + cpd.morning + cpd.afternoon + cpd.evening + cpd.night + cpd.gender_bool + cpd.item_price + cpd.quantity + cpd.shipping_price + cpd.ship_postal_code + cpd.total_amount + cpd.profit_percentage + cpd.profit_inr + cpd.cost_price)
FROM 
	student.ctt_p1_datadynamo cpd;


-- [QC11]
-- Count Nulls  (NOTE : COUNT(*) – COUNT(column_name)  is a better way to do this)
SELECT 
	sum(CASE WHEN cpd.id IS NULL THEN 1 ELSE 0 END ) AS id,
	sum(CASE WHEN cpd.purchase_date IS NULL THEN 1 ELSE 0 END ) AS purchase_date ,
	sum(CASE WHEN cpd."date" IS NULL THEN 1 ELSE 0 END ) AS "date",
	sum(CASE WHEN cpd."time" IS NULL THEN 1 ELSE 0 END ) AS "time" ,
	sum(CASE WHEN cpd.quarter IS NULL THEN 1 ELSE 0 END ) AS quarter ,
	sum(CASE WHEN cpd.qtr IS NULL THEN 1 ELSE 0 END ) AS qtr ,
	sum(CASE WHEN cpd.YEAR IS NULL THEN 1 ELSE 0 END ) AS year ,
	sum(CASE WHEN cpd."month" IS NULL THEN 1 ELSE 0 END ) AS "month" ,
	sum(CASE WHEN cpd."day" IS NULL THEN 1 ELSE 0 END ) AS "day" ,
	sum(CASE WHEN cpd.special_day IS NULL THEN 1 ELSE 0 END ) AS special_day ,
	sum(CASE WHEN cpd.online_sale_offers IS NULL THEN 1 ELSE 0 END ) AS online_sale_offers ,
	sum(CASE WHEN cpd.weekday IS NULL THEN 1 ELSE 0 END ) AS weekday ,
	sum(CASE WHEN cpd.weekend IS NULL THEN 1 ELSE 0 END ) AS weekend ,
	sum(CASE WHEN cpd.morning IS NULL THEN 1 ELSE 0 END ) AS morning ,
	sum(CASE WHEN cpd.afternoon IS NULL THEN 1 ELSE 0 END ) AS afternoon ,
	sum(CASE WHEN cpd.evening IS NULL THEN 1 ELSE 0 END ) AS evening ,
	sum(CASE WHEN cpd.night IS NULL THEN 1 ELSE 0 END ) AS night ,
	sum(CASE WHEN cpd.gender_bool IS NULL THEN 1 ELSE 0 END ) AS gender_bool ,
	sum(CASE WHEN cpd.customer IS NULL THEN 1 ELSE 0 END ) AS customer ,
	sum(CASE WHEN cpd.gender IS NULL THEN 1 ELSE 0 END ) AS gender ,
	sum(CASE WHEN cpd.product_name IS NULL THEN 1 ELSE 0 END ) AS product_name ,
	sum(CASE WHEN cpd.item_status IS NULL THEN 1 ELSE 0 END ) AS item_status ,
	sum(CASE WHEN cpd.quantity IS NULL THEN 1 ELSE 0 END ) AS quantity ,
	sum(CASE WHEN cpd.currency IS NULL THEN 1 ELSE 0 END ) AS currency ,
	sum(CASE WHEN cpd.item_price IS NULL THEN 1 ELSE 0 END ) AS item_price ,
	sum(CASE WHEN cpd.shipping_price IS NULL THEN 1 ELSE 0 END ) AS shipping_price ,
	sum(CASE WHEN cpd.ship_city IS NULL THEN 1 ELSE 0 END ) AS ship_city ,
	sum(CASE WHEN cpd.ship_state IS NULL THEN 1 ELSE 0 END ) AS ship_state ,
	sum(CASE WHEN cpd.ship_postal_code IS NULL THEN 1 ELSE 0 END ) AS ship_postal_code ,
	sum(CASE WHEN cpd.category IS NULL THEN 1 ELSE 0 END ) AS category ,
	sum(CASE WHEN cpd.total_amount IS NULL THEN 1 ELSE 0 END ) AS total_amount ,
	sum(CASE WHEN cpd.author IS NULL THEN 1 ELSE 0 END ) AS author ,
	sum(CASE WHEN cpd."publication" IS NULL THEN 1 ELSE 0 END ) AS "publication" ,
	sum(CASE WHEN cpd.profit_percentage IS NULL THEN 1 ELSE 0 END ) AS profit_percentage ,
	sum(CASE WHEN cpd.profit_inr IS NULL THEN 1 ELSE 0 END ) AS profit_inr ,
	sum(CASE WHEN cpd.cost_price IS NULL THEN 1 ELSE 0 END ) AS cost_price 
FROM 
	student.ctt_p1_datadynamo cpd ;


-- [QC12]
-- Get column sums, mins and maxs
SELECT 
	CONCAT(sum(cpd.id), ' | ', min(cpd.id), ' | ', max(cpd.id))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.qtr), ' | ', min(cpd.qtr), ' | ', max(cpd.qtr))
FROM 
	student.ctt_p1_datadynamo cpd ;
	
SELECT 
	CONCAT(sum(cpd.year), ' | ', min(cpd.year), ' | ', max(cpd.year))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.month), ' | ', min(cpd.month), ' | ', max(cpd.month))
FROM 
	student.ctt_p1_datadynamo cpd ;
	
SELECT 
	CONCAT(sum(cpd.day), ' | ', min(cpd.day), ' | ', max(cpd.day))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.special_day), ' | ', min(cpd.special_day), ' | ', max(cpd.special_day))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.online_sale_offers), ' | ', min(cpd.online_sale_offers), ' | ', max(cpd.online_sale_offers))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.weekday), ' | ', min(cpd.weekday), ' | ', max(cpd.weekday))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.weekend), ' | ', min(cpd.weekend), ' | ', max(cpd.weekend))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.morning), ' | ', min(cpd.morning), ' | ', max(cpd.morning))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.afternoon), ' | ', min(cpd.afternoon), ' | ', max(cpd.afternoon))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.evening), ' | ', min(cpd.evening), ' | ', max(cpd.evening))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.night), ' | ', min(cpd.night), ' | ', max(cpd.night))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.gender_bool), ' | ', min(cpd.gender_bool), ' | ', max(cpd.gender_bool))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.quantity), ' | ', min(cpd.quantity), ' | ', max(cpd.quantity))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.item_price), ' | ', min(cpd.item_price), ' | ', max(cpd.item_price))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.shipping_price), ' | ', min(cpd.shipping_price), ' | ', max(cpd.shipping_price))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.ship_postal_code), ' | ', min(cpd.ship_postal_code), ' | ', max(cpd.ship_postal_code))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.total_amount), ' | ', min(cpd.total_amount), ' | ', max(cpd.total_amount))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.profit_percentage), ' | ', min(cpd.profit_percentage), ' | ', max(cpd.profit_percentage))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.profit_inr), ' | ', min(cpd.profit_inr), ' | ', max(cpd.profit_inr))
FROM 
	student.ctt_p1_datadynamo cpd ;

SELECT 
	CONCAT(sum(cpd.cost_price), ' | ', min(cpd.cost_price), ' | ', max(cpd.cost_price))
FROM 
	student.ctt_p1_datadynamo cpd ;