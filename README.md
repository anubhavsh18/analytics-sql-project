# Data Warehouse Analytics

A SQL Server-based data warehouse project built with a star schema design.
Covers data ingestion, exploration, and advanced business analytics using T-SQL.

---

## Tech Stack
- SQL Server
- T-SQL

---

## Database Schema

**Fact Table**
- `fact_sales` — orders, sales amount, quantity, price

**Dimension Tables**
- `dim_customers` — customer details, country, gender, birthdate
- `dim_products` — product details, category, subcategory, cost
```
dim_customers ──┐
                ├── fact_sales
dim_products  ──┘
```

---

## What This Project Covers

**Database Setup**
- Created and configured the `DataWarehouseAnalytics` database
- Loaded raw data using `BULK INSERT`

**Exploration**
- Identified date ranges and data scope
- Explored customer demographics (country, gender, age)
- Explored product catalog (categories, subcategories)

**Key Business Metrics**
- Total sales, quantity sold, average price
- Total orders, products, and customers

**Magnitude Analysis**
- Customers by country and gender
- Products and average cost by category
- Revenue by category and customer
- Items sold by country

**Ranking Analysis**
- Top 5 and bottom 5 products by revenue
- Top 10 customers by revenue
- 3 customers with fewest orders
- Implemented using both `TOP N` and window functions (`ROW_NUMBER`)

**Change Over Time Analysis**
- Monthly and yearly sales trends
- Unique customers and quantity sold over time
- Date formatting using `YEAR()`, `DATETRUNC()`, and `FORMAT()`

**Cumulative Analysis**
- Running total of sales over time
- Moving average price using window functions (`SUM OVER`, `AVG OVER`)

**Performance Analysis (Year-over-Year)**
- Yearly product sales compared to their historical average
- Above/below average classification per product
- Year-over-year sales change using `LAG()` window function

**Data Segmentation**
- Products grouped into cost ranges (Below 100, 100–500, 500–1000, Above 1000)
- Customers segmented into VIP, Regular, and New based on spending and lifespan

---

## How to Run

1. Open SQL Server Management Studio (SSMS)
2. Update the file paths in the `BULK INSERT` statements to match
   your local CSV locations
3. Run the scripts in order starting from `01_create_database.sql`

---

## Key SQL Concepts Used
- Star schema design
- BULK INSERT for data loading
- Aggregate functions (SUM, AVG, COUNT)
- JOINs (LEFT JOIN)
- GROUP BY and ORDER BY
- CTEs (Common Table Expressions)
- Window functions (ROW_NUMBER, LAG, SUM OVER, AVG OVER)
- DATEDIFF, DATETRUNC, GETDATE for date logic
- CASE statements for classification and segmentation
- INFORMATION_SCHEMA exploration
