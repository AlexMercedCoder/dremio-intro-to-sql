-- Lesson 3: GROUP BY and HAVING

-- Exercise 1: Total Per Product
SELECT 
  product_name,
  SUM(CAST(total_amount AS DOUBLE)) AS total_sold
FROM sampledata."normalized_sales.csv"
GROUP BY product_name;

-- Exercise 2: Customers with High Activity
SELECT 
  customer_name,
  COUNT(*) AS sales_count
FROM sampledata."normalized_sales.csv"
GROUP BY customer_name
HAVING COUNT(*) > 5;

-- Exercise 3: High-Volume Countries
SELECT 
  shipping_country,
  AVG(CAST(total_amount AS DOUBLE)) AS avg_order_value
FROM sampledata."normalized_sales.csv"
GROUP BY shipping_country
HAVING AVG(CAST(total_amount AS DOUBLE)) > 500;
