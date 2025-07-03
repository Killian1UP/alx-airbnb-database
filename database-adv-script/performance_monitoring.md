
# 📈 Performance Monitoring Report

This report documents query performance analysis and optimizations applied to improve efficiency when working with the **Airbnb Clone SQL dataset**.

## 🎯 Objective
Use SQL performance monitoring tools like `EXPLAIN ANALYZE` to identify inefficiencies in query execution and apply optimizations (e.g., indexes or schema adjustments) to improve performance.

---

## 🔍 Test 1: Property Average Rating Query (Subquery)

### ✅ Initial Query
```sql
EXPLAIN ANALYZE
SELECT *
FROM property
WHERE property_id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
ORDER BY name ASC;
```

### 🔎 Findings (Before Optimization)
- **Table scan** on `property` (type = ALL, key = NULL)
- **No index usage** on `review`
- **Execution Time**: ~0.24 seconds
- **Join Method**: Subquery filter with deduplication and materialization

### 🛠 Optimizations Applied
- Created index on `property(name)` → `idx_property_name`
- Created index on `review(property_id, rating)` → `idx_review_property_rating`

### ✅ Results (After Optimization)
```sql
EXPLAIN ANALYZE
SELECT 
    p.property_id,
    p.name,
    p.location,
    AVG(r.rating) AS avg_rating
FROM property p
JOIN review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name, p.location
HAVING avg_rating > 4.0
ORDER BY p.name ASC;
```

- ✅ Index on `property` used for name sorting
- ✅ Index on `review` used for JOIN and aggregation
- ✅ Execution time dropped to **~0.01 seconds**
- ✅ `Covering index scan` and `index lookup` observed

---

## 🔍 Test 2: Window Functions with Bookings

### Query Using ROW_NUMBER and RANK
```sql
SELECT
    b.property_id,
    p.name,
    p.location,
    b.booking_id,
    b.status,
    ROW_NUMBER() OVER (PARTITION BY b.property_id ORDER BY b.booking_id DESC) AS row_num,
    RANK () OVER (PARTITION BY b.property_id ORDER BY b.booking_id) AS rank_num
FROM booking b   
JOIN property p ON b.property_id = p.property_id;
```

### 🔎 Findings
- ✅ Executed successfully using MySQL 8+ window functions
- ✅ Worked as expected to rank bookings by property
- ⚠️ No index usage observed in EXPLAIN (small dataset impact)

### 🛠 Suggestions
- Add index on `booking(property_id, booking_id)` to improve partition-based row scans

---

## 📌 Conclusion

| Test | Bottlenecks Found | Actions Taken | Result |
|------|-------------------|---------------|--------|
| Property Avg Rating | Table scans, no index | Indexes on `property.name` and `review.property_id, rating` | ✅ Query optimized |
| Booking Rank | No major issues | Used window functions, suggest index | ✅ Logical correctness; optional speedup with index |

---

## 🛠 Tools Used
- MySQL 8.0+
- EXPLAIN ANALYZE
- SQLTools Extension (VS Code)