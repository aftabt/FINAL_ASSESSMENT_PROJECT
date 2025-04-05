CREATE DATABASE IF NOT EXISTS silver_db;

USE silver_db;

CREATE TABLE IF NOT EXISTS silver_db.delivery_data_silver (
    delivery_id INT NOT NULL PRIMARY KEY,
    vehicle_id INT NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL,
    driver_name VARCHAR(100) NOT NULL,
    driver_rating FLOAT NOT NULL,
    route_name VARCHAR(255) NOT NULL,
    delivery_time FLOAT NOT NULL,
    distance_covered FLOAT NOT NULL,
    delivery_status VARCHAR(50) NOT NULL,
    distance FLOAT NOT NULL,
    fuel_efficiency FLOAT NOT NULL,
    fuel_consumed FLOAT NOT NULL,
    processed_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


SELECT * FROM silver_db.delivery_data_silver;
TRUNCATE TABLE silver_db.delivery_data_silver;
DROP TABLE silver_db.delivery_data_silver;
