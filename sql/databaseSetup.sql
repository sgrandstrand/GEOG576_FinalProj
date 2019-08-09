-- SQL of a database design for trail status and damage reports for MORE bike trails as part of GEOG576's final project  

-- open SQL shell (psql)
-- find database
\l

-- connect to database previously created in pgAdmin (named trailmaint)
\connect trailmaint

-- create enums 

CREATE TYPE condition_ AS ENUM ('dry','damp','wet');
CREATE TYPE damage AS ENUM ('down tree/brush', 'bridge', 'standing water','erosion/holes/ruts','trash','other');
CREATE TYPE report_intent AS ENUM ('status', 'damage');
CREATE TYPE difficulty AS ENUM ('green', 'green to blue', 'green to black','blue','blue to black','black');

-- create tables for report, trail, status report, damage report, county and state

CREATE TABLE state (name varchar(64), abbrev char(2));

CREATE TABLE county (name varchar(64), state varchar REFERENCES state (state_name));

CREATE TABLE trail (name varchar(64) NOT NULL, county varchar REFERENCES county (cnty_name), state varchar REFERENCES state(name), mileage FLOAT(8), condition_status condition_, difficulty_level difficulty, email varchar(128), website varchar(255), geom geometry(Point, 4326));

CREATE TABLE report (id BIGSERIAL PRIMARY KEY, first_name varchar(64),last_name varchar(64), trail_name varchar REFERENCES trail (name), date_ date, email varchar(128), time_stamp TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(), geom geometry(Point, 4326), message varchar(255));

CREATE TABLE status_report (report_num INT REFERENCES report (id), condition_type condition_);

CREATE TABLE damage_report (report_num INT REFERENCES report (id), damage_type damage);