use lag_ride_sharing_analytics;

-- 1. Top 5 highest-rated drivers in Lagos
create table top_5rated_driver as (select * from Drivers
order by Rating desc, TotalRides desc
limit 5);

-- 2. Riders with more than 5 rides in the last 30 days in Lagos
create table riders_with_more_than_5_rides as (select Riders.RiderID, Riders.Name, City, count(*) as rides  
from Riders join Rides
on Riders.RiderID = Rides.RiderID
group by Riders.RiderID
having rides > 5);

-- 3. Total revenue for the past month for Lagos rides
create table total_revenue_for_past_month as (select sum(Amount) as TotalRevenue from Payments);

-- 4. Area in Lagos with the most rides
create table area_in_lagos_with_most_rides as (select City, count(*) as Rides from Riders join Rides
on Riders.RiderID = Rides.RiderID
group by City
order by Rides desc);

