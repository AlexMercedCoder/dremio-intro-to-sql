# 🧭 Exploring More SQL: Beyond the Basics

You've now completed a solid foundation in SQL using Dremio, covering:

- `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `LIMIT`
- `GROUP BY`, `HAVING`, `JOIN`
- Basic filtering and aggregation logic

But SQL is a vast language with **many more features** that can help you build powerful, expressive queries.

Below are some additional SQL keywords and concepts you may encounter. While we haven’t covered them directly in this course, they are worth exploring further — especially in the context of Dremio.

---

## 🔍 More SQL Keywords to Explore

| Keyword        | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `UNION`        | Combines the results of two `SELECT` statements into a single result set     |
| `CASE`         | Enables conditional logic to create new calculated fields                   |
| `DISTINCT`     | Removes duplicate rows from the result set                                  |
| `NULLIF`       | Returns `NULL` if two expressions are equal                                 |
| `COALESCE`     | Returns the first non-null value in a list                                  |
| `EXISTS`       | Checks whether a subquery returns any rows                                  |
| `IN`           | Checks if a value exists in a list or subquery result                       |
| `IS NOT NULL`  | Filters out null values                                                     |
| `DATE_TRUNC`   | Truncates a date to a specific part (e.g., month, year)                     |
| `EXTRACT`      | Retrieves a specific part of a date (e.g., day, month, year)                |
| `CTE` / `WITH` | Common Table Expressions, useful for structuring complex queries             |
| `WINDOW`       | Enables advanced analytical functions (e.g., running totals, rankings)       |
| `PIVOT`        | Rotates rows into columns for reshaping tabular data                        |

---

## 📚 Learn More with Dremio Documentation

Dremio supports many standard SQL operations, along with its own extensions and optimizations. To dive deeper:

👉 **Explore the official docs at [docs.dremio.com](https://docs.dremio.com)**

There, you'll find:
- Detailed SQL function reference
- Examples of advanced query techniques
- Documentation for reflection-based acceleration, datasets, sources, and more

---

## 🧪 Bonus Challenge

Choose one of the keywords above that you’re curious about. Use the Dremio docs to:
1. Look up its syntax
2. Try applying it in a query using one of your workshop datasets
3. Share your result with a peer or mentor

---

You're now ready to continue exploring SQL and Dremio's full capabilities — happy querying!
