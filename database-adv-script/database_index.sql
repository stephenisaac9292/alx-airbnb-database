-- Before indexes: measure query performance using EXPLAIN ANALYZE

-- Example: Check bookings by user performance before index
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;

-- Create indexes on important columns

-- Index on bookings.user_id (used in JOIN and WHERE)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id (used in JOIN)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on users.id (usually primary key, likely already indexed)
-- CREATE INDEX idx_users_id ON users(id); -- Usually primary key, so might skip

-- Index on properties.id (usually primary key, likely already indexed)
-- CREATE INDEX idx_properties_id ON properties(id); -- Usually primary key, so might skip

-- Index on reviews.property_id (used in JOIN and filtering)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- After indexes: measure query performance again

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;

EXPLAIN ANALYZE
SELECT properties.id, properties.name, reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
WHERE properties.id = 45;
