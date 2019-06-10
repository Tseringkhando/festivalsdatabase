--@F:\db_group_10\tests_proc_10.sql

--TESTING

/*-----------------------------------------------------
	------for procedure 'proc_add_addresses'----
------------------------------------------------------*/

--first checking data in the addresses object table
SELECT * FROM addresses;
--14 rows returned

--executing the procedure with correct data
EXEC proc_add_addresses('SOUTH SCIOTO','CIRCLEVILLE','OHIO','USA');

--checking if the procedure added data in the table
SELECT * FROM addresses;
--15 rows returned

--executing the procedure with incorrect data
EXEC proc_add_addressess('CIRCLEVILLE','OHIO','USA');

--checking if the procedure added data in the table
SELECT * FROM addresses;
--no row added and returns the 15 rows returned

/*-------------------------------------------------------
-----for procedure 'proc_delete_addressess_street'-------
--------------------------------------------------------*/

--first checking data in the addresses object table
SELECT * FROM addresses;
--15 rows returned

--executing the procedure with correct data
EXEC proc_delete_addresses_street('SOUTH SCIOTO');

--checking if the procedure added data in the table
SELECT * FROM addresses;
--14 rows returned

--executing the procedure with incorrect data
EXEC proc_delete_addressess_street(1);

--checking if the procedure added data in the table
SELECT * FROM addresses;
--no row added

/*-------------------------------------------------------
-----for procedure 'proc_delete_addressess_city'---------
--------------------------------------------------------*/

--first checking data in the addresses object table
SELECT * FROM addresses;
-- 15 rows returned

--executing the procedure with correct data
EXEC proc_delete_addresses_city('CIRCLEVILLE');

--checking if the procedure deleted data in the table
SELECT * FROM addresses;
--14 rows returned

--executing the procedure with incorrect data
EXEC proc_delete_addresses_city(01);

--checking if the procedure deleted data in the table
SELECT * FROM addresses;
--no row added



/*---------------------------------------------------------------
---------for procedure 'proc_delete_addressess_state'----------
----------------------------------------------------------------------------*/

--first checking data in the addresses object table
SELECT * FROM addresses;
-- 15 rows returned

--executing the procedure with correct data
EXEC proc_delete_addresses_state('OHIO');

--checking if the procedure deleted data in the table
SELECT * FROM addresses;
--13 rows returned

--executing the procedure with incorrect data
EXEC proc_delete_addresses_state(01);

--checking if the procedure added data in the table
SELECT * FROM addresses;
--no row added

-------------------------------------------------------
-----for procedure 'proc_delete_addresses_country'-----
-------------------------------------------------------
--first checking data in the addresses object table
SELECT * FROM addresses;
-- 13 rows returned

--executing the procedure with correct data
EXEC proc_delete_addresses_country('USA');

--checking if the procedure deleted data in the table
SELECT * FROM addresses;
--13 rows returned

--executing the procedure with incorrect data
EXEC proc_delete_addresses_country(01);

--checking if the procedure added data in the table
SELECT * FROM addresses;
--no row added

-------------------------------------------------------
-------for procedure 'proc_add_location'--------------
-------------------------------------------------------
--first checking data in the location table
SELECT location_no, l.address.street street,l.address.city city, l.address.state state, l.address.country country 
FROM locations l;
-- 15 rows returned

--executing the procedure with correct data
EXEC proc_add_location('TEST');

--checking if the procedure added data in the table
SELECT location_no, l.address.street street,l.address.city city, l.address.state state, l.address.country country 
FROM locations l;
--16 rows returned

--executing the procedure with incorrect data
EXEC proc_add_location(01);

--checking if the procedure added data in the table
SELECT location_no, l.address.street street,l.address.city city, l.address.state state, l.address.country country 
FROM locations l;
--no row added

-------------------------------------------------------
-------for procedure 'proc_delete_location'------------
-------------------------------------------------------
--first checking data in the location table
SELECT location_no, l.address.street street,l.address.city city, l.address.state state, l.address.country country 
FROM locations l;
-- 15 rows returned

--executing the procedure with correct data
EXEC proc_delete_location(16);

--checking if the procedure deleted data in the table
SELECT location_no, l.address.street street,l.address.city city, l.address.state state, l.address.country country 
FROM locations l;
--16 rows returned

--executing the procedure with incorrect data
EXEC proc_delete_location('TEST');

--checking if the procedure deleted data in the table
SELECT location_no, l.address.street street,l.address.city city, l.address.state state, l.address.country country 
FROM locations l;


-------------------------------------------------------
----for procedure 'proc_add_festival_natures' ---------
-------------------------------------------------------
--first checking data in the festival_natures table
SELECT * FROM festival_natures;
--5  rows returned

