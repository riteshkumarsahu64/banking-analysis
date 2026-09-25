-- Product Analysis
USE banking_analysis2;
SELECT
    product_type,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(transaction_amount) AS transaction_value
FROM banking_data
GROUP BY product_type
ORDER BY transaction_value DESC;

-- Customer Satisfaction Analysis

SELECT
    satisfaction_rating,
    COUNT(*) AS customers
FROM banking_data
GROUP BY satisfaction_rating
ORDER BY satisfaction_rating;


SELECT
    complaint_flag,
    COUNT(*) AS customers,
    AVG(satisfaction_rating) AS avg_satisfaction
FROM banking_data
GROUP BY complaint_flag;


SELECT
    customer_segment,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(transaction_amount) AS transaction_value,
    AVG(account_balance) AS avg_balance,
    AVG(credit_score) AS avg_credit_score,
    AVG(satisfaction_rating) AS avg_satisfaction
FROM banking_data
GROUP BY customer_segment
ORDER BY transaction_value DESC;