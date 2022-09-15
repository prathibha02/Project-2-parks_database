-- National Parks and Trails to visit based on Ideal Weather Condition
SELECT n.park_code,n.park_name,t.trail FROM weather_data 
AS w JOIN national_parks AS n ON w.park_code = n.park_code 
JOIN alltrails AS t on n.park_code=t.park_code 
WHERE w.Min_Temp>70 AND w.Max_Temp<80 AND w.Cloudiness=0 AND n.num_of_trails>0;

-- Display trails from the National Park with the highest avg_difficulty, there is only one trail
SELECT t.trail,t.park_code,n.park_name,t.length,t.elevation_gain 
FROM alltrails AS t 
JOIN national_parks AS n ON t.park_code = n.park_code 
WHERE n.avg_difficulty = (SELECT max(avg_difficulty) FROM national_parks);
						  				  
-- Display top 10 most popular trails
SELECT trail,area_name,popularity 
FROM alltrails
LIMIT 10;
						  
-- Display top 10 highest rated trails
SELECT t.trail,t.park_code,n.park_name,t.length,t.elevation_gain,t.avg_rating 
FROM alltrails AS t 
JOIN national_parks AS n ON t.park_code = n.park_code 
WHERE t.avg_rating >4 
ORDER BY t.avg_rating DESC
LIMIT 10;

-- Ideal less 60 degrees, easy trails
SELECT t.trail,t.park_code,n.park_name,n.avg_difficulty 
FROM alltrails
AS t JOIN national_parks AS n ON t.park_code = n.park_code
JOIN weather_data AS w ON n.park_code=w.park_code
WHERE n.avg_difficulty < 2.5 AND w.min_temp < 60;

-- Top 10 Highest Elevation Gain
SELECT t.trail,t.park_code,n.park_name,t.length,t.elevation_gain,t.avg_rating 
FROM alltrails
AS t JOIN national_parks AS n ON t.park_code = n.park_code
ORDER BY t.elevation_gain DESC LIMIT 10;

-- Average Elevation Gain by State
SELECT n.state,avg(t.length) "Average Length",AVG(t.elevation_gain) "Average Elevation Gain" FROM alltrails 
AS t JOIN national_parks AS n ON t.park_code = n.park_code 
GROUP BY n.state
ORDER BY avg(t.elevation_gain) DESC LIMIT 10;

-- Average Length and Average Elevation across All Trails
SELECT 'Average Across All Trails' as "Description", 
AVG(t.length) as "Average Length",
AVG(t.elevation_gain) AS "Average Elevation Gain" 
FROM alltrails AS t JOIN national_parks AS n ON t.park_code = n.park_code;
