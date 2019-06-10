--@F:\db_group_10\procedures_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

--displaying output on screen
SET SERVEROUTPUT ON

/*
	anonymous block to retrive the festival name whose festival_nature_id is equal to 4 an location_no is 1
	if there is no such data then the output "NO DATA FOUND" will be displayed
*/
DECLARE
	vc_festival_name festivals.festival_name%TYPE;
BEGIN
	SELECT festival_name INTO vc_festival_name
	FROM festivals WHERE festival_nature_id=4 AND location_no=1;
 	DBMS_OUTPUT.PUT_LINE(vc_festival_name);
   
   EXCEPTION 
   WHEN no_data_found THEN
   DBMS_OUTPUT.PUT_LINE('------------------NO DATA FOUND-------------------');
END;
/

--creating procedure named proc_add_addresses to insert into addresses table whose parameter is street, city, state, country
CREATE OR REPLACE PROCEDURE proc_add_addresses(in_street addresses.street%TYPE,
	in_city addresses.city%TYPE,
	in_state addresses.state%TYPE,
	in_country addresses.country%TYPE) IS
	BEGIN
		--insert query
		INSERT INTO addresses(street, city, state, country) 
		VALUES (in_street, in_city, in_state, in_country);
	END proc_add_addresses;
/
SHOW ERRORS
--no errors

--creating procedure named proc_delete_addresses_street to delete address column from addresses table whose street is equal to parameter of procedure
CREATE OR REPLACE PROCEDURE proc_delete_addresses_street(in_street addresses.street%TYPE) IS
	BEGIN
		DELETE FROM addresses 
		WHERE street = in_street;
		
	END proc_delete_addresses_street;
/
SHOW ERRORS
--no errors

--creating procedure named proc_delete_addresses_street to delete address row from addresses table whose city is equal to parameter of procedure
CREATE OR REPLACE PROCEDURE proc_delete_addresses_city(in_city addresses.city%TYPE) IS
	BEGIN
		DELETE FROM addresses 
		WHERE city = in_city;
		
	END proc_delete_addresses_city;
/
SHOW ERRORS
--no errors

--creating procedure named proc_delete_addresses_street to delete address row from addresses table whose state is equal to parameter of procedure
CREATE OR REPLACE PROCEDURE proc_delete_addresses_state(in_state addresses.state%TYPE) IS
	BEGIN
		DELETE FROM addresses 
		WHERE state = in_state;
		
	END proc_delete_addresses_state;
/
SHOW ERRORS
--no errors


--creating procedure named proc_delete_addresses_street to delete address row from addresses table whose country is equal to parameter of procedure
CREATE OR REPLACE PROCEDURE proc_delete_addresses_country(in_country addresses.country%TYPE) IS
	BEGIN
		DELETE FROM addresses 
		WHERE country = in_country;
		
	END proc_delete_addresses_country;
/
SHOW ERRORS
--no errors

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

--creating procedure named proc_add_location to insert values into locations table
CREATE OR REPLACE PROCEDURE proc_add_location(in_city addresses.city%TYPE) IS
	BEGIN
		--insert query
		INSERT INTO locations(location_no, address)
		SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city = in_city;
	END proc_add_location;
/
SHOW ERRORS
--no errors

--creating procedure named proc_delete_location to delete the location column sending the location number in parameters
CREATE OR REPLACE PROCEDURE proc_delete_location(in_location_no locations.location_no%TYPE) IS	
	BEGIN
		--delete query
		DELETE FROM locations WHERE location_no = in_location_no;

	END proc_delete_location;
/

SHOW ERRORS
--no errors

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

--creating procedure named proc_add_festival_natures to insert the values into festival_nature table
CREATE OR REPLACE PROCEDURE proc_add_festival_natures(in_nature_name festival_natures.nature_name%TYPE) IS
	BEGIN
		--insert query
		INSERT INTO festival_natures(festival_nature_id,nature_name)
		VALUES (seq_festival_natures.NEXTVAL, in_nature_name);
		
	END proc_add_festival_natures;
/
SHOW ERRORS
--no errors

