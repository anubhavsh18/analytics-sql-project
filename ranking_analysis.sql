-- Ranking Analysis

Purpose:
- To rank items (e.g., products, customers) based on performance or other metrics.
- To identify top performers or laggards.


-- 5 best performing products in terms of sales

SELECT TOP 5
p.product_name,
SUM(f.sales_amount) total_revenue
FROM fact_sales f
LEFT JOIN dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 5 worst performing products in terms of sales

SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC;

-- Top 5 Best Performing Products (Window Function)

WITH product_revenue AS (
    SELECT 
        p.product_name,
        SUM(f.sales_amount) AS total_revenue
    FROM fact_sales f
    LEFT JOIN dim_products p
    ON p.product_key = f.product_key
    GROUP BY p.product_name
)

SELECT product_name, total_revenue
FROM (
    SELECT 
        product_name,
        total_revenue,
        ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS rn
    FROM product_revenue
) t
WHERE rn <= 5;

-- 5 Worst Performing Products (Window Function)

WITH product_revenue AS (
    SELECT 
        p.product_name,
        SUM(f.sales_amount) AS total_revenue
    FROM fact_sales f
    LEFT JOIN dim_products p
    ON p.product_key = f.product_key
    GROUP BY p.product_name
)

SELECT product_name, total_revenue
FROM (
    SELECT 
        product_name,
        total_revenue,
        ROW_NUMBER() OVER (ORDER BY total_revenue ASC) AS rn
    FROM product_revenue
) t
WHERE rn <= 5;

-- top 10 customers who have generated the highest revenue

SELECT TOP 10
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM fact_sales f
LEFT JOIN dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;

-- -- The 3 customers with the fewest orders placed

-- The 3 customers with the fewest orders placed

SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM fact_sales f
LEFT JOIN dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders ASC;