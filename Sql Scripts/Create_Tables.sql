
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
