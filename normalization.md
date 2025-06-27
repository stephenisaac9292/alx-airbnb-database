# 🧾 Database Normalization Documentation

This documentation explains how the database schema for the Property Booking System has been normalized up to the **Third Normal Form (3NF)** to ensure minimal redundancy and optimal data integrity.

---

## ✅ What is Normalization?

Normalization is the process of structuring a relational database to:
- Remove redundancy
- Prevent anomalies (update, insert, delete)
- Ensure data integrity

The schema achieves the following normal forms:

---

## 🔹 First Normal Form (1NF)
**Requirements:**
- Atomic (indivisible) values
- No repeating groups or arrays

**Applied:**
- All attributes hold single values (e.g. `email`, `phone_number`, `pricepernight`)
- No multi-valued or nested fields

✅ All tables follow 1NF.

---

## 🔹 Second Normal Form (2NF)
**Requirements:**
- Satisfies 1NF
- Every non-key attribute must be fully functionally dependent on the **whole primary key**

**Applied:**
- All primary keys are single-column (UUIDs), so partial dependency doesn't exist
- All fields depend entirely on the primary key

✅ All tables follow 2NF.

---

## 🔹 Third Normal Form (3NF)
**Requirements:**
- Satisfies 2NF
- No transitive dependencies (i.e., non-key attributes must not depend on other non-key attributes)

**Applied:**
- Fields like `email`, `role`, `rating`, etc. depend directly on their table’s primary key
- No derived or indirectly related data is stored in the same table (e.g. total payment isn't repeated in multiple places)

✅ All tables follow 3NF.

---

## ✅ Summary

| Table      | 1NF | 2NF | 3NF |
|------------|-----|-----|-----|
| User       | ✅  | ✅  | ✅  |
| Property   | ✅  | ✅  | ✅  |
| Booking    | ✅  | ✅  | ✅  |
| Payment    | ✅  | ✅  | ✅  |
| Review     | ✅  | ✅  | ✅  |
| Message    | ✅  | ✅  | ✅  |

---

## 💡 Conclusion

The schema is fully normalized up to the **Third Normal Form (3NF)**:
- Redundancy is minimized
- Data consistency is ensured
- Schema is scalable and efficient for querying and maintenance
