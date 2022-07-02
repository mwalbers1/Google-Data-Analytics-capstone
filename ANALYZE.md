## Analyze Phase

The daily activity data from the Postgres database was extracted into a CSV file which was then loaded into an Excel workbook.  In Excel, a pivot table was created from the daily activity data and several Excel charts were created to draw additional insights from the data. 

### Daily Activity Excel Workbook

The Excel workbook for analysis of daily fitness activity is called <a href="https://github.com/mwalbers1/Google-Data-Analytics-capstone/blob/main/Excel/Analysis_of_Daily_Activity.xlsx" target="_blank">Analysis_of_Daily_Activity.xlsx</a>

#### Sedentary v. Activity Hours

Analysis of daily activity hours compared to daily sedentary hours

![](resources/Activity%20Hours%20Histogram.png)

The above histogram reveals that most fitness users are active between 2 to 6 hours per day.  There are close to 200 fitness users who were only active one or less hours on at least one day. A future SQL query can be used to analyze this group of fitness users


![](resources/Sedentary%20Hours%20Histogram.png)


The above histogram shows that most fitness users are sedentary between eight and twenty four hours a day.  There are approximately 500 fitness users who were sedentary for at least sixteen hours for one or more days which is concerning since this does not allow for much daily exercise and sleep.


![](resources/Sedentary%20and%20Active%20Daily%20Averages.png)

The combined bar and line chart above shows that Activity and Sedentary daily average hours follow a similar trend Sunday through Friday.  On Saturdays, fitness users experience an increase in activity while they are less sedentary.

#### High Sedentary Hours

This SQL query will target fitness members who logged days of high sedentary hours.  The output will be saved to a CSV file for the Share phase.

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
FROM public."DAILY_ACTIVITY"
WHERE "SEDENTARY_MINUTES"/60 >= 16;
```

### Low Activity Hours

This SQL query returns fitness members who had days of extreme low activity.  The output will be saved to a CSV file for the Share phase.

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
FROM public."DAILY_ACTIVITY"
WHERE ("VERY_ACTIVE_MINUTES" + "FAIRLY_ACTIVE_MINUTES" + "LIGHTLY_ACTIVE_MINUTES") / 60 <= 1;
```


#### Less Active and High Sedentary members

The histogram of Activity hours revealed a large number of members who are active between zero and one hour on a particular day.  The second histogram shows a lot of fitness members who had high levels of sedentary activity. It is possible that some of the high sedentary members maintained their fitness routines on the days they logged high sedentary activity.

The low activity members may have low sedentary hours and enough sleep. So a SQL query will need to extract fitness members who logged **both** low activity and high sedentary hours. This group of members may exhibit health risks or they may choose to leave the application altogether. The SQL query below will return these particular fitness members and the output will be saved to a CSV file for the Share phase.











