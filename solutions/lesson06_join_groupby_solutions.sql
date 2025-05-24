-- Lesson 6: JOINs with GROUP BY

-- Exercise 1: Count Orders Per Product
SELECT 
  p.product_name,
  COUNT(*) AS order_count
FROM sampledata."orders.csv" o
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
GROUP BY p.product_name;

-- Exercise 2: Average Order Amount by Customer
SELECT 
  c.customer_name,
  AVG(CAST(o.total_amount AS DOUBLE)) AS avg_order_amount
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

-- Exercise 3: Total Revenue Per Product
SELECT 
  p.product_name,
  SUM(CAST(o.total_amount AS DOUBLE)) AS total_revenue
FROM sampledata."orders.csv" o
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
GROUP BY p.product_name;
