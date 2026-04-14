# 🏡 Nashville Housing Investment Insights

## 📊 Project Overview

This project delivers an end-to-end data analysis solution on the Nashville housing market, combining **SQL-based data cleaning** with **Power BI analytics and visualization**.

The goal is to transform raw housing data into actionable insights that support real estate investment decisions.

---

## 🎯 Objectives

* Identify **high-potential investment areas**
* Analyze **property price trends over time**
* Understand **key factors affecting property prices**
* Evaluate **buyer activity and market concentration**

---

## 🛠️ Tools & Technologies

* SQL (Data Cleaning & Preparation)
* Power BI (Data Modeling & Visualization)
* Power Query (ETL)
* DAX (Measures & Calculations)

---

## 🔄 End-to-End Data Workflow

### 1. Data Cleaning (SQL)

Initial data preparation was performed in SQL to ensure a clean and reliable dataset before visualization.

Key steps included:

* Removing duplicate records
* Standardizing column formats
* Handling missing values
* Fixing data inconsistencies
* Renaming incorrectly formatted columns (e.g., encoding issues)
* Validating dataset integrity

---

### 2. Data Transformation (Power Query)

After SQL cleaning, the dataset was loaded into Power BI for transformation:

* Removed unnecessary columns to improve performance
* Converted data types (dates, numeric values)
* Created structured date fields:

  * Year
  * Month
  * YearMonth
* Ensured consistency for analysis-ready data

---

### 3. Data Modeling

* Built a **star schema**:

  * Fact Table: Housing sales
  * Dimension Table: Date table
* Created a dedicated **Date Table** for time intelligence
* Established relationships between tables
* Disabled Auto Date/Time for performance optimization

---

## 📐 DAX Measures

```DAX
Total Revenue = SUM(Sales[SalePrice])

Average Sale Price = AVERAGE(Sales[SalePrice])

Total Properties Sold = COUNT(Sales[UniqueID])

Top 5 Investor Share = 
DIVIDE([Top 5 Transactions], [Total Transactions])
```

---

## 📊 Dashboard Structure

### 📍 Page 1: Market Overview

Provides a high-level summary of the housing market:

* KPI cards (Total Revenue, Avg Price, Total Properties Sold)
* Top 5 most active property markets
* Price comparison across areas
* Property price growth over time
* Property type analysis (land use)
* Bedroom impact on pricing
* Seasonal trends in property prices

---

### 📍 Page 2: Investment Insights

Focuses on decision-making and deeper analysis:

* Scatter plot identifying **high-demand, lower-priced markets**
* Investor activity analysis
* Market concentration (Top 5 investors = 1.56%)
* Key investment insight:

  * **Antioch identified as a high-potential market** due to:

    * Lower average property prices
    * High transaction volume
    * Low investor dominance

---

## 💡 Key Insights

* Property prices show a **consistent upward trend**
* High-value areas (e.g., Nashville) dominate pricing
* **Antioch presents strong investment potential**
* Market concentration is low, indicating **competitive accessibility**
* Property characteristics (bedrooms, land use) significantly impact pricing
* Seasonal trends suggest **mid-year price peaks**

---

## ⚡ Performance Optimization

* Data cleaned in SQL before loading into Power BI
* Reduced dataset size by removing unnecessary columns
* Used Power Query instead of excessive DAX columns
* Disabled Auto Date/Time
* Optimized measures for performance

---

## 🔄 Automation

* Structured pipeline: **SQL → Power BI → Dashboard**
* Reusable transformations in Power Query
* Designed for easy refresh with new data
* Scalable model for future dataset expansion

---

## 🚀 Future Improvements

* Add price per square foot analysis
* Improve investor identification (LLC/company mapping)
* Implement incremental refresh
* Integrate external economic indicators
* Enhance geographic analysis with optimized mapping

---

## 📷 Dashboard Preview

<img width="1436" height="803" alt="dashboard page 1" src="https://github.com/user-attachments/assets/3479d286-ce79-41ce-8337-fd02c072e849" />

<img width="1439" height="805" alt="dashnoard page 2" src="https://github.com/user-attachments/assets/25c222ef-4fe0-4ba9-b103-95eb31eb2f52" />


---

## 🧠 What I Learned

* Importance of **cleaning data at the source (SQL)** before visualization
* Building efficient data models improves performance significantly
* Strong dashboards focus on **decision-making, not just visuals**
* Combining SQL + Power BI creates a more robust analytics workflow

---

## 📌 Conclusion

This project demonstrates the ability to:

* Perform SQL-based data cleaning
* Design efficient ETL pipelines
* Build scalable data models
* Create insightful, decision-driven dashboards

---
