CREATE DATABASE sales_analytics;
USE sales_analytics;
SELECT database();

select count(*) from sales_data;

select * from sales_data limit 5 ;

describe sales_data;

select ORDERDATE from sales_data limit 3;

alter table sales_data modify column ORDERDATE date;

SELECT COUNT(*) FROM sales_data;
DESCRIBE sales_data;

-- Total revenue generated from all orders.
select sum(SALES) as Total_Sales from sales_data;

-- Totoal number of order 
select count(*) as Total_Order from sales_data;

-- Avg revenue per order record 
select round(avg(SALES),2) as Avg_Sales from sales_data;

-- Largest transaction value 
select max(SALES) AS Highest_Sale from sales_data ;


-- lowest transaction value
select min(SALES) AS Lowest_Sale from sales_data ;

-- No. of unique or different customer who place order
select count(distinct CUSTOMERNAME) as Unique_Customers from sales_data;

-- SQL was used to perform business analysis on the cleaned sales dataset. 
-- Key metrics such as total revenue, average sales value, unique customers, and geographical reach were calculated 
-- using aggregate functions including SUM(), AVG(), COUNT(), MAX(), and MIN().

-- Sales by year 
SELECT YEAR(ORDERDATE) AS Year,
       ROUND(SUM(SALES),2) AS Total_Sales
FROM sales_data
GROUP BY YEAR(ORDERDATE)
ORDER BY Year;

-- Sales by Month
SELECT MONTHNAME(ORDERDATE) AS Month,
       ROUND(SUM(SALES),2) AS Total_Sales
FROM sales_data
GROUP BY MONTHNAME(ORDERDATE),
         MONTH(ORDERDATE)
ORDER BY MONTH(ORDERDATE);


-- Sales by Product Line -- Find the most profitable product categories.
SELECT PRODUCTLINE,
       ROUND(SUM(SALES),2) AS Total_Sales
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY Total_Sales DESC;


-- Sales by Country-- Identify strongest markets.
SELECT COUNTRY,
       ROUND(SUM(SALES),2) AS Total_Sales
FROM sales_data
GROUP BY COUNTRY
ORDER BY Total_Sales DESC;

-- Deal Size Analysis
SELECT DEALSIZE,
       COUNT(*) AS Orders,
       ROUND(SUM(SALES),2) AS Total_Sales
FROM sales_data
GROUP BY DEALSIZE;


-- Order Status Analysis
SELECT STATUS,
       COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY STATUS
ORDER BY Total_Orders DESC;

-- Top 10 Customers
SELECT CUSTOMERNAME,
       ROUND(SUM(SALES),2) AS Total_Sales
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY Total_Sales DESC
LIMIT 10;


-- Top Customers Ranking
SELECT CUSTOMERNAME,
       ROUND(SUM(SALES),2) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(SALES) DESC) AS Customer_Rank
FROM sales_data
GROUP BY CUSTOMERNAME;

-- Average Order Value by Country
SELECT COUNTRY,
       ROUND(AVG(SALES),2) AS Avg_Order_Value
FROM sales_data
GROUP BY COUNTRY
ORDER BY Avg_Order_Value DESC;