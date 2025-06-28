# 📦 Airbnb Sample Data Insertion

## 🎯 Objective

Populate the Airbnb relational database schema with **realistic sample data** using SQL `INSERT` statements. This data helps simulate how the system would behave in real-world use—covering users, properties, bookings, payments, reviews, and messages.

---

## 📋 Overview

This script includes `INSERT` statements for the following entities:

- 👤 **User**
- 🏡 **Property**
- 📅 **Booking**
- 💳 **Payment**
- ⭐ **Review**
- 💬 **Message**

Each table contains multiple records representing real-world scenarios, such as:
- A host listing multiple properties
- Guests making bookings and payments
- Guests leaving reviews
- Users sending messages

---

## 🗃️ Sample Data Summary

### 👤 Users
Includes 4 users with roles:
- 2 guests
- 1 host
- 1 admin  
Each user has unique information (email, phone, role).

### 🏡 Properties
2 properties listed by the host:
- "Cozy Cottage" in Cape Town
- "City Loft" in Johannesburg

### 📅 Bookings
2 bookings by different guests:
- One is confirmed
- One is pending

### 💳 Payments
2 payment records:
- Made via credit card and PayPal

### ⭐ Reviews
2 reviews:
- Each by a different guest
- Ratings within the valid 1–5 range

### 💬 Messages
2 messages:
- Guests communicating with host and admin

---