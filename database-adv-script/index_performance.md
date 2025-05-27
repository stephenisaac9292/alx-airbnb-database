# Index Performance Analysis

This file describes the indexing strategy and query performance measurements on the Airbnb database.

## Indexes Created

- `idx_bookings_user_id` on `bookings.user_id`
- `idx_bookings_property_id` on `bookings.property_id`
- `idx_reviews_property_id` on `reviews.property_id`

## Performance Measurements

Used `EXPLAIN ANALYZE` to measure query times before and after index creation.

Indexing foreign key columns that appear frequently in JOINs and WHERE clauses improved query performance significantly.
