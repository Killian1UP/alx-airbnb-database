# 🧮 Database Normalization – Airbnb Schema

## 🎯 Objective

Ensure the Airbnb database schema is normalized to **Third Normal Form (3NF)** to eliminate redundancy, ensure data integrity, and improve maintainability.

---

## 🧩 Normalization Process

### 📗 First Normal Form (1NF)
**Definition**: A table is in 1NF if:
- It has a primary key.
- All attributes are atomic (no repeating groups or arrays).

✅ **Compliance**:
- All tables (User, Property, Booking, Payment, Review, Message) have clearly defined primary keys.
- All columns hold atomic values (e.g., `first_name`, `email`, `pricepernight`, etc.).
- No multi-valued or composite attributes.

✅ **Result**: All tables are in **1NF**.

---

### 📘 Second Normal Form (2NF)
**Definition**: A table is in 2NF if:
- It is in 1NF.
- All non-key attributes are fully functionally dependent on the entire primary key.

✅ **Compliance**:
- All tables use single-column primary keys (`user_id`, `property_id`, etc.).
- No partial dependencies exist because no table uses a composite key.

✅ **Result**: All tables are in **2NF**.

---

### 📙 Third Normal Form (3NF)
**Definition**: A table is in 3NF if:
- It is in 2NF.
- There are no transitive dependencies (i.e., non-key attributes do not depend on other non-key attributes).

✅ **Review by Table**:

#### 1. **User**
- `user_id` → all other fields (no transitive dependency).
- `role` is atomic and not derived from any other field.

✅ In 3NF.

---

#### 2. **Property**
- `property_id` → all other fields.
- `host_id` is a foreign key; no transitive dependency exists among attributes.

✅ In 3NF.

---

#### 3. **Booking**
- `booking_id` → all other fields.
- `property_id` and `user_id` are foreign keys; `status`, `start_date`, `end_date`, `total_price` are independent of each other.

✅ In 3NF.

---

#### 4. **Payment**
- `payment_id` → all other fields.
- No transitive dependencies (e.g., `payment_method` is independent of `amount` or `booking_id`).

✅ In 3NF.

---

#### 5. **Review**
- `review_id` → all other fields.
- No redundant or derived data.

✅ In 3NF.

---

#### 6. **Message**
- `message_id` → all other fields.
- `sender_id` and `recipient_id` are independent of `message_body` and `sent_at`.

✅ In 3NF.

---

## 🔍 Summary of Findings

| Table     | 1NF | 2NF | 3NF | Notes                         |
|-----------|-----|-----|-----|-------------------------------|
| User      | ✅  | ✅  | ✅  | No transitive dependencies     |
| Property  | ✅  | ✅  | ✅  | All fields depend on PK        |
| Booking   | ✅  | ✅  | ✅  | Clean foreign key usage        |
| Payment   | ✅  | ✅  | ✅  | No derived or repeated fields  |
| Review    | ✅  | ✅  | ✅  | `rating` has value constraints |
| Message   | ✅  | ✅  | ✅  | Clear structure, no redundancy |

---

## 🧼 Conclusion

The Airbnb database schema is fully normalized to **Third Normal Form (3NF)**:
- All data is atomic.
- No partial or transitive dependencies exist.
- Relationships between entities are well-structured using foreign keys.
- Constraints and indexes are appropriately applied.

✅ **No redesign or refactoring is required.**

---

