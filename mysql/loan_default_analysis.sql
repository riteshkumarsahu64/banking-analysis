-- Loan Default Analysis
USE banking_analysis2;
SELECT
    SUM(loan_status = 'Defaulted') AS defaulted_loans,
    COUNT(*) AS total_loans,
    ROUND(
        100 * SUM(loan_status = 'Defaulted') / COUNT(*),
        2
    ) AS default_rate
FROM banking_data
WHERE loan_flag = 'Yes';

-- LOAN types
SELECT
    loan_type,
    COUNT(*) AS loans,
    SUM(loan_amount) AS total_loan_amount,
    SUM(loan_status = 'Defaulted') AS defaults
FROM banking_data
WHERE loan_flag = 'Yes'
GROUP BY loan_type;