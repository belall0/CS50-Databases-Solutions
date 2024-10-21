SELECT strftime('%Y',"air_date") AS "Year", strftime('%m-%d',"air_date") AS "month-day"
FROM "episodes"
WHERE "episode_in_season" = 1;


-- anther solution (assuming there's no episode_in_season column in the table)
SELECT MIN("air_date") AS "first_date", strftime('%Y',"air_date") AS "year",  strftime('%m-%d',"air_date") AS "Month - Year"
FROM "episodes"
GROUP BY strftime('%Y',"air_date")