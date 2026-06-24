CREATE PROCEDURE KPIS 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        'Total Revenue' AS KPI,
        CAST(ROUND(SUM(total_price),0) AS DECIMAL(18,0)) AS Value
    FROM pizza_sales

    UNION ALL

    SELECT 
        'Average Order Value',
        CAST(ROUND(SUM(total_price) * 1.0 / COUNT(DISTINCT order_id),0) AS DECIMAL(18,0))
    FROM pizza_sales

    UNION ALL

    SELECT 
        'Total Pizza Sold',
        CAST(SUM(quantity) AS DECIMAL(18,0))
    FROM pizza_sales

    UNION ALL

    SELECT 
        'Total Orders',
        CAST(COUNT(DISTINCT order_id) AS DECIMAL(18,0))
    FROM pizza_sales

    UNION ALL

    SELECT 
        'Average Pizza per Order',
        CAST(ROUND(SUM(quantity) * 1.0 / COUNT(DISTINCT order_id),2) AS DECIMAL(18,2))
    FROM pizza_sales;
END;
