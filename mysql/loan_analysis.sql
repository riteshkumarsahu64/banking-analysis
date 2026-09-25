-- Loan Analysis

-- Loan Customers

SELECT COUNT(DISTINCT customer_id) as customers FROM banking_data
WHERE loan_flag='Yes'; -- 1078

-- Total Loan Amount

SELECT
    SUM(loan_amount) AS total_loan_amount
FROM banking_data
WHERE loan_flag = 'Yes'; -- 138886795.54 total loan amount


-- Loan Status

SELECT loan_status, count( DISTINCT customer_id) AS customers
FROM banking_data
GROUP BY loan_status
Order BY customers desc;