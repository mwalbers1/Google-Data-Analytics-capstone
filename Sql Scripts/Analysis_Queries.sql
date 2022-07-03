-- High Sedentary Hours Query
SELECT "ID", 
		"ACTIVITY_DATE", 
		"TOTAL_STEPS", 
		"TOTAL_DISTANCE", 
		"TRACKER_DISTANCE", 
		"LOGGED_ACTIVITIES_DISTANCE", 
		"VERY_ACTIVE_DISTANCE", 
		"MODERATELY_ACTIVE_DISTANCE", 
		"LIGHT_ACTIVE_DISTANCE", 
		"SEDENTARY_ACTIVE_DISTANCE", 
		"VERY_ACTIVE_MINUTES", 
		"FAIRLY_ACTIVE_MINUTES", 
		"LIGHTLY_ACTIVE_MINUTES", 
		"SEDENTARY_MINUTES", 
		"CALORIES",
		"SEDENTARY_MINUTES"/60 AS "SEDENTARY_HOURS",
		("VERY_ACTIVE_MINUTES" + "FAIRLY_ACTIVE_MINUTES" + "LIGHTLY_ACTIVE_MINUTES") / 60 AS "ACTIVE_HOURS"
FROM public."DAILY_ACTIVITY"
WHERE "SEDENTARY_MINUTES"/60 >= 16;

-- Low Activity Hours Query
SELECT "ID", 
		"ACTIVITY_DATE", 
		"TOTAL_STEPS", 
		"TOTAL_DISTANCE", 
		"TRACKER_DISTANCE", 
		"LOGGED_ACTIVITIES_DISTANCE", 
		"VERY_ACTIVE_DISTANCE", 
		"MODERATELY_ACTIVE_DISTANCE", 
		"LIGHT_ACTIVE_DISTANCE", 
		"SEDENTARY_ACTIVE_DISTANCE", 
		"VERY_ACTIVE_MINUTES", 
		"FAIRLY_ACTIVE_MINUTES", 
		"LIGHTLY_ACTIVE_MINUTES", 
		"SEDENTARY_MINUTES", 
		"CALORIES",
		"SEDENTARY_MINUTES"/60 AS "SEDENTARY_HOURS",
		("VERY_ACTIVE_MINUTES" + "FAIRLY_ACTIVE_MINUTES" + "LIGHTLY_ACTIVE_MINUTES") / 60 AS "ACTIVE_HOURS"
FROM public."DAILY_ACTIVITY"
WHERE ("VERY_ACTIVE_MINUTES" + "FAIRLY_ACTIVE_MINUTES" + "LIGHTLY_ACTIVE_MINUTES") / 60 <= 1;

WITH cte_daily_activity AS (
	SELECT "ID", 
		"ACTIVITY_DATE", 
		"TOTAL_STEPS", 
		"TOTAL_DISTANCE", 
		"TRACKER_DISTANCE", 
		"LOGGED_ACTIVITIES_DISTANCE", 
		"VERY_ACTIVE_DISTANCE", 
		"MODERATELY_ACTIVE_DISTANCE", 
		"LIGHT_ACTIVE_DISTANCE", 
		"SEDENTARY_ACTIVE_DISTANCE", 
		"VERY_ACTIVE_MINUTES", 
		"FAIRLY_ACTIVE_MINUTES", 
		"LIGHTLY_ACTIVE_MINUTES", 
		"SEDENTARY_MINUTES", 
		"CALORIES",
		"SEDENTARY_MINUTES"/60 AS "SEDENTARY_HOURS",
		("VERY_ACTIVE_MINUTES" + "FAIRLY_ACTIVE_MINUTES" + "LIGHTLY_ACTIVE_MINUTES") / 60 AS "ACTIVE_HOURS"
FROM public."DAILY_ACTIVITY"    
)
SELECT S."ID",
		S."ACTIVITY_DATE",
		S."TOTAL_STEPS", 
		S."TOTAL_DISTANCE", 
		S."TRACKER_DISTANCE", 
		S."LOGGED_ACTIVITIES_DISTANCE", 
		S."VERY_ACTIVE_DISTANCE", 
		S."MODERATELY_ACTIVE_DISTANCE", 
		S."LIGHT_ACTIVE_DISTANCE", 
		S."SEDENTARY_ACTIVE_DISTANCE", 
		S."VERY_ACTIVE_MINUTES", 
		S."FAIRLY_ACTIVE_MINUTES", 
		S."LIGHTLY_ACTIVE_MINUTES", 
		S."SEDENTARY_MINUTES", 
		S."CALORIES",
		S."SEDENTARY_HOURS",
		S."ACTIVE_HOURS"
FROM cte_daily_activity S
INNER JOIN (
	SELECT "ID",
		"ACTIVITY_DATE",
		"SEDENTARY_HOURS",
		"ACTIVE_HOURS"
	FROM cte_daily_activity
	WHERE "ACTIVE_HOURS" <= 1
	) S2 ON S."ID" = S2."ID" AND S."ACTIVITY_DATE" = S2."ACTIVITY_DATE"
WHERE S."SEDENTARY_HOURS" >= 16;