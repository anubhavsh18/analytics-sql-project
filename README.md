# Data Warehouse Analytics

A SQL Server-based data warehouse project built with a star schema design.
Covers data ingestion, exploration, and business analytics using T-SQL.

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

---

## How to Run

1. Open SQL Server Management Studio (SSMS)
2. Update the file paths in the `BULK INSERT` statements to match
   your local CSV locations
3. Run the scripts in order:
   - `01_create_database.sql`
   - `02_load_data.sql`
   - `03_analysis_queries.sql`

---

## Key SQL Concepts Used
- Star schema design
- BULK INSERT for data loading
- Aggregate functions (SUM, AVG, COUNT)
- JOINs (LEFT JOIN)
- GROUP BY and ORDER BY
- CTEs (Common Table Expressions)
- Window functions (ROW_NUMBER OVER)
- DATEDIFF and GETDATE for date logic
- INFORMATION_SCHEMA exploration