--creating procedure named proc_delete_festival_nature to delete the row whose festival_nature_id is equal to the in_festival_nature_id in parameter
CREATE OR REPLACE PROCEDURE proc_delete_festival_nature(in_festival_nature_id festival_natures.festival_nature_id%TYPE) IS	
	BEGIN
		--delete query
		DELETE FROM festival_natures WHERE festival_nature_id = in_festival_nature_id;
		
	END proc_delete_festival_nature;
/

SHOW ERRORS;

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

--creating procedure named proc_add_festival to insert values into festivals table
CREATE OR REPLACE PROCEDURE proc_add_festival(in_location_no festivals.location_no%TYPE, 
	in_festival_nature_id festivals.festival_nature_id%TYPE, 
	in_festival_name festivals.festival_name%TYPE, 
	in_activities festivals.activities%TYPE, 
	in_festival_start_date festivals.festival_start_date%TYPE, 
	in_festival_end_date festivals.festival_end_date%TYPE) IS
	BEGIN
		--insert query
		INSERT INTO festivals(location_no, festival_nature_id, festival_name, activities, festival_start_date, festival_end_date)
		VALUES (in_location_no, in_festival_nature_id, in_festival_name, in_activities, in_festival_start_date, in_festival_end_date);
		
	END proc_add_festival;
/
SHOW ERRORS;

--creating procedure named proc_delete_festival to delete the festival rows by sending the festival_nature_id in parameters
CREATE OR REPLACE PROCEDURE proc_delete_festival(in_festival_nature_id festivals.festival_nature_id%TYPE) IS	
	BEGIN
		--delete query
		DELETE FROM festivals WHERE festival_nature_id=in_festival_nature_id;
		
	END proc_delete_festival;
/

SHOW ERRORS
--no errors

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

--creating procedure named proc_add_staff to insert the values into staffs table
CREATE OR REPLACE PROCEDURE proc_add_staff(in_firstname staff.firstname%TYPE, 
	in_lastname staff.lastname%TYPE, 
	in_address staff.address%TYPE,	
	in_contact staff.contact%TYPE,	
	in_staff_gender staff.staff_gender%TYPE,	
	in_staff_email staff.staff_email%TYPE,
	in_staff_employed_date staff.staff_employed_date%TYPE,
	in_salary staff.salary%TYPE,
	in_dob staff.dob%TYPE
	) IS
	BEGIN
		--insert query
		INSERT INTO staff(staff_id, firstname, lastname, address, contact, 
			staff_gender, staff_email, staff_employed_date,salary, dob)
		VALUES (seq_staff.NEXTVAL,in_firstname, in_lastname, in_address, in_contact, 
			in_staff_gender, in_staff_email, in_staff_employed_date, in_salary, in_dob);
	END proc_add_staff;
/
SHOW ERRORS
--no errors

--creating procedure named proc_delete_staff to delete the staff rows by sending the staff_id in parameters
CREATE OR REPLACE PROCEDURE proc_delete_staff(in_staff_id staff.staff_id%TYPE) IS	
	BEGIN
		--delete query
		DELETE FROM staff WHERE staff_id = in_staff_id;
		
	END proc_delete_staff;
/

SHOW ERRORS
--no errors

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

--creating procedure named proc_add_festival_staff to insert values into staffs table
CREATE OR REPLACE PROCEDURE proc_add_festival_staff(in_staff_id festival_staff.staff_id%TYPE, 
	in_location_no festival_staff.location_no%TYPE, 
	in_festival_nature_id festival_staff.festival_nature_id%TYPE
	) IS
	BEGIN
		--insert query
		INSERT INTO festival_staff(staff_id, location_no, festival_nature_id)
		VALUES (in_staff_id,in_location_no, in_festival_nature_id);
		
	END proc_add_festival_staff;
/
SHOW ERRORS
--no errors

--creating procedure named proc_delete_festival_staff to delete the rows by sending the staff_id in parameters
CREATE OR REPLACE PROCEDURE proc_delete_festival_staff(in_staff_id festival_staff.staff_id%TYPE) IS	
	BEGIN
		--delete query
		DELETE FROM festival_staff WHERE staff_id = in_staff_id;
		
	END proc_delete_festival_staff;
/
SHOW ERRORS
--no errors