# 🚀 Optimization Report – Airbnb SQL Queries

## 📈 Objective

Improve the performance of SQL queries retrieving bookings, users, properties, and payments by analyzing execution plans and applying proper indexing.

---

## 🔍 Initial Observation

Using `EXPLAIN`, we observed that the following tables were scanned **fully** (`type = ALL`, `key = NULL`):

- `property`
- `booking`
- `payment`

This meant MySQL was not using any indexes, which could slow performance as the dataset grows.

---

## 🛠 Indexes Created

We applied the following indexes to improve join and filter performance:

```sql
-- Booking table: user_id and property_id are foreign keys
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_property ON booking(property_id);

-- Payment table: booking_id is a foreign key
CREATE INDEX idx_payment_booking ON payment(booking_id);

-- Property table: property_id may be used in joins (only if not already primary key)
CREATE INDEX idx_property_id ON property(property_id);
```


## 🧪 EXPLAIN After Indexing
Even after indexing, EXPLAIN still showed:
- type = ALL and key = NULL for most tables
- MySQL using join buffers (hash joins)

🧠 Reason: The dataset is currently very small (only 2–5 rows), so MySQL's optimizer intentionally avoids indexes because full scans are faster on small data.

## ✅ Result Summary
| Table      | Before Indexing (type) | After Indexing (type)  | Notes                           |
| ---------- | ---------------------- | ---------------------- | ------------------------------- |
| `booking`  | ALL                    | ALL                    | Index present, but not used yet |
| `property` | ALL                    | ALL                    | Same as above                   |
| `payment`  | ALL                    | ALL                    | Same as above                   |
| `user`     | eq\_ref (used PRIMARY) | eq\_ref (used PRIMARY) | ✅ Efficient                     |

## 💡Conclusion
- Indexes were successfully added on high-usage columns.
- MySQL is not yet using them due to small table size.
- These indexes will improve performance automatically as data volume increases.
- No changes to query logic needed at this stage.