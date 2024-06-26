SELECT aircraft, COUNT(*) AS booking_count
FROM Bookings
JOIN Flights ON Bookings.flight_id = Flights.flight_id
JOIN Customers ON Bookings.customer_id = Customers.customer_id
WHERE Customers.customer_status = 'Gold'
GROUP BY aircraft
ORDER BY booking_count DESC
LIMIT 1;
