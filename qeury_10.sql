--@F:\db_group_10\qeury_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

/*----------select Queries---------**/

--view all the tables in the userspace 
SELECT * FROM TAB;

--viewing all the table structures
DESC festival_natures
DESC festivals
DESC locations
DESC staff
DESC festival_staff
DESC addresses



--all the column formatting
COLUMN street FORMAT A20
COLUMN city FORMAT A15
COLUMN state FORMAT A15
COLUMN country FORMAT A10

--column formatting
COLUMN street FORMAT A20 
COLUMN city FORMAT A20
COLUMN state FORMAT A10 
COLUMN country FORMAT A10 

--column formatting for festivals table
COLUMN festival_name FORMAT A20
COLUMN activities FORMAT A15
COLUMN festival_start_date FORMAT A10
COLUMN festival_end_date FORMAT A10

--column formatting of staff table
COLUMN firstname FORMAT A10
COLUMN lastname FORMAT A10
COLUMN address FORMAT A10
COLUMN staff_email FORMAT A10
COLUMN username FORMAT A10
COLUMN password FORMAT A10
COLUMN contact FORMAT A10


--Viewing all the data from all the tables
SELECT * FROM festival_natures;
SELECT * FROM festivals;
SELECT * FROM locations;
SELECT * FROM staff;
SELECT * FROM festival_staff;
SELECT * FROM addresses;


/*----------querying all types------------**/
----querying sequence values
DESC user_sequences
SELECT sequence_name FROM user_sequences;
SELECT seq_locations.NEXTVAL FROM DUAL;
SELECT seq_locations.CURRVAL FROM DUAL;

--viewing user_objects table structure
DESC user_objects
COLUMN OBJECT_NAME FORMAT A25

--viewing all the objects
SELECT object_name, object_type FROM user_objects;
SELECT object_name, object_type FROM user_objects WHERE object_name NOT LIKE 'S%';
SELECT object_name, object_type FROM user_objects WHERE object_type  LIKE 'TYP%';
SELECT object_name, object_type FROM user_objects WHERE object_type  LIKE 'TAB%';
SELECT object_name, object_type FROM user_objects WHERE object_type  LIKE 'PR%';
SELECT object_name, object_type FROM user_objects WHERE object_type  LIKE 'F%';


--querying triggers
--viewing trigger's table structure
DESC user_triggers
SELECT trigger_name, trigger_type FROM user_triggers;


--Viewing all the constraints
DESC user_constraints
SELECT constraint_name, constraint_type FROM user_constraints;
SELECT constraint_name, constraint_type FROM user_constraints WHERE constraint_name NOT LIKE 'SYS%';
SELECT constraint_name, constraint_type FROM user_constraints WHERE constraint_name  LIKE 'F%';
SELECT constraint_name, constraint_type FROM user_constraints WHERE constraint_name  LIKE 'P%';


--Viewing all the sequence
DESC user_sequences
SELECT sequence_name FROM user_sequences;


--Query Festival Natures
SELECT * FROM festival_natures
WHERE festival_nature_id = 2;


--select query using OR 
SELECT * FROM festival_natures
WHERE festival_nature_id = 3
OR festival_nature_id = 5;

--using projection
SELECT festival_nature_id, location_no,festival_name FROM festivals;
SELECT staff_id, firstname FROM staff;


--Query of festivals
SELECT festival_name FROM festivals
WHERE festival_name = 'DEVFARE 2019';

SELECT festival_name FROM festivals
WHERE festival_name LIKE 'A%';

SELECT festival_name, festival_start_date FROM festivals
WHERE festival_start_date = '14-SEP-2019';

SELECT festival_name, festival_start_date as "START", festival_end_date as "END" FROM festivals
WHERE festival_end_date < '06-MAY-2019';

SELECT festival_name, festival_start_date as "START", festival_end_date as "END" FROM festivals
WHERE festival_start_date = '06-SEP-2019' AND festival_end_date = '07-SEP-2019';


--query using between 
SELECT festival_name 
FROM festivals
WHERE festival_start_date 
BETWEEN '05-JUN-2019'
AND '07-SEP-2019';

--using union
SELECT l.address.country
FROM locations l
UNION 
SELECT s.address.country
FROM staff s;

--minus | intersect | 
SELECT l.address.city city
FROM locations l
INTERSECT 
SELECT s.address.city city 
FROM staff s;

SELECT l.address.city city
FROM locations l
MINUS
SELECT s.address.city city
FROM staff s;

--select query using IN 
SELECT festival_name 
FROM festivals
WHERE festival_start_date IN ('8-SEP-2019', '10-SEP-2019');

--select query using ALL 
SELECT * FROM festivals
WHERE festival_start_date = ALL('8-SEP-2019', '10-SEP-2019');


--query joining the festival and location 
SELECT fe.festival_name, fe.festival_start_date, fe.festival_end_date, l.address.street street,l.address.city city 
FROM locations l
INNER JOIN festivals fe
ON l.location_no = fe.location_no;


--LOCATIONS QUERY

--using poor method
SELECT * FROM locations
WHERE location_no = 0000001;

--using deference
SELECT location_no, DEREF(address) FROM locations;

--using best method (dot notation)
SELECT location_no, l.address.street street,l.address.city city, l.address.state state, l.address.country country 
FROM locations l;

--in descending order
SELECT location_no, l.address.street street,l.address.city city, l.address.state state
FROM locations l
ORDER BY state DESC;


/*---------------------------
-----------STAFF QUERY-------------
---------------------------------**/
SELECT firstname, username, password 
FROM staff
WHERE staff_id = 0000001;

SELECT firstname, lastname, contact, staff_email,staff_gender ,username
FROM staff
WHERE staff_gender = 'M';

