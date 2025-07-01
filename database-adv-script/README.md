# 🧠 SQL Joins Practice — Airbnb Clone Dataset

This repository contains SQL queries written to demonstrate mastery of various SQL JOIN types using a simplified Airbnb-style database. The project explores how to effectively retrieve relational data using `INNER JOIN`, `LEFT JOIN`, and simulated `FULL OUTER JOIN` in MySQL.

## 🎯 Objective

To master SQL joins by writing complex queries using different types of joins.

## 🗂️ Database Overview

The project uses the following relational tables:

- `user` — Contains user details such as first name, email, and role.
- `property` — Lists properties hosted on the platform.
- `booking` — Contains booking data, linked to both users and properties.
- `review` — Stores user reviews for properties.
- `payment` — Tracks payment information for bookings.
- `message` — Includes messages exchanged between users.

## 📌 Queries Implemented

### 1️⃣ INNER JOIN: Retrieve All Bookings and the Users Who Made Them

```sql
SELECT
    booking.booking_id,
    booking.property_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email
FROM booking
INNER JOIN user ON booking.user_id = user.user_id;
```

### 2️⃣ LEFT JOIN: Retrieve All Properties and Their Reviews (If Any)

```sql
SELECT 
    property.host_id,
    property.name,
    property.location,
    property.pricepernight,
    review.review_id,
    review.property_id,
    review.rating,
    review.comment
FROM property
LEFT JOIN review ON property.property_id = review.property_id
ORDER BY review.rating ASC;
```

✅ This query includes all properties, even if no review exists for them.

### 3️⃣ FULL OUTER JOIN (Simulated in MySQL): Retrieve All Users and All Bookings

```sql
SELECT
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.user_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id

UNION

SELECT
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.user_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM user u
RIGHT JOIN booking b ON u.user_id = b.user_id;
```

✅ Since MySQL does not support `FULL OUTER JOIN` natively, this approach uses a `UNION` of `LEFT JOIN` and `RIGHT JOIN`.

# 🧠 SQL Subqueries — Airbnb Dataset Practice

This repository demonstrates the use of **non-correlated** and **correlated subqueries** in SQL to extract meaningful insights from a relational Airbnb-style database.

---

## 🎯 Objective

Write both **correlated** and **non-correlated subqueries** using realistic Airbnb-style data.

---

## 📘 What Are Subqueries?

- A **subquery** is a query nested inside another SQL query.
- Subqueries can be used in `WHERE`, `FROM`, or `SELECT` clauses.
- They allow filtering or aggregation based on data from other tables.

---

## 🔍 Types of Subqueries Covered

### 1️⃣ Non-Correlated Subquery  
**Find all properties where the average rating is greater than 4.0**

```sql
SELECT * 
FROM property 
WHERE property_id IN (
    SELECT property_id 
    FROM review 
    GROUP BY property_id 
    HAVING AVG(rating) > 4.0
);
```

✅ This subquery runs independently of the outer query. It returns a list of property_ids with an average rating above 4.0, which the outer query then filters against.

### 2️⃣ Correlated Subquery
**Find users who have made more than 3 bookings**

```sql
SELECT * 
FROM user u
WHERE (
    SELECT COUNT(*) 
    FROM booking b 
    WHERE b.user_id = u.user_id
) > 3;
```
✅ This subquery is correlated because it references a value (u.user_id) from the outer query. It runs once for each row in the outer query to count bookings per user.

## 🛠 Tools Used
- **MySQL** for data storage and querying.
- **SQLTools Extension (VS Code)** for writing and running SQL queries locally.

## 📚 Learning Outcomes
- Understood differences between `INNER`, `LEFT`, and simulated `FULL OUTER JOIN`s.
- Practiced writing complex queries that extract meaningful insights from relational data.
- Learned to simulate `FULL OUTER JOIN` in MySQL using `UNION`.
- Understood the difference between correlated and non-correlated subqueries.
- Practiced using subqueries in the WHERE clause to filter data.
- Strengthened SQL fundamentals for real-world database querying.