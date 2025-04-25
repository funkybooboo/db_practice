-- ======================================
-- Create and select the vidly database
-- ======================================
CREATE DATABASE IF NOT EXISTS `vidly`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE `vidly`;


-- ================================
-- Table: roles
-- Stores user roles (e.g. “admin”, “member”)
-- ================================
CREATE TABLE `roles` (
    `id` BIGINT UNSIGNED      NOT NULL AUTO_INCREMENT,      -- surrogate primary key
    `name` VARCHAR(100)       NOT NULL,                     -- role name
    `created_at` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- record creation time
    `updated_at` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- last update time
    PRIMARY KEY (`id`)
);

-- Ensure role names are unique
ALTER TABLE `roles`
    ADD UNIQUE KEY `roles_name_unique` (`name`);


-- ================================
-- Table: users
-- Stores application user accounts
-- ================================
CREATE TABLE `users` (
    `user_id`      BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, -- surrogate primary key
    `username`     VARCHAR(50)      NOT NULL,               -- login name
    `password_hash` INT              NOT NULL,               -- hashed password
    `role_id`      BIGINT UNSIGNED  NOT NULL,               -- foreign key to roles
    `created_at`   DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- record creation
    `updated_at`   DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- last update
    PRIMARY KEY (`user_id`)
);

-- Ensure usernames are unique
ALTER TABLE `users`
    ADD UNIQUE KEY `users_username_unique` (`username`);

-- Speed up lookups by role
ALTER TABLE `users`
    ADD INDEX `users_role_id_index` (`role_id`);


-- ================================
-- Table: customers
-- Stores customer information
-- ================================
CREATE TABLE `customers` (
    `customer_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,  -- surrogate primary key
    `first_name`  VARCHAR(50)      NOT NULL,                -- customer first name
    `last_name`   VARCHAR(50)      NOT NULL,                -- customer last name
    `email`       VARCHAR(255)     NOT NULL,                -- customer email
    `phone`       VARCHAR(20)      NOT NULL,                -- customer phone number
    `created_at`  DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- record creation
    `updated_at`  DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- last update
    PRIMARY KEY (`customer_id`)
);

-- Ensure each email and phone is unique
ALTER TABLE `customers`
    ADD UNIQUE KEY `customers_email_unique` (`email`),
    ADD UNIQUE KEY `customers_phone_unique` (`phone`);


-- ================================
-- Table: movies
-- Stores movie inventory
-- ================================
CREATE TABLE `movies` (
    `movie_id`         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, -- surrogate primary key
    `barcode`          VARCHAR(100)    NOT NULL,                -- unique movie barcode
    `daily_rental_rate` DECIMAL(5,2)   NOT NULL,                -- price per day
    `number_in_stock`  INT UNSIGNED    NOT NULL,                -- available copies
    `created_at`       DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- record creation
    `updated_at`       DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- last update
    PRIMARY KEY (`movie_id`)
);

-- Ensure each barcode is unique
ALTER TABLE `movies`
    ADD UNIQUE KEY `movies_barcode_unique` (`barcode`);


-- ================================
-- Table: coupons
-- Stores discount coupons
-- ================================
CREATE TABLE `coupons` (
    `coupon_id`   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, -- surrogate primary key
    `code`        VARCHAR(50)      NOT NULL,               -- coupon code
    `description` VARCHAR(255)     NULL,                    -- optional description
    `discount`    DECIMAL(5,2)     NOT NULL,               -- discount amount or percentage
    `created_at`  DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- record creation
    `updated_at`  DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- last update
    PRIMARY KEY (`coupon_id`)
);

-- Ensure coupon codes are unique
ALTER TABLE `coupons`
    ADD UNIQUE KEY `coupons_code_unique` (`code`);


-- ================================
-- Table: rentals
-- Records each rental transaction
-- ================================
CREATE TABLE `rentals` (
    `rental_id`   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT, -- surrogate primary key
    `customer_id` BIGINT UNSIGNED NOT NULL,               -- FK to customers
    `movie_id`    BIGINT UNSIGNED NOT NULL,               -- FK to movies
    `coupon_id`   BIGINT UNSIGNED     NULL,               -- optional FK to coupons
    `start_date`  DATETIME           NOT NULL,            -- rental start
    `end_date`    DATETIME           NOT NULL,            -- rental end
    `created_at`  DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- record creation
    `updated_at`  DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP(),  -- last update
    PRIMARY KEY (`rental_id`)
);

-- Indexes to speed up lookups
ALTER TABLE `rentals`
    ADD INDEX `rentals_customer_id_index` (`customer_id`),
    ADD INDEX `rentals_movie_id_index` (`movie_id`),
    ADD INDEX `rentals_coupon_id_index` (`coupon_id`);


-- ================================
-- Foreign Key Constraints
-- ================================
-- Link users.role_id → roles.id
ALTER TABLE `users`
    ADD CONSTRAINT `users_role_id_foreign`
    FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

-- Link rentals.coupon_id → coupons.coupon_id
ALTER TABLE `rentals`
    ADD CONSTRAINT `rentals_coupon_id_foreign`
    FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`coupon_id`);

-- Link rentals.customer_id → customers.customer_id
ALTER TABLE `rentals`
    ADD CONSTRAINT `rentals_customer_id_foreign`
    FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

-- Link rentals.movie_id → movies.movie_id
ALTER TABLE `rentals`
    ADD CONSTRAINT `rentals_movie_id_foreign`
    FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

