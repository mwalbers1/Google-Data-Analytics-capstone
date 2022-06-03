
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

GO

