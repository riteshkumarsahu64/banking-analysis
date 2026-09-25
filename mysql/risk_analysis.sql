-- Risk Analysis

-- Risk Distribution
SELECT risk_category, COUNT(DISTINCT Customer_id) AS customers
FROM banking_data
GROUP BY risk_category
ORDER BY customers desc;

-- Risk + Loan Status

SELECT risk_category,loan_status,count(*) AS customers
FROM banking_data
GROUP BY risk_category, loan_status
Order BY risk_category, customers DESC;