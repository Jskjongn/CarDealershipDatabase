# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          CarDealershipDatabase                           #
# ---------------------------------------------------------------------- #

DROP DATABASE IF EXISTS cardealership;

CREATE DATABASE IF NOT EXISTS cardealership;

USE cardealership;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "dealerships"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `dealerships` (
	`Dealership_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(50) NOT NULL,
    `Address` VARCHAR(50) NOT NULL,
    `Phone` VARCHAR(12) NOT NULL,
    CONSTRAINT `PK_Dealership_ID` PRIMARY KEY (`Dealership_ID`)
);

# ---------------------------------------------------------------------- #
# Add table "vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `vehicles` (
	`VIN` VARCHAR(17) NOT NULL,
    `Year` INTEGER NOT NULL,
    `Make` VARCHAR(15) NOT NULL,
    `Model` VARCHAR(15) NOT NULL,
    `Vehicle_Type` VARCHAR(10) NOT NULL,
    `Color` VARCHAR(10) NOT NULL,
    `Odometer` INTEGER NOT NULL,
    `Price` DECIMAL(10,2) NOT NULL,
    `SOLD` ENUM('SOLD', 'NOT SOLD') DEFAULT 'NOT SOLD',
    CONSTRAINT `PK_VIN` PRIMARY KEY (`VIN`)
);

# ---------------------------------------------------------------------- #
# Add table "inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `inventory` (
	`Dealership_ID` INTEGER NOT NULL,
    `VIN` VARCHAR(17) NOT NULL,
    CONSTRAINT `FK_Dealership_ID` FOREIGN KEY (`Dealership_ID`) REFERENCES `dealerships` (`Dealership_ID`),
    CONSTRAINT `FK_VIN` FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`)
);

# ---------------------------------------------------------------------- #
# Add table "sales_contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `sales_contracts` (
	`Sales_Contract_ID` INTEGER NOT NULL AUTO_INCREMENT,
	`Date` DATE,
    `Customer_Name` VARCHAR(50) NOT NULL,
    `Customer_Email` VARCHAR(20) NOT NULL,
    `VIN` VARCHAR(17) NOT NULL,
    `Sales_Tax` DECIMAL(10,2) NOT NULL,
    `Recording_Fee` INTEGER DEFAULT 100 NOT NULL,
    `Processing_Fee` DECIMAL(10,2) NOT NULL,
    `Financed` ENUM('YES', 'NO') DEFAULT 'NO',
    `Monthly_Payment` DECIMAL(10,2) NOT NULL,
    CONSTRAINT `PK_Sales_Contract_ID` PRIMARY KEY (`Sales_Contract_ID`),
    CONSTRAINT `FK_VIN` FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`)
);

# ---------------------------------------------------------------------- #
# Add table "lease_contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `lease_contracts` (
	`Lease_Contract_ID` INTEGER NOT NULL AUTO_INCREMENT,
	`Date` DATE,
    `Customer_Name` VARCHAR(50) NOT NULL,
    `Customer_Email` VARCHAR(20) NOT NULL,
    `VIN` VARCHAR(17) NOT NULL,
    `Ending_Value` DECIMAL(10,2) NOT NULL,
    `Lease_Fee` DECIMAL(10,2) NOT NULL,
    `Financed` ENUM('YES', 'NO') DEFAULT 'NO',
    `Monthly_Payment` DECIMAL(10,2) NOT NULL,
    CONSTRAINT `PK_Lease_Contract_ID` PRIMARY KEY (`Lease_Contract_ID`),
    CONSTRAINT `FK_VIN` FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`)
);