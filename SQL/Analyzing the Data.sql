SELECT * FROM bikesharing_project.working_table;
-- This identifies the total number of casual vs annual riders and their proportion
SELECT 
	DISTINCT (member_casual) AS member,
	COUNT(rideid) AS no_of_rides,
    COUNT(rideid) / SUM(COUNT(rideid)) OVER () *100 AS proportion_of_rides
FROM bikesharing_project.working_table
GROUP BY member_casual;
-- This identifies the total number of rides per type of bike for members and casual members
SELECT
  rideable_type,
  member_casual,
  COUNT(rideid) AS total_no_of_of_rides
FROM working_table
GROUP BY rideable_type, member_casual
ORDER BY member_casual, rideable_type;
-- This counts the total number of rides per month grouped by member types
SELECT 
  month,
  member_casual AS member_type,
  COUNT(rideid) AS total_no_of_rides
FROM working_table
GROUP BY month, member_type
ORDER BY member_type;
-- This counts the total number of rides per day of the week grouped by member types
SELECT
  day_of_the_week AS day,
  member_casual AS member,
  COUNT(rideid) AS total_no_of_rides
FROM working_table	
GROUP BY day, member
ORDER BY member;
-- This counts the total number of rides per hour within the day grouped by member types
SELECT
  EXTRACT(HOUR FROM started_at) AS hour,
  member_casual AS member,
  COUNT(rideid) AS total_no_of_rides
FROM working_table
GROUP BY hour, member
ORDER BY member;
-- This counts the average ride duration per week grouped by member types
SELECT 
 day_of_the_week AS day,
 member_casual AS member,
 ROUND(AVG(EXTRACT(MINUTE FROM ride_length)), 2) AS ave_mins_duration
FROM working_table	
GROUP BY day, member
ORDER BY day, member;
-- This identifies the top 10 popular start stations
SELECT
  start_station_name,
  COUNT(rideid) AS number_of_rides
FROM working_table
GROUP BY start_station_name
ORDER BY number_of_rides DESC
LIMIT 10;
-- This identifies the top 10 popular end stations
SELECT
  end_station_name,
  COUNT(rideid) AS number_of_rides
FROM working_table
GROUP BY end_station_name
ORDER BY number_of_rides DESC
LIMIT 10;
-- This identifies the top 10 routes
SELECT
  start_station_name,
  end_station_name,
  COUNT(*) AS number_of_rides
FROM working_table
GROUP BY start_station_name, end_station_name
ORDER BY number_of_rides DESC
LIMIT 10;
-- This averages the distance taken per member type in kms
SELECT 
member_casual,
ROUND(AVG(distancein_km),2) AS average
FROM working_table
GROUP BY member_casual;





