# Query Optimization Report

## Initial Query

The initial query retrieves bookings with related user, property, and payment data, joining all relevant tables without filtering.

## Performance Analysis

Using `EXPLAIN ANALYZE` revealed that the query scanned a large number of rows, leading to longer execution time.

## Refactor Strategy

- Added a filter on `booking_date` to limit the dataset to recent bookings.
- Ensured proper indexing on foreign keys (`user_id`, `property_id`, `booking_id`) to speed up joins.

## Result

The refactored query runs faster with fewer rows scanned and improved performance.
