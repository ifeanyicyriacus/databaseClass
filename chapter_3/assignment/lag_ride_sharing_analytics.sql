create database lag_ride_sharing_analytics;
use lag_ride_sharing_analytics;

CREATE TABLE `drivers` (
  `DriverID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Rating` decimal(1,1) NOT NULL,
  `TotalRides` int NOT NULL,
  PRIMARY KEY (`DriverID`)
);

CREATE TABLE `riders` (
	`RiderID` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(45) NOT NULL,
    `City` varchar(45) NOT NULL,
    PRIMARY KEY (`RiderID`)
);

CREATE TABLE `rides` (
	`RideID` int NOT NULL AUTO_INCREMENT ,
    `DriverID` int NOT NULL,
    `RiderID` int NOT NULL,
    `Fare` int NOT NULL,
    `Rating` decimal(1,1) NOT NULL,
    `DistanceKM` int NOT NULL,
    PRIMARY KEY (`RideID`),
    INDEX `driver_ind` (DriverID),
    INDEX `rider_ind` (RiderID),
    FOREIGN KEY (DriverID) REFERENCES drivers(DriverID),
	FOREIGN KEY (RiderID) REFERENCES riders(RiderID)
);

CREATE TABLE `Payments` (
	`PaymentID` int NOT NULL AUTO_INCREMENT,
    `RideID` int NOT NULL,
    `Amount` int NOT NULL,
    `PaymentMethod` varchar(45) NOT NULL,
    PRIMARY KEY (`PaymentID`),
    INDEX `ride_ind` (RideID),
    FOREIGN KEY (RideID) REFERENCES rides(RideID)
);

