# E-Commerce Order Management System

## 📌 Project Overview

The **E-Commerce Order Management System** is a MySQL-based database project designed to manage products, categories, customers, orders, payments, and shipping information.

This project demonstrates essential and advanced SQL concepts, including database creation, CRUD operations, filtering, sorting, grouping, aggregate functions, joins, subqueries, date and string functions, window functions, and CASE expressions.

## 🎯 Objectives

- Design a relational database for an e-commerce business.
- Manage product inventory and customer information.
- Store and retrieve order details.
- Analyze sales, revenue, and customer spending.
- Practice SQL queries from beginner to advanced levels.
- Understand relationships between multiple database tables.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Query Language:** SQL
- **Concepts:** Relational Database Management System (RDBMS)

## 🗂️ Database Schema

The project contains seven tables:

| Table Name | Description |
|---|---|
| `Categories` | Stores product categories. |
| `Products` | Stores product details, prices, and stock quantities. |
| `Customers` | Stores customer contact and registration information. |
| `Orders` | Stores customer orders, dates, amounts, and statuses. |
| `Order_Items` | Stores products associated with each order. |
| `Payments` | Stores payment methods, dates, and statuses. |
| `Shipping` | Stores shipping and delivery information. |

### Database Relationships

- A category can contain multiple products.
- A customer can place multiple orders.
- An order can contain multiple order items.
- Each order item references a product.
- Orders can have associated payment and shipping records.

Primary keys and foreign keys help maintain relationships between the tables.

## 📚 SQL Concepts Covered

### 1. Database Creation and Schema Design
- `CREATE DATABASE`
- `USE`
- `CREATE TABLE`
- Primary keys
- Foreign keys
- `AUTO_INCREMENT`

### 2. CRUD Operations
- `INSERT` – Add records.
- `SELECT` – Retrieve records.
- `UPDATE` – Modify existing records.
- `DELETE` – Remove records.

### 3. SQL Clauses
- `WHERE`
- `HAVING`
- `ORDER BY`
- `GROUP BY`
- `LIMIT`

### 4. SQL Operators
- `AND`
- `OR`
- `NOT`
- Comparison operators
- Logical conditions

### 5. Sorting and Grouping
- Sort products by price.
- Count orders for each customer.
- Calculate revenue by product category.

### 6. Aggregate Functions
- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`
- `COUNT()`

### 7. SQL Joins
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- Simulated `FULL OUTER JOIN` using `UNION`

### 8. Subqueries
- Find orders placed by recently registered customers.
- Identify high-spending customers.
- Find products that have never been ordered.

### 9. Date and Time Functions
- `MONTH()`
- `DATEDIFF()`
- `DATE_FORMAT()`
- `CURRENT_DATE`
- `INTERVAL`

### 10. String Functions
- `UPPER()`
- `TRIM()`
- `COALESCE()`

### 11. Window Functions
- `RANK()`
- `OVER()`
- Running totals
- Cumulative monthly revenue

### 12. CASE Expressions
- Categorize customers by spending.
- Assign loyalty levels.
- Classify products based on units sold.

## 📊 Key Features

- Product and category management.
- Customer registration data management.
- Order tracking and status filtering.
- Inventory quantity updates.
- Sales and revenue calculations.
- Customer spending analysis.
- Payment and shipping status tracking.
- Product popularity analysis.
- Customer loyalty classification.
- Monthly revenue and running-total analysis.

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench, or use another compatible MySQL client.
2. Open the MySQL query editor.
3. Copy the SQL script into a new query tab.
4. Execute the script section by section, starting with database creation.
5. Run the SELECT queries to explore and analyze the data.

**Note:** The supplied script inserts sample records into the `Categories`, `Products`, `Customers`, and `Orders` tables. The `Order_Items`, `Payments`, and `Shipping` tables are created but do not receive sample records. Insert related records into these tables to test revenue, payment, shipping, and product-sales queries with meaningful results.

If the script is executed repeatedly, existing tables may cause errors because the table definitions do not include `DROP TABLE IF EXISTS`.

## 💡 Learning Outcomes

By completing this project, I practiced:

- Designing a relational database.
- Creating tables and defining relationships.
- Writing SQL queries to retrieve and manipulate data.
- Applying joins and subqueries to related datasets.
- Using aggregate functions for sales analysis.
- Applying window functions to calculate rankings and running totals.
- Using conditional logic to categorize records.
- Understanding how SQL supports business data analysis.

## 🔮 Future Improvements

- Add sample data for order items, payments, and shipping.
- Implement constraints for valid prices, quantities, and order statuses.
- Add indexes to improve query performance.
- Create stored procedures and triggers for inventory management.
- Build a dashboard using Power BI or Python.
- Integrate the database with a Python application.
- Add more advanced sales and customer analytics.

## 👨‍💻 Author

**Mihir Parmar**

- GitHub: [mihirparmarh2005-boop](https://github.com/mihirparmarh2005-boop)

## 📄 License

This project is intended for educational and learning purposes.
