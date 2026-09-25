SELECT * from banking_data;	

--  Validating the data
SELECT COUNT(*) FROM banking_data;
SELECT * FROM banking_data LIMIT 10; 
SELECT MIN(transaction_date), MAX(transaction_date) FROM banking_data; 
SELECT COUNT(DISTINCT customer_id) FROM banking_data;


-- checking null, or empty cells from the coloumn
SELECT 
SUM(transaction_id IS NULL OR TRIM(transaction_id) = ''),
SUM(customer_id IS NULL OR TRIM(customer_id)=''),
SUM(account_id IS NULL OR TRIM(account_id ) = ''),
SUM(transaction_date IS NULL OR TRIM(transaction_date) = ''),
SUM(age IS NULL OR TRIM(age ) = ''),
SUM(gender IS NULL OR TRIM(gender) = ''),
SUM(city IS NULL OR TRIM(city) = ''),
SUM(customer_segment IS NULL OR TRIM(customer_segment) = ''),
SUM(account_type IS NULL OR TRIM(account_type) = ''),
SUM(transaction_type IS NULL OR TRIM(transaction_type ) = ''),
SUM(transaction_amount IS NULL OR TRIM(transaction_amount) = ''),
SUM(account_balance IS NULL OR TRIM(account_balance) = ''),
SUM(credit_score IS NULL OR TRIM(credit_score) = ''),
SUM(loan_flag IS NULL OR TRIM(loan_flag) = '') ,
SUM(loan_type IS NULL OR TRIM(loan_type) = ''),
SUM(loan_amount IS NULL OR TRIM(loan_amount) = ''),
SUM(interest_rate IS NULL OR TRIM(interest_rate) = ''),
SUM(loan_status IS NULL OR TRIM(loan_status) = '') ,
SUM(risk_category IS NULL OR TRIM(risk_category) = ''),
SUM(product_type IS NULL OR TRIM(product_type) = ''),
SUM(channel IS NULL OR TRIM(channel ) = ''),
SUM(customer_status IS NULL OR TRIM(customer_status) = ''),
SUM(complaint_flag IS NULL OR TRIM(complaint_flag) = ''),
SUM(satisfaction_rating IS NULL OR TRIM(satisfaction_rating) = ''),
SUM(MyUnknownColumn IS NULL OR TRIM(MyUnknownColumn) = ''),
SUM(MyUnknownColumn_ IS NULL OR TRIM(MyUnknownColumn_) = '') from banking_data;

#-------------------------------------------------------------------------------------------------

-- replacing the empty celles from gender as Other, City as unknown
SET SQL_SAFE_UPDATES = 0;

UPDATE banking_data 
SET 
    gender = 'Other'
WHERE
    gender = '' OR gender IS NULL;

UPDATE banking_data 
SET 
    city = 'Unknown'
WHERE
    city = '' OR city IS NULL;

SET SQL_SAFE_UPDATES = 1;

#-------------------------------------------------------------------------------------------------

--  Removing unwanted column
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE banking_data
DROP COLUMN MyUnknownColumn,
DROP COLUMN MyUnknownColumn_;
SET SQL_SAFE_UPDATES = 1;
#-------------------------------------------------------------------------------------------------
-- Duplicates checking
SELECT 
    *
FROM
    banking_data
WHERE
    transaction_id IN (SELECT 
            transaction_id
        FROM
            banking_data
        GROUP BY transaction_id
        HAVING COUNT(*) > 1);

#-------------------------------------------------------------------------------------------------


-- removing dupicates by creating a temp id
ALTER TABLE banking_data
ADD COLUMN temp_id INT AUTO_INCREMENT PRIMARY KEY;

DELETE b1 FROM banking_data b1
        JOIN
    banking_data b2 ON b1.transaction_id = b2.transaction_id
        AND b1.temp_id > b2.temp_id;
 
 ALTER TABLE banking_data
DROP COLUMN temp_id;

#-------------------------------------------------------------------------------------------------

-- checking invalid values for specific coloumns

SELECT * FROM banking_data WHERE credit_score NOT BETWEEN 300 AND 850;
SELECT * FROM banking_data WHERE age < 18 OR age > 100;
SELECT * FROM banking_data WHERE transaction_amount < 0 OR account_balance < 0 OR loan_amount < 0;

#-------------------------------------------------------------------------------------------------

-- Updating the 0  values in credit score as null

SET SQL_SAFE_UPDATES = 0;
UPDATE banking_data
SET credit_score= NULL
Where credit_score NOT BETWEEN 300 AND 850;
SET SQL_SAFE_UPDATES = 1;

#-------------------------------------------------------------------------------------------------
