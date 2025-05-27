-- 1. Find all properties where the average rating is greater than 4.0 using a subquery
SELECT id, name
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
ORDER BY id;

-- 2. Find users who have made more than 3 bookings using a correlated subquery
SELECT id, name
FROM users
WHERE (
    SELECT COUNT(*)
    FROM bookings
    WHERE bookings.user_id = users.id
) > 3
ORDER BY id;
