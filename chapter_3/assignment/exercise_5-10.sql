-- 5. Driver with the highest revenue in Lagos
select Drivers.DriverID, Name, sum(Fare) as `Total Revenue` 
from Drivers join Rides
on Drivers.DriverID = Rides.DriverID
group by DriverID
order by `Total Revenue` desc;

-- 6. Find rides where the fare is more than 50% higher or lower than the average fare
select 	RideID,
		Fare,
        avg(Fare) over() as AverageFare,
        round(((Fare - avg(Fare) over()) / avg(Fare) over()) * 100,2) as `(%) difference`
from Rides;

-- 7. Find riders in Lagos who rated their drivers less than 3 on average
select 	Riders.RiderID,
		Name,
        avg(Rating) as `Average Rating`
from	Riders join Rides
on 	Riders.RiderID = Rides.RiderID
group by Riders.RiderID
having `Average Rating` < 3;


-- 8. Find the top 5 Lagos neighborhoods with the highest average fare
select City as Area, avg(Fare) as `Average Fare` from Riders join Rides
on Riders.RiderID = Rides.RiderID
group by Area
order by `Average Fare` desc;

-- 9. Drivers in Lagos who have not received any rides in the last 30 days
select Drivers.DriverID, Drivers.Name
from Drivers
where Drivers.DriverID not in (select Rides.DriverID from Rides);


-- 10. Rides in Lagos with the longest distance (top 5)
select 	RideID, DistanceKM, DriverID, RiderID
from 	Rides
