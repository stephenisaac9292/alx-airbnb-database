-- Create partitioned bookings table based on start_date
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    -- Add other columns as per original bookings table if needed
    -- For example: status, price, created_at, etc.
) PARTITION BY RANGE (start_date);

-- Create yearly partitions
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Insert existing data from original bookings table
INSERT INTO bookings_partitioned (id, user_id, property_id, start_date, end_date)
SELECT id, user_id, property_id, start_date, end_date FROM bookings;

-- Test query to measure performance on partitioned table
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
