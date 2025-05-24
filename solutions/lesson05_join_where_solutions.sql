-- Lesson 5: JOINs with WHERE Conditions

-- Exercise 1: Orders for Laptops
SELECT 
  o.order_id,
  o.order_date,
  c.customer_name,
  p.product_name,
  CAST(o.total_amount AS DOUBLE) AS total_amount
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
WHERE p.product_name = 'Laptop';

-- Exercise 2: Orders by Alice Smith
SELECT 
  o.order_id,
  o.order_date,
  p.product_name,
  CAST(o.total_amount AS DOUBLE) AS total_amount
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
WHERE c.customer_name = 'Alice Smith';

-- Exercise 3: High-Value Orders After Feb 1
SELECT 
  o.order_id,
  o.order_date,
  c.customer_name,
  p.product_name,
  CAST(o.total_amount AS DOUBLE) AS total_amount
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
WHERE CAST(o.total_amount AS DOUBLE) > 300
  AND o.order_date >= '2024-02-01';
