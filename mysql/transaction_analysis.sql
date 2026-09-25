-- Transaction Analysis

-- -- Transaction Type

SELECT transaction_type, count(DISTINCT customer_id) AS customers FROM banking_data
GROUP BY transaction_type
ORDER BY customers DESC;

----- Monthly transation 

SELECT
 date_format(transaction_date, '%Y-%m') AS Month,
 Count(*) AS transactions,
 SUM(transaction_amount) AS transction_value
 FROM banking_data
 GROUP BY date_format(transaction_date, '%Y-%m')
 ORDER BY month;
 
 