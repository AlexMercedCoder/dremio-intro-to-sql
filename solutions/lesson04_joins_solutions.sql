-- Lesson 4: Understanding JOINs

-- Join customers, orders, and products to get a complete view of each order
SELECT 
  c.customer_name,
  p.product_name,
  o.order_date,
  o.total_amount
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id;
