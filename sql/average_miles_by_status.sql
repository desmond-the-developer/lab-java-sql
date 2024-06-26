SELECT customer_status, AVG(total_mileage) AS average_miles
FROM Bookings
JOIN Customers ON Bookings.customer_id = Customers.customer_id
GROUP BY customer_status;
