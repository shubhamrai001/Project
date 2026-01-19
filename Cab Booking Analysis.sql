Create Database Project;
use Project;

Create table Customers (
CustomerID INT PRIMARY KEY,
Name VARCHAR(100),
Phone VARCHAR(15),
Email VARCHAR(100),
JoinDate DATE);

INSERT INTO Customers (CustomerID, Name, Phone, Email, JoinDate) VALUES
(1, 'Rajan Pandey', '9876543210', 'rajan@example.com', '2024-01-10'),
(2, 'Jay Tiwari', '8765432109', 'jay@example.com', '2024-02-15'),
(3, 'Rakesh Yadav', '7654321098', 'rakesh1@example.com', '2024-03-01'),
(4, 'Harsh Singh', '6543210987', 'harshu@example.com', '2024-04-05');

Select * from Customers;

Create table Drivers (
DriverID INT PRIMARY KEY,
Name VARCHAR(100),
Phone VARCHAR(15),
LicenseNumber VARCHAR(50),
JoinDate DATE,
Rating FLOAT);

INSERT INTO Drivers (DriverID, Name, Phone, LicenseNumber, JoinDate, Rating) VALUES
(1, 'Raj Singh', '9123456789', 'DL12345678', '2023-09-01', 4.5),
(2, 'Sunny Chaudhary', '9234567890', 'DL87654321', '2023-10-12', 3.2),
(3, 'Anshu P', '9345678901', 'DL23456789', '2024-01-20', 2.8),
(4, 'Alina Kapoor', '9456789012', 'DL34567890', '2024-03-15', 4.0);

Select * from Drivers;

Create table Cabs(
CabID INT PRIMARY KEY,
DriverID INT,
CabType VARCHAR(20), 
PlateNumber VARCHAR(20),
FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID));

INSERT INTO Cabs (CabID, DriverID, CabType, PlateNumber) VALUES
(1, 1, 'Sedan', 'KA01AB1234'),
(2, 2, 'SUV', 'KA01CD5678'),
(3, 3, 'Sedan', 'KA01EF9012'),
(4, 4, 'SUV', 'KA01GH3456');

Select * from Cabs;

Create table Bookings(
BookingID INT PRIMARY KEY,
CustomerID INT,
CabID INT,
BookingTime DATETIME,
TripStartTime DATETIME,
TripEndTime DATETIME,
PickupLocation VARCHAR(100),
DropoffLocation VARCHAR(100),
Status VARCHAR(20), -- 'Completed', 'Cancelled', 'Ongoing'
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (CabID) REFERENCES Cabs(CabID));

INSERT INTO Bookings (BookingID, CustomerID, CabID, BookingTime, TripStartTime, TripEndTime, PickupLocation, DropoffLocation, Status) VALUES
(101, 1, 1, '2025-05-01 08:00:00', '2025-05-01 08:10:00', '2025-05-01 08:40:00', 'Downtown', 'Airport', 'Completed'),
(102, 2, 2, '2025-05-01 09:00:00', NULL, NULL, 'Station', 'Mall', 'Cancelled'),
(103, 1, 3, '2025-05-02 10:00:00', '2025-05-02 10:15:00', '2025-05-02 10:50:00', 'Downtown', 'Hospital', 'Completed'),
(104, 3, 4, '2025-05-03 11:30:00', '2025-05-03 11:45:00', '2025-05-03 12:30:00', 'Mall', 'University', 'Completed'),
(105, 4, 1, '2025-05-04 14:00:00', NULL, NULL, 'Airport', 'Downtown', 'Cancelled');

Select * from Bookings;


Create table TripDetails(
TripID INT PRIMARY KEY,
BookingID INT,
Distance FLOAT,
Fare DECIMAL(10,2),
DriverRating FLOAT,
FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID));

INSERT INTO TripDetails (TripID, BookingID, Distance, Fare, DriverRating) VALUES
(1001, 101, 12.5, 250.00, 5.0),
(1002, 103, 10.0, 200.00, 4.0),
(1003, 104, 15.0, 300.00, 3.5);

Select * from TripDetails;

Select * from Bookings;


Create table TripDetails(
TripID INT PRIMARY KEY,
BookingID INT,
Distance FLOAT,
Fare DECIMAL(10,2),
DriverRating FLOAT,
FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID));

INSERT INTO TripDetails (TripID, BookingID, Distance, Fare, DriverRating) VALUES
(1001, 101, 12.5, 250.00, 5.0),
(1002, 103, 10.0, 200.00, 4.0),
(1003, 104, 15.0, 300.00, 3.5);

