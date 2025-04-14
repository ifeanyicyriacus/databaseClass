use cape_codd;

/* *** Questions 2.17 *** */
SELECT SKU, SKU_Description FROM INVENTORY;

/* *** Questions 2.18 *** */
SELECT SKU_Description, SKU FROM INVENTORY;

/* *** Questions 2.19 *** */
SELECT WarehouseID FROM INVENTORY;

/* *** Questions 2.20 *** */
SELECT DISTINCT WarehouseID FROM INVENTORY;

/* *** Questions 2.21 *** */
SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder FROM INVENTORY;

/* *** Questions 2.22 *** */
SELECT * FROM INVENTORY;

/* *** Questions 2.23 *** */
SELECT * FROM INVENTORY WHERE QuantityOnHand > 0;

/* *** Questions 2.24 *** */
SELECT * FROM INVENTORY WHERE QuantityOnHand = 0;

/* *** Questions 2.25 *** */
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand = 0 ORDER BY WarehouseID;

/* *** Questions 2.26 *** */
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand > 0 ORDER BY WarehouseID DESC, SKU;

/* *** Questions 2.27 *** */
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0 
ORDER BY WarehouseID DESC , SKU;

/* *** Questions 2.28 *** */
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY where QuantityOnHand = 0 or QuantityOnOrder = 0 
ORDER BY WarehouseID DESC, SKU;

/* *** Questions 2.29 *** */
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM INVENTORY WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;

/* *** Questions 2.30 *** */
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM INVENTORY WHERE QuantityOnHand BETWEEN 2 AND 9;

/* *** Questions 2.31 *** */
SELECT distinct SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE "Half-Dome%";

/* *** Questions 2.32 *** */
SELECT distinct SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE "%Climb%";

/* *** Questions 2.33 *** */
SELECT distinct SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE "__d%";

/* *** Questions 2.34 *** */
SELECT distinct SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE "__d%";

/* *** Questions 2.34 *** */
SELECT COUNT(QuantityOnHand) AS NumberOfRows  FROM INVENTORY;
SELECT SUM(QuantityOnHand) AS SumOfQuantityOnHand  FROM INVENTORY;
SELECT AVG(QuantityOnHand) AS AvgQuantityOnHand  FROM INVENTORY;
SELECT MIN(QuantityOnHand) AS MinQuantityOnHand  FROM INVENTORY;
SELECT MAX(QuantityOnHand) AS MaxQuantityOnHand  FROM INVENTORY;

/* *** Questions 2.35 *** */
/*Explain the difference between the SQL built-in functions COUNT and SUM.
	COUNT: this is used to count the number of rows returned in column, a roll is counted if it has a non-null value
	SUM: Returnes the sum, If the return set has no rows, SUM() returns NULL
*/

/* *** Questions 2.36 *** */
SELECT WarehouseID, sum(QuantityOnHand) as TotalItemsOnHand  FROM INVENTORY
group by WarehouseID
order by TotalItemsOnHand desc;

/* *** Questions 2.37 *** */
select WarehouseID, sum(QuantityOnHand) as TotalItemsOnHandLT3 from INVENTORY
where QuantityOnHand < 3
group by WarehouseID
order by TotalItemsOnHandLT3 desc;

/* *** Questions 2.38 *** */
select WarehouseID, sum(QuantityOnHand) as TotalItemsOnHandLT3 from INVENTORY
where QuantityOnHand < 3
group by WarehouseID
having TotalItemsOnHandLT3 = 2
order by TotalItemsOnHandLT3 desc;

/* *** Questions 2.39 *** */
/* In your answer to Review Question 2.38, was the WHERE clause or the HAVING 
	clause applied first? Why?
	
    Answer:
    The ware clause was applied before the `group by` and `having` beacuse, 
    i want the where clause to take effect before the grouping/ grouping sum aggregation
    while the having is after the group by to pass row filtering condition after it get aggregated in groups, 
    usually on condensed/evaluated column 
    The SQL WHERE clause specifies which rows will be used to determine the groups.
	The SQL HAVING clause specifies which groups will be used in the final result.
*/


/* *** Questions 2.40 (using the forbidden in)*** */
select SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState from INVENTORY, WAREHOUSE
where INVENTORY.WarehouseID in (select WarehouseID
from WAREHOUSE
where WarehouseCity = 'Atlanta' or WarehouseCity = 'Bangor' or WarehouseCity = 'Chicago');

/* *** Questions 2.40 *** */
select SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState from INVENTORY, WAREHOUSE
where WarehouseCity = 'Atlanta' or WarehouseCity = 'Bangor' or WarehouseCity = 'Chicago';

/* *** Questions 2.41 (using the forbidden in)*** */
select SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState from INVENTORY, WAREHOUSE
where INVENTORY.WarehouseID in (
select WAREHOUSE.WarehouseID from WAREHOUSE 
where  WarehouseCity = 'Atlanta' or WarehouseCity = 'Bangor' or WarehouseCity = 'Chicago' )
and WAREHOUSE.WarehouseID = INVENTORY.WarehouseID;

/* *** Questions 2.42 *** */
select SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState from INVENTORY, WAREHOUSE
where WAREHOUSE.WarehouseID = INVENTORY.WarehouseID
and WarehouseCity <> 'Atlanta' and WarehouseCity <> 'Bangor' and WarehouseCity <> 'Chicago';

/* *** Questions 2.43 *** */
select SKU, SKU_Description, INVENTORY.WarehouseID, WarehouseCity, WarehouseState from INVENTORY, WAREHOUSE
where WAREHOUSE.WarehouseID = INVENTORY.WarehouseID
and WarehouseCity not in (select WarehouseCity from WAREHOUSE
where WarehouseCity = 'Atlanta' or WarehouseCity = 'Bangor' or WarehouseCity = 'Chicago' );

/* *** Questions 2.44 *** */
select distinct concat(SKU_Description, ' is located in ', WarehouseCity) as ItemLocation from INVENTORY, WAREHOUSE;

/* *** Questions 2.45 *** */
SELECT 	SKU, SKU_Description, WarehouseID
FROM	INVENTORY
WHERE 	WarehouseID IN (SELECT	WarehouseID
        FROM	WAREHOUSE
        WHERE	Manager LIKE 'Lucille Smith');

/* *** Questions 2.46 *** */
SELECT 	SKU, SKU_Description, WAREHOUSE.WarehouseID 
from INVENTORY join WAREHOUSE
where INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
and WAREHOUSE.Manager  LIKE 'Lucille Smith';

/* *** Questions 2.47 *** */
SELECT 	SKU, SKU_Description, WAREHOUSE.WarehouseID 
from INVENTORY join WAREHOUSE
on INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
and WAREHOUSE.Manager  LIKE 'Lucille Smith';

/* *** Questions 2.48 *** */
select i.WarehouseID, avg(QuantityOnHand) from INVENTORY as i
where i.WarehouseID in (select w.WarehouseID from WAREHOUSE as w
	where w.Manager  LIKE 'Lucille Smith')
    group by i.WarehouseID;

/* *** Questions 2.49 *** */
select 	i.WarehouseID, avg(QuantityOnHand) from INVENTORY as i join WAREHOUSE as w
where 	i.WarehouseID = w.WarehouseID and
		w.Manager  LIKE 'Lucille Smith'
group by i.WarehouseID;

/* *** Questions 2.50 *** */
select 	i.WarehouseID, avg(QuantityOnHand) from INVENTORY as i join WAREHOUSE as w
on		i.WarehouseID = w.WarehouseID
where	w.Manager  LIKE 'Lucille Smith'
group by i.WarehouseID;


select * from WAREHOUSE;














