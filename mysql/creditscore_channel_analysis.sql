-- Credit Score Analysis

SELECT
    risk_category,
    ROUND(AVG(credit_score),2) AS avg_credit_score
FROM banking_data
GROUP BY risk_category;


-- Banking Channel Analysis

SELECT
channel, count(*) AS transaction,
SUM(transaction_amount) AS transaction_value,
AVG(transaction_amount) AS avg_amount
FROM banking_data
GROUP BY channel
ORDER BY transaction_value desc;

