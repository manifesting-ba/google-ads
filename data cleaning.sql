-- DATA CLEANING
-- Inspect the dataset
SELECT *
FROM ads_sales_raw;
-- Create a copy of the original dataset
CREATE TABLE ads_sales_cleaned_v1
LIKE ads_sales_raw;
INSERT INTO ads_sales_cleaned_v1
SELECT *
FROM ads_sales_raw;
SELECT * 
FROM ads_sales_cleaned_v1;

-- 1.Check for duplicates
-- Make sure there're 2600 unique ad ids
SELECT DISTINCT Ad_ID
FROM ads_sales_cleaned_v1;

WITH duplicate AS (
SELECT *, ROW_NUMBER() OVER(PARTITION BY Ad_ID) AS row_num
FROM ads_sales_cleaned_v1
)
SELECT *
FROM duplicate
WHERE row_num > 1;
-- There's no duplicates
SELECT *
FROM ads_sales_cleaned_v1;

-- 2.Fix misspellings
SELECT DISTINCT Campaign_Name
FROM ads_sales_cleaned_v1;
UPDATE ads_sales_cleaned_v1
SET Campaign_Name = REPLACE(Campaign_Name, "DataAnalyticsCourse", "Data Analytics Course");
UPDATE ads_sales_cleaned_v1
SET Campaign_Name = REPLACE(Campaign_Name, "Data Anlytics Corse", "Data Analytics Course");
UPDATE ads_sales_cleaned_v1
SET Campaign_Name = REPLACE(Campaign_Name, "Data Analytcis Course", "Data Analytics Course");
UPDATE ads_sales_cleaned_v1
SET Campaign_Name = REPLACE(Campaign_Name, "Data Analytics Corse", "Data Analytics Course");

UPDATE ads_sales_cleaned_v1
SET Keyword = REPLACE(Keyword, "analitics", "analytics");
UPDATE ads_sales_cleaned_v1
SET Keyword = REPLACE(Keyword, "anaytics", "analytics");
UPDATE ads_sales_cleaned_v1
SET Keyword = REPLACE(Keyword, "analytic", "analytics")
WHERE Keyword = "online data analytic";
SELECT DISTINCT Keyword
FROM ads_sales_cleaned_v1;

-- 3.Fix upper/lower case inconsistencies
-- Device column
UPDATE ads_sales_cleaned_v1
SET Device = CONCAT(UPPER(SUBSTR(Device, 1, 1)), LOWER(SUBSTR(Device, 2)));
SELECT DISTINCT Device
FROM ads_sales_cleaned_v1;

-- Location column
UPDATE ads_sales_cleaned_v1
SET Location = CONCAT(UPPER(SUBSTR(Location, 1, 1)), LOWER(SUBSTR(Location, 2)));
SELECT DISTINCT Location
FROM ads_sales_cleaned_v1;
-- Fix misspelling for Location
UPDATE ads_sales_cleaned_v1
SET Location = REPLACE(Location, "Hyderbad", "Hyderabad");
UPDATE ads_sales_cleaned_v1
SET Location = REPLACE(Location, "Hydrebad", "Hyderabad");

-- Standardize date format for Ad_Date
SELECT Ad_Date, STR_TO_DATE(Ad_Date, '%d-%m-%Y') 
FROM ads_sales_cleaned_v1
WHERE Ad_Date LIKE "%-%-%";
UPDATE ads_sales_cleaned_v1
SET Ad_Date = STR_TO_DATE(Ad_Date, '%d-%m-%Y')
WHERE Ad_Date LIKE "%-%-%";
SELECT Ad_Date, STR_TO_DATE(Ad_Date, '%m/%d/%Y')
FROM ads_sales_cleaned_v1;
UPDATE ads_sales_cleaned_v1
SET Ad_Date = STR_TO_DATE(Ad_Date, '%m/%d/%Y')
WHERE Ad_Date LIKE "%/%/%";
SELECT DISTINCT Ad_Date
FROM ads_sales_cleaned_v1;
ALTER TABLE ads_sales_cleaned_v1
MODIFY COLUMN Ad_Date DATE; -- update column text data type to date

-- Rename and change data type for Conversion Rate column
ALTER TABLE ads_sales_cleaned_v1
RENAME COLUMN `Conversion Rate` TO Conversion_Rate;

-- 4.Address nulls
-- Look for columns with nulls
SELECT Clicks -- contain nulls
FROM ads_sales_cleaned_v1
WHERE Clicks IS NULL;

SELECT Impressions -- contain nulls
FROM ads_sales_cleaned_v1
WHERE Impressions IS NULL;

SELECT Cost -- contain nulls
FROM ads_sales_cleaned_v1
WHERE Cost IS NULL;

SELECT Leads -- contain nulls
FROM ads_sales_cleaned_v1
WHERE Leads IS NULL;

SELECT Conversions -- contain nulls
FROM ads_sales_cleaned_v1
WHERE Conversions IS NULL;

SELECT Conversion_Rate -- contain nulls
FROM ads_sales_cleaned_v1
WHERE Conversion_Rate IS NULL;

SELECT Sale_Amount -- contain nulls
FROM ads_sales_cleaned_v1
WHERE Sale_Amount IS NULL;
-- There are 7 columns containing nulls; however, Conversion_Rate is the only one can be filled (conversion rate = conversions/clicks)

-- Recalculate conversion rate and convert it to %
WITH rate AS (
SELECT Ad_ID, Clicks, Conversions, ROUND((SUM(Conversions)/SUM(Clicks))*100, 1) AS Conversion_rate
FROM ads_sales_cleaned_v1
GROUP BY Ad_ID
)
UPDATE ads_sales_cleaned_v1 AS a
JOIN rate AS r 
  ON a.Ad_ID = r.Ad_ID
SET a.Conversion_Rate = r.Conversion_rate;

-- Convert Conversion_Rate, Cost, Sale_Amount data type to decimal
ALTER TABLE ads_sales_cleaned_v1
MODIFY COLUMN Conversion_Rate DECIMAL(19, 1);
UPDATE ads_sales_cleaned_v1
SET Cost = SUBSTR(Cost, 2);
ALTER TABLE ads_sales_cleaned_v1
MODIFY COLUMN Cost DECIMAL(19, 2);
UPDATE ads_sales_cleaned_v1
SET Sale_Amount = SUBSTR(Sale_Amount, 2);
ALTER TABLE ads_sales_cleaned_v1 
ADD COLUMN Sales DECIMAL(12,2);
UPDATE ads_sales_cleaned_v1
SET Sales = CAST(REPLACE(Sale_Amount, ',', '') AS DECIMAL(12,2));
ALTER TABLE ads_sales_cleaned_v1
DROP COLUMN Sale_Amount;
