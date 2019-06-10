--@F:\db_group_10\functions_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/
--output display
SET SERVEROUTPUT ON


/*-------------------FUNCTIONS WITHOUT PARAMETERS-----------**/
--function name 'func_count_staff 'that returns the number of staff in the staff table
CREATE OR REPLACE FUNCTION func_count_staff RETURN NUMBER AS
vn_count NUMBER(3);

BEGIN
	SELECT COUNT(staff_id)
	INTO vn_count
	FROM staff;
	
	RETURN vn_count;
	
END func_count_staff;
/
SHOW ERRORS

--procedure named'proc_count_staff' to execute the function 'func_count_staff'
CREATE OR REPLACE PROCEDURE proc_count_staff AS
vn_count NUMBER(3);
BEGIN
	vn_count := func_count_staff;
	DBMS_OUTPUT.PUT_LINE('THERE ARE '||vn_count||' STAFF RECORDS.');
END proc_count_staff;
/
SHOW ERRORS

/*-------------------FUNCTIONS WITH PARAMETERS-----------**/
--creating a function named func_generate_age_staff which calculates age by given id
CREATE OR REPLACE FUNCTION func_generate_age_staff(in_date_of_birth DATE) RETURN NUMBER IS
	vd_dob DATE;
	vn_calc_age NUMBER(3);
BEGIN
	
	vn_calc_age := FLOOR(MONTHS_BETWEEN(SYSDATE, in_date_of_birth)/12);
	RETURN vn_calc_age;

END func_generate_age_staff;
/
SHOW ERRORS

--creating procedure named proc_generate_age_staff to call func_generate_age_staff
CREATE OR REPLACE PROCEDURE proc_generate_age_staff(in_id staff.staff_id%TYPE)IS
	vn_calc_age NUMBER(3);
	vc_firstname staff.firstname%TYPE;
	vd_dob DATE;
BEGIN
	SELECT firstname, dob INTO vc_firstname, vd_dob FROM staff   WHERE staff_id= in_id;
	vn_calc_age := func_generate_age_staff(vd_dob);
	DBMS_OUTPUT.PUT_LINE('AGE OF ' || vc_firstname ||' IS ' || vn_calc_age|| ' YEARS OLD.');
END proc_generate_age_staff;
/
SHOW ERRORS

--------------------------------------------------------------------
--------------------------------------------------------------------

--creating parameterised function to calculate the duration of the festival by passing festival's start and end dates
CREATE OR REPLACE FUNCTION func_duration_of_festival(in_start_date DATE, in_end_date DATE) RETURN NUMBER IS
	vn_calc_duration NUMBER(4);
BEGIN
	vn_calc_duration:= in_end_date - in_start_date;
	RETURN vn_calc_duration;
END func_duration_of_festival;
/

SHOW ERRORS

--creating procedure named proc_duration_of_fetival to call func_duration_of_festival
CREATE OR REPLACE PROCEDURE proc_duration_of_festival(in_fes_name festivals.festival_name%TYPE)IS
	vn_duration NUMBER(3);
	vd_start DATE;
	vd_end DATE;
BEGIN
	SELECT festival_start_date,festival_end_date  INTO vd_start,vd_end FROM festivals WHERE festival_name LIKE in_fes_name||'%';
	--SELECT festival_end_date INTO vd_end FROM festivals WHERE festival_name = in_fes_name;
	vn_duration := func_duration_of_festival(vd_start, vd_end);
	DBMS_OUTPUT.PUT_LINE('THE DURATION OF FESTIVAL IS ' || vn_duration || ' DAYS.');
	
END proc_duration_of_festival;
/
SHOW ERRORS

--------------------------------------------------------------------
--------------------------------------------------------------------

--creating a function name func_generate_staff_username that returns username
CREATE OR REPLACE FUNCTION func_generate_staff_username(in_staff_id staff.staff_id%TYPE) RETURN VARCHAR2 IS
  vc_username VARCHAR2(20);

BEGIN
	SELECT CONCAT(SUBSTR(firstname,1,3), SUBSTR(lastname,1,4))
	INTO vc_username
	FROM staff
	WHERE staff_id = in_staff_id;

	RETURN vc_username;
	
END func_generate_staff_username;
/
SHOW ERRORS

--creating a function named func_generate_staff_password that generates the password using username, date of birth and firstname
CREATE OR REPLACE FUNCTION func_generate_staff_password(in_staff_id staff.staff_id%TYPE) RETURN VARCHAR2 IS
  vc_password VARCHAR2(20);

BEGIN
	SELECT CONCAT(CONCAT(UPPER(SUBSTR(username,1,4)),REPLACE(SUBSTR(dob,1,5),'-')), SUBSTR(firstname,1,4))
	INTO vc_password
	FROM staff
	WHERE staff_id = in_staff_id;

	RETURN vc_password;
	
END func_generate_staff_password;
/
SHOW ERRORS

--creating a procedure named proc_insert_username_password
CREATE OR REPLACE PROCEDURE proc_update_username_password(in_staff_id staff.staff_id%TYPE) IS
 vc_username VARCHAR2(20);
 vc_password VARCHAR2(20);
	BEGIN
	vc_username := func_generate_staff_username(in_staff_id);
	 vc_password :=func_generate_staff_password(in_staff_id);
		
	UPDATE staff SET
		username = vc_username, password=vc_password
		WHERE staff_id = in_staff_id;
		

	END proc_update_username_password;
/
SHOW ERRORS
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

	
	