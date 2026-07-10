/*
============================================
Data Import Process
============================================

1. Open MySQL Workbench.

2. Right-click staging_orders.

3. Select:
   Table Data Import Wizard

4. Choose:
   Sample - Superstore.csv

5. Import into:
   staging_orders

6. Verify import:

SELECT COUNT(*) FROM staging_orders;

Expected Rows:
9989

============================================
Populate Customers Table
============================================
*/

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

/*
============================================
Populate Products Table
============================================
*/

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