--@F:\db_group_10\tests_trigggers.sql
--testing triggers

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

/*-----------------------------
-----------TESTING trig_check_festival_dates------------
-----------------------**/
--checking location_no , festival_nature_id
SELECT location_no FROM locations;
--16 rows selected

SELECT  festival_nature_id FROM festival_natures;
--	7 rows selected

--inserting in the festivals table with festival_start_date less than festival_end_date
INSERT INTO festivals(location_no,festival_nature_id,
festival_name,activities,festival_start_date,festival_end_date)
VALUES(7,2,'TEST FESTIVAL',
activity_varray_type(activity_type('PARADE','OUTDOOR'),
activity_type('PRESENTATION','OUTDOOR')),'10-NOV-2019','20-NOV-2019');
--Result: 1 rows created and no triggers generated

--inserting in the festivals table with festival_start_date greater than festival_end_date
INSERT INTO festivals(location_no, festival_nature_id, 
festival_name, activities, festival_start_date,festival_end_date)
VALUES(8,2,'TEST FESTIVAL',
activity_varray_type(activity_type('PARADE','OUTDOOR'),
activity_type('PRESENTATION','OUTDOOR')),
'30-NOV-2020','20-NOV-2019');
--Displayed the error message.


/*-------------------------------
-----------TESTING trig_check_insert_update_del-----
---------------------------**/
--testing the triger by updating the satff's age with age >18 
UPDATE staff SET dob= '01-JAN-1990' WHERE staff_id =1;
--SUCCESSFUL DISPLAYED

--deleting
DELETE FROM staff WHERE staff_id=2;
--deleted

--testing with age>60
UPDATE staff SET dob= '01-JAN-1920' WHERE staff_id =1;
--trigger raised error

--testing with age<18
UPDATE staff SET dob= '01-JAN-2004' WHERE staff_id =1;
--trigger raised error


/*-------------------------------
-----------TESTING trig_stop_pk_update------
----------------------------**/

SELECT festival_nature_id FROM festival_natures;

--inserting new dummy id 
INSERT INTO festival_natures VALUES(200,'TEST');
--successfully inserted
SELECT festival_nature_id FROM festival_natures;
--7 rows selected
--testing by trying to change the festival_nature_id of 2to 9
UPDATE festival_natures SET festival_nature_id=222 WHERE festival_nature_id=200;
--TRIGGER GENERATED


/*-------------------------------
--------TESTING trig_stop_pk_update_loc----
-------------**/
SELECT location_no FROM locations;
--16 rows selected
--inserting new dummy id 
INSERT INTO locations(location_no, address) SELECT 200, REF(a) FROM addresses a WHERE a.city='HARTFORD';
--successfully inserted
--testing by trying to change location_no of 1 to 40
UPDATE locations SET location_no =209 WHERE location_no=200;



/*-------------------------------
--------TESTING trig_stop_pk_update_staff----
-------------**/

--inserting dummy data
INSERT INTO staff (staff_id, firstname, lastname, address, contact, staff_gender, staff_email, staff_employed_date,salary, dob)
VALUES (99,  'CONNOR', 'PAYNE', address_type('4478 TRAILS END ROAD','ALBANY','NEW YORK','USA'), contact_table_type(contact_type('MOBILE','+1 129-123-0099')), 'M', 'CONNOE@GMAIL.COM', '12-JAN-2018', '14000', '11-NOV-1982');

SELECT staff_id , firstname FROM staff;
--7 rows selected
--testing
UPDATE staff SET staff_id=1000 WHERE staff_id=100;
--


/*-------------------------------
--------TESTING trig_logon----
-------------**/
--cannot login  before 8am and after 6pm.
--CONNECT SYS AS SYSDBA

--CONNECT group10

