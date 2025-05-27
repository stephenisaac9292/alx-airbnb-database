-- Initial query retrieving all bookings with user, property, and payment details
EXPLAIN ANALYZE
SELECT
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    properties.id AS property_id,
    properties.name AS property_name,
    payments.id AS payment_id,
    payments.amount,
    payments.payment_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id
INNER JOIN properties ON bookings.property_id = properties.id
INNER JOIN payments ON bookings.id = payments.booking_id
ORDER BY bookings.id;

-- Refactored query with filtering using AND clause for better performance
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments pay ON b.id = pay.booking_id
WHERE b.booking_date >= CURRENT_DATE - INTERVAL '6 months' 
  AND pay.amount > 0
ORDER BY b.id;
