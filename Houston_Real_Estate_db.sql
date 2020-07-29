DROP TABLE real_acct;
drop table sq_ft;
drop TABLE neighborhoods 


-- Create tables for raw data to be loaded into
CREATE TABLE real_acct (
	id serial primary key,
	ACCOUNT BIGINT,
	TAX_YEAR INT,
	SITE_ADDR_1 varchar(300),
	SITE_ADDR_2 varchar(100),
	SITE_ADDR_3 varchar(300),
	STATE_CLASS varchar(10),
	NEIGHBORHOOD_CODE NUMERIC,
	NEIGHBORHOOD_GROUP INT,
	ACREAGE NUMERIC,
	TOTAL_APPRAISED_VALUE NUMERIC
);

CREATE TABLE sq_ft (
	id serial primary key,
	account bigint,
	sq_ft numeric);

CREATE TABLE neighborhoods (
	id serial primary key,
	neighborhood_code numeric,
	neighborhood_group numeric,
	neighborhood varchar(300));

