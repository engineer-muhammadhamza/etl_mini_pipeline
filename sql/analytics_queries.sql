-- Total Revenue
SELECT SUM(total) AS total_revenue
FROM sales_clean;


-- Total Orders
SELECT COUNT(*) AS total_orders
FROM sales_clean;


-- Revenue by Product
SELECT product,
       SUM(total) AS revenue
FROM sales_clean
GROUP BY product
ORDER BY revenue DESC;


-- Top 5 Customers by Spending
SELECT customer_name,
       SUM(total) AS total_spent
FROM sales_clean
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- Revenue by City
SELECT city,
       SUM(total) AS revenue
FROM sales_clean
GROUP BY city
ORDER BY revenue DESC;


-- Average Order Value
SELECT AVG(total) AS avg_order_value
FROM sales_clean;


-- Best Selling Products (by Quantity)
SELECT product,
       SUM(quantity) AS total_quantity
FROM sales_clean
GROUP BY product
ORDER BY total_quantity DESC;


-- Top Selling City Per Product
SELECT product, city,
       SUM(total) AS revenue
FROM sales_clean
GROUP BY product, city
ORDER BY revenue DESC;


-- Customers with More Than 5 Orders
SELECT customer_name,
       COUNT(*) AS order_count
FROM sales_clean
GROUP BY customer_name
HAVING COUNT(*) > 5
ORDER BY order_count DESC;
