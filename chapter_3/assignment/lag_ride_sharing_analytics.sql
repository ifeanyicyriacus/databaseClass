create database lag_ride_sharing_analytics;

use lag_ride_sharing_analytics;

CREATE TABLE `Drivers` (
  `DriverID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Rating` decimal(2,1) NOT NULL,
  `TotalRides` int NOT NULL,
  PRIMARY KEY (`DriverID`)
);

CREATE TABLE `Riders` (
	`RiderID` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(45) NOT NULL,
    `City` varchar(45) NOT NULL,
    PRIMARY KEY (`RiderID`)
);

CREATE TABLE `Rides` (
	`RideID` int NOT NULL AUTO_INCREMENT ,
    `DriverID` int NOT NULL,
    `RiderID` int NOT NULL,
    `Fare` int NOT NULL,
    `Rating` decimal(2,1) NOT NULL,
    `DistanceKM` int NOT NULL,
    PRIMARY KEY (`RideID`),
    INDEX `driver_ind` (DriverID),
    INDEX `rider_ind` (RiderID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
	FOREIGN KEY (RiderID) REFERENCES Riders(RiderID)
);

CREATE TABLE `Payments` (
	`PaymentID` int NOT NULL AUTO_INCREMENT,
    `RideID` int NOT NULL,
    `Amount` int NOT NULL,
    `PaymentMethod` varchar(45) NOT NULL,
    PRIMARY KEY (`PaymentID`),
    INDEX `ride_ind` (RideID),
    FOREIGN KEY (RideID) REFERENCES Rides(RideID)
);

