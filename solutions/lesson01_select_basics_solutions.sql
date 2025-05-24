-- Lesson 1: SELECT, FROM, AS, ORDER BY, LIMIT

-- Exercise 1: Select Specific Columns
SELECT 
  customer_name, 
  product_category, 
  payment_method
FROM sampledata."normalized_sales.csv";

-- Exercise 2: Rename and Sort
SELECT 
  product_name AS item, 
  total_amount AS amount_spent
FROM sampledata."normalized_sales.csv"
ORDER BY amount_spent DESC;

-- Exercise 3: Top Sellers
SELECT 
  sale_id,
  customer_name,
  product_name,
  total_amount
FROM sampledata."normalized_sales.csv"
ORDER BY total_amount DESC
LIMIT 10;
