-- ZOMATO DATA ANALYSIS USING SQL --

-- PROJECT: ZOMATO DATASET ANALYSIS
-- AUTHOR: SANJEEVAN
-- DATE: MARCH 2026
-- TOOL: SUPABASE

--- DATA CLEANING ---

SELECT COUNT(*) 
FROM customers;
-- There are total of 33 

SELECT COUNT(*)
FROM deliveries;

SELECT COUNT(*)
FROM riders;

SELECT COUNT(*)
FROM orders;

SELECT COUNT(*)
FROM restaurants;

-- Checking for the NULL values --
-- PURPOSE: For the proper analysisi of the dataset the NULL values must be handled accordingly 
SELECT 
  COUNT(*) - COUNT(customer_id) AS customer_id_NULL,
  COUNT(*) - COUNT(customer_name) AS customer_name_NULL,
  COUNT(*) - COUNT(reg_date) AS reg_date_NULL
FROM customers;
-- No null values are found in customers table

SELECT 
  COUNT(*) - COUNT(delivery_id) AS deliver_id_NULL,
  COUNT(*) - COUNT(order_id) AS order_id_NULL,
  COUNT(*) - COUNT(delivery_status) AS delivery_status_NULL,
  COUNT(*) - COUNT(delivery_time) AS delivery_time_NULL,
  COUNT(*) - COUNT(rider_id) AS rider_id_NULL
FROM deliveries;
-- Found 797 NULL values in the delivery_time coulmn, which is nearly 8% of the total rows present in the deliveries table
-- These NULL values correspond to the deliveries which are having 'delivery_status' of 'Order' or 'Not Delivered'
-- So these NULL values are meaningful, and must be retained for better analysis of the data

SELECT
  COUNT(*) - COUNT(order_id) AS order_id_NULL,
  COUNT(*) - COUNT(customer_id) AS customer_id_NULL,
  COUNT(*) - COUNT(restaurant_id) AS restaurant_id_NULL,
  COUNT(*) - COUNT(order_item) AS order_item_NULL,
  COUNT(*) - COUNT(order_date) AS order_date_NULL,
  COUNT(*) - COUNT(order_time) AS order_time_NULL,
  COUNT(*) - COUNT(order_status) AS order_status_NULL,
  COUNT(*) - COUNT(total_amount) AS total_amount_NULL
FROM orders;
-- No NULL values are found in orders table

SELECT   
  COUNT(*) - COUNT(restaurant_id) AS restaurant_id_NULL,
  COUNT(*) - COUNT(restaurant_name) AS restaurant_name_NULL,
  COUNT(*) - COUNT(city) AS city_NULL,
  COUNT(*) - COUNT(opening_hours) AS opening_hour_NULL
FROM restaurants;
-- No NULL values are found in the restaurants table

SELECT 
  COUNT(*) - COUNT(rider_id) AS rider_id_NULL,
  COUNT(*) - COUNT(rider_name) AS rider_name_NULL,
  COUNT(*) - COUNT(sign_up) AS sign_up_NULL
FROM riders;
-- No null values are found in the riders table

-- Checking for the duplicate values --
-- PURPOSE: Duplicate vlues may hamper the data-analysis by increasing the duplicacy and reducing the redundancy

SELECT *
FROM (
  SELECT *,
  ROW_NUMBER() OVER(
    PARTITION BY customer_id
    ORDER BY customer_id
  ) AS ROW_NUM
  FROM customers
) AS ROW
WHERE ROW_NUM>1;
-- FINDING: There is no duplicacy in the 'customers' table

-- Performing logical duplicacy check too in the 'deliveries' table
SELECT *
FROM (
  SELECT *,
  ROW_NUMBER() OVER(
    PARTITION BY
      delivery_id,
      order_id,
      rider_id
    ORDER BY 
      delivery_id,
      order_id,
      rider_id  
  ) AS ROW_NUM
  FROM deliveries
) AS ROW 
WHERE ROW_NUM>1;
-- FINDING: There is no duplicacy in the 'deliveries' table

-- Peforming logical duplicacy check too in the 'orders' table
SELECT *
FROM (
  SELECT *,
  ROW_NUMBER() OVER(
    PARTITION BY 
      order_id,
      customer_id,
      restaurant_id
    ORDER BY 
      order_id,
      customer_id,
      restaurant_id
  ) AS ROW_NUM
  FROM orders
) AS ROW
WHERE ROW_NUM>1;
-- FINDING: There is no duplicacy in the 'orders' table

SELECT *
FROM (
  SELECT *,
  ROW_NUMBER() OVER(
    PARTITION BY restaurant_id
    ORDER BY restaurant_id
  ) AS ROW_NUM
  FROM restaurants
) AS ROW 
WHERE ROW_NUM>1        
-- FINDING: There is no duplicacy in the 'restaurants' table

SELECT *
FROM (
  SELECT *,
  ROW_NUMBER() OVER(
    PARTITION BY rider_id
    ORDER BY rider_id
  ) AS ROW_NUM
  FROM riders          
 ) AS ROW
WHERE ROW_NUM>1;
-- FINDING: There is no duplicacy in the 'riders' table

--- END OF DATA CLEANING ---