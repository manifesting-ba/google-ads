-- EDA
-- Create a separate table for analysis
CREATE TABLE ads_sales_analyzed
LIKE ads_sales_cleaned_v1;
INSERT INTO ads_sales_analyzed
SELECT *
FROM ads_sales_cleaned_v1;
SELECT *
FROM ads_sales_analyzed;

-- Executive Summary
-- Calculate total cost, revenue, and impressions of the campaign
SELECT SUM(Cost) AS Total_Cost, SUM(Sales) AS Total_Sale, SUM(Impressions) AS Total_Impressions
FROM ads_sales_analyzed;

-- Calculate ROAS, CTR, CVR, CPC, CPA of the campaign
SELECT ROUND((SUM(Sales)/SUM(Cost))*100, 0) AS ROAS
FROM ads_sales_analyzed
WHERE Sales >= 0 AND Cost > 0;

SELECT ROUND((SUM(Clicks)/SUM(Impressions))*100, 2) AS CTR
FROM ads_sales_analyzed
WHERE Clicks >= 0 AND Impressions > 0;

SELECT ROUND((SUM(Conversions)/SUM(Clicks))*100, 2) AS CVR
FROM ads_sales_analyzed
WHERE Conversions >= 0 AND Clicks > 0;

SELECT ROUND(SUM(Cost)/SUM(Clicks), 2) AS CPC
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Clicks > 0;

SELECT ROUND(SUM(Cost)/SUM(Conversions), 2) AS CPA
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Conversions > 0;

-- 1.Ad performance
-- Calculate & add ROAS column
SELECT Campaign_Name, Sales, Cost, ROUND((Sales/Cost)*100, 0) AS ROAS
FROM ads_sales_analyzed;
ALTER TABLE ads_sales_analyzed 
ADD COLUMN ROAS INT;
UPDATE ads_sales_analyzed
SET ROAS = ROUND((Sales/Cost)*100, 0);
-- View top 10 campaigns with most ROAS
SELECT *
FROM ads_sales_analyzed
ORDER BY ROAS DESC
LIMIT 10;
-- View top 10 campaigns with least ROAS
SELECT *
FROM ads_sales_analyzed
WHERE ROAS IS NOT NULL
ORDER BY ROAS 
LIMIT 10;

-- Calculate & add CTR column
SELECT Campaign_Name, Clicks, Impressions, ROUND((Clicks/Impressions)*100, 2) AS CTR
FROM ads_sales_analyzed;
ALTER TABLE ads_sales_analyzed 
ADD COLUMN CTR DECIMAL(12, 2);
UPDATE ads_sales_analyzed
SET CTR = ROUND((Clicks/Impressions)*100, 2);
-- View top 10 campaigns with most CTR
SELECT *
FROM ads_sales_analyzed
ORDER BY CTR DESC
LIMIT 10;
-- View top 10 campaigns with least CTR
SELECT *
FROM ads_sales_analyzed
WHERE CTR IS NOT NULL
ORDER BY CTR
LIMIT 10;

-- Calculate & add CPC column
SELECT Campaign_Name, Cost, Clicks, ROUND(Cost/Clicks, 2) AS CPC
FROM ads_sales_analyzed;
ALTER TABLE ads_sales_analyzed 
ADD COLUMN CPC DECIMAL(12, 2);
UPDATE ads_sales_analyzed
SET CPC = ROUND(Cost/Clicks, 2);
-- View top 10 campaigns with most CPC
SELECT *
FROM ads_sales_analyzed
ORDER BY CPC DESC
LIMIT 10;
-- View top 10 campaigns with least CPC
SELECT *
FROM ads_sales_analyzed
WHERE CPC IS NOT NULL
ORDER BY CPC
LIMIT 10;

-- Calculate & add CPL column
SELECT Campaign_Name, Cost, Leads, ROUND(Cost/Leads, 2) AS CPL
FROM ads_sales_analyzed;
ALTER TABLE ads_sales_analyzed 
ADD COLUMN CPL DECIMAL(12, 2);
UPDATE ads_sales_analyzed
SET CPL = ROUND(Cost/Leads, 2);
-- View top 10 campaigns with most CPL
SELECT *
FROM ads_sales_analyzed
ORDER BY CPL DESC
LIMIT 10;
-- View top 10 campaigns with least CPL
SELECT *
FROM ads_sales_analyzed
WHERE CPL IS NOT NULL
ORDER BY CPL
LIMIT 10;

