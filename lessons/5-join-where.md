# 🔍 Lesson 5: JOINs with WHERE Conditions

Now that you’ve learned how to combine tables with `JOIN`, let’s go further by adding **filters** using the `WHERE` clause.

This lets you:
- Focus on specific customers, products, or date ranges
- Analyze data based on business criteria
- Reduce result set size for clearer insights

We'll continue using:

- `sampledata."orders.csv"`
- `sampledata."customers.csv"`
- `sampledata."products.csv"`

---

## 🧠 JOIN + WHERE Workflow

When working with JOINs and WHERE together, the **JOIN happens first**, creating a larger intermediate dataset. Then, the `WHERE` clause filters that result.

---

## 🔗 Example 1: Filter by Customer Name

Let’s see orders placed **only by Bob Johnson**.

```sql
SELECT 
  o.order_id,
  o.order_date,
  c.customer_name,
  p.product_name,
  o.total_amount
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
WHERE c.customer_name = 'Bob Johnson';
```

✅ This shows only the rows where Bob placed an order, across all products.

## 🔗 Example 2: Filter by Date
You can also filter on fields like order_date.

```sql
SELECT 
  o.order_id,
  c.customer_name,
  o.order_date,
  p.product_name,
  o.total_amount
FROM sampledata."orders.csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
WHERE o.order_date >= '2024-01-20';
```
✅ This query returns only orders that occurred on or after January 20th, 2024.

## 🔗 Example 3: Filter by Product Type and Amount
Let’s find orders for Smartphones with a `total_amount` over $200.

```sql
SELECT 
  c.customer_name,
  o.order_date,
  p.product_name,
  o.total_amount
FROM sampledata."orders (1).csv" o
JOIN sampledata."customers.csv" c 
  ON o.customer_id = c.customer_id
JOIN sampledata."products.csv" p 
  ON o.product_id = p.product_id
WHERE p.product_name = 'Laptop'
  AND CAST(o.total_amount as DOUBLE) > 200;
```
✅ A common business query: "Who bought expensive Laptops?"

### 🧪 Practice Exercises

##### 🧪 Exercise 1: Orders for Laptops
Show all orders where the product was a Laptop.

##### 🧪 Exercise 2: Orders by Alice Smith
Return Alice’s orders and the names of the products she purchased.

##### 🧪 Exercise 3: High-Value Orders After Feb 1
Return all orders with a total_amount over 300 and an order_date on or after 2024-02-01.

## 🧠 Recap

| Concept          | Description                                          |
|------------------|------------------------------------------------------|
| `JOIN + WHERE`   | Combines tables and filters the resulting dataset   |
| `WHERE` clause   | Applies after JOIN to narrow down rows              |
| Multiple filters | Use `AND` to apply several filter conditions         |
