USE retail_sales_db;

-- ============================================
-- Customers Table
-- ============================================

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_segment VARCHAR(50) NOT NULL
);

-- ============================================
-- Products Table
-- ============================================

CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL,
    sub_category VARCHAR(50) NOT NULL
);

-- ============================================
-- Orders Table
-- ============================================

CREATE TABLE orders (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2),

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- ============================================
-- Staging Table
-- ============================================

CREATE TABLE staging_orders (
    row_id VARCHAR(20),
    order_id VARCHAR(30),
    order_date VARCHAR(30),
    ship_date VARCHAR(30),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(30),
    customer_name VARCHAR(150),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales VARCHAR(30),
    quantity VARCHAR(20),
    discount VARCHAR(20),
    profit VARCHAR(30)
);