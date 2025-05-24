-- Lesson 2: WHERE, AND, OR, IN, BETWEEN, LIKE, IS NULL

-- Exercise 1: Clothing in Brazil
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE product_category = 'Clothing'
  AND shipping_country = 'Brazil';

-- Exercise 2: Large Orders Paid with Paypal
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE total_amount BETWEEN 900 AND 1200
  AND payment_method = 'Paypal';

-- Exercise 3: Names with "son"
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE customer_name LIKE '%son%';

-- Exercise 4: Unknown Product
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE product_name IS NULL;
