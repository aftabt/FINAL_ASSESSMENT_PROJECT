CREATE DATABASE IF NOT EXISTS gold_db;
USE gold_db;

CREATE TABLE IF NOT EXISTS transportation_gold (
    route_name VARCHAR(255),
    total_deliveries INT,
    avg_delivery_time FLOAT,
    avg_fuel_consumed FLOAT,
    vehicle_id INT,
    total_distance FLOAT,
    fuel_efficiency FLOAT,
    driver_name VARCHAR(255),
    total_deliveries_by_driver INT,
    driver_rating FLOAT,
    delivery_status VARCHAR(50),
    report_date DATE
);

SELECT * FROM gold_db.transportation_gold;
SELECT COUNT(*) AS total_rows FROM gold_db.transportation_gold;
TRUNCATE TABLE gold_db.transportation_gold;
DROP TABLE gold_db.transportation_gold;

