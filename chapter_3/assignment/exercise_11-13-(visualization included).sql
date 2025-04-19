-- 11. Find the number of rides each driver in Lagos has had, sorted by the most rides 
select DriverID, TotalRides as `Total Rides`
from Drivers
order by `Total Rides` desc;

-- 12. Identify the payment methods used by Lagos riders for rides over ₦50,000
select PaymentMethod, sum(Amount), count(*) as NumberOfTransaction
from Payments
group by PaymentMethod
having sum(Amount) > 50000;

-- 13 Find rides in Lagos with a duration longer than 2 hours
select RideID, (2) as Duration, DriverID, RideID
from Rides
having Duration > 2
order by Duration desc;


-- Data Visualization Ideas
-- 1. Bar Chart: Top-rated Drivers in Lagos
select * 
from Drivers
order by Rating desc, TotalRides desc;

-- 2. Pie Chart: Payment Methods for Rides Over ₦50,000
select PaymentMethod, sum(Amount), count(*) as NumberOfTransaction
from Payments
group by PaymentMethod
having sum(Amount) > 50000;

-- 3. Line Graph: Monthly Revenue Trends in Lagos
select PaymentMethod, max(Amount), min(Amount), count(*) as NumberOfTransaction
from Payments
group by PaymentMethod;

-- 4. Heatmap: Most Popular Lagos Areas Based on Rides
select City as Area, count(*) as `Popularity`
from Riders join Rides
on Riders.RiderID = Rides.RiderID
group by City
order by Popularity desc;


