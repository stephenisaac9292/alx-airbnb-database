-- 1. Total number of bookings made by each user
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id
ORDER BY user_id;

-- 2. Rank properties using ROW_NUMBER()
SELECT property_id, COUNT(*) AS total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number_rank
FROM bookings
GROUP BY property_id
ORDER BY row_number_rank;

-- 3. Rank properties using RANK()
SELECT property_id, COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_rank
FROM bookings
GROUP BY property_id
ORDER BY rank_rank;
