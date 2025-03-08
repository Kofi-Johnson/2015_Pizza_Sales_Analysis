
Select * from pizza_sales

--Total Revenue
Select SUM(total_price) AS Total_Revenue from pizza_sales

--Average Order Value
Select SUM(total_price) / COUNT(DISTINCT order_id) 
as Avg_Order_Value 
from pizza_sales

--Total Pizza Sold
Select SUM(quantity) as Total_Pizza_Sold from pizza_sales

--Total Orders
Select COUNT(Distinct order_id) as Total_Orders
from pizza_sales

--Average Pizzas Per Order
---Use cast to limit decimal to 2
Select cast(
	cast(SUM(quantity) as Decimal(10,2)) /
	Cast(COUNT(Distinct order_id)as Decimal(10,2)) as decimal (10,2)
	)
as Avg_Pizza_per_Order
from pizza_sales

--Finding the total number of order recieved on each day (Daily Trend)
Select DATENAME(DW, order_date) as Order_day, COUNT(Distinct order_id)
as Total_Order
from pizza_sales
Group By DATENAME(DW, order_date)
Order by Total_Order Desc

--Finding the total number of order recieved on each month (Monthly Trend)
Select DATENAME(MONTH, order_date) as Month_Name, COUNT(Distinct order_id)
as Total_Order
from pizza_sales
Group By DATENAME(MONTH, order_date)
Order by Total_Order Desc

--Percentage of Sales by Pizza Category
Select pizza_category, Cast(SUM(total_price) as decimal(10,2)) as Total_Sales, Cast(SUM(total_price) * 100 /
	(
	Select SUM(total_price) from pizza_sales
	)
	as Decimal(10,2))
	as Percentage_of_Total_Sales
	from pizza_sales
	Group By pizza_category

--Percentage of Sales by Pizza Size
Select pizza_size, Cast(SUM(total_price) as decimal(10,2)) as Total_Sales, cast(SUM(total_price) * 100 /
	(
	Select SUM(total_price) from pizza_sales
	)
	as decimal(10,2))
	as Percentage_of_Total_Sales
	from pizza_sales
	Group By pizza_size
	Order by Percentage_of_Total_Sales

--Top 5 best selling Pizza by Revenue
Select Top 5 pizza_name, Cast(SUM(total_price) as decimal(10,2)) as Total_Revenue from pizza_sales
Group By pizza_name
Order By Total_Revenue desc

--Bottom/worst 5 selling Pizza by Revenue
Select Top 5 pizza_name, Cast(SUM(total_price) as decimal(10,2)) as Total_Revenue from pizza_sales
Group By pizza_name
Order By Total_Revenue

--Top 5 best selling Pizza by Quantity
Select Top 5 pizza_name, SUM(quantity) as Total_Quantity from pizza_sales
Group By pizza_name
Order By Total_Quantity desc

--Bottom/worst 5 selling Pizza by Quantity
Select Top 5 pizza_name, SUM(quantity) as Total_Quantity from pizza_sales
Group By pizza_name
Order By Total_Quantity

--Top 5 best selling Pizza by Orders
Select Top 5 pizza_name, Count(distinct order_id) as Total_Orders from pizza_sales
Group By pizza_name
Order By Total_Orders desc

--Bottom/worst 5 selling Pizza by Orders
Select Top 5 pizza_name, Count(distinct order_id) as Total_Orders from pizza_sales
Group By pizza_name
Order By Total_Orders

-- % of top 5 best selling pizza in terms of revenue
;WITH Top5Pizzas AS (
	Select Top 5 
	pizza_name,
	Cast(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
	from pizza_sales
	Group By pizza_name
	Order By SUM(total_price) desc
),
TotalRevenue AS (
    Select CAST(SUM(total_price) AS decimal(10,2)) AS Overall_Revenue
	from pizza_sales
)

SELECT
	SUM(t.Total_Revenue) as Top_5_Revenue,
	MAX(tr.Overall_Revenue) AS Overall_Revenue,
	CAST(CASE
		WHEN MAX(tr.Overall_Revenue) = 0 THEN 0
		ELSE (SUM(t.Total_Revenue)*100.0 / MAX(tr.Overall_Revenue))
	END AS DECIMAL(5,2)) as top_5_percentage
FROM Top5Pizzas t
Cross Join TotalRevenue tr;

-- % of top 5 worst selling pizza in terms of revenue
;WITH Bottom5Pizzas AS (
	Select Top 5 
	pizza_name,
	Cast(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
	from pizza_sales
	Group By pizza_name
	Order By SUM(total_price)
),
TotalRevenue AS (
    Select CAST(SUM(total_price) AS decimal(10,2)) AS Overall_Revenue
	from pizza_sales
)

SELECT
	SUM(t.Total_Revenue) as Top_5_Revenue,
	MAX(tr.Overall_Revenue) AS Overall_Revenue,
	CAST(CASE
		WHEN MAX(tr.Overall_Revenue) = 0 THEN 0
		ELSE (SUM(t.Total_Revenue)*100.0 / MAX(tr.Overall_Revenue))
	END AS DECIMAL(5,2)) as top_5_percentage
FROM Bottom5Pizzas t
Cross Join TotalRevenue tr;