USE ChocolateSales;
GO

--------------------------------------------------
-- 11. Running total of sales per product
--------------------------------------------------
SELECT p.product_name,
       s.sale_date,
       SUM(s.quantity) OVER(PARTITION BY p.product_name ORDER BY s.sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_quantity,
       SUM(s.total_amount) OVER(PARTITION BY p.product_name ORDER BY s.sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
ORDER BY p.product_name, s.sale_date;

--------------------------------------------------
-- 12. Rank products by total revenue
--------------------------------------------------
SELECT p.product_name,
       SUM(s.total_amount) AS total_revenue,
       RANK() OVER(ORDER BY SUM(s.total_amount) DESC) AS revenue_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue_rank;

--------------------------------------------------
-- 13. Rank stores by total revenue
--------------------------------------------------
SELECT st.store_name,
       SUM(s.total_amount) AS total_revenue,
       RANK() OVER(ORDER BY SUM(s.total_amount) DESC) AS store_rank
FROM sales s
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.store_name
ORDER BY store_rank;

--------------------------------------------------
-- 14. Cumulative revenue over time
--------------------------------------------------
SELECT sale_date,
       SUM(total_amount) OVER(ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_revenue
FROM sales
ORDER BY sale_date;

--------------------------------------------------
-- 15. Customers with revenue above average
--------------------------------------------------
WITH customer_sales AS (
    SELECT c.customer_name,
           SUM(s.total_amount) AS total_spent
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    GROUP BY c.customer_name
)
SELECT customer_name, total_spent
FROM customer_sales
WHERE total_spent > (SELECT AVG(total_spent) FROM customer_sales)
ORDER BY total_spent DESC;

--------------------------------------------------
-- 16. Category-wise revenue contribution
--------------------------------------------------
SELECT p.category,
       SUM(s.total_amount) AS total_revenue,
       RANK() OVER(ORDER BY SUM(s.total_amount) DESC) AS category_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY category_rank;

--------------------------------------------------
-- 17. Top-selling product per store
--------------------------------------------------
WITH store_product_sales AS (
    SELECT s.store_id,
           p.product_name,
           SUM(s.quantity) AS total_quantity,
           RANK() OVER(PARTITION BY s.store_id ORDER BY SUM(s.quantity) DESC) AS product_rank
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY s.store_id, p.product_name
)
SELECT store_id, product_name, total_quantity
FROM store_product_sales
WHERE product_rank = 1;

--------------------------------------------------
-- 18. Monthly sales trend
--------------------------------------------------
SELECT FORMAT(sale_date, 'yyyy-MM') AS month,
       SUM(quantity) AS total_quantity,
       SUM(total_amount) AS total_revenue
FROM sales
GROUP BY FORMAT(sale_date, 'yyyy-MM')
ORDER BY month;

--------------------------------------------------
-- 19. Average revenue per product category
--------------------------------------------------
SELECT p.category,
       AVG(s.total_amount) AS avg_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_revenue DESC;

--------------------------------------------------
-- 20. Top 3 customers by revenue
--------------------------------------------------
SELECT TOP 3 c.customer_name,
       SUM(s.total_amount) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