--querying staff ID , firstname and lastname whose firstname has 'a' in it ;
SELECT staff_id, firstname ,lastname
FROM staff
WHERE firstname  LIKE '%A%';

--querying staff ID, firstname and lastname by matching staff first name that start exactly with D and ends with E;
SELECT staff_id, firstname, lastname
FROM staff
WHERE lastname LIKE '_O_';


/*---------------------------------------------------------
------------------------NESTED QUERY--------------**/
--using EXISTS, querying the staff table to show staff whose salaries are greater than their mentor
SELECT i.staff_id, i.firstname, i.salary, i.reports_to
FROM staff i
WHERE EXISTS(
	SELECT staff_id 
	FROM staff m
	WHERE i.reports_to IS NOT NULL
	AND i.reports_to = m.staff_id
	AND i.salary > m.salary);
	
--using NOT IN, showing the cities from the addresses table which are not in staff table
SELECT city 
FROM addresses
WHERE city NOT IN(
	SELECT s.address.city
	FROM staff s);

--using IN,viewing all the festival name in festivals in 'HOLLAND' city
SELECT festival_name
FROM festivals
WHERE location_no IN(
	SELECT location_no
	FROM locations l
	WHERE l.address.city = 'HOLLAND');


--using =, viewing the staff's firstname whose salary is the highest
SELECT DISTINCT(firstname), salary 
FROM staff
WHERE salary =
	(SELECT MAX(salary) FROM staff);
	

--IS NULL
SELECT staff_id, firstname, username  
FROM staff s
WHERE s.username IS NULL;

--CROSS JOINS DATA(CARTESIAN PRODUCT)
SELECT f.festival_name, s.firstname
FROM festivals f, staff s;

--JOIN using table alias
SELECT l.location_no, f.festival_nature_id
FROM locations l JOIN festivals f
ON l.location_no = f.location_no;

-- INNER JOIN BY APPLYING CONDITION
SELECT s.address,fs.location_no
FROM staff s JOIN festival_staff fs
ON s.staff_id = fs.staff_id
WHERE s.staff_gender = 'M';

--LEFT, RIGHT AND OUTER JOINS
SELECT fs.nature_name,f.festival_name
FROM festival_natures fs LEFT JOIN festivals f
ON fs.festival_nature_id = f.festival_nature_id;

SELECT fs.nature_name,f.festival_name
FROM festival_natures fs RIGHT JOIN festivals f
ON fs.nature_name = 'CULTURAL';

SELECT fs.nature_name,f.festival_name AS fest_name
FROM festival_natures fs FULL OUTER JOIN festivals f
ON fs.festival_nature_id = f.festival_nature_id;





/*--------------------------------------------------------
-------------BUILT IN FUNCTIONS-------------------
-----------------------------------**/
--retrieving specific data using DISTINCT
SELECT DISTINCT(s.firstname),fs.staff_id
FROM staff s JOIN festival_staff fs
ON s.staff_id = fs.staff_id;

--SUM
SELECT SUM(salary) AS "Total Salary"
FROM staff;

--COUNT function with GROUP BY
SELECT festival_nature_id,COUNT(festival_name) AS total_festivals
FROM festivals 
GROUP BY festival_nature_id 
ORDER BY festival_nature_id;

--MIN function
SELECT MIN(salary) AS "LOWEST SALARY"
FROM staff;

--MAX function
SELECT MAX(salary) AS "HIGHEST SALARY"
FROM staff;

--AVG FUNCTION
SELECT AVG(salary) AS "AVERAGE SALARY EXPENSE"
FROM staff;

--TRIM 
SELECT TRIM('  HELLO !')  FROM DUAL;


--REPLACE
SELECT REPLACE(SYSDATE, '-')  FROM DUAL;


--RUNTIME PARAMETERS
--counting the locations where festivals of type given 'festival_nature_id' are held
SELECT COUNT(location_no) AS locations ,festival_nature_id
FROM festivals
GROUP BY festival_nature_id
HAVING festival_nature_id= '&id';


--using CEIL,FLOOR,ROUND and TRUNC in one statement to show values of salary
SELECT salary, 
		CEIL(salary) CEILED,
		FLOOR(salary) FLOORED,
		ROUND(salary) ROUNDED,
	   TRUNC(salary) TRUNCATED 
FROM staff; 


/*-----------OBJECT QUERYING-------------
-----------------------------------------**/

--viewing contact_type
DESC contact_type

--using poor method
SELECT 	UPPER(firstname), contact FROM staff;
SELECT 	LOWER(firstname), contact FROM staff;

--using best method
SELECT s.firstname firstname, a.medium medium, a.contact_number contact
FROM staff s , TABLE(s.contact) a;

--querying only the nested table "contact_table_type"
SELECT VALUE(s)
FROM THE(
	SELECT contact
	FROM staff
	WHERE staff_id=5)s;
	
--querying varray, activity_varray_type
DESC activity_type

--using poor method
SELECT festival_name, activities FROM festivals;

--using best method
--COLUMN FORMATTING
COLUMN festival FORMAT A10
COLUMN activity FORMAT A10
COLUMN category FORMAT A10
SELECT f.festival_name festival, a.activity_name activity, a.category category
FROM festivals f , TABLE(f.activities) a;


--query using switch case
SELECT s.firstname,s.lastname, s.address.city city, s.address.country country
FROM staff s 
ORDER BY (CASE
WHEN s.address.city IS NULL THEN s.address.country
ELSE s.address.city
END);


--checking user login log 'activity_logs' table
SELECT user_logged, TO_CHAR(date_time, 'MM/DD/YYYY HH24:MI:SS') AS " DATE-TIME"  FROM  activity_logs ;


