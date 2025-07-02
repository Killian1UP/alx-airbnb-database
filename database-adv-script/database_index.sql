USE airbnb;

CREATE INDEX idx_property_name_location
ON property(name, location);

CREATE INDEX idx_booking_user_property
ON booking(user_id, property_id);

EXPLAIN ANALYZE SELECT * FROM property WHERE name = 'City Loft'