Select * from TripDetails;

Select * from Bookings;


Create table TripDetails(
TripID INT PRIMARY KEY,
BookingID INT,
Distance FLOAT,
Fare DECIMAL(10,2),
DriverRating FLOAT,
FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID));

INSERT INTO TripDetails (TripID, BookingID, Distance, Fare, DriverRating) VALUES
(1001, 101, 12.5, 250.00, 5.0),
(1002, 103, 10.0, 200.00, 4.0),
(1003, 104, 15.0, 300.00, 3.5);

Select * from TripDetails;
-- Note: Bookings 102 and 105 are cancelled, so they don’t appear here.

Create table Feedback(
FeedbackID INT PRIMARY KEY,
BookingID INT,
CustomerFeedback TEXT,
ReasonForCancellation VARCHAR(100),
FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID));

INSERT INTO Feedback (FeedbackID, BookingID, CustomerFeedback, ReasonForCancellation) VALUES
(501, 102, 'Cab was late, had to cancel.', 'Driver Delay'),
(502, 105, 'Change of plans.', 'Customer Personal Reason');

Select * from Feedback;

-- Customer and Booking Analysis
-- 1. Identify customers who have completed the most bookings. What insights can you draw about their behavior?


-- 2. Find customers who have canceled more than 30% of their total bookings. What could be the reason for frequent cancellations?


-- 3. Determine the busiest day of the week for bookings. How can the company optimize cab availability on peak days?


-- Driver Performance & Efficiency
-- 1. Identify drivers who have received an average rating below 3.0 in the past three months. What strategies can be implemented to improve their performance?

-- 2. Find the top 5 drivers who have completed the longest trips in terms of distance. What does this say about their working patterns?

-- 3. Identify drivers with a high percentage of canceled trips. Could this indicate driver unreliability?

-- Revenue & Business Metrics
-- 1. Calculate the total revenue generated by completed bookings in the last 6 months.How has the revenue trend changed over time?

-- 2. Identify the top 3 most frequently traveled routes based on PickupLocation and DropoffLocation. Should the company allocate more cabs to these routes?

-- 3. Determine if higher-rated drivers tend to complete more trips and earn higher fares. Is there a direct correlation between driver ratings and earnings?

-- Operational Efficiency & Optimization
-- 1. Analyze the average waiting time (difference between booking time and trip start time) for different pickup locations. How can this be optimized to reduce delays?

-- 2. Identify the most common reasons for trip cancellations from customer feedback.What actions can be taken to reduce cancellations?

-- 3. Find out whether shorter trips (low-distance) contribute significantly to revenue.Should the company encourage more short-distance rides?

-- Comparative & Predictive Analysis

-- 1. Compare the revenue generated from 'Sedan' and 'SUV' cabs. Should the company invest more in a particular vehicle type?

-- 2. Predict which customers are likely to stop using the service based on their last booking date and frequency of rides. How can customer retention be improved?

-- 3. Analyze whether weekend bookings differ significantly from weekday bookings. Should the company introduce dynamic pricing based on demand?

-- Ans 

select name,count(*) as completed_booking
from customers c
join bookings b on
 c.customerid = b.customerid
where status = 'completed'
group by name
order by completed_booking desc;

select c.customerid,name,count(case when status = 'cancelled' then 1 end) * 1.0 / count(bookingid) as cancelledbooking 
from customers c
join bookings b on c.customerid = b.customerid
group by c.customerid
having cancelledbooking >0.3;

-- Ans 2. 
-- SELECT 
--     c.CustomerID,
--     c.Name,
--     COUNT(CASE WHEN b.Status = 'Cancelled' THEN 1 END) * 1.0 / COUNT(b.BookingID) AS Cancelled Percentage
-- FROM Customers c
-- JOIN Bookings b ON c.CustomerID = b.CustomerID
-- GROUP BY c.CustomerID, c.Name
-- HAVING COUNT(CASE WHEN b.Status = 'Cancelled' THEN 1 END) * 1.0 / COUNT(b.BookingID) > 0.3;

 -- /--
-- Customer ID	Customer Name	Cancelled Percentage
-- 2	Jay Tiwari	1.0 (100%)
-- 4	Harsh Singh	1.0 (100%)

-- Analysis:
-- Both Jay Tiwari and Harsh Singh have cancelled 100% of their total bookings, which is clearly above the 30% threshold
-- Jay Tiwari cancelled due to Driver Delay (from the Feedback table).
-- Indicates a service reliability problem, possibly late arrival or poor driver coordination

