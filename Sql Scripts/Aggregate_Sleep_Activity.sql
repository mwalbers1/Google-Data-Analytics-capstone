-- Aggregate_Sleep_Activity.sql
--

-- Calculate average number of hours of sleep for each day of the week
SELECT DATE_PART('DAY', "SLEEP_DAY"),
    AVG("TOTAL_MINUTES_ASLEEP") / 60 AS AVERAGE_SLEEP_HOURS
FROM public."SLEEP_DAY_LOG"
GROUP BY DATE_PART('DAY', "SLEEP_DAY")
ORDER BY DATE_PART('DAY', "SLEEP_DAY")

-- TODO:
-- sum sleep records for each day by id and add week day column
-- total sleep by day and member
-- then join to DAILY_ACTIVITY table
