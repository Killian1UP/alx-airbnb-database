USE airbnb;

SELECT * 
FROM property 
WHERE property_id IN (
    SELECT property_id 
    FROM review 
    GROUP BY property_id 
    HAVING AVG(rating) > 4.0
)
ORDER BY name ASC;

SELECT 
    u.first_name,
    u.last_name,
    u.email
FROM user u
WHERE (
    SELECT COUNT(*) 
    FROM booking b 
    WHERE b.user_id = u.user_id
) > 3;
