create database customer_analysis;
use customer_analysis;

select * from customer;

 -- Total Customers --
 
 SELECT 
    COUNT(DISTINCT customer_id) AS total_customer
FROM
    customer;
    
    -- Gender Distribution --
    
SELECT 
    gender, COUNT(DISTINCT customer_id) AS total_customer
FROM
    customer
GROUP BY gender;

-- Revenue by Age Group --

SELECT 
    age_groups, ROUND(SUM(total_spend), 2) AS total_revenue
FROM
    customer
GROUP BY 1
ORDER BY 2 DESC;

-- Top 5 Spending Customers --

SELECT 
    customer_id, ROUND(SUM(total_spend), 2) AS total_spend
FROM
    customer
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Revenue by Category -- 

SELECT 
    category, ROUND(SUM(total_spend), 2) AS total_revenue
FROM
    customer
GROUP BY 1
ORDER BY 2 DESC;

-- Monthly Revenue Trend -- 

SELECT 
    month, ROUND(SUM(total_spend), 2) AS total_revenue
FROM
    customer
GROUP BY 1
ORDER BY 2 DESC;

-- Most Popular Payment Method --

SELECT 
    payment_method, COUNT(*) AS total_transaction
FROM
    customer
GROUP BY 1
ORDER BY 2 DESC;

-- Top 5 Shopping Malls by Revenue-- 

SELECT 
    shopping_mall, ROUND(SUM(total_spend), 2) AS total_revenue
FROM
    customer
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

