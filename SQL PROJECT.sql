CREATE DATABASE AutomobileDB;
USE AutomobileDB;
-- Table for Brand Information
CREATE TABLE Brand (
    BrandID INT AUTO_INCREMENT PRIMARY KEY,
    BrandName VARCHAR(50) NOT NULL
);
-- Table for Car Model Details
CREATE TABLE CarModel (
    ModelID INT AUTO_INCREMENT PRIMARY KEY,
    BrandID INT,
    BodyStyle VARCHAR(50),
    DriveWheels VARCHAR(10),
    Price DECIMAL(10,2),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID) ON DELETE CASCADE
);
-- Table for Engine Specifications
CREATE TABLE Engine (
    EngineID INT AUTO_INCREMENT PRIMARY KEY,
    EngineType VARCHAR(50),
    NumOfCylinders VARCHAR(20),
    EngineSize INT,
    FuelSystem VARCHAR(50),
    Horsepower INT,
    PeakRPM INT
);
-- Table for Fuel Information
CREATE TABLE Fuel (
    FuelID INT AUTO_INCREMENT PRIMARY KEY,
    FuelType VARCHAR(20),
    Aspiration VARCHAR(20),
    FuelSystem VARCHAR(50)
);

-- Table for Dimensions of the Car
CREATE TABLE Dimensions (
    DimensionID INT AUTO_INCREMENT PRIMARY KEY,
    WheelBase DECIMAL(5,2),
    Length DECIMAL(5,2),
    Width DECIMAL(5,2),
    Height DECIMAL(5,2),
    CurbWeight INT
);

-- Table for Car Performance
CREATE TABLE Performance (
    PerformanceID INT AUTO_INCREMENT PRIMARY KEY,
    CompressionRatio DECIMAL(4,2),
    CityMPG INT,
    HighwayMPG INT
);

-- Table for Transmission Details
CREATE TABLE Transmission (
    TransmissionID INT AUTO_INCREMENT PRIMARY KEY,
    NumOfDoors VARCHAR(10),
    DriveWheels VARCHAR(10)
);
-- Main Car Table (Links All Other Tables)
CREATE TABLE Car (
    CarID INT AUTO_INCREMENT PRIMARY KEY,
    ModelID INT,
    EngineID INT,
    FuelID INT,
    DimensionID INT,
    PerformanceID INT,
    TransmissionID INT,
    FOREIGN KEY (ModelID) REFERENCES CarModel(ModelID) ON DELETE CASCADE,
    FOREIGN KEY (EngineID) REFERENCES Engine(EngineID) ON DELETE CASCADE,
    FOREIGN KEY (FuelID) REFERENCES Fuel(FuelID) ON DELETE CASCADE,
    FOREIGN KEY (DimensionID) REFERENCES Dimensions(DimensionID) ON DELETE CASCADE,
    FOREIGN KEY (PerformanceID) REFERENCES Performance(PerformanceID) ON DELETE CASCADE,
    FOREIGN KEY (TransmissionID) REFERENCES Transmission(TransmissionID) ON DELETE CASCADE
);
-- Insert into Brand Table
INSERT INTO Brand (BrandName) VALUES 
('alfa-romero'), ('audi');

-- Insert into CarModel Table
INSERT INTO CarModel (BrandID, BodyStyle, DriveWheels, Price) VALUES 
(1, 'convertible', 'rwd', 13495),
(1, 'convertible', 'rwd', 16500),
(1, 'hatchback', 'rwd', 16500),
(2, 'sedan', 'fwd', 13950),
(2, 'sedan', '4wd', 17450),
(2, 'sedan', 'fwd', 15250),
(2, 'sedan', 'fwd', 17710),
(2, 'wagon', 'fwd', 18920),
(2, 'sedan', 'fwd', 23875),
(2, 'hatchback', '4wd', NULL);

-- Insert into Engine Table
INSERT INTO Engine (EngineType, NumOfCylinders, EngineSize, FuelSystem, Horsepower, PeakRPM) VALUES 
('mpfi', 'four', 130, 'mpfi', 111, 5000),
('mpfi', 'four', 130, 'mpfi', 111, 5000),
('mpfi', 'four', 152, 'mpfi', 154, 5000),
('mpfi', 'four', 109, 'mpfi', 102, 5500),
('mpfi', 'five', 136, 'mpfi', 115, 5500),
('mpfi', 'five', 136, 'mpfi', 110, 5500),
('mpfi', 'five', 136, 'mpfi', 110, 5500),
('mpfi', 'five', 136, 'mpfi', 110, 5500),
('mpfi', 'four', 131, 'mpfi', 140, 5500),
('mpfi', 'four', 131, 'mpfi', 160, 5500);

