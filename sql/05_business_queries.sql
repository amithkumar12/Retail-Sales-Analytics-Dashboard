SELECT
    ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS total_sales
FROM staging_orders;


SELECT COUNT(DISTINCT order_id) AS total_orders
FROM staging_orders;

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM staging_orders;

SELECT
    customer_name,
    ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS total_sales
FROM staging_orders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    product_name,
    ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS total_sales
FROM staging_orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    region,
    ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS sales
FROM staging_orders
GROUP BY region
ORDER BY sales DESC;

SELECT
    region,
    ROUND(SUM(CAST(profit AS DECIMAL(10,2))),2) AS profit
FROM staging_orders
GROUP BY region
ORDER BY profit DESC;

SELECT
    category,
    ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS sales
FROM staging_orders
GROUP BY category;

SELECT
    sub_category,
    ROUND(SUM(CAST(sales AS DECIMAL(10,2))),2) AS sales
FROM staging_orders
GROUP BY sub_category
ORDER BY sales DESC;