USE `vidly`;

-- ================================
-- Table: roles
-- ================================
INSERT INTO `roles` (`name`)
VALUES
  ('admin'),
  ('member'),
  ('guest');

-- ================================
-- Table: users
-- ================================
-- Note: password_hash is an INT placeholder in this schema
INSERT INTO `users` (`username`, `password_hash`, `role_id`)
VALUES
  ('alice',  123456,  1),  -- admin
  ('bob',    234567,  2),  -- member
  ('carol',  345678,  2),  -- member
  ('dave',   456789,  3);  -- guest

-- ================================
-- Table: customers
-- ================================
INSERT INTO `customers` (`first_name`, `last_name`, `email`,                   `phone`)
VALUES
  ('Emma',   'Johnson',   'emma.johnson@example.com',   '555-0101'),
  ('Liam',   'Smith',     'liam.smith@example.com',     '555-0202'),
  ('Olivia', 'Brown',     'olivia.brown@example.com',   '555-0303'),
  ('Noah',   'Davis',     'noah.davis@example.com',     '555-0404');

-- ================================
-- Table: movies
-- ================================
INSERT INTO `movies` (`barcode`,         `daily_rental_rate`, `number_in_stock`)
VALUES
  ('978020137962',   3.50,                5),
  ('978013110362',   2.99,                3),
  ('978026203384',   4.25,                2),
  ('978013235088',   3.75,                4);

-- ================================
-- Table: coupons
-- ================================
INSERT INTO `coupons` (`code`,       `description`,             `discount`)
VALUES
  ('WELCOME10', '10% off new customers',         10.00),
  ('SPRING5',   'Spring sale discount',           5.00),
  ('FREERENT',  'One free rental up to $5.00',    5.00);

-- ================================
-- Table: rentals
-- ================================
INSERT INTO `rentals` (`customer_id`, `movie_id`, `coupon_id`, `start_date`,           `end_date`)
VALUES
  (1,              1,          1,           '2025-04-01 09:00:00',  '2025-04-03 09:00:00'),  -- Emma with WELCOME10
  (2,              2,          NULL,        '2025-04-02 14:00:00',  '2025-04-04 14:00:00'),  -- Liam without coupon
  (3,              3,          2,           '2025-04-05 18:30:00',  '2025-04-07 18:30:00'),  -- Olivia with SPRING5
  (1,              2,          NULL,        '2025-04-08 10:15:00',  '2025-04-10 10:15:00'),  -- Emma second rental
  (4,              4,          3,           '2025-04-09 12:00:00',  '2025-04-11 12:00:00');  -- Noah with FREERENT
