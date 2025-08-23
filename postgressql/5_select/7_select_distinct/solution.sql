CREATE TABLE cities (
    id INT PRIMARY KEY,
    name TEXT,
    country TEXT
);

INSERT INTO cities (id, name, country) VALUES
(1, 'Tokyo', 'Japan'),
(2, 'London', 'England'),
(3, 'Paris', 'France'),
(4, 'New York', 'USA'),
(5, 'New Delhi', 'India'),
(6, 'Shanghai', 'China'),
(7, 'Sao Paulo', 'Brazil'),
(8, 'Mexico City', 'Mexico'),
(9, 'Cairo', 'Egypt'),
(10, 'Mumbai', 'India'),
(11, 'Beijing', 'China'),
(12, 'Los Angeles', 'USA');
-- Do not modify above this line. --

SELECT DISTINCT country FROM cities;
