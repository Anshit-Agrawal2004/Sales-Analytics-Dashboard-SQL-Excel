CREATE TABLE superstore(
Order_id SERIAL PRIMARY KEY,
Customer_id INT,
Product_id INT,
Product_name VARCHAR(50),
Category VARCHAR(50),
Unit_price NUMERIC(10,2),
Quantity INT,
Order_date 	DATE,
Customer_age INT,
Customer_gender VARCHAR(20),
Country VARCHAR(50)
);

SELECT * FROM superstore;

-- Total Revenue
SELECT SUM(unit_price*quantity) AS Total_Revenue
FROM superstore;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM superstore;

-- Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM superstore;

-- Total Quantity Sold
SELECT SUM(quantity) AS Total_Quantity_Sold
FROM superstore;

-- Average Order Value
SELECT (SUM(unit_price*quantity)/SUM(quantity) AS Average_Order_Value
FROM superstore;

-- SALES Trend
ALTER TABLE superstore
ADD Revenue NUMERIC(10,2);

UPDATE superstore
SET Revenue = unit_price*quantity;

SELECT TO_CHAR(order_date,'Month') AS Months, SUM(Revenue) AS monthly_revenue
FROM superstore
GROUP BY Months
ORDER BY Months;

-- Repeated Customers
SELECT customer_id, COUNT(*) AS Total_Orders
FROM superstore
GROUP BY customer_id
HAVING COUNT(*)>1
ORDER BY Total_Orders DESC
LIMIT 5
;

-- Product wise Sales
SELECT product_name, SUM(Revenue) AS Total_Sales
FROM superstore
GROUP BY product_name
ORDER BY Total_Sales DESC;