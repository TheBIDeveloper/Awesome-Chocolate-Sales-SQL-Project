-- Awesome Chocolate Sales Project
-- Table Creation Script (SQL Server)

CREATE DATABASE ChocolateSales;
GO

USE ChocolateSales;
GO

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_city VARCHAR(50),
    customer_state VARCHAR(50)
);

-- Stores table
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(50),
    store_state VARCHAR(50)
);

-- Sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    store_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    CONSTRAINT fk_sales_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_sales_store FOREIGN KEY (store_id) REFERENCES stores(store_id)
);
