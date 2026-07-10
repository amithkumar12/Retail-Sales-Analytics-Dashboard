SELECT
    DATE_FORMAT(STR_TO_DATE(order_date,'%m/%d/%Y'),'%Y-%m') AS month,
    ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS total_sales
FROM staging_orders
GROUP BY month
ORDER BY month;

SELECT
    DATE_FORMAT(STR_TO_DATE(order_date,'%m/%d/%Y'),'%Y-%m') AS month,
    ROUND(SUM(CAST(profit AS DECIMAL(10,2))),2) AS total_profit
FROM staging_orders
GROUP BY month
ORDER BY month;

SELECT
ROUND(SUM(CAST(sales AS DECIMAL(10,2)))
/
COUNT(DISTINCT order_id),2)
AS average_order_value
FROM staging_orders;

SELECT
state,
ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS sales
FROM staging_orders
GROUP BY state
ORDER BY sales DESC
LIMIT 5;

SELECT
state,
ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS sales
FROM staging_orders
GROUP BY state
ORDER BY sales ASC
LIMIT 5;

SELECT
city,
ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS sales
FROM staging_orders
GROUP BY city
ORDER BY sales DESC
LIMIT 10;

SELECT
product_name,
ROUND(SUM(CAST(profit AS DECIMAL(10,2))),2) AS profit
FROM staging_orders
GROUP BY product_name
ORDER BY profit DESC
LIMIT 10;

SELECT
product_name,
ROUND(SUM(CAST(profit AS DECIMAL(10,2))),2) AS profit
FROM staging_orders
GROUP BY product_name
ORDER BY profit ASC
LIMIT 10;

SELECT
segment,
ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS sales
FROM staging_orders
GROUP BY segment;

SELECT
discount,
COUNT(*) AS orders
FROM staging_orders
GROUP BY discount
ORDER BY discount;