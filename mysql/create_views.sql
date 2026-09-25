-- Creating View for the banking_data

CREATE VIEW vw_monthly_transactions AS
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    COUNT(*) AS transaction_count,
    SUM(transaction_amount) AS transaction_value,
    AVG(transaction_amount) AS avg_transaction
FROM banking_data
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m');

CREATE VIEW vw_customer_segment AS
SELECT
    customer_segment,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(transaction_amount) AS transaction_value,
    AVG(account_balance) AS avg_balance,
    AVG(credit_score) AS avg_credit_score,
    AVG(satisfaction_rating) AS avg_satisfaction
FROM banking_data
GROUP BY customer_segment;

CREATE VIEW vw_loan_analysis AS
SELECT
    loan_type,
    loan_status,
    risk_category,
    COUNT(*) AS loan_count,
    SUM(loan_amount) AS loan_value,
    AVG(interest_rate) AS avg_interest_rate
FROM banking_data
WHERE loan_flag = 'Yes'
GROUP BY loan_type, loan_status, risk_category;

SELECT *from vw_loan_analysis;
SELECT *from vw_customer_segment;
SELECT *from vw_monthly_transactions ORDER BY month;