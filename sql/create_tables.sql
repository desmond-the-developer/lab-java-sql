-- Create Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_status VARCHAR(50)
);

-- Create Flights table
CREATE TABLE Flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(50),
    aircraft VARCHAR(50),
    total_seats INT,
    flight_distance INT
);

-- Create Bookings table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    total_mileage INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert sample data into Customers
INSERT INTO Customers (customer_name, customer_status) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

-- Insert sample data into Flights
INSERT INTO Flights (flight_number, aircraft, total_seats, flight_distance) VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL222', 'Boeing 777', 264, 1765),
('DL37', 'Boeing 747', 400, 531);

-- Insert sample data into Bookings
INSERT INTO Bookings (customer_id, flight_id, total_mileage) VALUES
(1, 1, 115235),
(1, 2, 115235),
(2, 2, 6008),
(3, 2, 205767),
(3, 3, 205767),
(4, 1, 2653),
(5, 1, 127656),
(6, 4, 136773),
(7, 4, 300582),
(8, 4, 14642);
