# 2015_Pizza_Sales_Analysis
SQL and Power BI analysis of pizza sales data for 2015.

## Project Overview
This project analyzes pizza sales data from 2015 using SQL Server Management Studio (SSMS) 20 and Power BI. The objective is to extract insights related to sales performance, order trends, and product popularity to aid business decision-making.

## Dataset
- Source: CSV file (https://drive.google.com/drive/folders/17U0ah6Q4MJM_wIn_Xl4fHc-1fO6Q4s6z?usp=sharing)
- Attributes/ Column Headers:
    - Pizza Id
    - Order Id
    - Pizza Name Id
    - Quantity
    - Order Date
    - Order Time
    - Unit Price
    - Total Price
    - Pizza Size
    - Pizza Category
    - Pizza Ingredients
    - Pizza Name

*After inspecting the dataset for missing values, duplicates, and inconsistencies, I found it clean and ready for analysis, so no preprocessing was required.*


## Key Analyses
### SQL Queries
- Total Revenue
- Average Order Value
- Total Pizzas Sold
- Total Orders
- Daily & Monthly Trends
- Sales Breakdown by Category & Size
- Top & Bottom 5 Pizzas by Revenue, Quantity, and Orders
- Percentage of Sales from Top 5 & Bottom 5 Pizzas (Using CTEs)
  
For complete details, refer to the [SQL analysis file](Pizza%20Sales%20Project.sql)

### Power BI Insights
- Interactive dashboards for revenue trends and product performance.
- DAX functions for custom calculations.
- Power Query transformations for enhanced data structuring.

#### Dashboard Screenshots
- *Home Dashboard*
  ![Home Dashboard](Project%20Images/Home_dashboard.png)

- *Best & Worst Selling Pizza Dashboard*
  ![Best & Worst Selling Pizza Dashboard](Project%20Images/Best%26Worst_Seliing_Pizzas_dashboard.png)

## Key Findings
- Revenue & Order Trends: Peak sales on specific weekdays(Friday, Thursday, and Saturday) and months (July, May, and January).
- Best-Selling Pizzas: The top 5 pizzas significantly contribute 24.53% to the revenue.
- Worst-Selling Pizzas: Identified underperforming items for potential removal.
- Pizza Size & Category Impact: Larger sizes and specific categories dominated sales.

## Challenges & Solutions
- Complex SQL Queries (CTE Usage): I experimented with CTE in my queries, which required troubleshooting multiple syntax errors before I could successfully execute them.
- Power BI Transformations: I used Power Query to refine dataset structure for better insights.

## Conclusion
This analysis provides actionable insights for optimizing pizza sales strategies, menu adjustments, and promotional planning. The combination of *SQL and Power BI* ensures a data-driven approach to improving business performance.

## Repository Structure
```
2015_Pizza_Sales_Analysis
📁 `Project Images/` – Contains dashboard screenshots
📄 `Pizza Sales Project.pbix` – Power BI dashboard file
📄 `Pizza Sales Project.sql` – SQL queries used in the analysis
📄 `README.md` – Project documentation
📄 `Pizza Sales Project.csv` – Dataset

```

## Get Started
1. Clone this repository:
   ```bash
   git clone https://github.com/Prof-Johnson/2015_Pizza_Sales_Analysis.git
   ```
2. Open SQL Server and run `Pizza Sales Project.sql`.
3. Load `Pizza Sales Project.pbix` in Power BI.
4. Explore the interactive dashboard!
