# Customer Churn Analytics & Retention Analysis

> An end-to-end data analytics project focused on understanding customer churn, retention patterns, contract behavior, payment methods, tenure, customer charges, and customer lifetime value using Python, PostgreSQL, SQL, and Power BI.

---

## 📌 Overview

Customer churn is an important business problem because retaining existing customers is often critical for sustainable growth.

This project analyzes customer churn data to identify patterns associated with customer attrition and retention. The project follows an end-to-end analytics workflow starting from data cleaning and validation, followed by database integration, SQL-based business analysis, DAX calculations, and interactive Power BI dashboard development.

The analysis focuses on:

- Customer churn and retention
- Contract types
- Payment methods
- Customer tenure
- Monthly charges
- Customer Lifetime Value (CLV)
- Churn rate analysis
- Interactive business reporting

## 🎯 Business Objectives

The main objectives of this project are to:

- Analyze overall customer churn and retention
- Calculate the overall churn rate
- Identify churn patterns across contract types
- Analyze churned customers by payment method
- Understand the relationship between customer tenure and churn
- Analyze monthly charges across customer tenure
- Calculate key customer and churn KPIs
- Perform business analysis using SQL
- Build an interactive Power BI dashboard
- Present actionable customer churn insights through data visualization

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| Python | Data preparation and analysis |
| Pandas | Data cleaning and transformation |
| NumPy | Numerical analysis |
| PostgreSQL | Database storage |
| SQL | Business and customer churn analysis |
| Power BI | Interactive dashboard development |
| DAX | KPI and calculated measure development |
| Power Query | Data preparation in Power BI |


## 📊 Dataset

The dataset contains **7,043 customer records** with information related to:

- Customer demographics
- Customer tenure
- Contract type
- Internet service
- Payment method
- Monthly charges
- Customer Lifetime Value
- Churn status

The cleaned dataset used in the final analysis is included in this repository.


## 🧹 Data Cleaning & Preparation

The raw customer data was processed using Python, Pandas, and NumPy.

The preparation workflow included:

- Dataset inspection
- Data type validation
- Missing-value analysis
- Duplicate and data-quality checks
- Data cleaning
- Data transformation
- Feature engineering
- Churn-related feature preparation
- Tenure grouping
- Data validation
- Exporting the cleaned dataset

The final cleaned dataset was exported as:

`customer_churn_cleaned.csv`


## 🔄 ETL Workflow

```text
Raw Customer Data
        ↓
Python / Pandas / NumPy
        ↓
Data Cleaning & Validation
        ↓
Feature Engineering
        ↓
Cleaned CSV
        ↓
PostgreSQL Database
        ↓
SQL Business Analysis
        ↓
Power BI
        ↓
DAX Measures & KPIs
        ↓
Interactive Dashboard

🗄️ PostgreSQL Database

A PostgreSQL database was created for structured customer churn analysis.

Database: customer_churn_analytics

Table: customer_churn_cleaned

Records Loaded: 7,043

The cleaned customer dataset was successfully loaded into PostgreSQL and used for SQL-based analysis.

🔎 SQL Analysis

A total of 26 SQL analysis queries were prepared to analyze different aspects of customer churn and customer behavior.

The analysis covers:

Overall customer churn
Churn distribution
Contract analysis
Payment method analysis
Tenure analysis
Monthly charges
Customer Lifetime Value
Churn by contract type
Churn by payment method
Churn by tenure
Customer-level analysis
Customer retention patterns
📈 Power BI Dashboard

The Power BI dashboard provides an interactive view of customer churn and retention patterns.

Key Performance Indicators
KPI	Value
Total Customers	7.043K
Churned Customers	2K
Churn Rate	26.54%
Average Monthly Charges	64.76
Average Customer Lifetime Value	2.28K
Dashboard Visualizations

The dashboard includes:

Churn by Contract Type
Churn by Payment Method
Churn Status by Contract Type
Churn Rate by Tenure Group
Monthly Charges vs Tenure
Interactive Filters

Users can filter the dashboard using:

Contract Type
Internet Service
Payment Method
Senior Citizen
📊 Dashboard Preview

💡 Key Insights

The analysis identified several important churn patterns:

The overall customer churn rate is 26.54%.
Month-to-month contract customers show a substantially higher churn proportion compared with customers on longer-term contracts.
Customers with 0–12 months of tenure have the highest observed churn rate at approximately 47.4%.
Customers with more than 60 months of tenure have a much lower observed churn rate of approximately 6.6%.
Electronic check has the highest number of churned customers among the analyzed payment methods.
The dashboard visualizes the relationship between monthly charges and customer tenure.
🧮 DAX Measures
Churned Customers
Churned Customers =
CALCULATE(
    COUNTROWS(customer_churn_cleaned),
    customer_churn_cleaned[Churn] = "Yes"
)
Churn Rate
Churn Rate =
DIVIDE(
    [Churned Customers],
    COUNTROWS(customer_churn_cleaned),
    0
)
Additional Calculated Columns

The Power BI model also includes calculated columns for:

Churn Status
Tenure Group
Customer Index

These calculations support dashboard segmentation and visualization.

📁 Project Files
File	Description
customer_churn_cleaned.csv	Cleaned customer churn dataset
customer_churn_analytics in sql.sql	SQL analysis queries
customer_churn_analytics in power bi.pbix	Power BI dashboard and data model
customer-churn-analytics_Dashboard pic	Dashboard preview

🧠 Key Skills Demonstrated
Data Cleaning
Data Validation
Data Transformation
Feature Engineering
Exploratory Data Analysis
Python
Pandas
NumPy
PostgreSQL
SQL
DAX
Power BI
Data Visualization
KPI Development
Dashboard Development
Customer Churn Analysis
Retention Analysis
Business Analytics

🔗 Project Workflow
Data Collection
      ↓
Data Cleaning
      ↓
Data Validation
      ↓
Feature Engineering
      ↓
Exploratory Analysis
      ↓
PostgreSQL Database
      ↓
SQL Business Analysis
      ↓
Power BI Data Modeling
      ↓
DAX Measures
      ↓
Interactive Dashboard
      ↓
Business Insights


This project demonstrates an end-to-end data analytics workflow for customer churn analysis, from data preparation and database management to SQL analysis, DAX calculations, and interactive Power BI reporting.

The project showcases practical skills in Python, Pandas, NumPy, PostgreSQL, SQL, Power BI, DAX, data visualization, KPI analysis, and business analytics.
