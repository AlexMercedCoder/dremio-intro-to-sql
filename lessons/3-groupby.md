# 📘 Lesson 3: Summarizing Data with GROUP BY and HAVING

In this lesson, you’ll learn how to **group** and **summarize** your data using the SQL `GROUP BY` clause, and how to apply filters **after aggregation** using `HAVING`.

We’re still working with:  
👉 `sampledata."normalized_sales.csv"`

---

## 📊 Why Grouping Matters

Raw data tells individual stories. Grouping lets you **see the big picture**. For example:
- Total sales per country
- Number of transactions per customer
- Average order value by payment method

---

## 🧠 1. `GROUP BY` – Aggregate by Category

The `GROUP BY` clause groups your rows based on the value of one or more columns, allowing you to apply **aggregate functions** like:

- `COUNT()` – number of records
- `SUM()` – total value
- `AVG()` – average value
- `MIN()` / `MAX()` – smallest/largest value

```sql
SELECT 
  shipping_country,
  COUNT(*) AS num_sales
FROM sampledata."normalized_sales.csv"
GROUP BY shipping_country;
```

✅ This returns a list of countries with the number of sales shipped to each.

#### 🧮 Casting for Aggregation
Since we're working with a CSV file, numeric columns like total_amount are stored as text. We must cast them before using in SUM, AVG, etc.

```sql
SELECT 
  shipping_country,
  SUM(CAST(total_amount AS DOUBLE)) AS total_sales
FROM sampledata."normalized_sales.csv"
GROUP BY shipping_country;
```

💡 `CAST(total_amount AS DOUBLE)` converts the string to a numeric type so Dremio can calculate the sum correctly.

## 🔍 2. `HAVING` – Filtering Aggregated Results
Once you’ve grouped and summarized your data, you may want to filter those results. That’s what `HAVING` is for.

```sql
SELECT 
  shipping_country,
  SUM(CAST(total_amount AS DOUBLE)) AS total_sales
FROM sampledata."normalized_sales.csv"
GROUP BY shipping_country
HAVING SUM(CAST(total_amount AS DOUBLE)) > 3000;
```

✅ This shows only countries where the total sales exceed $3,000.

⚠️ You can’t use `WHERE` to filter aggregate functions — that’s what `HAVING` is for.

## 🧪 Practice Exercises

#### 🧪 Exercise 1: Total Per Product
List each `product_name` and the total amount sold across all orders.

#### 🧪 Exercise 2: Customers with High Activity
Show the number of sales per customer and only include customers with more than 5 sales.

#### 🧪 Exercise 3: High-Volume Countries
List each `shipping_country` and the average `total_amount`, showing only those with an average over $500.

## 🧠 Recap

| Clause      | Purpose                                  |
|-------------|-------------------------------------------|
| `GROUP BY`  | Aggregate data by one or more columns     |
| `HAVING`    | Filter grouped/aggregated results         |
| `CAST(...)` | Ensure correct types for math operations  |
