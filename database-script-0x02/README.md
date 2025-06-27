# 📦 Airbnb Clone — Sample Data Population

## 📁 Directory: `database-script-0x02`  
## 📄 File: `seed.sql`

This SQL script populates the Airbnb Clone database with realistic, relational sample data across all entities in the system. It also applies indexes to optimize query performance based on primary and foreign keys.

---

## 🧠 Objective

> Populate the database with sample records that simulate real-world usage, including:
- 5 Users with different roles
- 5 Properties hosted by valid users
- 5 Bookings linking guests to properties
- 5 Payments attached to bookings
- 5 Reviews tied to users and properties
- 5 Private messages between users

---

## ⚙️ How to Use

1. Ensure all required tables are already created (with correct constraints and UUID support).
2. Open your terminal and run:

```bash
psql -U <your_db_user> -d <your_db_name> -f seed.sql
```

3. Replace `<your_db_user>` and `<your_db_name>` with your actual database credentials.

---

## 🧾 Features

### ✅ UUIDs Used for All IDs  
- Every primary key (`user_id`, `property_id`, etc.) uses UUIDs.
- UUIDs are hardcoded but valid and unique.

### ✅ Foreign Key Relationships Preserved  
- Properties are linked to real users (hosts).
- Bookings reference valid users and properties.
- Payments reference bookings.
- Reviews and messages reference existing users and properties.

### ✅ Indexes Included
Indexes are manually created for all `*_id` columns to improve performance, even though primary keys are auto-indexed. This includes:
- `user_id`, `property_id`, `booking_id`, etc.
- Foreign key fields like `host_id`, `sender_id`, `recipient_id`, etc.
- User `email` field (for fast lookup and enforcing uniqueness).

---

## 🧪 Example Entities

### 👤 Users
- Alice (Host)
- Bob (Guest)
- Eve (Admin)

### 🏡 Properties
- Seaside Cottage (by Alice)
- City Loft (by David)

### 📅 Bookings
- Bob books Seaside Cottage
- Carol books City Loft

### 💳 Payments
- All bookings have matching payments using various methods (PayPal, Stripe, etc.)

### 📝 Reviews
- Guests leave ratings from 3–5 stars with relevant comments

### 💬 Messages
- Guests ask hosts questions before or after bookings

---

## 🧼 Optional Enhancements

- Add `DROP TABLE IF EXISTS` or `DELETE FROM ...` at the top of the script if you want to reset the data before each run.
- Use PostgreSQL’s `gen_random_uuid()` if you prefer dynamically generated UUIDs.

---

## 📌 Notes

- Designed for PostgreSQL.
- Assumes all constraints (foreign keys, enums, timestamps, etc.) are already enforced at schema level.
- Use this file for local testing, demos, or CI test setups.

---

> Created with ❤️ for the ALX Airbnb clone project.
