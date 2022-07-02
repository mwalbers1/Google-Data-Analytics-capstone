## Analyze Phase

The daily activity data from the Postgres database was extracted into a CSV file which was then loaded into an Excel workbook.  In Excel, a pivot table was created from the daily activity data and several Excel charts were created to draw additional insights from the data. 

### Daily Activity Excel Workbook

The Excel workbook for analysis of daily fitness activity is called <a href="https://github.com/mwalbers1/Google-Data-Analytics-capstone/blob/main/Excel/Analysis_of_Daily_Activity.xlsx" target="_blank">Analysis_of_Daily_Activity.xlsx</a>

#### Sedentary v. Activity Hours

Analysis of daily activity hours compared to daily sedentary hours

![](resources/Activity%20Hours%20Histogram.png)

The above histogram reveals that most fitness users are active between 2 to 6 hours per day.  There are close to 200 fitness users who are only active one or less hours per day. A future SQL query can be used to analyze this group of fitness users


![](resources/Sedentary%20Hours%20Histogram.png)


The above histogram shows that most fitness users are sedentary between eight and twenty four hours a day.  There are approximately 500 fitness users who are sedentary for at least sixteen hours a day which is concerning since this does not allow for much daily exercise and sleep.


![](resources/Sedentary%20and%20Active%20Daily%20Averages.png)

The combined bar and line chart above shows that Activity and Sedentary daily average hours follow a similar trend Sunday through Friday.  On Saturdays, fitness users experience an increase in activity while they are less sedentary.

#### Less Active members

The histogram of Activity hours revealed a large number of members who are only active between zero and one hour a day.  A SQL query will be written to extract these fitness member records from the database for further analysis


#### Overly Sedentary members

A SQL query will be run to return fitness users whose sedentary activity far exceeds the daily average.  These particular members may be at risk of increased stress and may be experiencing less exercise and sleep.






