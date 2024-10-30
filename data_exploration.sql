SELECT top 10 *
FROM CyclisticStagingTable;

-- Check for duplicates.
SELECT ride_id, COUNT(*) AS duplicate
FROM CyclisticStagingTable
GROUP BY ride_id
HAVING COUNT(*) > 1;

-- Check for number of records.
SELECT COUNT(ride_id) as number_of_records
FROM CyclisticStagingTable;

-- Check for null values.
SELECT COUNT(CASE WHEN rideable_type IS NULL THEN 1 END) as rideable_nulls,
	   COUNT(CASE WHEN started_at IS NULL THEN 1 END) as started_at_nulls,
	   COUNT(CASE WHEN ended_at IS NULL THEN 1 END) as ended_at_nulls,
	   COUNT(CASE WHEN start_station_name IS NULL THEN 1 END) as start_station_nulls,
	   COUNT(CASE WHEN start_station_id IS NULL THEN 1 END) as start_stationid_nulls,
	   COUNT(CASE WHEN end_station_name IS NULL THEN 1 END) as end_station_nulls,
	   COUNT(CASE WHEN end_station_id IS NULL THEN 1 END) as end_stationid_nulls,
	   COUNT(CASE WHEN start_lat IS NULL THEN 1 END) as start_lat_nulls,
	   COUNT(CASE WHEN start_lng IS NULL THEN 1 END) as start_lng_nulls,
	   COUNT(CASE WHEN end_lat IS NULL THEN 1 END) as end_lat_nulls,
	   COUNT(CASE WHEN end_lng IS NULL THEN 1 END) as end_lng_nulls,
	   COUNT(CASE WHEN member_casual IS NULL THEN 1 END) as member_casual_nulls
FROM CyclisticStagingTable;

-- Understand distinct values in the data
SELECT DISTINCT rideable_type
FROM CyclisticStagingTable;

SELECT DISTINCT start_station_name
FROM CyclisticStagingTable;

SELECT DISTINCT end_station_name
FROM CyclisticStagingTable;

SELECT DISTINCT member_casual
FROM CyclisticStagingTable;

-- Check For outliers (less than a minute ride and more than a day ride)
SELECT COUNT(DATEDIFF(HOUR,started_at,ended_at)) as more_day_rides
FROM CyclisticStagingTable
WHERE  DATEDIFF(HOUR,started_at,ended_at) > 24;

SELECT COUNT(DATEDIFF(MINUTE,started_at,ended_at)) as less_min_rides
FROM CyclisticStagingTable
WHERE  DATEDIFF(MINUTE,started_at,ended_at) < 1;
