
-- use to import made up data for status's on trails. USE YOUR PATH. 
-- note we do not need to add a geom here

\COPY report (first_name, last_name, trail_ID, date_, email, message) FROM '/Users/sarah/Documents/GEOG576/FInalProj/GEOG576_FinalProj/Data/dummystatus1.csv' WITH (FORMAT CSV, HEADER);

-- use to import made up data for status reports on trails. USE OWN PATH

\COPY status_report (report_num, condition_type) FROM '/Users/sarah/Documents/GEOG576/FInalProj/GEOG576_FinalProj/Data/dummystatusreport.csv' WITH (FORMAT CSV, HEADER);