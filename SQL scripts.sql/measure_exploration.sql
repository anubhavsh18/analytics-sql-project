-- Measures Exploration

Purpose:
- To calculate aggregated metrics (e.g., totals, averages) for quick insights.
- To identify overall trends or spot anomalies.

-- Find the total Sales
SELECT SUM(sales_amount) AS total_sales from fact_sales;


-- Number of items sold
SELECT SUM(quantity) AS total_quantity from fact_sales;


-- Average Selling Price
SELECT AVG(price) AS avg_price from fact_sales;


-- Total number of orders
SELECT COUNT(order_number) AS total_orders from fact_sales;
SELECT COUNT(DISTINCT order_number) AS total_orders from fact_sales;
    

-- Total number of products
SELECT COUNT(product_key) AS total_products from dim_products;
SELECT COUNT(DISTINCT product_key) AS total_products from dim_products;


-- Total number of Customers
SELECT COUNT(customer_key) AS total_customers FROM dim_customers;

-- Total number of customers that placed an order
SELECT COUNT(customer_key) AS total_customers FROM fact_sales;
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM fact_sales;

--- All key metrics of the business

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value from fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) from fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) from fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) from fact_sales
UNION ALL
SELECT 'Total Products', COUNT(product_name) from dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) from dim_customers;