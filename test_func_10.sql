--@F:\db_group_10\test_func_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

--test script of all the functions and related procedures 
--testing 'functions_10.sql'

--to see the output on screen
SET SERVEROUTPUT ON

--column formatting
COLUMN firstname FORMAT A10
COLUMN lastname FORMAT A10
COLUMN username FORMAT A10
COLUMN password FORMAT A20
COLUMN address FORMAT A10
COLUMN staff_email FORMAT A10

---------------------------------------------------
---------for procedures 'proc_count_staff'---------
---------------------------------------------------
--checking the staffs 
DESC staff;

--executing 'proc_count_staff'
EXECUTE proc_count_staff;
--Result: THERE ARE 6 STAFF RECORDS

SELECT * FROM staff;
--6 rows returned

---------------------------------------------------
---------for procedure 'proc_generate_age_staff'---
---------------------------------------------------
DESC staff;

--executing by putting the date value in parameter
EXECUTE proc_generate_age_staff(3);
--Result: AGE OF ELVENA  IS 35 YEARS OLD.

--runtime parameter
EXEC proc_generate_age_staff(&in_id);
--shows age


---------------------------------------------------
---------for 'proc_duration_of_festival'-----------
---------------------------------------------------
--viwing table structure
DESC festivals

--executing by putting the festival name in parameter to calculate the duration of festival
EXEC proc_duration_of_festival('DEVFARE');
--Result: THE DURATION OF FESTIVAL IS 4 DAYS.

---------------------------------------------------
---------for 'proc_update_username_password'-------
---------------------------------------------------
--first checking data of the table staff
SELECT firstname, username, password FROM staff
WHERE staff_id = 2;
-- Result: username and password columns are empty

--executing the procedure by putting the staff_id to generate both username and password of that user
EXEC proc_update_username_password(2);
--PL/SQL procedure successfully completed

--checking if the username and password is updated in the staff table
SELECT firstname, username, password FROM staff
WHERE staff_id = 2;
--Result: username and password updated


