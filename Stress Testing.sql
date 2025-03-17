INSERT INTO Brand (BrandName) 
SELECT CONCAT('Brand_', id) FROM (SELECT 1 AS id UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS temp;
DELIMITER $$

CREATE PROCEDURE BulkInsertCarModel()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        INSERT INTO CarModel (BrandID, BodyStyle, DriveWheels, Price) 
        VALUES (FLOOR(RAND() * 5) + 1, 'sedan', 'rwd', ROUND(RAND() * 50000, 2));
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;
CALL BulkInsertCarModel();
SET GLOBAL max_allowed_packet = 512M;
SET GLOBAL net_read_timeout = 300;
SET GLOBAL net_write_timeout = 300;
SET GLOBAL max_connections = 100;
SET SESSION wait_timeout = 1800;
