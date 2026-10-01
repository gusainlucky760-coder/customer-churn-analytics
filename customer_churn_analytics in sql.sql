-- Check the active database for the customer churn project

SELECT current_database();

-- Create the customer churn table for the cleaned ETL dataset

CREATE TABLE customer_churn_cleaned (
    customer_id VARCHAR(20),
    gender VARCHAR(20),
    senior_citizen INTEGER,
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure INTEGER,
    phone_service VARCHAR(30),
    multiple_lines VARCHAR(30),
    internet_service VARCHAR(30),
    online_security VARCHAR(30),
    online_backup VARCHAR(30),
    device_protection VARCHAR(30),
    tech_support VARCHAR(30),
    streaming_tv VARCHAR(30),
    streaming_movies VARCHAR(30),
    contract VARCHAR(30),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(50),
    monthly_charges NUMERIC(10,2),
    total_charges NUMERIC(12,2),
    churn VARCHAR(10),
    churn_flag INTEGER,
    estimated_lifetime_value NUMERIC(12,2),
    tenure_group VARCHAR(20),
    monthly_charge_group VARCHAR(20)
);

---SQL Analysis — Customer Churn--
Q1. Total number of customers
-- Q1: Calculate the total number of customers
SELECT COUNT(*) AS total_customers
FROM customer_churn_cleaned;

Q2. Total churned customers
-- Q2: Calculate the total number of churned customers
SELECT COUNT(*) AS churned_customers
FROM customer_churn_cleaned
WHERE churn = 'Yes';

Q3. Total retained customers
-- Q3: Calculate the total number of retained customers
SELECT COUNT(*) AS retained_customers
FROM customer_churn_cleaned
WHERE churn = 'No';

Q4. Overall churn rate
-- Q4: Calculate the overall customer churn rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned;

Q5. Customer distribution by gender
-- Q5: Analyze customer distribution by gender
SELECT
    gender,
    COUNT(*) AS total_customers
FROM customer_churn_cleaned
GROUP BY gender
ORDER BY total_customers DESC;

Q6. Churn rate by gender
-- Q6: Calculate churn rate by gender
SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY gender
ORDER BY churn_rate_percent DESC;

Q7. Churn rate by contract type
-- Q7: Analyze customer churn by contract type
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY contract
ORDER BY churn_rate_percent DESC;

Q8. Churn rate by Internet Service
-- Q8: Analyze customer churn by internet service type
SELECT
    internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY internet_service
ORDER BY churn_rate_percent DESC;

Q9. Churn rate by payment method
-- Q9: Analyze customer churn by payment method
SELECT
    payment_method,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY payment_method
ORDER BY churn_rate_percent DESC;

Q10. Churn rate by tenure group
-- Q10: Analyze customer churn by tenure group
SELECT
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY tenure_group
ORDER BY churn_rate_percent DESC;

Q11. Average Monthly Charges by churn status
-- Q11: Compare average monthly charges between churned and retained customers
SELECT
    churn,
    ROUND(AVG(monthly_charges), 2) AS average_monthly_charges
FROM customer_churn_cleaned
GROUP BY churn
ORDER BY churn;

Q12. Average Total Charges by churn status
-- Q12: Compare average total charges between churned and retained customers
SELECT
    churn,
    ROUND(AVG(total_charges), 2) AS average_total_charges
FROM customer_churn_cleaned
GROUP BY churn
ORDER BY churn;

Q13. Average tenure by churn status
-- Q13: Compare average customer tenure between churned and retained customers
SELECT
    churn,
    ROUND(AVG(tenure), 2) AS average_tenure_months
FROM customer_churn_cleaned
GROUP BY churn
ORDER BY churn;

Q14. Churn by senior citizen status
-- Q14: Analyze customer churn by senior citizen status
SELECT
    senior_citizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY senior_citizen
ORDER BY churn_rate_percent DESC;

Q15. Churn by customer tenure
-- Q15: Analyze churn distribution across customer tenure
SELECT
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customer_churn_cleaned
GROUP BY tenure_group
ORDER BY tenure_group;

Q16. Average Monthly Charges by contract
-- Q16: Calculate average monthly charges for each contract type
SELECT
    contract,
    ROUND(AVG(monthly_charges), 2) AS average_monthly_charges
FROM customer_churn_cleaned
GROUP BY contract
ORDER BY average_monthly_charges DESC;

Q17. Average tenure by contract
-- Q17: Calculate average customer tenure for each contract type
SELECT
    contract,
    ROUND(AVG(tenure), 2) AS average_tenure_months
FROM customer_churn_cleaned
GROUP BY contract
ORDER BY average_tenure_months DESC;

Q18. Churn by payment method
-- Q18: Count churned customers by payment method
SELECT
    payment_method,
    COUNT(*) AS churned_customers
FROM customer_churn_cleaned
WHERE churn = 'Yes'
GROUP BY payment_method
ORDER BY churned_customers DESC;

Q19. High-value customers
-- Q19: Identify customers with above-average estimated lifetime value
SELECT
    customer_id,
    tenure,
    monthly_charges,
    estimated_lifetime_value,
    churn
FROM customer_churn_cleaned
WHERE estimated_lifetime_value >
      (SELECT AVG(estimated_lifetime_value)
       FROM customer_churn_cleaned)
ORDER BY estimated_lifetime_value DESC;

Q20. Top 10 customers by estimated lifetime value
-- Q20: Identify the top 10 customers by estimated lifetime value
SELECT
    customer_id,
    tenure,
    monthly_charges,
    estimated_lifetime_value,
    churn
FROM customer_churn_cleaned
ORDER BY estimated_lifetime_value DESC
LIMIT 10;

Q21. Churned high-value customers
-- Q21: Identify high-value customers who have churned
SELECT
    customer_id,
    tenure,
    monthly_charges,
    estimated_lifetime_value,
    churn
FROM customer_churn_cleaned
WHERE churn = 'Yes'
ORDER BY estimated_lifetime_value DESC;

Q22. Churn by monthly charge group
-- Q22: Analyze customer churn by monthly charge group
SELECT
    monthly_charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY monthly_charge_group
ORDER BY churn_rate_percent DESC;

Q23. Churn by online security service
-- Q23: Analyze churn based on online security service
SELECT
    online_security,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY online_security
ORDER BY churn_rate_percent DESC;

Q24. Churn by tech support
-- Q24: Analyze churn based on technical support service
SELECT
    tech_support,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY tech_support
ORDER BY churn_rate_percent DESC;

Q25. Overall customer metrics
-- Q25: Generate a summary of key customer metrics
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN churn = 'No' THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(AVG(tenure), 2) AS average_tenure,
    ROUND(AVG(monthly_charges), 2) AS average_monthly_charges,
    ROUND(AVG(total_charges), 2) AS average_total_charges,
    ROUND(AVG(estimated_lifetime_value), 2) AS average_lifetime_value
FROM customer_churn_cleaned;

Q26. Final business summary by contract
-- Q26: Create a business summary by contract type
SELECT
    contract,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(AVG(tenure), 2) AS avg_tenure,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn_cleaned
GROUP BY contract
ORDER BY churn_rate_percent DESC;
