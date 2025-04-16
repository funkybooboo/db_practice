-- Use the aviation database
USE aviation;

-- Insert sample airlines
INSERT INTO airlines (name)
VALUES 
    ('Acme Airways'),
    ('Global Air'),
    ('North Star Airlines');

-- Insert sample airports
INSERT INTO airports (iata_code, name, city, state, country, latitude, longitude)
VALUES 
    ('JFK', 'John F Kennedy International Airport', 'New York', 'NY', 'USA', 40.6413111, -73.7781391),
    ('LAX', 'Los Angeles International Airport', 'Los Angeles', 'CA', 'USA', 33.9415889, -118.40853),
    ('LHR', 'Heathrow Airport', 'London', NULL, 'UK', 51.4700223, -0.4542955),
    ('CDG', 'Charles de Gaulle Airport', 'Paris', 'Île-de-France', 'France', 49.0096906, 2.5479245);

-- Insert sample flight classes
INSERT INTO flight_classes (name)
VALUES 
    ('Economy'),
    ('Business'),
    ('First');

-- Insert sample passengers
INSERT INTO passengers (first_name, last_name)
VALUES 
    ('John', 'Doe'),
    ('Jane', 'Smith'),
    ('Alice', 'Johnson');

-- Insert sample aircrafts
-- Note: The airline_id values here reference the airlines inserted above.
INSERT INTO aircrafts (airline_id, registration, model, manufacturer, capacity)
VALUES
    (1, 'N123AC', 'Boeing 737', 'Boeing', 180),
    (2, 'N456GA', 'Airbus A320', 'Airbus', 150),
    (3, 'N789NS', 'Boeing 777', 'Boeing', 300);

-- Insert sample flights
-- Note: Airport IDs assume the order of the airports inserted above:
-- JFK=1, LAX=2, LHR=3, CDG=4.
-- The aircraft_id and airline_id values correspond to those inserted.
INSERT INTO flights (
    departure_airport_id, 
    arrival_airport_id, 
    aircraft_id, 
    airline_id, 
    flight_number, 
    departure_date, 
    arrival_date, 
    duration_in_minutes, 
    distance_in_miles
)
VALUES
    (1, 2, 1, 1, 'AC101', '2025-05-01 08:00:00', '2025-05-01 11:00:00', 300, 2475.50),
    (2, 1, 2, 2, 'GA202', '2025-05-02 14:00:00', '2025-05-02 22:00:00', 480, 2475.50),
    (3, 4, 3, 3, 'NS303', '2025-06-10 09:00:00', '2025-06-10 10:30:00', 90, 214.30);

-- Insert sample tickets
-- Note: Flight IDs and passenger IDs are based on the order of insertion above.
-- Flight class IDs: 1 = Economy, 2 = Business, 3 = First.
INSERT INTO tickets (
    passenger_id, 
    flight_id, 
    flight_class_id, 
    ticket_number, 
    price, 
    confirmation_number
)
VALUES
    (1, 1, 1, 'TCKT001', 350.00, 'CONF123'),
    (2, 2, 2, 'TCKT002', 1200.00, 'CONF456'),
    (3, 3, 3, 'TCKT003', 2500.00, 'CONF789');
