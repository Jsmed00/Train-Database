--Create a schema named train in the csci_3700 database. 
CREATE SCHEMA IF NOT EXISTS train;

--Set schema search path to train
SET search_path TO train;


--Show search path to ensure that it is set to train
SHOW search_path;



--Create the table for station
CREATE TABLE station(
	base_station_id         INT    PRIMARY KEY,
	station_city            VARCHAR,
	station_state           VARCHAR
);

/*
Load station data into station table. 
*/

COPY station(base_station_id, station_city, station_state)
FROM 'C:\Users\Public\train_data\station_data.csv'
DELIMITER ','
CSV HEADER;


--View the station table to check that data was loaded in correctly. 
SELECT *
FROM station;



--Create the conductor table
CREATE TABLE conductor(
	conductor_id      INT        PRIMARY KEY,
	conductor_name    VARCHAR,
	salary            FLOAT,
	dob               DATE,
	sex               VARCHAR,
	base_station_id   INT,
	FOREIGN KEY (base_station_id) REFERENCES station(base_station_id)
);



--Load in the data for conductor
COPY conductor(conductor_id, conductor_name, salary, dob, sex, base_station_id)
FROM 'C:\Users\Public\train_data\conductor_data.csv'
DELIMITER ','
CSV HEADER;





--View the conductor table
SELECT *
FROM conductor;



--Create the engineer table
CREATE TABLE engineer(
	engineer_id        INT       PRIMARY KEY,
	engineer_name      VARCHAR,
	salary             FLOAT,
	dob                DATE,
	sex                VARCHAR,
	base_station_id    INT,
	FOREIGN KEY (base_station_id) REFERENCES station(base_station_id)
);




--Load in the data for engineer
COPY engineer(engineer_id, engineer_name, salary, dob, sex, base_station_id)
FROM 'C:\Users\Public\train_data\engineer_data.csv'
DELIMITER ','
CSV HEADER;



--View the engineer table
SELECT *
FROM engineer;


--Create the train table
CREATE TABLE train(
	train_id     INT   PRIMARY KEY,
	base_station_id    INT,
	conductor_id       INT,
	engineer_id        INT,
	train_type         VARCHAR,
	FOREIGN KEY(base_station_id) REFERENCES station(base_station_id),
	FOREIGN KEY(conductor_id) REFERENCES conductor(conductor_id),
	FOREIGN KEY(engineer_id) REFERENCES engineer(engineer_id)
);



--Load table into train
COPY train(train_id, base_station_id, conductor_id, engineer_id, train_type)
FROM 'C:\Users\Public\train_data\train_data.csv'
DELIMITER ','
CSV HEADER;



--View the train table
SELECT *
FROM train;



--Create the routes table
CREATE TABLE routes(
	route_id                   INT    PRIMARY KEY,
	train_id                   INT,
	depart_time                TIME,
	arrival_time               TIME,
	departing_station_id       INT,
	arriving_station_id        INT,
	FOREIGN KEY(train_id) REFERENCES train(train_id)
);



--Load in routes data
COPY routes(route_id, train_id, depart_time, arrival_time, departing_station_id, arriving_station_id)
FROM 'C:\Users\Public\train_data\routes_data.csv'
DELIMITER ','
CSV HEADER;



--View the routes table
SELECT *
FROM routes;




--Submit this completed sql file on Canvas.