-- Harsh Singh canceled due to Change of plans.
-- Suggests customer initiated cancellation, unrelated to service issues.

-- Insights and Recommendations:
-- Operational Improvements:
-- •	Investigate driver punctuality and dispatch timing for customers affected by delays.
-- •	Implemented automated communication: real – time tracking, driver ETA  alerts 
-- Customer Behavior Management:
-- •	Offer flexible cancellation policies or instant rebooking for customers with frequent plan changes.
-- •	Engange with personalized offers or reminders to encourage re – use of the service 

-- Retention Strategy:
-- •	Since both customers have 100% cancellation rates, they may abandon the platform.
-- •	Provide apology messages or small promo credits to rebuild trust and encourage future bookings 
-- Conclusion:
-- The analysis reveals that Jay Tiwari and Harsh Singh are the customers with the highest cancellation ratios.
-- Addressing driver delays and enhancing customer flexibility can significantly reduce cancellations and improve long term customer satisfaction.

select dayname(bookingtime) as busiest_weekday,count(*) as total_booking
from bookings 
group by busiest_weekday
limit 1;

-- Ans 3
-- -- Determine the busiest day of the week for bookings.
-- -- This query extracts the weekday name from the booking time,
-- -- counts how many bookings occurred each day,
-- -- and then returns the day with the highest total.

-- SELECT 
--     DAYNAME(BookingTime) AS Busiest_Weekday,
--     COUNT(*) AS Total_Bookings
-- FROM Bookings
-- GROUP BY Busiest_Weekday
-- ORDER BY Total_Bookings DESC
-- LIMIT 1;

-- -- Result:
-- -- | Busiest_Weekday | Total_Bookings |
-- -- |------------------|----------------|
-- -- | Thursday         | 2              |

-- -- Interpretation:
-- -- The data shows that Thursday has the highest number of bookings.
-- -- This suggests mid‑week peak ride demand, possibly due to office travel or airport trips.
-- --
-- -- Optimization Recommendations:
-- -- 1. Increase driver availability and cab allocation for Thursday mornings and evenings.
-- -- 2. Implement surge or dynamic pricing during these hours to manage demand.
-- -- 3. Send driver shift reminders or bonus incentives for working on peak weekdays.
-- --
-- -- Conclusion:
-- -- Thursday is identified as the busiest day for bookings.
-- -- By adjusting driver schedules and introducing dynamic pricing, 
-- -- the company can handle peak‑day demand efficiently while maximizing revenue.

SELECT 
    d.DriverID,
    d.Name,
    ROUND(AVG(t.DriverRating), 2) AS Avg_Rating,
    COUNT(t.TripID) AS Total_Trip
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
JOIN TripDetails t ON b.BookingID = t.BookingID
WHERE b.Status = 'Completed'
GROUP BY d.DriverID, d.Name
HAVING AVG(t.DriverRating) < 3.0
ORDER BY Avg_Rating ASC;

-- The original data does not have any driver with an average trip rating below 3.0.
--  To demonstrate a meaningful analysis, we will assume the DriverRating for TripID 1002 (driven by Anshu P) was 2.5 instead of 4.0.
--  To demonstrate a meaningful analysis, we will assume the DriverRating for TripID 1002 (driven by Anshu P) was 2.5 instead of 4.0.
-- Analysis:
-- The query identifies 'Anshu P' as a driver with performance significantly below the acceptable standard.
-- His overall rating in the Drivers table is also low (2.8), suggesting a consistent performance issue.
-- Although based on a single trip in this dataset, such a low rating is a red flag that requires immediate attention to prevent further negative customer experiences and protect the brand's reputation.
-- Strategies for Improvement:
-- 1. Investigate the Root Cause:
-- * Review specific customer feedback for the low-rated trip(s) to understand what went wrong (e.g., unprofessional behavior, unsafe driving, poor navigation).
-- * Conduct a one-on-one meeting with the driver (Anshu P) to discuss the feedback and hear their perspective.
-- 2. Implement a Performance Improvement Plan (PIP):
-- * Mandatory Retraining: Enroll the driver in a targeted refresher course focusing on customer service, professional conduct, and safe driving protocols.
-- * Mentorship Program: Pair Anshu P with a top-rated driver, like 'Raj Singh' (who has a 5.0 rating), for a few shifts to observe and learn best practices.
-- * Probation and Monitoring: Place the driver on a probationary period for the next 30 days. Closely monitor their ratings and set a clear improvement target (e.g., achieve an average of 4.0 or higher).
-- Systemic Enhancements:
-- * Improve Feedback Collection: Enhance the in-app feedback system to allow customers to select specific reasons for low ratings (e.g., 'Cleanliness', 'Punctuality', 'Driver Attitude'). This provides more actionable data for intervention.
-- * Proactive Alerts: Create an automated alert for managers when a driver's average rating drops below a certain threshold (e.g., 3.5), enabling proactive intervention.
-- Conclusion:
-- By systematically identifying low-performing drivers like Anshu P, the company can take targeted actions to address service quality issues
-- A structured approach combining investigation, retraining, and continuous monitoring is essential for improving driver performance, which directly impacts customer satisfaction and retention.

