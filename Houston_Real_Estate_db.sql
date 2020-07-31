DROP TABLE real_acct;
drop table tax_year_2019;
drop table tax_year_2018;
drop table sq_ft;
drop TABLE neighborhoods ;


-- Create tables for raw data to be loaded into
CREATE TABLE real_acct (
	id serial primary key,
	ACCOUNT BIGINT,
	TAX_YEAR INT,
	full_addr varchar(300),
	SITE_ADDR_3 numeric,
	STATE_CLASS varchar(10),
	NEIGHBORHOOD_CODE NUMERIC,
	NEIGHBORHOOD_GROUP INT,
	ACREAGE NUMERIC,
	NEW_OWNER_DATE DATE
);

CREATE TABLE tax_year_2018 (
	id serial primary key,
	account bigint,
	land_value numeric,
	total_appraised_value numeric,
	total_market_value numeric);
	
CREATE TABLE tax_year_2019 (
	id serial primary key,
	account bigint,
	land_value numeric,
	total_appraised_value numeric,
	total_market_value numeric);

CREATE TABLE sq_ft (
	id serial primary key,
	account bigint,
	sq_ft numeric);

CREATE TABLE neighborhoods (
	id serial primary key,
	neighborhood_code numeric,
	neighborhood_group numeric,
	neighborhood varchar(300));
