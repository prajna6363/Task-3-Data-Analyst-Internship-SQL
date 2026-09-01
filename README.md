# SQL for Data Analysis — Data Analyst Internship Task 3

## 📌 Objective

The objective of this task was to use **SQL to extract, analyze, and manipulate e-commerce data** using a MySQL database. The task involved applying SQL queries to identify useful business insights from a dataset containing 10,000 records.

## 🛠️ Tools Used

* MySQL
* MySQL Workbench
* SQL
* GitHub
* CSV Dataset

## 📊 Dataset

**Dataset:** `ecommerce_dataset_10000.csv`

The dataset contains 10,000 e-commerce records with information about:

* Customer details
* Products
* Categories
* Orders
* Quantity and prices
* Order status
* Payment methods
* Ratings and reviews
* Dates
* Countries

## 🔍 SQL Concepts Implemented

* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* Aggregate functions: `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`
* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* Subqueries
* Views
* `COALESCE()`
* NULL handling
* Indexing
* `EXPLAIN` for query optimization

## 📈 Analysis Performed

### 1. Data Retrieval and Filtering

Used `SELECT` and `WHERE` to retrieve customer and order information and filter records based on specific conditions.

### 2. Sorting and Aggregation

Used `ORDER BY` to identify high-priced products and `GROUP BY` with aggregate functions to analyze product categories.

Revenue was calculated as:

**Revenue = Quantity × Unit Price**

### 3. Category Analysis

Calculated total revenue and average product price for each product category.

### 4. JOIN Analysis

Created separate customer and product tables from the original dataset and used `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` to combine related information.

### 5. Subquery Analysis

Used a subquery with `AVG()` to identify products whose prices were higher than the overall average product price.

### 6. View Creation

Created a `sales_analysis` view containing order information and calculated revenue for reusable analysis.

### 7. NULL Handling

Checked for missing values and used `COALESCE()` to provide default values when required.

### 8. Query Optimization

Created an index on `customer_id` and used `EXPLAIN` to examine query execution.

## 💡 Key Findings

* The dataset contains **10,000 records**.
* Unit prices range from **25 to 999**.
* The average unit price is approximately **246.65**.
* Quantity ranges from **1 to 5**.
* **Home & Kitchen** generated the highest total revenue.
* **Electronics** had the highest average unit price.

## 📁 Repository Structure

```text
Data-Analyst-Internship-Task-3-SQL/
│
├── ecommerce_analysis.sql
├── ecommerce_dataset_10000.csv
├── README.md
│
└── screenshots/
    ├── select.png
    ├── where.png
    ├── order_by.png
    ├── group_by_sum.png
    ├── avg.png
    ├── inner_join.png
    ├── left_join.png
    ├── right_join.png
    ├── subquery.png
    ├── view.png
    ├── null_handling.png
    └── index_explain.png
```

## 🎓 Learning Outcomes

This task provided practical experience in using SQL for data analysis, including data filtering, aggregation, joining tables, subqueries, views, NULL handling, and query optimization.

## 📌 Conclusion

The project demonstrates the practical use of **MySQL and SQL for analyzing structured e-commerce data** and extracting meaningful business insights. It also strengthened understanding of important SQL concepts commonly used in data analyst roles.
