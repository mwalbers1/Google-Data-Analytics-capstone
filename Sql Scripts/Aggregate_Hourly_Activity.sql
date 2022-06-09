-- Aggregate intensity, steps, and calories by the hour
--
SELECT DATE_PART('HOUR', "ACTIVITY_HOUR"), 
	SUM("CALORIES") AS CALORIES,
	SUM("STEP_TOTAL") AS STEP_TOTAL,
	SUM("TOTAL_INTENSITY") AS TOTAL_INTENSITY
FROM "HOURLY_ACTIVITY"
GROUP BY DATE_PART('HOUR', "ACTIVITY_HOUR")
ORDER BY  DATE_PART('HOUR', "ACTIVITY_HOUR");

