SELECT customer_status, AVG(flight_distance) AS average_flight_distance
FROM Bookings
JOIN Customers ON Bookings.customer_id = Customers.customer_id
JOIN Flights ON Bookings.flight_id = Flights.flight_id
GROUP BY customer_status;
