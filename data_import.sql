-- Check data and consistancy across tables.
SELECT * 
FROM tripdata_202301;

SELECT *
FROM tripdata_202302;

SELECT *
FROM tripdata_202303;

SELECT *
FROM tripdata_202304;

SELECT *
FROM tripdata_202305;

SELECT *
FROM tripdata_202306;

SELECT *
FROM tripdata_202307;

SELECT *
FROM tripdata_202308;

SELECT *
FROM tripdata_202309;

SELECT *
FROM tripdata_202310;

SELECT *
FROM tripdata_202311;

SELECT *
FROM tripdata_202312;

-- Drop the staging table if it already exists
DROP TABLE IF EXISTS CyclisticStagingTable;

-- Creat staging table to combine the tables.

CREATE TABLE CyclisticStagingTable (
    ride_id VARCHAR(255),   
    rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual VARCHAR(255)
);

-- Insert data into the staging table.
INSERT INTO CyclisticStagingTable
SELECT * 
FROM tripdata_202301
UNION ALL 
SELECT * 
FROM tripdata_202302
UNION ALL 
SELECT * 
FROM tripdata_202303
UNION ALL 
SELECT * 
FROM tripdata_202304
UNION ALL 
SELECT * 
FROM tripdata_202305
UNION ALL 
SELECT * 
FROM tripdata_202306
UNION ALL 
SELECT * 
FROM tripdata_202307
UNION ALL 
SELECT * 
FROM tripdata_202308
UNION ALL 
SELECT * 
FROM tripdata_202309
UNION ALL 
SELECT * 
FROM tripdata_202310
UNION ALL 
SELECT * 
FROM tripdata_202311
UNION ALL 
SELECT * 
FROM tripdata_202312;

SELECT TOP 5 * 
FROM CyclisticStagingTable