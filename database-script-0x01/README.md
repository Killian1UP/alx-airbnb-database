# 🏨 Airbnb Database Schema

## 📌 Objective

Design and implement a relational database schema for an Airbnb-like platform using SQL. The schema includes users, property listings, bookings, payments, reviews, and messaging features.

---

## 🧱 Schema Overview

This project contains SQL `CREATE TABLE` statements for the following entities:

- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

Each table includes:
- Proper data types (`CHAR(36)` for UUIDs, `VARCHAR`, `DECIMAL`, etc.)
- Constraints (`NOT NULL`, `UNIQUE`, `CHECK`, `ENUM`)
- Primary and foreign key relationships
- Indexes where appropriate (e.g., primary keys and unique fields)

---

## 🧩 Entities & Key Fields

### 👤 User
- `user_id` (Primary Key, UUID, Indexed)
- `email` (UNIQUE, NOT NULL)
- `role` (ENUM: guest, host, admin)

### 🏠 Property
- `property_id` (Primary Key)
- `host_id` (Foreign Key → User)
- `pricepernight` (DECIMAL)

### 📅 Booking
- `booking_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `user_id` (Foreign Key → User)
- `status` (ENUM: pending, confirmed, canceled)

### 💳 Payment
- `payment_id` (Primary Key)
- `booking_id` (Foreign Key → Booking)
- `payment_method` (ENUM: credit_card, paypal, stripe)

### ⭐ Review
- `review_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `user_id` (Foreign Key → User)
- `rating` (INT with CHECK constraint: 1 to 5)

### 💬 Message
- `message_id` (Primary Key)
- `sender_id` and `recipient_id` (Foreign Keys → User)

---

## ✅ Features Implemented

- [x] All tables created with appropriate data types
- [x] Constraints: `NOT NULL`, `UNIQUE`, `CHECK`, `ENUM`
- [x] Foreign key relationships for referential integrity
- [x] Timestamps with default and update triggers
- [x] Indexing on primary keys and important columns (e.g., `email`)

---