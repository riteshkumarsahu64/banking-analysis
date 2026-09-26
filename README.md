🚀 **Project Overview:**

In the banking and financial sector, understanding risk exposure, customer behavior, and product adoption is critical for sustainable growth. This project addresses these challenges by taking raw banking transaction records, executing rigorous data hygiene protocols in SQL, building advanced analytical KPIs using DAX, and presenting the insights via a multi-page executive dashboard.

**🛠️ Tech Stack & Tools:**

Database & Querying: MySQL (Data Cleaning, Transformation, and Aggregation)

Data Visualization & BI: Power BI Desktop

Modeling & Calculations: DAX (Data Analysis Expressions)

Version Control: Git & GitHub

---

**📊 Key Features & Analysis Pillars:**

**Data Cleaning & Preprocessing (MySQL):**

Handled and removed missing/null values to maintain data integrity.

Identified and dropped duplicate transaction and customer records.

Standardized date-time formats, currency fields, and categorical attributes.

**Customer Analysis:**

Segmented customers based on transaction volume, account tenure, and demographics.

Identified high-value customers and churn risk indicators.

**Loan & Risk Analysis:**

Evaluated loan default rates, risk distribution by credit score bands, and loan-to-income ratios.

Assessed portfolio risk exposure across different customer segments.

**Product Analysis:**

Tracked adoption rates and performance metrics across various banking products (Savings, Current Accounts, Personal Loans, Mortgages).

Identified top-performing revenue-generating products and underperforming services.

**Customer Satisfaction & Experience:**

Integrated customer feedback/satisfaction score ratings to correlate service quality with product retention.

---


**⚙️ Data Cleaning & Preparation (SQL Snapshot)**
The raw dataset containing 5,000 rows went through strict validation checks in MySQL:

Duplicate Removal: Checked primary keys and composite keys to eliminate redundant rows.

Missing Value Treatment: Imputed or filtered missing values in critical fields such as income, loan amount, and credit score.

Derived Columns: Created calculated columns for age groups, risk categorization, and transaction frequency buckets.

**📈 Power BI Dashboard Highlights**
The Power BI dashboard is structured into targeted analytical views:

Overview Page: High-level executive summary tracking Total Transactions, Total Loan Volume, Active Customers, and Overall Satisfaction Rate.

Loan Risk Analysis Page: Deep dive into non-performing loans (NPL), risk distribution tiers, and default likelihood indicators.
Customer Experience Page: Visualizations mapping customer satisfaction trends against service interaction channels and product types.

---

**Key DAX Measures Used**
Total Loan Amount:

Code snippet
Total Loan Volume = SUM(Banking_Transactions[Loan_Amount])
Default Rate (%):

Code snippet
Default Rate = DIVIDE(CALCULATE(COUNTROWS(Banking_Transactions), Banking_Transactions[Loan_Status] = "Default"), COUNTROWS(Banking_Transactions), 0)
Average Customer Satisfaction Score:

Code snippet
Avg Satisfaction = AVERAGE(Banking_Transactions[Satisfaction_Score])
