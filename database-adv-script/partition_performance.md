# 🚀 Booking Table Partitioning – Performance Evaluation

This repository demonstrates the use of **table partitioning** in MySQL to optimize query performance on large datasets.

## 🎯 Objective

To test whether partitioning the `booking` table by the `start_date` column improves performance when querying by date ranges.

---

## ⚙️ Setup

We created a new table `booking_partitioned` with the same structure as the original `booking` table but partitioned by `start_date`.

### 🔧 Partitioned Table Definition

```sql
CREATE TABLE booking_partitioned (
    booking_id CHAR(36),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE COLUMNS(start_date) (
    PARTITION p2022 VALUES LESS THAN ('2023-01-01'),
    PARTITION p2023 VALUES LESS THAN ('2024-01-01'),
    PARTITION p2024 VALUES LESS THAN ('2025-01-01'),
    PARTITION pmax VALUES LESS THAN (MAXVALUE)
);
```
⚠️ Note: Foreign keys are not supported on partitioned tables in MySQL, so they were omitted during this test.

## 📊 Performance Testing
We used the EXPLAIN statement to analyze performance on both the original and partitioned table using the same query:

### 🔍 Test Query

```sql
SELECT * FROM booking WHERE start_date >= '2025-01-01';
```

## 📋 Results

### 🧾 Original Table

```sql
EXPLAIN SELECT * FROM booking WHERE start_date >= '2025-01-01';
```
| table   | partitions | type | key  | rows | Extra       |
| ------- | ---------- | ---- | ---- | ---- | ----------- |
| booking | NULL       | ALL  | NULL | 2    | Using where |

### 🧾 Partitioned Table

```sql
EXPLAIN SELECT * FROM booking_partitioned WHERE start_date >= '2025-01-01';
```
| table                | partitions | type | key  | rows | Extra       |
| -------------------- | ---------- | ---- | ---- | ---- | ----------- |
| booking\_partitioned | pmax       | ALL  | NULL | 2    | Using where |

🧠 Observations
- No measurable performance improvement was observed.
- MySQL still performed a full table scan (type = ALL) on both tables.
- This is expected because the dataset only contains 2 rows, which is too small for the optimizer to leverage partition pruning or indexing benefits.

## ✅ Conclusion
Partitioning is a powerful feature in MySQL — but its benefits are only visible on large datasets (thousands to millions of rows). In small test environments, query planners may still opt for a full scan due to the low cost.

📌 Lesson learned: Partitioning improves query efficiency in large-scale applications, especially for time-based filtering — but doesn't make a noticeable difference on small datasets.