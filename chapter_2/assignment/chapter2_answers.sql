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





