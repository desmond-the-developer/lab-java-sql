SELECT customer_status, MAX(total_mileage) AS max_miles
FROM Bookings
JOIN Customers ON Bookings.customer_id = Customers.customer_id
GROUP BY customer_status;
