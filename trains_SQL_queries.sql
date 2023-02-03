-- Jonathan Smedley 
-- Evin Fisher
-- Seymone Gugneja
-- Emily Morales


SHOW search_path;
SET search_path TO train;

-- 1. Retrieve the records of all conductors who work at base station 3.
SELECT *
FROM conductor
WHERE base_station_id = 3;

-- 2. Retrieve the records of all of the trains engineer 4351 works on.
SELECT *
FROM train
WHERE engineer_id = 4351;

-- 3. Retrieve the record of the engineers that are Males.
SELECT *
FROM engineer
WHERE sex = 'M';

-- 4. Retrieve the Conductor with the highest salary who works at base station 2.
SELECT *
FROM Conductor
WHERE salary IN
    (SELECT MAX(salary)
	 FROM Conductor
	 WHERE base_station_id = 2);
	 
--5. Retrieve all of the routes that depart from station 2.
SELECT *
FROM routes
WHERE departing_station_id = 2;

--6. Retrieve all of the conductors who make above $90,000.
SELECT *
FROM conductor
WHERE salary > 90000;

--7. Retrieve all Trains of type Trolley.
SELECT *
FROM train
WHERE train_type = 'Trolley';

--8. Retrieve the records of the highest paid engineers. Order the results by salary in descending order. 
SELECT *
FROM engineer
WHERE (engineer_id, salary) IN
	  (SELECT engineer_id, MAX(salary)
	  FROM engineer
	  GROUP BY engineer_id)
	  ORDER BY salary DESC;

--9. Retrieve the birth date of the engineer(s) who work on train 5.
SELECT train.engineer_id, train.train_id, engineer.dob
FROM train, engineer
WHERE train_id = 5 AND train.engineer_id = engineer.engineer_id;

--10.  Retrieves the smallest salary of all the engineers.
SELECT MIN(engineer.salary)
FROM engineer;

--11. Retrieve the average salary of all the engineers that work out of Charlotte, NC.
SELECT AVG(salary)
FROM engineer
WHERE base_station_id = 1;

--12. Retrieve Station Cities in Alphabetical Order.
SELECT *
FROM station
ORDER BY station_city ASC;

--13. Retrieve the sum of all the salaries of the female engineers.
SELECT SUM(salary)
FROM engineer
WHERE sex = 'F';

--14. Retrieve the records of the engineers whose ID is greater than 7000 and who works on the Monorails.
SELECT engineer.*, train.train_type, train.engineer_id
FROM engineer, train
WHERE (engineer.engineer_id > 7000) AND (train.train_type = 'Monorail') AND
train.engineer_id = engineer.engineer_id;

--15. Retrieve the records of the conductors whose id is greater than 6000.
SELECT *
FROM conductor
WHERE conductor_id > 6000;

--16. Retrieve the records of the conductor and engineer who work on amtrak trains.
SELECT train.engineer_id, train.conductor_id, train.train_type, engineer.*, conductor.*
FROM engineer, conductor, train
WHERE train_type = 'Amtrak' AND train.engineer_id = engineer.engineer_id AND
train.conductor_id = conductor.conductor_id;

--17.  Retrieves the records of conductors whose base station is 3 and whose id is less than 5000.
SELECT *
FROM conductor
WHERE base_station_id = 3 AND conductor_id < 5000;

--18. Retrieve the records of all Monorails based at station 5.
SELECT *
FROM train
WHERE base_station_id = 5 AND train_type = 'Monorail';

--19. Retrieves the routes leaving from station 2 and arriving at station 5 in chronological order.
SELECT *
FROM routes
WHERE departing_station_id = 2 AND arriving_station_id = 5
ORDER BY depart_time ASC;

--20. Retrieves the records of all conductors who work in NC.
SELECT station.station_state, station.base_station_id, conductor.*
FROM station, conductor
WHERE station_state = 'NC' AND station.base_station_id = conductor.base_station_id;



--Submit this completed sql file on Canvas.
