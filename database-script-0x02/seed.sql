-- ============================
-- INDEXES ON ID COLUMNS
-- ============================

-- USER TABLE
CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);

-- PROPERTY TABLE
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- BOOKING TABLE
CREATE INDEX idx_booking_id ON Booking(booking_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- PAYMENT TABLE
CREATE INDEX idx_payment_id ON Payment(payment_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- REVIEW TABLE
CREATE INDEX idx_review_id ON Review(review_id);
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);

-- MESSAGE TABLE
CREATE INDEX idx_message_id ON Message(message_id);
CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);

-- ============================
-- USERS
-- ============================
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('1ad7c69e-14a4-4bc0-85ef-c5e764f01a10', 'Alice', 'Smith', 'alice@example.com', 'passhash1', '08010000001', 'host', CURRENT_TIMESTAMP),
  ('2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', 'Bob', 'Johnson', 'bob@example.com', 'passhash2', '08010000002', 'guest', CURRENT_TIMESTAMP),
  ('3c6f0847-7e2a-4239-9af4-48ea8263b54e', 'Carol', 'Williams', 'carol@example.com', 'passhash3', '08010000003', 'guest', CURRENT_TIMESTAMP),
  ('4a708bfd-67a6-4e63-8bd0-b7f3e5cd9f6f', 'David', 'Brown', 'david@example.com', 'passhash4', '08010000004', 'host', CURRENT_TIMESTAMP),
  ('5f4b1271-2784-4e1b-89fc-c2e91fda5613', 'Eve', 'Davis', 'eve@example.com', 'passhash5', '08010000005', 'admin', CURRENT_TIMESTAMP);

-- ============================
-- PROPERTIES
-- ============================
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at)
VALUES
  ('a5be3dd7-5b4c-4931-8b43-fccab2f73e27', '1ad7c69e-14a4-4bc0-85ef-c5e764f01a10', 'Seaside Cottage', 'A cozy cottage near the beach.', 'Lagos', 120.00, CURRENT_TIMESTAMP),
  ('b2e802de-7959-4b85-93e0-3bfcbbf9c9f3', '4a708bfd-67a6-4e63-8bd0-b7f3e5cd9f6f', 'City Loft', 'Modern loft in the city center.', 'Abuja', 200.00, CURRENT_TIMESTAMP),
  ('c3a2a3d0-839e-4b1b-84e8-6e159d86f997', '1ad7c69e-14a4-4bc0-85ef-c5e764f01a10', 'Hilltop Cabin', 'Rustic cabin with a view.', 'Jos', 150.00, CURRENT_TIMESTAMP),
  ('d5c41eb2-1983-45b3-8b6c-fcbcbf05ae24', '4a708bfd-67a6-4e63-8bd0-b7f3e5cd9f6f', 'Luxury Villa', '5-bedroom luxury villa with pool.', 'Port Harcourt', 450.00, CURRENT_TIMESTAMP),
  ('e11f77e9-3479-4d4d-9a78-1c5cfa9ff1d9', '1ad7c69e-14a4-4bc0-85ef-c5e764f01a10', 'Tiny Home', 'Minimalist tiny home experience.', 'Ibadan', 80.00, CURRENT_TIMESTAMP);