SELECT 
    d.driverid, d.name, SUM(t.distance) AS totaldistance
FROM
    drivers d
        JOIN
    cabs c ON d.driverid = c.driverid
        JOIN
    bookings b ON c.cabid = b.cabid
        JOIN
    tripdetails t ON b.bookingid = t.bookingid
WHERE
    b.status = 'completed'
GROUP BY d.driverid , d.name
ORDER BY totaldistance DESC
LIMIT 5;

-- Analysis of the Output:
-- The result identifies Alina Kapoor as the top driver in terms of total distance covered (15.0 km), followed by Raj Singh (12.5 km) and Anshu P (10.0 km). Although we requested the top 5, only three drivers appear because only these three have completed trips with distance data in our sample datase
-- Insights into Their Working Patterns:
-- 1. Preference for High-Value Routes: 
-- Drivers who accumulate high mileage are likely accepting and completing longer, more lucrative trips. These often include routes like airport transfers, trips to suburban areas, or travel between major city hubs (e.g., Alina Kapoor's 15 km trip from Mall to University). These trips generally yield higher fares than multiple short-distance rides.
-- 2. Operational Efficiency and Reliability:
-- The WHERE b.status = 'Completed' clause is crucial. It shows that these drivers not only accept long trips but also reliably complete them. This suggests a professional work ethic and good time management, as they are successfully navigating longer routes without cancellations.
-- 3. Strategic Positioning & Vehicle Type:
-- This pattern may indicate that these drivers position themselves in areas known for long-distance requests. Furthermore, the vehicle type can play a role. Alina Kapoor, the top driver, operates an SUV, which is often preferred by customers for longer, more comfortable journeys, potentially leading to her being assigned or chosen for such trips more frequently.
-- Business Recommendations:
-- * Incentivize Long Trips: The company can create a bonus program for drivers who exceed a certain total distance per month to encourage this profitable behavior
-- * Optimize Dispatching: 
--  The booking algorithm could be tailored to prioritize offering long-distance trips to these proven drivers, increasing the likelihood of acceptance and customer satisfaction.
-- * Recognize Top Performers: 
--  Publicly recognizing these drivers (e.g., in a driver newsletter) can motivate others and reinforce positive working patterns.

select d.driverid,d.name,count(case when b.status = 'cancelled' then 1 end) as cancelled_trips,
count(b.bookingid) as total_bookings,
round(count(case when b.status = 'cancelled' then 1 end) * 100.0/count(b.bookingid),2) as cancel_percentage
from drivers d
join cabs c on d.driverid = c.driverid
join bookings b on c.cabid = b.cabid
group by d.driverid,d.name
having cancel_percentage > 30
order by cancel_percentage desc;

-- Analysis and Output 
-- The output identifies Sunny Chaudhary anD Raj Singh as drivers with very high cancellation %. A high rate is a strong signal, but it does not mean that the driver is 
-- Sunny Chaudhary 
-- 1) His only assigned booking was cancelled 
-- 2) By checking the 'feedback' table for his asssigned 'Booking ID' we get the reason for the driver 
-- 3) This directly points to a service failure that indicates unrelability. 
-- Raj Singh 
-- Half of his aasigned bookings were cancelled, which is poor on the surface 
-- Checking the 'Feedback' Table for his cancellation - booking id - '105', it shows " Customer Personal Reason"
-- Recomendations - It should create system that flags drivers with high cancellation rates but prioritizes those linked to driver-fault reasons 
-- Immediate Intervention for Unreliability:
-- For drivers like Sunny Chaudhary, immediate action is necessary. This could include:
-- A formal warning
-- Mandatory retraining on punctuality and communication.
-- Temporary suspension if the behavior is repeated
-- Fair Assessment:
-- Ensure that drivers like Raj Singh are not penalized for customer-initiated cancellations. The system should clearly differentiate cancellation reasons to protect reliable drivers.

