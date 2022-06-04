
-- Table: WEIGHT_LOG_INFO

-- DROP TABLE IF EXISTS public."WEIGHT_LOG_INFO";

CREATE TABLE IF NOT EXISTS public."WEIGHT_LOG_INFO"
(
    "ID" bigint,
    "DATE" timestamp,
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


-- DROP TABLE IF EXISTS public."SLEEP_DAY_LOG";

CREATE TABLE IF NOT EXISTS public."SLEEP_DAY_LOG"
(
    "ID" bigint,
    "SLEEP_DAY" timestamp,
    "TOTAL_SLEEP_RECORDS" integer,
    "TOTAL_MINUTES_ASLEEP" integer,
    "TOTAL_TIME_IN_BED" integer
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."SLEEP_DAY_LOG"
    OWNER to postgres;


-- DROP TABLE IF EXISTS public."DAILY_ACTIVITY";

CREATE TABLE IF NOT EXISTS public."DAILY_ACTIVITY"
(
  "ID" bigint,
  "ACTIVITY_DATE" timestamp,
  "TOTAL_STEPS" integer,
  "TOTAL_DISTANCE" numeric(10,6),
  "TRACKER_DISTANCE" numeric(10,6),
  "LOGGED_ACTIVITIES_DISTANCE" numeric(10,6),
  "VERY_ACTIVE_DISTANCE" numeric(10,6),
  "MODERATELY_ACTIVE_DISTANCE" numeric(10,6),
  "LIGHT_ACTIVE_DISTANCE" numeric(10,6),
  "SEDENTARY_ACTIVE_DISTANCE" numeric(10,6),
  "VERY_ACTIVE_MINUTES" integer,
  "FAIRLY_ACTIVE_MINUTES" integer,
  "LIGHTLY_ACTIVE_MINUTES" integer,
  "SEDENTARY_MINUTES" integer,
  "CALORIES" integer
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."DAILY_ACTIVITY"
    OWNER to postgres;

-- DROP TABLE IF EXISTS public."DAILY_CALORIES";

CREATE TABLE IF NOT EXISTS public."DAILY_CALORIES"
(
  "ID" bigint,
  "ACTIVITY_DATE" date,
  "CALORIES" integer
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."DAILY_CALORIES"
    OWNER to postgres;


-- DROP TABLE IF EXISTS public."DAILY_STEPS";

CREATE TABLE IF NOT EXISTS public."DAILY_STEPS"
(
  "ID" bigint,
  "ACTIVITY_DATE" date,
  "STEP_TOTAL" integer
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."DAILY_STEPS"
    OWNER to postgres;


-- DROP TABLE IF EXISTS public."HEART_RATE_SECONDS";

CREATE TABLE IF NOT EXISTS public."HEART_RATE_SECONDS"
(
    "ID" bigint,
    "TIME" timestamp,
    "VALUE" integer
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."HEART_RATE_SECONDS"
    OWNER to postgres;

-- DROP TABLE IF EXISTS public."HOURLY_CALORIES";

CREATE TABLE IF NOT EXISTS public."HOURLY_CALORIES"
(
  "ID" bigint,
  "ACTIVITY_HOUR" timestamp,
  "CALORIES" integer
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."HOURLY_CALORIES"
    OWNER to postgres;


-- DROP TABLE IF EXISTS public."HOURLY_INTENSITY";

CREATE TABLE IF NOT EXISTS public."HOURLY_INTENSITY"
(
  "ID" bigint,
  "ACTIVITY_HOUR" timestamp,
  "TOTAL_INTENSITY" integer,
  "AVERAGE_INTENSITY" numeric(10,6)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."HOURLY_INTENSITY"
    OWNER to postgres;


-- DROP TABLE IF EXISTS public."HOURLY_STEPS";

CREATE TABLE IF NOT EXISTS public."HOURLY_STEPS"
(
  "ID" bigint,
  "ACTIVITY_HOUR" timestamp,
  "STEP_TOTAL" integer

)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."HOURLY_STEPS"
    OWNER to postgres;


-- DROP TABLE IF EXISTS public."MINUTE_METS";

CREATE TABLE IF NOT EXISTS public."MINUTE_METS"
(
    "ID"  bigint,
    "ACTIVITY_MINUTE" timestamp,
    "METS" integer
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."MINUTE_METS"
    OWNER to postgres;
