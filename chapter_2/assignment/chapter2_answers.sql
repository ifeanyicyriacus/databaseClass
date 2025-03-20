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
	COUNT: this is used to count the number of rows in column, a roll is counted if it has a non-null value
	
    
*/