USE Project;
SELECT
    d.DriverID,
    d.Name,
    COUNT(CASE WHEN b.Status = 'Cancelled' THEN 1 END) AS Cancelled_Trips,
    COUNT(b.BookingID) AS Total_Bookings,
    ROUND(COUNT(CASE WHEN b.Status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(b.BookingID), 2) AS Cancel_Percentage
FROM
    Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
GROUP BY
    d.DriverID, d.Name
HAVING
    COUNT(CASE WHEN b.Status = 'Cancelled' THEN 1 END) > 0
ORDER BY
    Cancel_Percentage DESC;
    
    -- Detailed Analysis 
    -- A high cancellation percentage is a significant metric, but it does not prove the driver unrelaibility. The context behind the cancellation is essential for the 
    -- accurate assesment
    -- Sunny chaudhary has the 100% cancellation rate - To understand this we look at the Feedback table for the cancellation of the trip and we check his booking id - 102
    -- The reason provided is driver delay 
    -- This is totally the driver fault cancellation . The combination of the high cancellation rate and a reason attributable for driver poor performance 
    -- Raj Singh 
    -- He has 50% chances of the cancellation which appears to be high and can be one of the major reason for our concern 
    -- Looking at the 'Feedback' Table and his booking id - 105 it shows that reason was customer personal reason
    -- The customer fault cancellation. The driver was not responsible for the cancellation. Therefore due to it the metrice fdoes ot indicate unrelaibility in this case
    -- SO concluding although the percentage of the cancelled trips can indicate driver unreliability but it is only when corelated with a reason of cancellation
    -- There are various ways for investigation of this particular like for e.g. Monitoring and protecting reliable driver
    
    USE Project;
    SELECT
    SUM(td.Fare) AS Total_Revenue
FROM
    Bookings b
JOIN
    TripDetails td ON b.BookingID = td.BookingID
WHERE
    b.Status = 'Completed'
    AND b.TripEndTime >= DATE_SUB('2025-10-13', INTERVAL 6 MONTH);
    
    -- Revenue Performance Analysis 
    -- The total revenue generated from the completed bookings in the last 6 months is RS 750
    -- A monthly breakdown of this revenue reveals that these earnings were concentrated in a single month May 2025
    -- There is no particular insight for the month of June to October making it difficult to identidy the trend 
    
    USE Project;
    
    SELECT
    PickupLocation,
    DropoffLocation,
    COUNT(*) AS Trip_Count
FROM
    Bookings
WHERE
    Status = 'Completed'
GROUP BY
    PickupLocation, DropoffLocation
ORDER BY
    Trip_Count DESC
LIMIT 3;

-- Yes the company should consider allocating more cabs to these high demand routes, but it should be a very strategic descision 
-- A simple increase is not advisable without further analaysis 
-- The following needs to be considered - Peak demand hours, Profitibilty, Return Trips, Network balance 
-- The best approach is dyanamic allocation. Company should use this data to position more cabs on these popular regular routes during peak hours to ensure 
-- profitibilaty and balanced service 

USE Project;

SELECT
    d.Name,
    d.Rating AS Overall_Rating,
    COUNT(td.TripID) AS Completed_Trips,
    SUM(td.Fare) AS Total_Earnings,
    AVG(td.Fare) AS Average_Fare_Per_Trip
FROM
    Drivers d
JOIN
    Cabs c ON d.DriverID = c.DriverID
JOIN
    Bookings b ON c.CabID = b.CabID
JOIN
    TripDetails td ON b.BookingID = td.BookingID
WHERE
    b.Status = 'Completed'
GROUP BY
    d.DriverID, d.Name, d.Rating
ORDER BY
    Overall_Rating DESC;
    
    -- The query output reveals positive co relation between the driver's overall rating and the earnings. The lowest rated driver Anshu had the lowest 
    -- earning i.e. 200 Rs. while the highest rated drivers had more 
    -- The corelation is not linear. It suggests the high rating is strong indicator of the fare value of the individual trips a driver completes is the most 
    -- direct factor influencinf their total earning 
    -- Regarding the completed trips the current dataset is inconclusive 
    -- Higher driver ratings are stronfly associated with higher earnings to establish direct co relation with the number of trips completed 
    
    USE Project;

SELECT
    PickupLocation,
    AVG(TIMESTAMPDIFF(MINUTE, BookingTime, TripStartTime)) AS Average_Wait_Time_Minutes
FROM
    Bookings
WHERE
    TripStartTime IS NOT NULL
GROUP BY
    PickupLocation
ORDER BY 
    Average_Wait_Time_Minutes DESC;
    

    
    
    















