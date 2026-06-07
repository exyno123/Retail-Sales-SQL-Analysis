USE retail_sales;

DROP TABLE IF EXISTS retail_sales_data;

CREATE TABLE retail_sales_data (
    transaction_id INT,
    sale_date DATE,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit INT,
    total_amount INT
);
SHOW TABLES;
SELECT COUNT(*) AS total_rows
FROM retail_sales_data;
SELECT *
FROM retail_sales_data
LIMIT 10;
SELECT *
FROM retail_sales_data
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR customer_id IS NULL;
   SELECT transaction_id,
       COUNT(*)
FROM retail_sales_data
GROUP BY transaction_id
HAVING COUNT(*) > 1;
SELECT SUM(total_amount) AS total_revenue
FROM retail_sales_data;
SELECT COUNT(*) AS total_transactions
FROM retail_sales_data;
SELECT AVG(total_amount) AS average_sale
FROM retail_sales_data;
SELECT customer_id,
       SUM(total_amount) AS total_spent
FROM retail_sales_data
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;
SELECT product_category,
       SUM(total_amount) AS revenue,
       RANK() OVER(
           ORDER BY SUM(total_amount) DESC
       ) AS category_rank
FROM retail_sales_data
GROUP BY product_category;
SELECT COUNT(*) AS total_rows
FROM retail_sales_data;