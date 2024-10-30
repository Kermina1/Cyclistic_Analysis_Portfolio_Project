SELECT TOP 2 *
FROM cyclistic_tbl

-- How many rides in 2023?
SELECT COUNT(ride_id) AS number_of_rides
FROM cyclistic_tbl;

-- How many rides for each bike type?
SELECT bike_type,
	   COUNT(*) number_of_rides
FROM cyclistic_tbl
GROUP BY bike_type
ORDER BY number_of_rides DESC;

-- What are the busiest days with rides?
SELECT day_name,
      COUNT(*) AS number_of_rides
FROM cyclistic_tbl
GROUP BY day_name
ORDER BY number_of_rides DESC;

-- What are the most active months?
SELECT month_name,
      COUNT(*) AS number_of_rides
FROM cyclistic_tbl
GROUP BY month_name
ORDER BY number_of_rides DESC;

-- What are most active hours?
SELECT DATEPART(HOUR,started_at) AS ride_hour,
      COUNT(*) AS number_of_rides
FROM cyclistic_tbl
GROUP BY DATEPART(HOUR,started_at)
ORDER BY number_of_rides DESC;

-- What is the overal average ride duration?
SELECT avg(ride_length) AS avg_ride_duration
FROM cyclistic_tbl;

-- Do members ride more frequently than casual riders?
SELECT rider_type,COUNT(*) AS number_of_rides
FROM cyclistic_tbl
GROUP BY rider_type;

-- Do casual riders or annual members tend to use certain types of bikes more frequently?
SELECT rider_type, 
	   bike_type,
	   COUNT(*) number_of_rides
FROM cyclistic_tbl
GROUP BY rider_type, bike_type
ORDER BY number_of_rides DESC;

-- What are the most popular days of the week for casual riders vs. annual members? 
SELECT rider_type,
	   day_name,
	   COUNT(*) AS number_of_rides,
	   ROW_NUMBER() OVER(PARTITION BY rider_type ORDER BY COUNT(*) DESC) AS ranking
FROM cyclistic_tbl
GROUP BY rider_type, day_name;

-- What are the most popular months for casual riders vs. annual members?
SELECT rider_type,
	   month_name,
	   COUNT(*) AS number_of_rides,
	   ROW_NUMBER() OVER(PARTITION BY rider_type ORDER BY COUNT(*) DESC) AS ranking
FROM cyclistic_tbl
GROUP BY rider_type, month_name;

-- What time of day do casual riders use Cyclistic bikes compared to annual members?
SELECT rider_type,
       DATEPART(HOUR,started_at) AS ride_hour,
	   COUNT(*) number_of_rides,
	   ROW_NUMBER() OVER(PARTITION BY rider_type ORDER BY COUNT(*) DESC) AS ranking
FROM cyclistic_tbl
GROUP BY rider_type, DATEPART(HOUR,started_at);

-- How avg ride duration differ for casual riders vs. annual members?
SELECT rider_type,
       AVG(ride_length) as avg_ride_duration
FROM cyclistic_tbl
GROUP BY rider_type;

-- What is the average ride duration per months, days, and hours for each group?
-- Per month
SELECT rider_type,
       month_name,
       AVG(ride_length) as avg_ride_duration
FROM cyclistic_tbl
GROUP BY rider_type, month_name
ORDER BY avg_ride_duration DESC;

-- Per day
SELECT rider_type,
       day_name,
       AVG(ride_length) as avg_ride_duration
FROM cyclistic_tbl
GROUP BY rider_type, day_name
ORDER BY avg_ride_duration DESC;

-- Per hour
SELECT rider_type,
       DATEPART(HOUR,started_at) AS ride_hour,
       AVG(ride_length) as avg_ride_duration
FROM cyclistic_tbl
GROUP BY rider_type, DATEPART(HOUR,started_at)
ORDER BY avg_ride_duration DESC;

-- What are the most common starting and ending stations for casual riders vs. members?
-- Start station.
SELECT start_station_name,
	   rider_type,
	   COUNT(*) AS number_of_rides
FROM cyclistic_tbl
GROUP BY start_station_name, rider_type
ORDER BY number_of_rides DESC;

-- End stations.
SELECT end_station_name,
	   rider_type,
	   COUNT(*) AS number_of_rides
FROM cyclistic_tbl
GROUP BY end_station_name, rider_type
ORDER BY number_of_rides DESC;

