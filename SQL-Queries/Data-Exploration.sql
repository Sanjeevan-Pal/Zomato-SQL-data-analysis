--- DATA EXPLORATION ---


-- Checking the number of rows and columns in each tables
-- PURPOSE: It would provide a better insight about the various tables

SELECT COUNT(*) AS Total_Content
FROM customers;
-- FINDING: There are total 33 rows in the 'customers' table

SELECT COUNT(*) AS Total_Column
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='customers';
-- FINDING: There are total of 3 columns in the 'customers' table

SELECT COUNT(*) AS Total_Content
FROM deliveries;
-- FINDING: There are total of 9,750 rows in the 'deliveries' table

SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='deliveries';
-- FINDING: There are total of 5 columns in the 'deliveries'table

SELECT COUNT(*) AS Total_Content
FROM orders;
-- FINDING: There are total of 10,000 rows in the 'orders' table

SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='orders';
-- FINDING: There are total of 8 columns in the 'orders' table

SELECT COUNT(*) AS Total_Content
FROM restaurants;
-- FINDING: There are total of 71 rows in the 'restaurants' table

SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='restaurants';
-- FINDING: There are total of 4 columns in the 'restaurants' table

SELECT COUNT(*) AS Total_Content
FROM riders;
-- FINDING: There are total of 34 rows in the 'riders' table

SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME='riders'; 
-- FINDING: There are total of 3 columns in the 'riders' table

-- Checking for the maximum and the minimum delivery-time
-- PURPOSE: Helps us to find the fastest and the slowest delivery 
SELECT 
  MAX(delivery_time) AS Max_Time,
  MIN(delivery_time) AS Min_Time
FROM deliveries;
-- FINDING: The fastest delivery-time is found out to be 1 second, while the most time-consuming being 24 hours

-- Checking for the status of the delivery 
-- PURPOSE: Helps us to find out the number of orders which are completed, being ordered and not delivered
SELECT 
  delivery_status, 
  COUNT(*) AS Total_Content
FROM deliveries
GROUP BY delivery_status
ORDER BY COUNT(*);
-- FINDING: There are total of 254 orders being made, 543 not delivered and 8953 delivered

-- Checking for the status of the orders
-- PURPOSE: Helps us to find out orders which are not fulfilled and the one which are fulfilled
SELECT
  order_status,
  COUNT(*)  
FROM orders
GROUP BY order_status;
-- FINDING: There are 250 not fulfilled orders, and 9750 being completed

-- Checking for the number of restaurants
SELECT COUNT(DISTINCT(restaurant_name)) AS Total_Restaurants
FROM restaurants;
-- FINDING: There are total of 71 restaurants

-- Checking for the number of cities
SELECT COUNT(DISTINCT(city)) AS Total_City
FROM restaurants;
-- FINDING: There are total of 11 cities

-- Checking for the number fo restaurants registered under each confirmation_sent_at
-- PURPOSE: Helps us to find the restaurant-distributions across various cities
SELECT 
  city AS City,
  COUNT(*) AS Total_Appearances
FROM restaurants
GROUP BY city
ORDER BY COUNT(*) DESC;
-- FINDING: Bengaluru has the most restaurants registered followed by Delhi, and Mumbai

-- Checking for the oldest sign_up and the latest one
SELECT 
  MIN(sign_up) AS Earliest_Sign_Up,
  MAX(sign_up) AS Latest_Sign_up
FROM riders;  
-- FINDING: The oldest one being the 5th May, 2023 and the latest one being the 5th August, 2024