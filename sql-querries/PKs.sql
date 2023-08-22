--------------------------------------------------------------------------------
--CREATING PRIMARY KEYS
--------------------------------------------------------------------------------

--1. ALL SESSIONS PK
ALTER TABLE all_sessions
ADD COLUMN sessionid VARCHAR,
ADD COLUMN sessionnum SERIAL,
ADD COLUMN sessiontext VARCHAR DEFAULT 'S';

UPDATE all_sessions
SET sessionid = sessiontext || sessionnum :: VARCHAR;

ALTER TABLE all_sessions
DROP COLUMN sessionnum,
DROP COLUMN sessiontext,
ADD PRIMARY KEY(sessionid);


--2. ANALYTICS PK
ALTER TABLE analytics
ADD COLUMN analyticsid VARCHAR,
ADD COLUMN analyticsnum SERIAL,
ADD COLUMN analyticstext VARCHAR DEFAULT 'A';

UPDATE analytics
SET analyticsid = analyticstext || analyticsnum :: VARCHAR;

ALTER TABLE analytics
DROP COLUMN analyticsnum,
DROP COLUMN analyticstext,
ADD PRIMARY KEY(analyticsid);


--3. SALES REPORT PK
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

--4. SKU SALES PK
ALTER TABLE sku_sales
ADD COLUMN salesid VARCHAR,
ADD COLUMN salesnum SERIAL,
ADD COLUMN salestext VARCHAR DEFAULT 'SA';

UPDATE sku_sales
SET salesid = salestext || salesnum :: VARCHAR;

ALTER TABLE sku_sales
DROP COLUMN salesnum,
DROP COLUMN salestext,
ADD PRIMARY KEY(salesid);


--------------------------------------------------------------------------------
--CREATING FOREIGN KEYS
--------------------------------------------------------------------------------

--1. ALL SESSIONS FK
ALTER TABLE all_sessions
ADD CONSTRAINT fk_prodsku_as
	FOREIGN KEY(productsku) REFERENCES products(sku);

--2. ANALYTICS FK


--3. SALES REPORT FK
ALTER TABLE sales_report 
ADD CONSTRAINT fk_prodsku_sr 
	FOREIGN KEY(productsku) REFERENCES products(sku);


--4. SKU SALES FK
ALTER TABLE sku_sales 
ADD CONSTRAINT fk_prodsku_ss
	FOREIGN KEY(productsku) REFERENCES products(sku);


--5. PRODUCTS FK