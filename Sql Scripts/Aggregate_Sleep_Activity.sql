-- Aggregate_Sleep_Activity.sql
--

-- Hours of sleep for each user by day
SELECT "ID",
	"SLEEP_DAY",
	"TOTAL_MINUTES_ASLEEP"/60 AS SLEEP_HOURS
FROM public."SLEEP_DAY_LOG";
