-- Dimension Exploration

Purpose:
- To explore the structure of dimension tables.

-- Explore all countries our customers come from

SELECT DISTINCT country from dim_customers

-- Explore all categories

SELECT DISTINCT category, subcategory, product_name from dim_products;