-- Loan Default Analysis
USE banking_analysis2;
SELECT
    COUNT(DISTINCT CASE WHEN loan_status = 'Defaulted' THEN customer_id END) AS defaulted_customers,
    COUNT(DISTINCT customer_id) AS total_unique_customers,
    ROUND(
        100 * COUNT(DISTINCT CASE WHEN loan_status = 'Defaulted' THEN customer_id END) / COUNT(DISTINCT customer_id),
        2
    ) AS default_rate_by_customer
FROM banking_data
WHERE loan_flag = 'Yes';

-- LOAN types
SELECT
    loan_type,
    COUNT(*) AS loans,
    SUM(loan_amount) AS total_loan_amount,
    COUNT(DISTINCT case WHEN loan_status = 'Defaulted' THEN customer_id END) AS defaults
FROM banking_data
WHERE loan_flag = 'Yes'
GROUP BY loan_type;
