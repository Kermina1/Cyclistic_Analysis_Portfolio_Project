SELECT top 2*
FROM CyclisticStagingTable;

-- Create new table with cleaned data.
SELECT 
ride_id,
rideable_type AS bike_type,
started_at,
ended_at,
DATEDIFF(minute,started_at,ended_at) AS ride_length,
DATEPART(WEEKDAY, started_at) AS day_of_week,
DATENAME(WEEKDAY, started_at) AS day_name,
DATEPART(MONTH, started_at) AS ride_month,
DATENAME(MONTH, started_at) AS month_name,
DATEPART(YEAR, started_at) AS ride_year,
start_station_name,
start_station_id,
end_station_name,
end_station_id,
start_lat,
start_lng,
end_lat,
end_lng,
member_casual AS rider_type
INTO cyclistic_tbl
FROM CyclisticStagingTable
WHERE start_station_name IS NOT NULL
   AND start_station_id IS NOT NULL
   AND end_station_name IS NOT NULL
   AND end_station_id IS NOT NULL
   AND end_lat IS NOT NULL
   AND end_lng IS NOT NULL -- Remove all null values.
   AND DATEDIFF(MINUTE, started_at, ended_at) >= 1 -- remove rides less than a min.
   AND DATEDIFF(MINUTE, started_at, ended_at) <= 1440; -- remove rides more than 24hrs.

   SELECT top 5 * 
   FROM cyclistic_tbl;

  



