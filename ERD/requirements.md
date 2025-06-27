# 🗃️ ER Design for Property Booking System

This document provides a detailed description of the Entity-Relationship (ER) model for a property booking system, including users, listings, bookings, payments, reviews, and messaging between users.

---

## 📑 Entities and Attributes

### 👤 User
| Attribute       | Type                                      | Description                         |
|----------------|-------------------------------------------|-------------------------------------|
| `user_id`       | UUID, PK, Indexed                         | Unique identifier for each user     |
| `first_name`    | VARCHAR, NOT NULL                         | First name of the user              |
| `last_name`     | VARCHAR, NOT NULL                         | Last name of the user               |
| `email`         | VARCHAR, UNIQUE, NOT NULL                 | Email address                       |
| `password_hash` | VARCHAR, NOT NULL                         | Secure password hash                |
| `phone_number`  | VARCHAR, NULL                             | Optional phone number               |
| `role`          | ENUM(`guest`, `host`, `admin`), NOT NULL | User's role in the system           |
| `created_at`    | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP      | User creation timestamp             |

---

### 🏠 Property
| Attribute        | Type                               | Description                               |
|------------------|------------------------------------|-------------------------------------------|
| `property_id`     | UUID, PK, Indexed                  | Unique ID for the property                |
| `host_id`         | UUID, FK → `User(user_id)`         | References the hosting user               |
| `name`            | VARCHAR, NOT NULL                  | Property name                             |
| `description`     | TEXT, NOT NULL                     | Property details                          |
| `location`        | VARCHAR, NOT NULL                  | Geographical location                     |
| `pricepernight`   | DECIMAL, NOT NULL                  | Cost per night                            |
| `created_at`      | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | When the property was listed             |
| `updated_at`      | TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP | Last updated time                     |

---

### 📅 Booking
| Attribute      | Type                            | Description                                |
|----------------|----------------------------------|--------------------------------------------|
| `booking_id`    | UUID, PK, Indexed               | Unique booking identifier                  |
| `property_id`   | UUID, FK → `Property(property_id)` | Booked property                        |
| `user_id`       | UUID, FK → `User(user_id)`      | Booking user                               |
| `start_date`    | DATE, NOT NULL                  | Start of stay                              |
| `end_date`      | DATE, NOT NULL                  | End of stay                                |
| `total_price`   | DECIMAL, NOT NULL               | Calculated total price                     |
| `status`        | ENUM(`pending`, `confirmed`, `canceled`), NOT NULL | Current booking status   |
| `created_at`    | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | When booking was made                  |

---

### 💳 Payment
| Attribute       | Type                            | Description                                |
|-----------------|----------------------------------|--------------------------------------------|
| `payment_id`     | UUID, PK, Indexed               | Unique payment identifier                  |
| `booking_id`     | UUID, FK → `Booking(booking_id)` | Associated booking                      |
| `amount`         | DECIMAL, NOT NULL               | Paid amount                                |
| `payment_date`   | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | Payment timestamp                      |
| `payment_method` | ENUM(`credit_card`, `paypal`, `stripe`), NOT NULL | Method used                 |

---

### 🌟 Review
| Attribute     | Type                             | Description                                |
|---------------|----------------------------------|--------------------------------------------|
| `review_id`     | UUID, PK, Indexed              | Unique review ID                           |
| `property_id`   | UUID, FK → `Property(property_id)` | Reviewed property                      |
| `user_id`       | UUID, FK → `User(user_id)`     | User who wrote the review                  |
| `rating`        | INTEGER CHECK(1–5), NOT NULL   | Rating from 1 to 5                         |
| `comment`       | TEXT, NOT NULL                 | Written feedback                           |
| `created_at`    | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | Review time stamp                     |

---

### 💬 Message
| Attribute       | Type                         | Description                                |
|------------------|------------------------------|--------------------------------------------|
| `message_id`      | UUID, PK, Indexed            | Unique message ID                          |
| `sender_id`       | UUID, FK → `User(user_id)`   | Sender of the message                      |
| `recipient_id`    | UUID, FK → `User(user_id)`   | Recipient of the message                   |
| `message_body`    | TEXT, NOT NULL               | Message content                            |
| `sent_at`         | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | When message was sent              |

---

## 🧱 Constraints

- **User**
  - `email` must be unique.
  - Non-null for essential fields.
- **Property**
  - `host_id` must reference a valid user.
- **Booking**
  - `status` must be `pending`, `confirmed`, or `canceled`.
  - Foreign keys link to valid users and properties.
- **Review**
  - Rating must be between 1 and 5.
- **Payment**
  - Tied to a valid booking only.
- **Message**
  - Both sender and recipient must be valid users.

---

## ⚡ Indexing

| Table       | Indexed Fields                                |
|-------------|------------------------------------------------|
| User        | `user_id`, `email`                             |
| Property    | `property_id`, `host_id`                       |
| Booking     | `booking_id`, `property_id`, `user_id`         |
| Payment     | `payment_id`, `booking_id`                     |
| Review      | `review_id`, `property_id`, `user_id`          |
| Message     | `message_id`, `sender_id`, `recipient_id`      |

---



./assets/airbnbERDiagram.png

