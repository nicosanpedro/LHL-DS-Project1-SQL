--DROP TABLE sales_report;

--RAW SALES REPORT
SELECT *
FROM raw_sales_report;

--------------------------------------------------------------------------------
--SALES REPOR TABLE
--------------------------------------------------------------------------------
CREATE TABLE sales_report(
	productsku VARCHAR,
	totalordered VARCHAR,
	prodname VARCHAR,
	stocklevel VARCHAR,
	restockingleadtime VARCHAR,
	sentimentscore VARCHAR,
	sentimentmagnitude VARCHAR,
	ratio VARCHAR
);

--------------------------------------------------------------------------------
--INSERTING RAW TABLE
--------------------------------------------------------------------------------
INSERT INTO sales_report
SELECT *
FROM raw_sales_report
OFFSET 1; --OFFSET 1 ROW

--------------------------------------------------------------------------------
--ALTERING TABLE DATATYPE
--------------------------------------------------------------------------------
ALTER TABLE sales_report
ALTER COLUMN productsku TYPE VARCHAR,
ALTER COLUMN totalordered TYPE NUMERIC USING totalordered :: NUMERIC,
ALTER COLUMN prodname TYPE VARCHAR,
ALTER COLUMN stocklevel TYPE NUMERIC USING stocklevel :: NUMERIC,
ALTER COLUMN restockingleadtime TYPE NUMERIC USING restockingleadtime :: NUMERIC,
ALTER COLUMN sentimentscore TYPE NUMERIC USING sentimentscore :: NUMERIC,
ALTER COLUMN sentimentmagnitude TYPE NUMERIC USING sentimentmagnitude :: NUMERIC,
ALTER COLUMN ratio TYPE NUMERIC USING ratio :: NUMERIC;



--------------------------------------------------------------------------------
--CREATING PRIMARY KEYS
--------------------------------------------------------------------------------
-- SALES REPORT PK
ALTER TABLE sales_report
ADD COLUMN reportid VARCHAR,
ADD COLUMN reportnum SERIAL,
ADD COLUMN reporttext VARCHAR DEFAULT 'R';

UPDATE sales_report
SET reportid = reporttext || reportnum :: VARCHAR;

ALTER TABLE sales_report
DROP COLUMN reportnum,
DROP COLUMN reporttext,
ADD PRIMARY KEY(reportid);