--executing the procedure with correct data
EXEC proc_add_festival_natures('TEST');

--checking if the procedure added data in the table
SELECT * FROM festival_natures;
--6 rows returned

--executing the procedure with incorrect data
EXEC proc_add_festival_natures('');

--checking if the procedure added data in the table
SELECT * FROM festival_natures;
--no row added

-------------------------------------------------------
-----for procedure 'proc_delete_festival_nature' ------
-------------------------------------------------------
--first checking data in the festival_natures table
SELECT * FROM festival_natures;
--6  rows returned

--executing the procedure with correct data
EXEC proc_delete_festival_nature(7);

--checking if the procedure deleted data in the table
SELECT * FROM festival_natures;
--5 rows returned

--executing the procedure with incorrect data
EXEC proc_add_festival_natures('');

--checking if the procedure added data in the table
SELECT * FROM festival_natures;
--no row added

-------------------------------------------------------
-----for procedure 'proc_add_festival' -------------
-------------------------------------------------------
--first checking data in the festivals table
SELECT * FROM festivals;
--15  rows returned

--executing the procedure with correct data
EXEC proc_add_festival(12, 2,'TULIP ME FESTIVAL',activity_varray_type(activity_type('PARADS','OUTDOOR'),activity_type('FIREWORKS','OUTDOOR')),'6-MAY-2019','7-MAY-2019');

--checking if the procedure deleted data in the table
SELECT * FROM festivals;
--16 rows returned

--executing the procedure with incorrect data
EXEC proc_add_festival('');
-- procedure didn't execute

--checking if the procedure added data in the table
SELECT * FROM festivals;
--no row added

-------------------------------------------------------
---------for procedure 'proc_add_festival' ----------
-------------------------------------------------------
--first checking data in the festivals table
SELECT * FROM festivals;


--executing the procedure with correct data
EXEC proc_delete_festival(2);

--checking if the procedure deleted data in the table
SELECT * FROM festivals;
--11 rows returned

--executing the procedure with incorrect data
EXEC proc_delete_festival('');
-- procedure didn't execute

--checking if the procedure added data in the table
SELECT * FROM festivals;
--no row added

-------------------------------------------------------
-------------for procedure 'proc_add_staff' -----------
-------------------------------------------------------
--first checking data in the staff table
SELECT * FROM staff;

--executing the procedure with correct data
EXEC proc_add_staff('KHANDO', 'MORRISON', address_type('4090 MORRIS STREET','FOWLERTON','TEXAS','USA'), contact_table_type(contact_type('MOBILE','+1 198-123-3456')), 'F', 'KHANDO@HOTMAIL.COM', '18-JAN-2018',  '11001', '11-SEP-1981');

--checking if the procedure deleted data in the table
SELECT * FROM staff;


--executing the procedure with incorrect data
EXEC proc_add_staff('');
-- procedure didn't execute

--checking if the procedure added data in the table
SELECT * FROM staff;
--no row added

-------------------------------------------------------
--------for procedure 'proc_delete_staff'--------------
-------------------------------------------------------
--first checking data in the staff table
SELECT * FROM staff;
--7  rows returned

--executing the procedure with correct data
EXEC proc_delete_staff(7);

--checking if the procedure deleted data in the table
SELECT * FROM staff;
--6 rows returned

--executing the procedure with incorrect data
EXEC proc_add_staff('');
-- procedure didn't execute

--checking if the procedure added data in the table
SELECT * FROM staff;
--no row added

-------------------------------------------------------
--------for procedure 'proc_add_festival_staff' -------
-------------------------------------------------------
--first checking data in the festival_staff table
SELECT * FROM festival_staff;
--6 rows returned

--executing the procedure with correct data
EXEC proc_add_festival_staff(2,2,2);

--checking if the procedure deleted data in the table
SELECT * FROM festival_staff;
--7 rows returned

--executing the procedure with incorrect data
EXEC proc_add_staff('');
-- procedure didn't execute

--checking if the procedure added data in the table
SELECT * FROM festival_staff;
--no row added

-------------------------------------------------------
------for procedure 'proc_delete_festival_staff' ------
-------------------------------------------------------
--first checking data in the festival_staff table
SELECT staff_id FROM festival_staff;
--7 rows returned

--executing the procedure with correct data
EXEC proc_delete_festival_staff(2);

--checking if the procedure deleted data in the table
SELECT * FROM festival_staff;
--5 rows returned

--executing the procedure with incorrect data
EXEC proc_delete_festival_staff(' ');
-- procedure didn't execute

--checking if the procedure added data in the table
SELECT * FROM festival_staff;
--no row added

