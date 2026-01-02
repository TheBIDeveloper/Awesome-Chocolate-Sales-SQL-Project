USE ChocolateSales;
GO

--------------------------------------------------
-- 1. Total sales transactions
--------------------------------------------------
SELECT COUNT(*) AS total_sales
FROM sales;

--------------------------------------------------
-- 2. Total revenue
--------------------------------------------------
SELECT SUM(total_amount) AS total_revenue
FROM sales;

--------------------------------------------------
-- 3. Total sales per product
--------------------------------------------------
SELECT p.product_name,
       SUM(s.quantity) AS total_quantity_sold,
       SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 4. Total revenue per category
--------------------------------------------------
SELECT p.category,
       SUM(s.total_amount) AS total_revenue,
       SUM(s.quantity) AS total_quantity_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 5. Total sales per customer
--------------------------------------------------
SELECT c.customer_name,
       SUM(s.quantity) AS total_quantity,
       SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

--------------------------------------------------
-- 6. Total sales per store
--------------------------------------------------
SELECT st.store_name,
       SUM(s.quantity) AS total_quantity_sold,
       SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.store_name
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 7. Daily sales trend
--------------------------------------------------
SELECT sale_date,
       SUM(quantity) AS total_quantity,
       SUM(total_amount) AS total_revenue
FROM sales
GROUP BY sale_date
ORDER BY sale_date;

--------------------------------------------------
-- 8. Top-selling products
--------------------------------------------------
SELECT TOP 5 p.product_name,
       SUM(s.quantity) AS total_quantity_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

--------------------------------------------------
-- 9. Average revenue per sale
--------------------------------------------------
SELECT AVG(total_amount) AS avg_revenue_per_sale
FROM sales;

--------------------------------------------------
-- 10. Customers with highest purchase
--------------------------------------------------
SELECT TOP 5 c.customer_name,
       SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
