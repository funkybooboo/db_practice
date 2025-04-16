-- Create the aviation database and switch to it
CREATE DATABASE IF NOT EXISTS aviation;
USE aviation;

-- Airlines table
CREATE TABLE airlines (
    airline_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (airline_id)
);

-- Airports table
CREATE TABLE airports (
    airport_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    iata_code CHAR(3) NOT NULL,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) DEFAULT NULL,
    country VARCHAR(100) NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (airport_id),
    UNIQUE KEY airports_iata_code_unique (iata_code),
    INDEX airports_city_index (city),
    INDEX airports_country_index (country)
);

-- Flight Classes table
CREATE TABLE flight_classes (
    flight_class_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (flight_class_id)
);

-- Passengers table
CREATE TABLE passengers (
    passenger_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (passenger_id)
);

-- Aircrafts table
CREATE TABLE aircrafts (
    aircraft_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    airline_id BIGINT UNSIGNED NOT NULL,
    registration VARCHAR(20) NOT NULL,
    model VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (aircraft_id),
    UNIQUE KEY aircrafts_registration_unique (registration),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);

-- Flights table
CREATE TABLE flights (
    flight_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    departure_airport_id BIGINT UNSIGNED NOT NULL,
    arrival_airport_id BIGINT UNSIGNED NOT NULL,
    aircraft_id BIGINT UNSIGNED NOT NULL,
    airline_id BIGINT UNSIGNED NOT NULL,
    flight_number VARCHAR(50) NOT NULL,
    departure_date DATETIME NOT NULL,
    arrival_date DATETIME NOT NULL,
    duration_in_minutes INT NOT NULL,
    distance_in_miles DECIMAL(8,2) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (departure_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(aircraft_id),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);

-- Tickets table
CREATE TABLE tickets (
    ticket_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    passenger_id BIGINT UNSIGNED NOT NULL,
    flight_id BIGINT UNSIGNED NOT NULL,
    flight_class_id BIGINT UNSIGNED NOT NULL,
    ticket_number VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    confirmation_number VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (ticket_id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (flight_class_id) REFERENCES flight_classes(flight_class_id)
);
