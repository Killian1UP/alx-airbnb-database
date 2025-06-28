USE airbnb;
INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
    ('7cbe0a82-ae8d-49ef-b872-2c50af7287b5', 'Lesley', 'Cooper', 'lesley@email.com', 'hashed_pw_1', NULL, 'host', NOW()),
    ('5f3e9c60-2b45-4e31-908e-34289e7d8e18', 'Alice', 'Smith', 'alice@email.com', 'hashed_pw_2', '0123456789', 'guest', NOW()),
    ('138db8a1-2e01-4a91-b718-8bc6a1f4f99c', 'Diana', 'Williams', 'diana@email.com', 'hashed_pw_3', '0825292251', 'guest', NOW()),
    ('d2a6f011-b35a-4c8e-9d3d-5f926e986a24', 'Charlie', 'Brown', 'charlie@email.com', 'hashed_password_3', NULL, 'admin', NOW());

INSERT INTO property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('a842c1f0-3f6d-47c2-97b3-b9b3e8829de6', '7cbe0a82-ae8d-49ef-b872-2c50af7287b5', 'Cozy Cottage', 'A peaceful retreat in the countryside', 'Cape Town', 1200.00, NOW(), NOW()),
    ('3d9e2a89-587c-4bbf-b042-29e5c1781f35', '7cbe0a82-ae8d-49ef-b872-2c50af7287b5', 'City Loft', 'Modern apartment in the heart of the city', 'Johannesburg', 950.00, NOW(), NOW());

INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
    ('6ea27b8e-f81e-4b9e-b8b3-9f226ff72ef0', 'a842c1f0-3f6d-47c2-97b3-b9b3e8829de6', '5f3e9c60-2b45-4e31-908e-34289e7d8e18', '2025-07-01', '2025-07-05', 4800.00, 'confirmed', NOW()),
    ('f9b5e840-3cc1-4ad8-a6f3-28d3c2c4697f', '3d9e2a89-587c-4bbf-b042-29e5c1781f35', '138db8a1-2e01-4a91-b718-8bc6a1f4f99c', '2025-07-10', '2025-07-12', 1900.00, 'pending', NOW());

INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('b2c7f8da-9a41-42f6-9212-e0870a2a9810', '6ea27b8e-f81e-4b9e-b8b3-9f226ff72ef0', 4800.00, NOW(), 'credit_card'),
    ('8f3cd7f1-2c57-42fc-a574-458c25a67e59', 'f9b5e840-3cc1-4ad8-a6f3-28d3c2c4697f', 1900.00, NOW(), 'paypal');

INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('9ddf1350-71b2-4be9-a6a0-e21c317a38e2', 'a842c1f0-3f6d-47c2-97b3-b9b3e8829de6', '5f3e9c60-2b45-4e31-908e-34289e7d8e18', 5, 'Amazing stay! Very clean and cozy.', NOW()),
    ('27b496b6-c248-489f-b09f-7ae09c36dcf4', '3d9e2a89-587c-4bbf-b042-29e5c1781f35', '138db8a1-2e01-4a91-b718-8bc6a1f4f99c', 4, 'Great location and service.', NOW());

INSERT INTO message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('74e0f3c6-92ae-4630-9dc1-1b91f8c117cb', '5f3e9c60-2b45-4e31-908e-34289e7d8e18', '7cbe0a82-ae8d-49ef-b872-2c50af7287b5', 'Hi Lesley, is the cottage available this weekend?', NOW()),
    ('d3d59453-df6e-4972-a4b8-1dfeaa6f269a', '138db8a1-2e01-4a91-b718-8bc6a1f4f99c', 'd2a6f011-b35a-4c8e-9d3d-5f926e986a24', 'Hello Charlie, I had a great stay! Thanks again.', NOW());