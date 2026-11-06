# Olist Merchant Performance Analysis

SQL and Tableau analysis of seller performance on the Olist Brazilian e-commerce dataset (96K orders), identifying which sellers and product categories drive revenue.

## Dashboard

[View the live dashboard on Tableau Public](https://public.tableau.com/app/profile/vadya.azzahra8298/viz/ProjectOlistMerchant/Dashboard1)

![Dashboard](Dashboard%201.png)

## Dataset

Brazilian E-Commerce Public Dataset by Olist (Kaggle). The raw CSV files are not included in this repository.

Tables used: orders, order_items, sellers, products, and the category translation table (imported as category_name)

## Tools

- SQLite (DB Browser for SQLite)
- Tableau for data visualization

## Definitions

- **Revenue:** sum of item price (order_items), excluding freight
- **Orders included:** delivered orders only (order_status = 'delivered')
- **Sellers:** identified by seller_id; city and state are shown as labels.
- **Categories:** English names from the translation table (Portuguese name if no translation); only categories with at least 100 delivered orders, ranked by revenue (top 10).
- **Seller segments:** High = R$10,000 or more, Mid = R$1,000 to R$9,999, Low = below R$1,000

## Business Questions and Findings

| # | Question | SQL techniques | Key insight |
|---|----------|----------------|-------------|
| 1 | How do orders and revenue change month by month? | JOIN, GROUP BY, aggregation | Revenue grew rapidly from early 2017 and peaked in November 2017 at R$988K. 2016 data is very limited, so it is less representative. |
| 2 | Which 10 sellers generate the most revenue? | Multi-table JOIN, ORDER BY, LIMIT | The top seller is Guariba, with 1,124 orders and R$226,988 in revenue. Revenue does not always follow order volume: Lauro de Freitas ranks second with only 348 orders but R$217,940 in revenue, while Ibitinga has far more orders (1,772) but lower revenue at R$196,882. |
| 3 | How are sellers distributed across High / Mid / Low revenue segments? | CTE, CASE WHEN, subquery | About 9.5% of sellers (the High segment) generate 66% of total revenue, while over half of sellers (the Low segment) contribute only 4%. Sales are highly concentrated among a small group of top merchants, so retaining top sellers and helping Mid-segment sellers grow would have the biggest impact. |
| 4 | Which product categories perform best? | JOIN, LEFT JOIN, HAVING | Health & beauty is the top-selling category with about R$1.23M in revenue. Categories grow in different ways: bed_bath_table has the most orders but a low average item price (R$93), while watches_gifts earns nearly the same revenue from far fewer orders thanks to a higher average price (R$199). |

## Repository Files

| Question | SQL script | Query output |
|----------|------------|--------------|
| 1. Monthly revenue | `monthly_revenue.sql` | `Q1_MonthlyRevenue.csv` |
| 2. Top sellers | `top_sellers.sql` | `Q2_TopSellers.csv` |
| 3. Seller segments | `seller_segment.sql` | `Q3_SellerSegment.csv` |
| 4. Top categories | `top_categories.sql` | `Q4_TopCategories.csv` |

Other files: KPI.csv (dashboard KPIs), Dashboard 1.png (dashboard preview), Olist_Merchant_Performance.twb (Tableau workbook).

## How to Reproduce

1. Download the dataset from Kaggle (Brazilian E-Commerce Public Dataset by Olist).
2. Import the CSV files into SQLite (e.g. with DB Browser for SQLite), naming the category translation table category_name.
3. Run the SQL scripts to generate the query outputs.
4. Open the Tableau workbook to view the dashboard.

## Author

Vadya Azzahra, Information Systems graduate.

- LinkedIn: [vadya-azzahra](https://www.linkedin.com/in/vadya-azzahra/)
- Email: vadyazzahra@gmail.com
