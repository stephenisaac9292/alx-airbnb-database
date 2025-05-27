# Database Performance Monitoring Report

## Objective
Continuously monitor query performance and refine the database schema for optimized execution.

## Monitored Queries
- Frequent queries analyzed with `EXPLAIN ANALYZE` to identify bottlenecks.

### Example Query 1
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;
