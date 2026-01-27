SELECT * FROM chicago_city_crime_incidents;

--query to find the total number of crime records in the dataset.
SELECT COUNT(*) FROM chicago_city_crime_incidents;

--Data cleaning, i.e., removing redundant column location
ALTER TABLE chicago_city_crime_incidents DROP COLUMN "LOCATION";

--Finding the number of crimes by their primary_type ordered in decreasing order
SELECT "PRIMARY_TYPE", COUNT("ID") AS incident_id FROM chicago_city_crime_incidents GROUP BY "PRIMARY_TYPE" ORDER BY incident_id;

-- Get the crimes where arrest = true, order the data as per year in increasing order.
SELECT "ID", "CASE_NUMBER", "DATE", "PRIMARY_TYPE", "LOCATION_DESCRIPTION", "ARREST" FROM chicago_city_crime_incidents 
WHERE "ARREST" = true ORDER BY EXTRACT(YEAR FROM "DATE") ASC;

--Query that extracts type of crime (primary_type), which resulted in arrests
SELECT "PRIMARY_TYPE", COUNT("ID") AS "number_of_arrests" FROM chicago_city_crime_incidents 
WHERE "ARREST"=true GROUP BY "PRIMARY_TYPE" ORDER BY "number_of_arrests" DESC LIMIT 5;

--Calculating the crimes and crimes resulted in arrests for each year
SELECT COUNT("ID") AS "number_of_arrests", COUNT(CASE WHEN "ARREST" = true THEN 1 END), "YEAR" FROM chicago_city_crime_incidents 
GROUP BY "YEAR"
