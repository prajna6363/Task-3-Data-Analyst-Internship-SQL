-- =========================================================
-- DATA ANALYST INTERNSHIP - TASK 3
-- SQL FOR DATA ANALYSIS
-- Dataset: Ecommerce Dataset (10,000 records)
-- Database: ecommerce_analysis
-- Tool: MySQL / MySQL Workbench
-- =========================================================


-- =========================================================
-- 1. SELECT
-- Retrieve customer information
-- =========================================================

USE ecommerce_analysis;

SELECT
    customer_id,
    first_name,
    last_name,
    country
FROM ecommerce_data
LIMIT 10;


-- =========================================================
-- 2. WHERE
-- Retrieve delivered orders
-- =========================================================

SELECT
    order_id,
    customer_id,
    product_name,
    category,
    unit_price,
    order_status
FROM ecommerce_data
WHERE order_status = 'Delivered'
LIMIT 10;


-- =========================================================
-- 3. ORDER BY
-- Find the 10 most expensive products
-- =========================================================

SELECT
    product_name,
    category,
    unit_price
FROM ecommerce_data
ORDER BY unit_price DESC
LIMIT 10;


-- =========================================================
-- 4. GROUP BY + SUM
-- Calculate total revenue by product category
-- Revenue = Quantity × Unit Price
-- =========================================================

SELECT
    category,
    SUM(quantity * unit_price) AS total_revenue
FROM ecommerce_data
GROUP BY category
ORDER BY total_revenue DESC;


-- =========================================================
-- 5. GROUP BY + AVG
-- Calculate average product price by category
-- =========================================================

SELECT
    category,
    ROUND(AVG(unit_price), 2) AS average_price
FROM ecommerce_data
GROUP BY category
ORDER BY average_price DESC;


-- =========================================================
-- 6. CREATE CUSTOMER TABLE
-- Create a separate customer table for JOIN analysis
-- =========================================================

CREATE TABLE IF NOT EXISTS customer_details AS
SELECT DISTINCT
    customer_id,
    first_name,
    last_name,
    gender,
    age_group,
    country
FROM ecommerce_data;


-- =========================================================
-- 7. CREATE PRODUCT TABLE
-- Create a separate product table for JOIN analysis
-- =========================================================

CREATE TABLE IF NOT EXISTS product_details AS
SELECT DISTINCT
    product_id,
    product_name,
    category,
    unit_price
FROM ecommerce_data;


-- =========================================================
-- 8. INNER JOIN
-- Combine order information with customer information
-- =========================================================

SELECT
    e.order_id,
    e.product_name,
    e.category,
    e.quantity,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country
FROM ecommerce_data e
INNER JOIN customer_details c
    ON e.customer_id = c.customer_id
LIMIT 10;


-- =========================================================
-- 9. LEFT JOIN
-- Display all customers and matching order information
-- =========================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country,
    e.order_id,
    e.product_name,
    e.category
FROM customer_details c
LEFT JOIN ecommerce_data e
    ON c.customer_id = e.customer_id
LIMIT 10;


-- =========================================================
-- 10. RIGHT JOIN
-- Display all ecommerce records and matching customer information
-- =========================================================

SELECT
    e.order_id,
    e.product_name,
    e.category,
    e.quantity,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country
FROM customer_details c
RIGHT JOIN ecommerce_data e
    ON c.customer_id = e.customer_id
LIMIT 10;


-- =========================================================
-- 11. SUBQUERY
-- Find products priced above the overall average price
-- =========================================================

SELECT
    product_name,
    category,
    unit_price
FROM ecommerce_data
WHERE unit_price > (
    SELECT AVG(unit_price)
    FROM ecommerce_data
)
ORDER BY unit_price DESC;


-- =========================================================
-- 12. CREATE VIEW
-- Create a reusable sales analysis view
-- =========================================================

CREATE OR REPLACE VIEW sales_analysis AS
SELECT
    order_id,
    customer_id,
    product_name,
    category,
    quantity,
    unit_price,
    quantity * unit_price AS revenue,
    order_status
FROM ecommerce_data;


-- View the analysis
SELECT *
FROM sales_analysis
LIMIT 10;


-- =========================================================
-- 13. NULL VALUE CHECK
-- Check for missing values in important columns
-- =========================================================

SELECT
    COUNT(*) AS total_rows,
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(product_name IS NULL) AS null_product_name,
    SUM(category IS NULL) AS null_category,
    SUM(rating IS NULL) AS null_rating
FROM ecommerce_data;


-- =========================================================
-- 14. COALESCE
-- Replace NULL ratings with 0 for analysis
-- =========================================================

SELECT
    product_name,
    rating,
    COALESCE(rating, 0) AS rating_with_default
FROM ecommerce_data
LIMIT 10;


-- =========================================================
-- 15. INDEX
-- Create an index on customer_id to improve searches and JOINs
-- Prefix length is used because customer_id was imported as TEXT
-- =========================================================

CREATE INDEX idx_customer_id
ON ecommerce_data(customer_id(20));


-- =========================================================
-- 16. EXPLAIN
-- Examine the query execution plan
-- =========================================================

EXPLAIN
SELECT *
FROM ecommerce_data
WHERE customer_id = 'CUST2353';


-- =========================================================
-- END OF TASK 3
-- =========================================================