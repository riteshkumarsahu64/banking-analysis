-- Creating KPIS for banking analysis 
select *from banking_data;
-- Customer KPIs
-- -- Total Customers
-- -- Active Customers
-- -- Inactive Customers
-- -- Dormant Customers
-- -- Customer Retention/Activity Rate


SELECT COUNT(DISTINCT customer_id) AS total_customer 
FROM banking_data; -- 2138 customers

SELECT COUNT(DISTINCT customer_id) As Active_customers FROM banking_data
WHERE customer_status = 'Active'; -- 1980 active customers

SELECT COUNT(DISTINCT customer_id) AS Inactive_Customers
FROM banking_data
WHERE customer_status = 'Inactive'; -- 556 inactive customers

SELECT COUNT(DISTINCT customer_id) AS Dormant_Customers
FROM banking_data
WHERE customer_status = 'Dormant'; -- 245 dormant customers

SELECT 
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN customer_status = 'Active' 
            THEN customer_id 
        END) * 100.0
        / COUNT(DISTINCT customer_id),
        2
    ) AS Activity_Rate
FROM banking_data; -- 92.61 activity rate 


-- Transaction KPIs
-- -- Total Transactions
-- -- Total Transaction Value
-- -- Average Transaction Value
-- -- Maximum Transaction
-- -- Transaction Volume by Type

SELECT COUNT(DISTINCT transaction_id) AS total_transactions
FROM banking_data; -- 4990 transations

SELECT SUM(transaction_amount) AS trasaction_value
FROM banking_data; -- 21862894.00 transaction VALUES

SELECT AVG(transaction_amount) AS Average_transaction_value
FROM banking_data; -- 4381.341483  Average transation VALUES

SELECT MAX(transaction_amount) AS max_transaction_value
FROM banking_data; -- 119312.97 MAX Transaction

SELECT transaction_type, SUM(transaction_amount) AS Transaction_Volume from banking_data
GROUP BY transaction_type
ORDER BY Transaction_Volume DESC;

-- UPI Payment	5499599.65
-- Deposit	4165184.95
-- Transfer	3610844.37
-- Card Payment	3529742.08
-- Withdrawal	2942513.34
-- ATM	2115009.61


-- Account KPIs
-- -- Total Account Balance
-- -- Average Account Balance
-- -- Accounts by Type
WITH latest_accounts AS (
    SELECT
        account_id,
        account_balance,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY transaction_date DESC
        ) AS rn
    FROM banking_data
)
SELECT 
    SUM(account_balance) AS total_account_balance
FROM latest_accounts
WHERE rn = 1; -- 226750325.01 Total Account Balance

SELECT AVG(account_balance) AS average_account_balance
FROM banking_data; -- 45440.946896 Average Account Balance

SELECT account_type, SUM(Account_balance) AS total_account_type_balance FROM banking_data
GROUP BY account_type;
-- Current	40435853.43
-- Salary	52288290.21
-- Savings	116416662.63
-- Fixed Deposit	17609518.74


-- Loan KPIs
-- -- Total Loan Customers
-- -- Total Loan Amount
-- -- Average Loan Amount
-- -- Active Loans
-- -- Closed Loans
-- -- Defaulted Loans
-- -- Loan Default Rate

SELECT COUNT(DISTINCT customer_id) as customers FROM banking_data
WHERE loan_flag='Yes'; -- 1078 LOAN customers

SELECT SUM(loan_amount) AS Total_loan_amount
FROM banking_data; -- 138886795.54 total loan amount

SELECT AVG(loan_amount) AS Average_Loan_Amount
FROM banking_data
WHERE loan_flag = 'Yes'; -- 27833.025158 AVG loan amount

SELECT COUNT(DISTINCT customer_id) AS Active_Loan_Customers
FROM banking_data
WHERE loan_status = 'Active'; -- 592 Active loans

SELECT COUNT(DISTINCT customer_id) AS Active_Loan_Customers
FROM banking_data
WHERE loan_status = 'Closed'; -- 372 Closed loans

SELECT COUNT(DISTINCT customer_id) AS Active_Loan_Customers
FROM banking_data
WHERE loan_status = 'Defaulted'; -- 109 defaulted loans

SELECT 
    COUNT(DISTINCT CASE WHEN loan_status = 'Defaulted' THEN customer_id END) * 100.0
    / COUNT(DISTINCT CASE WHEN loan_flag = 'Yes' THEN customer_id END) AS default_rate
FROM banking_data; -- 10.11132 default rate


-- Risk KPIs
-- High-Risk Customers
-- Medium-Risk Customers
-- Low-Risk Customers
-- Average Credit Score
-- Customer Experience
-- Complaint Rate
-- Average Satisfaction Rating

SELECT COUNT(DISTINCT customer_id) AS high_risk_customers
FROM banking_data
WHERE risk_category = 'High'; -- 722 high Risk customers

SELECT COUNT(DISTINCT customer_id) AS high_risk_customers
FROM banking_data
WHERE risk_category = 'Medium'; -- 1641 Medium risk customers

SELECT COUNT(DISTINCT customer_id) AS high_risk_customers
FROM banking_data
WHERE risk_category = 'Low'; -- 1046 Low risk customers

SELECT AVG(credit_score) AS AVG_credit_score FROM banking_data; -- 710.6059 AVG Credit score

SELECT 
    Round(Avg(satisfaction_rating)*100/5) AS avg_customer_experience
FROM banking_data
WHERE satisfaction_rating IS NOT NULL; -- 82 is the average customer experience rating

SELECT Round(COUNT(CASE WHEN complaint_flag= 'Yes' THEN 1 END)*100/ COUNT(complaint_flag)) AS complaints_rating
FROM banking_data; -- 12 is the complaint rating

SELECT 
    round(Avg(satisfaction_rating)) AS avg_customer_satisfaction
FROM banking_data
WHERE satisfaction_rating IS NOT NULL; -- 4 is the average rating

-- Channel
-- -- Mobile Banking Transactions
-- -- Internet Banking Transactions
-- -- ATM Transactions
-- -- Branch Transactions

SELECT channel, SUM(transaction_amount) AS total_transction_amount, Count(transaction_amount) AS no_of_transaction
FROM banking_data
GROUP BY channel;
-- channel      	total_transaction_amount	no_of_transaction
-- Mobile App		8421621.31					1889
-- Internet Banking	5143762.39					1217
-- ATM				3693610.54					884
-- Branch			3347305.94					717
-- Phone Banking	1256593.82					283

