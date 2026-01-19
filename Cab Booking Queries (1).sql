# Problem Solving with SQL Queries
# 1. Customer and Booking Analysis

-- 1. Top Customers by Completed Bookings

SELECT c.Name, COUNT(b.BookingID) AS CompletedBookings
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
WHERE b.Status = 'Completed'
GROUP BY c.CustomerID
ORDER BY CompletedBookings DESC
LIMIT 5;



-- 2. Customers with >30% Cancellations
SELECT c.Name, 
       COUNT(CASE WHEN b.Status = 'Cancelled' THEN 1 END) * 1.0 / COUNT(b.BookingID) AS CancellationRate
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID
HAVING CancellationRate > 0.3;

-- 3. Busiest Day for Bookings
SELECT DAYNAME(BookingTime) AS DayOfWeek, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY DayOfWeek
ORDER BY TotalBookings DESC
LIMIT 1;

# 2. Driver Performance & Efficiency

-- 1. Drivers Rated Below 3.0 in Last 3 Months
SELECT d.Name, AVG(t.DriverRating) AS AvgRating
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
JOIN TripDetails t ON b.BookingID = t.BookingID
WHERE b.TripEndTime >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY d.DriverID
HAVING AvgRating < 3.0;

-- 2. Top 5 Longest Trips
SELECT d.Name, t.Distance
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
JOIN TripDetails t ON b.BookingID = t.BookingID
ORDER BY t.Distance DESC
LIMIT 5;

-- 3. Drivers with High Cancellation Rates
SELECT d.Name,
       COUNT(CASE WHEN b.Status = 'Cancelled' THEN 1 END)*1.0 / COUNT(b.BookingID) AS CancellationRate
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
GROUP BY d.DriverID
HAVING CancellationRate > 0.3;

# 3. Revenue & Business Metrics

-- 1. Revenue in Last 6 Months
SELECT MONTH(TripEndTime) AS Month, SUM(Fare) AS MonthlyRevenue
FROM Bookings b
JOIN TripDetails t ON b.BookingID = t.BookingID
WHERE b.Status = 'Completed'
AND TripEndTime >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY Month
ORDER BY Month;

-- 2. Top 3 Routes
SELECT PickupLocation, DropoffLocation, COUNT(*) AS TripCount
FROM Bookings
WHERE Status = 'Completed'
GROUP BY PickupLocation, DropoffLocation
ORDER BY TripCount DESC
LIMIT 3;

-- 3. Driver Ratings vs. Earnings
SELECT d.Name, AVG(t.DriverRating) AS AvgRating, COUNT(t.TripID) AS TripCount, SUM(t.Fare) AS TotalEarnings
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
JOIN TripDetails t ON b.BookingID = t.BookingID
GROUP BY d.DriverID
ORDER BY AvgRating DESC;

# 4. Operational Efficiency & Optimization

-- 1. Average Waiting Time by Pickup Location
SELECT PickupLocation, AVG(TIMESTAMPDIFF(MINUTE, BookingTime, TripStartTime)) AS AvgWaitTime
FROM Bookings
WHERE Status = 'Completed'
GROUP BY PickupLocation
ORDER BY AvgWaitTime DESC;

-- 2. Common Cancellation Reasons
SELECT ReasonForCancellation, COUNT(*) AS Occurrences
FROM Feedback
JOIN Bookings ON Feedback.BookingID = Bookings.BookingID
WHERE Bookings.Status = 'Cancelled'
GROUP BY ReasonForCancellation
ORDER BY Occurrences DESC;

-- 3. Revenue from Short Trips (<5km)
SELECT 
    SUM(CASE WHEN Distance < 5 THEN Fare ELSE 0 END) AS ShortTripRevenue,
    SUM(Fare) AS TotalRevenue,
    SUM(CASE WHEN Distance < 5 THEN Fare ELSE 0 END) * 100.0 / SUM(Fare) AS PercentageShortTripRevenue
FROM TripDetails;

#5. Comparative & Predictive Analysis

-- 1. Sedan vs SUV Revenue
SELECT CabType, SUM(Fare) AS Revenue
FROM TripDetails t
JOIN Bookings b ON t.BookingID = b.BookingID
JOIN Cabs c ON b.CabID = c.CabID
GROUP BY CabType;

-- 2. Customers Likely to Churn
SELECT c.Name, MAX(b.BookingTime) AS LastBooking, COUNT(b.BookingID) AS TotalBookings
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID
HAVING LastBooking < DATE_SUB(CURDATE(), INTERVAL 60 DAY)
   OR TotalBookings < 5;
   
-- 3. Weekend vs Weekday Bookings
SELECT 
    CASE 
        WHEN DAYOFWEEK(BookingTime) IN (1, 7) THEN 'Weekend' 
        ELSE 'Weekday' 
    END AS DayType,
    COUNT(*) AS BookingCount,
    SUM(t.Fare) AS TotalRevenue
FROM Bookings b
JOIN TripDetails t ON b.BookingID = t.BookingID
GROUP BY DayType;