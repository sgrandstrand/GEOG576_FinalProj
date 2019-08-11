
-- import made up data for status reports on report table. USE YOUR PATH. 

\COPY report (first_name, last_name, trail_ID, date_, email, message) FROM '/Users/sarah/Documents/GEOG576/FInalProj/GEOG576_FinalProj/Data/dummystatus1.csv' WITH (FORMAT CSV, HEADER);

-- import made up data for status reports. USE OWN PATH
-- If you get an error check the report_num value, could be different

\COPY status_report (report_num, condition_type) FROM '/Users/sarah/Documents/GEOG576/FInalProj/GEOG576_FinalProj/Data/dummystatusreport.csv' WITH (FORMAT CSV, HEADER);

-- need to add latigude and longitude columns to report table in order to insert damage data points

ALTER TABLE report ADD COLUMN latitude double precision;
ALTER TABLE report ADD COLUMN longitude double precision;

-- import made up data for damage reports on report table. USE YOUR PATH. 

\COPY report (first_name, last_name, trail_ID, date_, email, message, latitude, longitude) FROM '/Users/sarah/Documents/GEOG576/FInalProj/GEOG576_FinalProj/Data/dummydamage1.csv' WITH (FORMAT CSV, HEADER);

-- create point data from latitude and longitude values
UPDATE report
SET geom = ST_GeomFromText('POINT(' || longitude || ' ' || latitude || ')',4326);


-- input values for damage_report. USE OWN PATH
-- If you get an error check the report_num value, could be different

\COPY damage_report (report_num, damage_type) FROM '/Users/sarah/Documents/GEOG576/FInalProj/GEOG576_FinalProj/Data/dummydamagereport.csv' WITH (FORMAT CSV, HEADER);