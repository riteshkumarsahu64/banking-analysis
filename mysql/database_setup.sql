CREATE DATABASE Banking_analysis2;

USE banking_analysis2;

CREATE TABLE banking_data(
transaction_id INT,
customer_id INT, 
account_id INT, 
transaction_date TEXT, 
age INT,
gender VARCHAR(10), 
city VARCHAR(50),
customer_segment VARCHAR(100),
account_type VARCHAR(50),
transaction_type VARCHAR(100),
transaction_amount DECIMAL(15,2),
account_balance DECIMAL(15,2),
credit_score int,
loan_flag VARCHAR(10),
loan_type VARCHAR(100),
loan_amount DECIMAL(15,2),
interest_rate DECIMAL(15,2), 
loan_status VARCHAR(10),
risk_category VARCHAR(50),
product_type VARCHAR(100),
channel VARCHAR(150),
customer_status VARCHAR(10),
complaint_flag VARCHAR(10),
satisfaction_rating INT,
MyUnknownColumn text,
MyUnknownColumn_ text);

-- loading file from csv

LOAD DATA LOCAL INFILE 'C:/Users/Komesh/Downloads/banking_data_5000_rows.csv'
INTO TABLE banking_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- updating the date from string to  date 
SELECT*from banking_data;
SET SQL_SAFE_UPDATES = 0;
UPDATE banking_data
SET transaction_date = STR_TO_DATE(transaction_date, '%d-%m-%Y');

