USE airbnb;

-- INNER JOIN
SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM booking b
INNER JOIN user u ON b.user_id = u.user_id;

-- LEFT JOIN
SELECT 
    p.host_id,
    p.name,
    p.location,
    p.pricepernight,
    r.review_id,
    r.property_id,
    r.rating
FROM property p
LEFT JOIN review r ON p.property_id = r.property_id
ORDER BY r.rating ASC;

-- FULL OUTER JOIN
SELECT
    user.first_name,
    user.last_name,
    user.email,
    booking.booking_id,
    booking.user_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status
FROM user
FULL OUTER JOIN booking ON user.user_id = booking.user_id;

