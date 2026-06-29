-- Amazon Sales Dashboard - SQL Queries

-- 1. DATA EXTRACTION
SELECT *
FROM Orders;

-- 2. SALES ANALYSIS
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders;

SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Orders;

SELECT ROUND(SUM(Sales)/COUNT(DISTINCT Order_ID),2) AS Average_Order_Value
FROM Orders;

SELECT ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Percentage
FROM Orders;

-- 3. PRODUCT ANALYSIS
SELECT Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT Sub_Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

SELECT Product_Name, ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 4. CUSTOMER ANALYSIS
SELECT Customer_Name, ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM Orders;

SELECT Segment, ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 5. REGIONAL ANALYSIS
SELECT Region, ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT State, ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders
GROUP BY State
ORDER BY Total_Sales DESC;

-- 6. TIME ANALYSIS
SELECT YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
ROUND(SUM(Sales),2) AS Monthly_Sales
FROM Orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

SELECT YEAR(Order_Date) AS Year,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders
GROUP BY YEAR(Order_Date)
ORDER BY Year;

-- 7. PERFORMANCE ANALYSIS
SELECT Region,
ROUND(SUM(Sales),2) AS Sales,
ROUND(SUM(Profit),2) AS Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM Orders
GROUP BY Region
ORDER BY Sales DESC;

SELECT Category,
COUNT(Order_ID) AS Orders,
ROUND(SUM(Sales),2) AS Sales,
ROUND(SUM(Profit),2) AS Profit
FROM Orders
GROUP BY Category
ORDER BY Sales DESC;
