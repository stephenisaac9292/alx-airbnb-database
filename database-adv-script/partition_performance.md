# Partitioning Performance Report

## Objective
Optimize query performance on the large `bookings` table by implementing partitioning on the `start_date` column.

## Implementation
- Created a partitioned table `bookings_partitioned` using RANGE partitioning by year.
- Defined partitions for 2023 and 2024.
- Migrated data from the original `bookings` table.
- Tested query performance with EXPLAIN ANALYZE on date range queries.

## Results
- Queries targeting specific date ranges scan only relevant partitions.
- Execution time reduced significantly compared to querying the full bookings table.
- Query planner efficiently pruned partitions, improving scalability.

## Conclusion
Partitioning by `start_date` improves query efficiency for time-based searches and is highly recommended for large datasets.
