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