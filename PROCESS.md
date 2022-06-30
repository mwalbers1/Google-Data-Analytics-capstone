## PROCESS Phase

In this phase the CSV files will be loaded into a new Postgres database.  The instructions for setting up a local Postgres database are at <a href="Docker%20PostgreSQL%20Database%20Setup.md" target="_blank">Docker Postgres Database Setup</a>

### Database Schema

![](resources/Fitness%20Tracker%20Database.drawio.png)

### Database Queries

SQL queries are used to aggregate the hourly and minute fitness data. The output of each SQL query will get exported to CSV files. The CSV files will then be analyzed with Microsoft Excel in the Analysis phase. The SQL queries are at this folder: <a href="https://github.com/mwalbers1/Google-Data-Analytics-capstone/tree/main/Sql%20Scripts" target="_blank">SQL Scripts</a>.

#### SQL Queries for aggregating Hourly activity

The fitness steps and intensity data will be aggregated by hour of the day in order to analyze which hour(s) of the day are busiest and less frequent in terms of fitness activity.

SQL queries will be written to aggregate hourly sedentary activity.  This will determine which hours of day fitness members are most sedentary.

#### SQL Queries for aggregating Daily activity

This group of SQL queries will aggregate sleep minutes for each day as a daily sleep average. This will tell us on average which days of the week fitness members sleep the most and least amount of time.

SQL queries will also aggregate sedentary activity by the day of week.  This will help analyze which days of the week have higher sedentary minutes.  Then daily sedentary activity will be analyzed against daily sleep activity to determine whether there is a connection between sleep and sedentary activity levels.

SQL queries will report daily activity and sleep activity for analysis.

