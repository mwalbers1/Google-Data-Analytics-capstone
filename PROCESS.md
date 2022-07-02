## PROCESS Phase

In this phase, the raw fitness data files will be loaded into a new Postgres database.  The instructions for setting up a local Postgres database are at <a href="Docker%20PostgreSQL%20Database%20Setup.md" target="_blank">Docker Postgres Database Setup</a>


### Database Schema

![](resources/Fitness%20Tracker%20Database.drawio.png)

### Load fitness data

The raw fitness CSV data files are imported into the PostgreSQL database tables.  A SQL query is executed to populate the **Hourly_Activity** table.

```sql
INSERT INTO public."HOURLY_ACTIVITY"(
	"ID", 
	"ACTIVITY_HOUR", 
	"CALORIES", 
	"STEP_TOTAL", 
	"TOTAL_INTENSITY", 
	"AVERAGE_INTENSITY")
SELECT HC."ID", 
	HC."ACTIVITY_HOUR", 
	COALESCE(HC."CALORIES", 0),
	COALESCE(HS."STEP_TOTAL", 0), 
	COALESCE(HI."TOTAL_INTENSITY", 0), 
	COALESCE(HI."AVERAGE_INTENSITY", 0)
FROM "HOURLY_CALORIES" AS HC
INNER JOIN "HOURLY_INTENSITY" AS HI ON HI."ID" = HC."ID"
	AND HI."ACTIVITY_HOUR" = HC."ACTIVITY_HOUR"
INNER JOIN "HOURLY_STEPS" AS HS ON HS."ID" = HC."ID"
	AND HS."ACTIVITY_HOUR" = HC."ACTIVITY_HOUR";
```


### Database Queries

Once the database is created and the tables are populated with the fitness data, then SQL queries are executed to extract and aggregate the fitness data from the Postgres database. The output of each SQL query will get exported to CSV files. 

The CSV files will then be analyzed with Microsoft Excel in the Analysis phase. The SQL queries are at this folder: <a href="https://github.com/mwalbers1/Google-Data-Analytics-capstone/tree/main/Sql%20Scripts" target="_blank">SQL Scripts</a>.


#### SQL Queries for Daily Activity

The following SQL query returns the Daily Activity records for each fitness user for each day.  There are two calculated columns in the query for sedentary and active hours.

```sql
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
FROM public."DAILY_ACTIVITY";
```
<br/>
<a href="https://github.com/mwalbers1/Google-Data-Analytics-capstone/blob/main/ANALYZE.md" target="_blank">Click here to goto ANALYZE Phase</a>



