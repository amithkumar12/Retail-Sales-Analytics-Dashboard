USE retail_sales_db;
INSERT INTO customers (
    customer_id,
    customer_name,
    customer_segment
)
SELECT DISTINCT
    customer_id,
    customer_name,
    segment
FROM staging_orders;

INSERT INTO products (
    product_id,
    product_name,
    category,
    sub_category
)
SELECT
    product_id,
    MAX(product_name),
    MAX(category),
    MAX(sub_category)
FROM staging_orders
GROUP BY product_id;

INSERT INTO orders
(
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    product_id,
    country,
    city,
    state,
    postal_code,
    region,
    sales,
    quantity,
    discount,
    profit
)

SELECT
    order_id,
    STR_TO_DATE(order_date,'%m/%d/%Y'),
    STR_TO_DATE(ship_date,'%m/%d/%Y'),
    ship_mode,
    customer_id,
    product_id,
    country,
    city,
    state,
    postal_code,
    region,
    CAST(sales AS DECIMAL(10,2)),
    CAST(quantity AS UNSIGNED),
    CAST(discount AS DECIMAL(4,2)),
    CAST(profit AS DECIMAL(10,2))
FROM staging_orders;
SELECT COUNT(*) AS total_orders
FROM orders;