-- Insert into Fuel Table
INSERT INTO Fuel (FuelType, Aspiration, FuelSystem) VALUES 
('gas', 'std', 'mpfi'),
('gas', 'std', 'mpfi'),
('gas', 'std', 'mpfi'),
('gas', 'std', 'mpfi'),
('gas', 'std', 'mpfi'),
('gas', 'std', 'mpfi'),
('gas', 'std', 'mpfi'),
('gas', 'std', 'mpfi'),
('gas', 'turbo', 'mpfi'),
('gas', 'turbo', 'mpfi');

-- Insert into Dimensions Table
INSERT INTO Dimensions (WheelBase, Length, Width, Height, CurbWeight) VALUES 
(88.6, 168.8, 64.1, NULL, NULL),
(88.6, 168.8, 64.1, NULL, NULL),
(94.5, 171.2, 65.5, NULL, NULL),
(99.8, 176.6, 66.2, NULL, NULL),
(99.4, 176.6, 66.4, NULL, NULL),
(99.8, 177.3, 66.3, NULL, NULL),
(105.8, 192.7, 71.4, NULL, NULL),
(105.8, 192.7, 71.4, NULL, NULL),
(105.8, 192.7, 71.4, NULL, NULL),
(99.5, 178.2, 67.9, NULL, NULL);

-- Insert into Performance Table
INSERT INTO Performance (CompressionRatio, CityMPG, HighwayMPG) VALUES 
(9.0, 21, 27),
(9.0, 21, 27),
(9.0, 19, 26),
(10.0, 24, 30),
(8.0, 18, 22),
(8.5, 19, 25),
(8.5, 19, 25),
(8.5, 19, 25),
(8.3, 17, 20),
(7.0, 16, 22);

-- Insert into Transmission Table
INSERT INTO Transmission (NumOfDoors, DriveWheels) VALUES 
('two', 'rwd'),
('two', 'rwd'),
('two', 'rwd'),
('four', 'fwd'),
('four', '4wd'),
('two', 'fwd'),
('four', 'fwd'),
('four', 'fwd'),
('four', 'fwd'),
('two', '4wd');

-- Insert into Car Table
INSERT INTO Car (ModelID, EngineID, FuelID, DimensionID, PerformanceID, TransmissionID) VALUES 
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 4),
(5, 5, 5, 5, 5, 5),
(6, 6, 6, 6, 6, 6),
(7, 7, 7, 7, 7, 7),
(8, 8, 8, 8, 8, 8),
(9, 9, 9, 9, 9, 9),
(10, 10, 10, 10, 10, 10);

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, COLUMN_KEY 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'AutomobileDB';

INSERT INTO Brand (BrandName) VALUES ('BMW');

INSERT INTO CarModel (BrandID, BodyStyle, DriveWheels, Price) VALUES 
(3, 'sedan', 'rwd', 35000);

INSERT INTO Engine (EngineType, NumOfCylinders, EngineSize, FuelSystem, Horsepower, PeakRPM) VALUES 
('mpfi', 'six', 300, 'mpfi', 250, 6500);

INSERT INTO Fuel (FuelType, Aspiration, FuelSystem) VALUES 
('gas', 'std', 'mpfi');

INSERT INTO Dimensions (WheelBase, Length, Width, Height, CurbWeight) VALUES 
(110.0, 200.0, 75.0, 55.0, 3500);

INSERT INTO Performance (CompressionRatio, CityMPG, HighwayMPG) VALUES 
(10.0, 20, 30);

INSERT INTO Transmission (NumOfDoors, DriveWheels) VALUES 
('four', 'rwd');

INSERT INTO Car (ModelID, EngineID, FuelID, DimensionID, PerformanceID, TransmissionID) VALUES 
(11, 11, 11, 11, 11, 11);

SELECT * FROM Car;
SELECT cm.BrandID, b.BrandName, cm.BodyStyle, cm.Price, e.EngineType, f.FuelType, p.CityMPG, p.HighwayMPG
FROM Car c
JOIN CarModel cm ON c.ModelID = cm.ModelID
JOIN Brand b ON cm.BrandID = b.BrandID
JOIN Engine e ON c.EngineID = e.EngineID
JOIN Fuel f ON c.FuelID = f.FuelID
JOIN Performance p ON c.PerformanceID = p.PerformanceID
WHERE cm.BrandID = 3;
UPDATE CarModel
SET Price = 37000
WHERE ModelID = 11;
UPDATE Fuel
SET FuelType = 'diesel'
WHERE FuelID = 11;
DELETE FROM Car WHERE ModelID = 11;
DELETE FROM Brand WHERE BrandID = 3;





