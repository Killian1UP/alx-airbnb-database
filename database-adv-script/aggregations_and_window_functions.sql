USE airbnb;

SELECT user_id, COUNT(*) AS bookingcount
FROM booking
GROUP BY user_id;

SELECT
    p.property_id,
    p.name,
    p.location,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank_num
FROM property p    
LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.location;