-- ============================
-- BOOKINGS
-- ============================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('f11456db-3c9c-4c9e-a294-c204fcff7a01', 'a5be3dd7-5b4c-4931-8b43-fccab2f73e27', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', '2025-07-01', '2025-07-04', 360.00, 'confirmed', CURRENT_TIMESTAMP),
  ('f9f34770-d123-4d69-9505-74d17e2287c2', 'b2e802de-7959-4b85-93e0-3bfcbbf9c9f3', '3c6f0847-7e2a-4239-9af4-48ea8263b54e', '2025-07-10', '2025-07-13', 600.00, 'pending', CURRENT_TIMESTAMP),
  ('fd5ff268-0906-45e5-b747-f4e9f6c35c61', 'c3a2a3d0-839e-4b1b-84e8-6e159d86f997', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', '2025-08-01', '2025-08-05', 600.00, 'canceled', CURRENT_TIMESTAMP),
  ('c3d5f48d-7db7-4a9b-8f3e-8d4a64c2491e', 'd5c41eb2-1983-45b3-8b6c-fcbcbf05ae24', '3c6f0847-7e2a-4239-9af4-48ea8263b54e', '2025-08-15', '2025-08-20', 2250.00, 'confirmed', CURRENT_TIMESTAMP),
  ('fe1d4ba3-9373-4d82-9c28-cf83715f918c', 'e11f77e9-3479-4d4d-9a78-1c5cfa9ff1d9', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', '2025-09-05', '2025-09-07', 160.00, 'pending', CURRENT_TIMESTAMP);

-- ============================
-- PAYMENTS
-- ============================
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pmt-001', 'f11456db-3c9c-4c9e-a294-c204fcff7a01', 360.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('pmt-002', 'c3d5f48d-7db7-4a9b-8f3e-8d4a64c2491e', 2250.00, CURRENT_TIMESTAMP, 'paypal'),
  ('pmt-003', 'fd5ff268-0906-45e5-b747-f4e9f6c35c61', 600.00, CURRENT_TIMESTAMP, 'stripe'),
  ('pmt-004', 'f9f34770-d123-4d69-9505-74d17e2287c2', 600.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('pmt-005', 'fe1d4ba3-9373-4d82-9c28-cf83715f918c', 160.00, CURRENT_TIMESTAMP, 'paypal');

-- ============================
-- REVIEWS
-- ============================
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('rev-1', 'a5be3dd7-5b4c-4931-8b43-fccab2f73e27', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', 5, 'Beautiful stay by the sea.', CURRENT_TIMESTAMP),
  ('rev-2', 'b2e802de-7959-4b85-93e0-3bfcbbf9c9f3', '3c6f0847-7e2a-4239-9af4-48ea8263b54e', 4, 'Very clean and central.', CURRENT_TIMESTAMP),
  ('rev-3', 'c3a2a3d0-839e-4b1b-84e8-6e159d86f997', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', 3, 'Nice view but too cold.', CURRENT_TIMESTAMP),
  ('rev-4', 'd5c41eb2-1983-45b3-8b6c-fcbcbf05ae24', '3c6f0847-7e2a-4239-9af4-48ea8263b54e', 5, 'Incredible luxury experience.', CURRENT_TIMESTAMP),
  ('rev-5', 'e11f77e9-3479-4d4d-9a78-1c5cfa9ff1d9', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', 4, 'Tiny but well-equipped.', CURRENT_TIMESTAMP);

-- ============================
-- MESSAGES
-- ============================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('msg-001', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', '1ad7c69e-14a4-4bc0-85ef-c5e764f01a10', 'Hi, is Seaside Cottage available next week?', CURRENT_TIMESTAMP),
  ('msg-002', '3c6f0847-7e2a-4239-9af4-48ea8263b54e', '4a708bfd-67a6-4e63-8bd0-b7f3e5cd9f6f', 'Can I check in early for City Loft?', CURRENT_TIMESTAMP),
  ('msg-003', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', '1ad7c69e-14a4-4bc0-85ef-c5e764f01a10', 'Is there a refund for cancellations?', CURRENT_TIMESTAMP),
  ('msg-004', '3c6f0847-7e2a-4239-9af4-48ea8263b54e', '4a708bfd-67a6-4e63-8bd0-b7f3e5cd9f6f', 'Loved the villa! Will book again.', CURRENT_TIMESTAMP),
  ('msg-005', '2f53ec5e-06b4-4c35-b5fd-9d1b2ffb9a31', '1ad7c69e-14a4-4bc0-85ef-c5e764f01a10', 'Can you send more pictures of Tiny Home?', CURRENT_TIMESTAMP);
