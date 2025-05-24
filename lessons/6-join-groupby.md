# 📊 Lesson 6: JOINs with GROUP BY

In this final lesson of our JOIN series, you’ll learn how to:
- Aggregate data across multiple related tables
- Use `JOIN` to enrich context
- Use `GROUP BY` to summarize your results

We'll continue using the datasets:

- `sampledata."customers.csv"`
- `sampledata."orders.csv"`
- `sampledata."products.csv"`

---

## 🧠 JOIN + GROUP BY: Why It Matters

Combining `JOIN` with `GROUP BY` allows you to answer questions like:
- “Which customer placed the most orders?”
- “What is the average order value by product?”
- “What are total sales by country or by product category?”

These are essential for **reporting** and **business intelligence**.

---

## 🔗 Example 1: Orders Per Customer

```sql
SELECT 
  c.customer_name,
  COUNT(*) AS num_orders
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
GROUP BY c.customer_name;
```
✅ This returns the number of orders placed by each customer.

## 🔗 Example 2: Average Order Amount Per Product
Since total_amount is stored as text, we need to cast it as a number before aggregating.

```sql
SELECT 
  p.product_name,
  AVG(CAST(o.total_amount AS DOUBLE)) AS avg_order_value
FROM sampledata."orders.csv" o
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
GROUP BY p.product_name;
```

💡 This gives insight into the average order value for each product type.

## 🔗 Example 3: Total Sales Per Customer (JOIN 3 Tables)
```sql
SELECT 
  c.customer_name,
  SUM(CAST(o.total_amount AS DOUBLE)) AS total_spent
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
GROUP BY c.customer_name;
```

✅ Here, we’ve used all three tables to calculate customer-level sales totals.

## 🧪 Practice Exercises
#### 🧪 Exercise 1: Count Orders Per Product
List each product and the number of times it was ordered.

#### 🧪 Exercise 2: Average Order Amount by Customer
Return each customer and their average total_amount.

#### 🧪 Exercise 3: Total Revenue Per Product
Return each product name and the total revenue it generated.

## 🧠 Recap

| Concept           | Description                                      |
|-------------------|--------------------------------------------------|
| `JOIN + GROUP BY` | Summarizes data from related tables              |
| `COUNT()`         | Tallies rows in each group                       |
| `SUM()` / `AVG()` | Performs math on numeric fields (cast required)  |
| `CAST(...)`       | Converts text fields to numeric for aggregation  |