-- Calculate & add CPA column
SELECT Campaign_Name, Cost, Conversions, ROUND(Cost/Conversions, 2) AS CPA
FROM ads_sales_analyzed;
ALTER TABLE ads_sales_analyzed 
ADD COLUMN CPA DECIMAL(12, 2);
UPDATE ads_sales_analyzed
SET CPA = ROUND(Cost/Conversions, 2);

-- 2.Time-based performance
-- Add weekday column
SELECT DAYNAME(Ad_Date) AS weekday
FROM ads_sales_analyzed;
ALTER TABLE ads_sales_analyzed
ADD COLUMN weekday TEXT;
UPDATE ads_sales_analyzed
SET weekday = DAYNAME(Ad_Date);
-- How do ad performance vary by day of week?
-- Calculate total ads, average impressions, clicks, leads, conversions, sales, and costs of each weekday
SELECT weekday, 
       COUNT(DISTINCT Ad_ID) AS Total_ads,
       ROUND(SUM(Impressions)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Impressions,
       ROUND(SUM(Clicks)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Clicks,
       ROUND(SUM(Leads)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Leads,
       ROUND(SUM(Conversions)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Conversions,
       ROUND(SUM(Sales)/COUNT(DISTINCT Ad_ID), 2) AS Avg_Sales,
       ROUND(SUM(Cost)/COUNT(DISTINCT Ad_ID), 2) AS Avg_Cost
FROM ads_sales_analyzed
GROUP BY weekday
ORDER BY FIELD(weekday, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- Calculate ROAS, CTR, CVR, CPC of each weekday
SELECT weekday, ROUND((SUM(Sales)/SUM(Cost))*100, 0) AS ROAS
FROM ads_sales_analyzed
WHERE Sales >= 0 AND Cost > 0
GROUP BY weekday
ORDER BY FIELD(weekday, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

SELECT weekday, ROUND((SUM(Clicks)/SUM(Impressions))*100, 2) AS CTR
FROM ads_sales_analyzed
WHERE Clicks >= 0 AND Impressions > 0
GROUP BY weekday
ORDER BY FIELD(weekday, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

SELECT weekday, ROUND((SUM(Conversions)/SUM(Clicks))*100, 2) AS CVR
FROM ads_sales_analyzed
WHERE Conversions >= 0 AND Clicks > 0
GROUP BY weekday
ORDER BY FIELD(weekday, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

SELECT weekday, ROUND(SUM(Cost)/SUM(Clicks), 2) AS CPC
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Clicks > 0
GROUP BY weekday
ORDER BY FIELD(weekday, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- How do ad performance vary by month?
-- Calculate total ads, average impressions, clicks, leads, conversions, sales, and costs per ad in each month
SELECT SUBSTR(Ad_Date, 6, 2) AS Month, 
       COUNT(DISTINCT Ad_ID) AS Total_ads,
       ROUND(SUM(Impressions)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Impressions,
       ROUND(SUM(Clicks)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Clicks,
       ROUND(SUM(Leads)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Leads,
       ROUND(SUM(Conversions)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Conversions,
       ROUND(SUM(Sales)/COUNT(DISTINCT Ad_ID), 2) AS Avg_Sales,
       ROUND(SUM(Cost)/COUNT(DISTINCT Ad_ID), 2) AS Avg_Cost
FROM ads_sales_analyzed
GROUP BY SUBSTR(Ad_Date, 6, 2);

-- Calculate ROAS, CTR, CVR, CPC of each month
SELECT SUBSTR(Ad_Date, 6, 2) AS Month, ROUND((SUM(Sales)/SUM(Cost))*100, 0) AS ROAS
FROM ads_sales_analyzed
WHERE Sales >= 0 AND Cost > 0
GROUP BY SUBSTR(Ad_Date, 6, 2)
ORDER BY 1;

SELECT SUBSTR(Ad_Date, 6, 2) AS Month, ROUND((SUM(Clicks)/SUM(Impressions))*100, 2) AS CTR
FROM ads_sales_analyzed
WHERE Clicks >= 0 AND Impressions > 0
GROUP BY SUBSTR(Ad_Date, 6, 2)
ORDER BY 1;

SELECT SUBSTR(Ad_Date, 6, 2) AS Month, ROUND((SUM(Conversions)/SUM(Clicks))*100, 2) AS CVR
FROM ads_sales_analyzed
WHERE Conversions >= 0 AND Clicks > 0
GROUP BY SUBSTR(Ad_Date, 6, 2) 
ORDER BY 1;

SELECT SUBSTR(Ad_Date, 6, 2) AS Month, ROUND(SUM(Cost)/SUM(Clicks), 2) AS CPC
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Clicks > 0
GROUP BY SUBSTR(Ad_Date, 6, 2)
ORDER BY 1;

-- 3.Device analysis
-- Calculate total ads, average impressions, clicks, leads, and conversions of each device
SELECT Device, 
       COUNT(DISTINCT Ad_ID) AS Total_ads,
       ROUND(SUM(Impressions)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Impressions,
       ROUND(SUM(Clicks)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Clicks,
       ROUND(SUM(Leads)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Leads,
       ROUND(SUM(Conversions)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Conversions
FROM ads_sales_analyzed
GROUP BY Device;

-- Calculate ROAS, CTR, CVR, CPC, CPL, CPA of each device
SELECT Device, ROUND((SUM(Sales)/SUM(Cost))*100, 0) AS ROAS
FROM ads_sales_analyzed
WHERE Sales >= 0 AND Cost > 0
GROUP BY Device;

SELECT Device, ROUND((SUM(Clicks)/SUM(Impressions))*100, 2) AS CTR
FROM ads_sales_analyzed
WHERE Clicks >= 0 AND Impressions > 0
GROUP BY Device;

SELECT Device, ROUND((SUM(Conversions)/SUM(Clicks))*100, 2) AS CVR
FROM ads_sales_analyzed
WHERE Conversions >= 0 AND Clicks > 0
GROUP BY Device;

SELECT Device, ROUND(SUM(Cost)/SUM(Clicks), 2) AS CPC
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Clicks > 0
GROUP BY Device;

SELECT Device, ROUND(SUM(Cost)/SUM(Leads), 2) AS CPL
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Leads > 0
GROUP BY Device;

SELECT Device, ROUND(SUM(Cost)/SUM(Conversions), 2) AS CPA
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Conversions > 0
GROUP BY Device;

-- 4.Keyword analysis
-- Calculate total ads, average impressions, clicks, leads, and conversions of each keyword
SELECT Keyword, 
       COUNT(DISTINCT Ad_ID) AS Total_ads,
       ROUND(SUM(Impressions)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Impressions,
       ROUND(SUM(Clicks)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Clicks,
       ROUND(SUM(Leads)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Leads,
       ROUND(SUM(Conversions)/COUNT(DISTINCT Ad_ID), 0) AS Avg_Conversions
FROM ads_sales_analyzed
GROUP BY Keyword;

-- Calculate ROAS, CTR, CVR, CPC, CPA for each keyword
SELECT Keyword, ROUND((SUM(Sales)/SUM(Cost))*100, 0) AS ROAS
FROM ads_sales_analyzed
WHERE Sales >= 0 AND Cost > 0
GROUP BY Keyword
ORDER BY 1;

SELECT Keyword, ROUND((SUM(Clicks)/SUM(Impressions))*100, 2) AS CTR
FROM ads_sales_analyzed
WHERE Clicks >= 0 AND Impressions > 0
GROUP BY Keyword
ORDER BY 1;

SELECT Keyword, ROUND((SUM(Conversions)/SUM(Clicks))*100, 2) AS CVR
FROM ads_sales_analyzed
WHERE Conversions >= 0 AND Clicks > 0
GROUP BY Keyword
ORDER BY 1;

SELECT Keyword, ROUND(SUM(Cost)/SUM(Clicks), 2) AS CPC
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Clicks > 0
GROUP BY Keyword
ORDER BY 1;

SELECT Keyword, ROUND(SUM(Cost)/SUM(Conversions), 2) AS CPA
FROM ads_sales_analyzed
WHERE Cost >= 0 AND Conversions > 0
GROUP BY Keyword
ORDER BY 1;
