/* =========================================
   A. Daily Trend for Total Orders
========================================= */
SELECT 
    DATENAME(WEEKDAY, order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date);


/* =========================================
   B. Hourly Trend for Orders
========================================= */
SELECT 
    DATEPART(HOUR, order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_hour;


/* =========================================
   C. % of Sales by Pizza Category
========================================= */
SELECT 
    pizza_category,
    ROUND(SUM(total_price), 2) AS total_sales,
    ROUND(
        SUM(total_price) * 100.0 
        / SUM(SUM(total_price)) OVER(),
        2
    ) AS Sales_Percentage_by_category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Sales_Percentage_by_category DESC;


/* =========================================
   D. % of Sales by Pizza Size
========================================= */
SELECT 
    pizza_size,
    ROUND(SUM(total_price), 2) AS total_sales,
    ROUND(
        SUM(total_price) * 100.0 
        / SUM(SUM(total_price)) OVER(),
        2
    ) AS Sales_Percentage_by_size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Sales_Percentage_by_size DESC;


/* =========================================
   E. Total Pizzas Sold by Category
========================================= */
SELECT 
    pizza_category,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;


/* =========================================
   F. Top 5 Best Sellers
========================================= */
SELECT TOP 5
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity_sold DESC;


/* =========================================
   G. Bottom 5 Best Sellers
========================================= */
SELECT TOP 5
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity_sold ASC;