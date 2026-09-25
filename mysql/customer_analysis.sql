-- Customer Analysis 
----- Total Customers
USE banking_analysis2;
SELECT count(DISTINCT customer_id) AS total_customers
FROM banking_data;

----- Customers by Segment
SELECT
    customer_segment,
    COUNT(DISTINCT customer_id) AS customers
FROM banking_data
GROUP BY customer_segment
ORDER BY customers DESC;

----- Customers by City

SELECT 
city, COUNT(DISTINCT customer_id) AS customers
FROM banking_data
GROUP BY city
ORDER BY customers DESC;

----- Customers Status

SELECT 
customer_status, COUNT(DISTINCT customer_id) AS customers
FROM banking_data
GROUP BY customer_status
ORDER BY customers DESC;
