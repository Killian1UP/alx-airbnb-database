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
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.user_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id

UNION

SELECT
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.user_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM user u
RIGHT JOIN booking b ON u.user_id = b.user_id;


