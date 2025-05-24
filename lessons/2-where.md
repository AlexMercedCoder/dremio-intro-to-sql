# 📘 Lesson 2: Filtering Rows with WHERE, AND, OR, IN, BETWEEN, LIKE, IS NULL

In this lesson, we explore how to **filter rows** in your dataset to return only the data you're interested in. These filters are applied using the `WHERE` clause and several powerful operators.

We'll continue using the dataset:  
👉 `sampledata."normalized_sales.csv"`

---

## 🧠 Why Filtering Matters

Most real-world datasets are large and messy. You rarely want to look at everything. SQL filters let you:

- Zoom in on specific customers, products, or regions
- Focus on a date range
- Remove irrelevant data for analysis

---

## 🔎 1. `WHERE` – The Core Filter

The `WHERE` clause narrows your query to only rows that meet certain **conditions**.

```sql
SELECT * 
FROM sampledata."normalized_sales.csv"
WHERE shipping_country = 'Indonesia';
```

🎯 This will return only the sales where the item was shipped to Indonesia.

## 🔗 2. `AND` / `OR` – Combine Conditions
You can combine multiple conditions with `AND` and `OR`.

```sql
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE shipping_country = 'Indonesia'
  AND payment_method = 'Cash';
```

✅ Only shows sales in Indonesia and paid with Cash.

```sql
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE payment_method = 'Paypal'
   OR payment_method = 'Credit Card';
```

✅ Returns sales that used either Paypal or Credit Card.

## 📦 3. `IN` – Match Multiple Values
`IN` is a clean way to check if a column's value is one of many.

```sql
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE shipping_country IN ('Brazil', 'Russia', 'Indonesia');
```

✅ Returns only rows where the `shipping_country` is one of the listed values.

## 📅 4. `BETWEEN` – Filter Ranges (with Type Casting)

When working with CSV files, all columns are initially interpreted as **text strings** in Dremio. To perform numerical comparisons (like checking for values within a range), you need to **explicitly cast** the field into a number.

Use `BETWEEN` to filter values that fall within a numeric or date range (inclusive):

```sql
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE CAST(total_amount AS DOUBLE) BETWEEN 500 AND 1000;
```

✅ This query returns all sales where the `total_amount` is between `500` and `1000`, after converting the field into a numeric type (`CAST` allowss you to convert a column to a different data type).

> 💡 If you skip the `CAST`, Dremio will treat values like `"900"` and `"100"` as text, which can lead to incorrect comparisons. This is because CSV files schema-less, Parquet files have explicit schemas so you wouldn't need to cast different columns as Dremio would know each colummn's data type.

## 🔤 5. `LIKE` – Pattern Matching
`LIKE` lets you filter string columns by pattern. Use % as a wildcard.

```sql
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE customer_name LIKE 'A%';
```

✅ Returns customers whose names start with “A”.

```sql
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE customer_name LIKE '%son';
```

✅ Returns names that end with “son”.

## 🚫 6. IS NULL – Check for Missing Data
In SQL, missing data is represented by NULL. Use IS NULL or IS NOT NULL to find those values.

```sql
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE product_name IS NULL;
```
⚠️ This returns rows with no product name. Which will be no rows in this dataset.

```sql
SELECT *
FROM sampledata."normalized_sales.csv"
WHERE total_amount IS NOT NULL;
```

✅ Returns only rows where total amount is present (not missing). Which is all rows in this dataset.

## 🧪 Practice Exercises
#### 🧪 Exercise 1: Clothing in Brazil
Write a query to find sales of Clothing products shipped to Brazil.

#### 🧪 Exercise 2: Large Orders Paid with Paypal
Find rows where:

- `total_amount` is between `900` and `1200`

- `payment_method` is `'Paypal'`

#### 🧪 Exercise 3: Names with "son"
Find customers whose names contain the string “son”.

#### 🧪 Exercise 4: Unknown Product
Find all rows where product_name is missing (NULL).

## 🧠 Recap

| Operator     | Description                     |
|--------------|----------------------------------|
| `WHERE`      | Filters rows                     |
| `AND` / `OR` | Combines conditions              |
| `IN`         | Checks for multiple values       |
| `BETWEEN`    | Filters ranges (inclusive)       |
| `LIKE`       | Matches string patterns          |
| `IS NULL`    | Checks for missing values        |
