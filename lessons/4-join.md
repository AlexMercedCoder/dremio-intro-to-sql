# 🔗 Lesson 4: Understanding JOINs

In this lesson, we’ll learn how to **combine data from multiple tables** using SQL JOINs. We’ll discuss primary and foreign keys and how to use `JOIN` to enrich datasets with related information.

---

## 🗂️ Datasets

We’ll use the following CSV files from the `sampledata` source:

- `customers.csv`
- `orders.csv` (now includes `product_id`)
- `products.csv`

Each file represents a logical table in our database model.

---

## 🛠️ Step 1: Format the CSV Files

Before we can query these files in Dremio:

1. Go to the `sampledata` space in the Dremio UI.
2. For each of the three files:
   - Click on the filename (e.g. `orders.csv`)
   - Click “Format File”
   - Choose **CSV**
   - Accept default settings and click **Save**

This step tells Dremio to treat the files as queryable datasets.

---

## 🔐 Step 2: Keys and Relationships

Relational systems often use **keys** to connect related data:

- A **primary key** is a column with unique values for each row.
- A **foreign key** is a reference to a primary key in another table.

In our example:

| Table     | Primary Key     | Foreign Key(s)                        |
|-----------|------------------|----------------------------------------|
| customers | `customer_id`    | —                                      |
| orders    | `order_id`       | `customer_id` → customers, `product_id` → products |
| products  | `product_id`     | —                                      |

---

## 🔗 Step 3: Basic `JOIN` Example

Let’s combine `orders`, `customers`, and `products` to get a full view of each order:

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
  ON o.product_id = p.product_id;

```

### 🔍 Explanation
- `JOIN ... ON` defines how rows from one table match with rows from another.

- `o.customer_id = c.customer_id` connects orders to customers.

- `o.product_id = p.product_id` connects orders to products.

- Aliases (`o`, `c`, `p`) make the query cleaner.

✅ Now we have a full picture: who placed the order, what they bought, and how much it cost.

### 🧪 Practice Exercise
Write a query to show:

- `customer_name`

- `product_name`

- `order_date`

- `total_amount`

For each order by joining all three tables.

🧠 Recap
Concept	Description
JOIN	Combines rows from multiple tables using keys
Primary Key	Uniquely identifies each row in a table
Foreign Key	References a primary key in another table
JOIN ... ON	Specifies the matching logic between tables