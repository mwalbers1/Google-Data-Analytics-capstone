## PostgreSQL Database Setup with Docker 

### Docker Setup

1 - Download and install Docker Desktop from [Docker website](www.docker.com) 

2 - On Home page of Docker, click on the Postgres latest image

3 - Copy the connection string into clipboard

### Connect pgAdmin to Docker Postgres Database server

1 - Download and install pgAdmin from <a href="https://www.pgadmin.org/download/" target="_blank">https://www.pgadmin.org/download/</a>

2 - In pgAdmin Browser in left pane, right click servers and select Create Server

3 - Enter a name for server in first tab

4 - In connection tab, enter connection properties from the connection string that was copied to the clipboard

5 - Click Save button


### Import CSV file into database table

#### 1 - Create a new table in your database.  An example create statement is below.

```sql
CREATE TABLE IF NOT EXISTS public."WEIGHT_LOG_INFO"
(
    "ID" bigint,
    "DATE" date,
    "WEIGHT_KG" numeric(8,2),
    "WEIGHT_LBS" numeric(8,2),
    "FAT" character varying COLLATE pg_catalog."default",
    "BMI" numeric(8,2),
    "IS_MANUAL" boolean,
    "LOG_ID" bigint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."WEIGHT_LOG_INFO"
    OWNER to postgres;
```



#### 2 - In pgAdmin, select Import/Export from the menu. See screen shot below for importing CSV file

![](resources/pgAdmin_import_csv_file.png)
