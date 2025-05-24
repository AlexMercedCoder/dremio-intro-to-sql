# 📘 Lesson 1: The Basics of SQL – SELECT, FROM, AS, ORDER BY, LIMIT

In this first lesson, we’ll introduce the foundational components of SQL used to retrieve and organize data. You'll learn how to:

- Select specific columns
- Indicate the dataset to query from
- Rename columns for readability
- Sort results
- Limit how many rows you see

We'll be working with the `sampledata.normalized_sales` dataset, which contains sales records with fields like customer names, products, prices, and countries.

---

## 🧠 Key SQL Clauses

### 1. `SELECT` – Choosing What to See

The `SELECT` clause tells SQL what columns to include in the result.

```sql
SELECT customer_name, product_name, total_amount
FROM sampledata."normalized_sales.csv";
```

This query retrieves a list of customer names, the product they bought, and the total amount spent.

**🔍 Note:** You can specify one or many columns separated by commas.

### 2. `FROM` – Where the Data Lives
The `FROM` clause specifies which dataset or table you're querying.

```sql
SELECT *
FROM sampledata."normalized_sales.csv";
```

Here, `sampledata` is the source you connected to in Dremio, and `"normalized_sales.csv"` is the CSV file (treated like a table). The `*` means “select all columns.”

### 3. `AS` – Renaming Columns
To improve readability or create business-friendly names, use `AS` to assign a new alias to a column.

```sql
SELECT 
  customer_name AS customer,
  product_name AS item,
  total_amount AS total_spent
FROM sampledata."normalized_sales.csv";
```

🏷️ Aliases are optional but very useful for reporting or simplifying complex expressions.

### 4. `ORDER BY` – Sorting Results
`ORDER BY` allows you to sort your data based on one or more columns.

```sql
SELECT 
  customer_name,
  total_amount
FROM sampledata."normalized_sales.csv"
ORDER BY total_amount DESC;
```

- `ASC` = Ascending (default)

- `DESC` = Descending

📊 This example shows the highest spending customers at the top.

### 5. LIMIT – Trimming Results
Sometimes you don’t want to see all the data. Use `LIMIT` to restrict how many rows are returned.

```sql
SELECT 
  customer_name,
  total_amount
FROM sampledata."normalized_sales.csv"
ORDER BY total_amount DESC
LIMIT 5;
```

This query returns the top 5 highest spending customers.

### 🛠️ Try It Yourself

##### 🧪 Exercise 1: Select Specific Columns
Write a query to show:

- `customer_name`

- `product_category`

- `payment_method`

##### 🧪 Exercise 2: Rename and Sort
Write a query to return:

- `product_name` as `item`

- `total_amount` as `amount_spent`

- Sort the results by `amount_spent` descending.

### 🧪 Exercise 3: Top Sellers
Write a query to find the top 10 transactions by total_amount.

## 🧠 Recap

| SQL Clause | Purpose                          |
|------------|----------------------------------|
| `SELECT`   | Pick specific columns            |
| `FROM`     | Choose the dataset or table      |
| `AS`       | Rename columns for clarity       |
| `ORDER BY` | Sort results                     |
| `LIMIT`    | Control number of rows shown     |


