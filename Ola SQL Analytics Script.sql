SELECT TOP (1000) [Date]
      ,[Time]
      ,[Booking_ID]
      ,[Booking_Status]
      ,[Customer_ID]
      ,[Vehicle_Type]
      ,[Pickup_Location]
      ,[Drop_Location]
      ,[V_TAT]
      ,[C_TAT]
      ,[Canceled_Rides_by_Customer]
      ,[Canceled_Rides_by_Driver]
      ,[Incomplete_Rides]
      ,[Incomplete_Rides_Reason]
      ,[Booking_Value]
      ,[Payment_Method]
      ,[Ride_Distance]
      ,[Driver_Ratings]
      ,[Customer_Rating]
      ,[Vehicle_Images]
      ,[column21]
  FROM [Ola Dataset].[dbo].[Ola Bookings]



 -- Total Number of Records
 Select COUNT(*) Total_Records from [Ola Bookings]



-- OLA Data Analyst Project
-- SQL Questions:

-- 1.Find Total Number of Sucessful bookings 
-- And Retrieve all successful bookings:

SELECT COUNT(*) Total_Successful_Bookings FROM [Ola Bookings]
WHERE Booking_Status = 'Success';

GO
CREATE VIEW Successful_Bookings_View AS
SELECT * 
FROM [Ola Bookings]
WHERE Booking_Status = 'Success';
GO

Select * from Successful_Bookings_View;

-- 2. Find the average ride distance for each vehicle type:
Go
CREATE VIEW Ride_Distance_For_Vehicle_type as 
Select Vehicle_Type, CAST(AVG(CAST(Ride_Distance as float)) as decimal(10,2)) Average_Ride_Distance
from [Ola Bookings]
Group by Vehicle_Type
Go

Select * from Ride_Distance_For_Vehicle_type
Order by Average_Ride_Distance DESC

-- 3. Get the total number of cancelled rides by customers:

GO
CREATE VIEW Number_of_Canceled_Rides_by_Customers AS
Select COUNT(*) Total_Rides_Canceled_By_Customers from [Ola Bookings]
Where Booking_Status = 'Canceled by Customer';
GO

Select * from Number_of_Canceled_Rides_by_Customers

-- 4. List the top 10 customers who booked the highest number of rides:
GO
CREATE VIEW Top_10_Customers_with_Higest_Rides AS
Select  TOP 10 Customer_ID, Count(Booking_ID) Total_Rides
from [Ola Bookings]
Group by Customer_ID
Order by Count(Booking_ID) DESC 
GO
Select * from Top_10_Customers_with_Higest_Rides

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
GO
CREATE VIEW Canceled_Rides_by_Driver_due_Personal_And_Car_related_issue AS
Select COUNT(*) Total_Rides_Canceled_By_Drivers from [Ola Bookings]
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';
GO

Select * from Canceled_Rides_by_Driver_due_Personal_And_Car_related_issue

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
GO
Create VIEW Max_and_Min_Rating_Driver_Rating_for_Prime_Sedan_bookings AS
Select MAX(Driver_Ratings) as Max_Rating, MIN(Driver_Ratings) Min_Rating 
from [Ola Bookings]
Where Vehicle_Type = 'Prime Sedan'
GO

Select * from Max_and_Min_Rating_Driver_Rating_for_Prime_Sedan_bookings

-- 7. Retrieve all rides where payment was made using UPI:
GO
Create View Bookings_Where_Payment_Was_Made_Using_UPI AS
Select * from [Ola Bookings]
where Payment_Method = 'UPI'
GO

Select * from Bookings_Where_Payment_Was_Made_Using_UPI

-- 8. Find the average customer rating per vehicle type:
GO
Create View Avg_Customer_Rating_by_Vehicle_type AS
Select Vehicle_Type, CAST(AVG(Customer_Rating ) as decimal(10,2)) Avg_Customer_Rating
from [Ola Bookings]
Group by Vehicle_Type
GO

Select * from Avg_Customer_Rating_by_Vehicle_type
Order by Avg_Customer_Rating DESC

-- 9. Calculate the total booking value of rides completed successfully:
GO
Create View Total_Booking_Value_of_Successful_Rides AS
Select SUM(Booking_Value) Total_Success_Booking_Value from [Ola Bookings]
Where Booking_Status = 'Success'
GO
Select * from Total_Booking_Value_of_Successful_Rides

-- 10. List all incomplete rides along with the reason
GO
Create View All_Incomplete_Rides_by_Reason AS
Select Booking_ID, Incomplete_Rides_Reason from [Ola Bookings]
Where Incomplete_Rides = 'Yes'
GO

Select * from All_Incomplete_Rides_by_Reason

























