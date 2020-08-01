-- Houston Real Estate SQL

-- Drop tables if they exist
DROP TABLE IF EXISTS "crime";
DROP TABLE IF EXISTS "properties";
DROP TABLE IF EXISTS "zip_code";
DROP TABLE IF EXISTS "flood_zone";
DROP TABLE IF EXISTS "appraisal";
DROP TABLE IF EXISTS "neighborhoods";
DROP TABLE IF EXISTS "school";
DROP TABLE IF EXISTS "school_district";


-- Create tables

CREATE TABLE "school_district" (
    "district_id" INT   NOT NULL,
    "district_name" TEXT   NOT NULL,
    CONSTRAINT "pk_school_district" PRIMARY KEY (
        "district_id"
     )
);

CREATE TABLE "school" (
    "school_id" INT   NOT NULL,
    "school_type" TEXT   NOT NULL,
    "name" TEXT   NOT NULL,
    "address" TEXT   NOT NULL,
    "city" TEXT   NOT NULL,
    "zip_code" VARCHAR(5)   NOT NULL,
    "district_id" INT   NOT NULL,
    "latitude" NUMERIC   NOT NULL,
    "longitude" NUMERIC   NOT NULL,
    "school_rating" INT   NOT NULL,
    CONSTRAINT "pk_school" PRIMARY KEY (
        "school_id","school_type"
     )
);

CREATE TABLE "flood_zone" (
    "Flood_Description" TEXT   NOT NULL,
    "Flood_Zone" VARCHAR(2)   NOT NULL,
    CONSTRAINT "pk_flood_zone" PRIMARY KEY (
        "Flood_Description"
     )
);

CREATE TABLE "zip_code" (
    "zip_code" INT   NOT NULL,
    CONSTRAINT "pk_zip_code" PRIMARY KEY (
        "zip_code"
     )
);

CREATE TABLE "properties" (
    "id" SERIAL   NOT NULL,
    "account" BIGINT   NOT NULL,
    "latitude" NUMERIC   NOT NULL,
    "longitude" NUMERIC   NOT NULL,
    "address" VARCHAR(300)   NOT NULL,
    "zip_code" INT   NOT NULL,
    "neighborhood_code" NUMERIC   NOT NULL,
    "acreage" NUMERIC   NOT NULL,
    "new_owner_date" DATE   NOT NULL,
    "sq_ft" NUMERIC   NOT NULL,
    "school_id" INT   NOT NULL,
    "school_type" TEXT   NOT NULL,
    "flood_description" TEXT   NOT NULL,
    CONSTRAINT "pk_properties" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "neighborhoods" (
    "neighborhood_code" NUMERIC   NOT NULL,
    "neighborhood" VARCHAR(300)   NOT NULL,
    CONSTRAINT "pk_neighborhoods" PRIMARY KEY (
        "neighborhood_code"
     )
);

CREATE TABLE "appraisal" (
    "account" BIGINT   NOT NULL,
    "land_value" NUMERIC   NOT NULL,
    "total_appraised_value" NUMERIC   NOT NULL,
    "total_market_value" NUMERIC   NOT NULL,
    "tax_year" INT   NOT NULL,
    CONSTRAINT "pk_appraisal" PRIMARY KEY (
        "account"
     )
);

CREATE TABLE "crime" (
    "id" SERIAL NOT NULL,
    "Incident" INT,
    "Date" DATE,
    "Hour" INT,
    "NIBRS_Class" VARCHAR(100),
    "NIBRS_Description" VARCHAR(100),
    "Offense_Count" INT,
    "Premise" VARCHAR(100),
    "Block_Range" VARCHAR(20),
    "Street_Name" VARCHAR(50),
    "Street_Type" VARCHAR(10),
    "City" VARCHAR(50),
    "Zip_Code" INT   NOT NULL,
    CONSTRAINT "pk_crime" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "school" ADD CONSTRAINT "fk_school_district_id" FOREIGN KEY("district_id")
REFERENCES "school_district" ("district_id");

ALTER TABLE "properties" ADD CONSTRAINT "fk_properties_account" FOREIGN KEY("account")
REFERENCES "appraisal" ("account");

ALTER TABLE "properties" ADD CONSTRAINT "fk_properties_zip_code" FOREIGN KEY("zip_code")
REFERENCES "zip_code" ("zip_code");

ALTER TABLE "properties" ADD CONSTRAINT "fk_properties_neighborhood_code" FOREIGN KEY("neighborhood_code")
REFERENCES "neighborhoods" ("neighborhood_code");

ALTER TABLE "properties" ADD CONSTRAINT "fk_properties_school_id_school_type" FOREIGN KEY("school_id", "school_type")
REFERENCES "school" ("school_id", "school_type");

ALTER TABLE "properties" ADD CONSTRAINT "fk_properties_flood_description" FOREIGN KEY("flood_description")
REFERENCES "flood_zone" ("Flood_Description");

ALTER TABLE "crime" ADD CONSTRAINT "fk_crime_Zip_Code" FOREIGN KEY("Zip_Code")
REFERENCES "zip_code" ("zip_code");

