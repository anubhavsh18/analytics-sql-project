-- Date Exploration
Purpose:
- To determine the temporal boundaries of key data points.
- To understand the range of historical data.

SELECT MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_year_ranges
from fact_sales;

-- Find the youngest and oldest customer

SELECT 
MIN(birthdate) AS Oldest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
MAX(birthdate) AS Youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
from dim_customers;