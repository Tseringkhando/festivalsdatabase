--@F:\db_group_10\triggers_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

/*-------------------------------------
---Time limit for the user to create alter or drop in the database.
--The trigger is fired when the user tries to login except between 8am to 6pm.
---------------------------------------------**/

CREATE OR REPLACE TRIGGER trig_limit_login
AFTER CREATE OR ALTER OR DROP ON group10.SCHEMA
DECLARE
	vn_hour NUMBER(2);

BEGIN
SELECT TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) INTO vn_hour FROM DUAL;
		IF vn_hour<13 OR vn_hour>23THEN
			RAISE_APPLICATION_ERROR(-20001,'CANNOT MAKE CHANGES IN DATABASE BEFORE 8PM AND AFTER 6PM.');
		END IF;
END;
/
SHOW ERRORS
--no errors

--trigger name 'trig_check_festival_dates' to check whether the festival start and end dates are valid 
--The trigger is fired when the user tries to enter the end date earlier than the  start date.
CREATE OR REPLACE TRIGGER  trig_check_festival_dates 
BEFORE INSERT OR UPDATE ON festivals
FOR EACH ROW
WHEN (NEW.festival_end_date < NEW.festival_start_date)

BEGIN
	RAISE_APPLICATION_ERROR(-20004, 'FESTIVAL END DATE IS LOWER THAN START DATE!!!');
END trig_check_festival_dates;
/
SHOW ERRORS
--trigger created

--trigger named 'trig_check_age_del' 
--The trigger is fired when the user tries to enter the age of the staff either below 18 or above 60.
CREATE OR REPLACE TRIGGER trig_check_age_del
AFTER INSERT OR UPDATE OR DELETE OF dob ON staff 
FOR EACH ROW
DECLARE
        vn_age NUMBER(3);
        vd_today DATE;
		
BEGIN
SELECT SYSDATE INTO vd_today FROM DUAL;
		vn_age:=FLOOR(MONTHS_BETWEEN(sysdate, :NEW.dob)/12);
IF INSERTING OR UPDATING THEN 
  IF (vn_age<18) OR (vn_age>60) OR :NEW.dob>vd_today THEN
	 RAISE_APPLICATION_ERROR(-20002,'THE AGE MUST BE BETWEEN 18 - 60 YEARS');
  ELSE
	 DBMS_OUTPUT.PUT_LINE('SUCCESSFUL');
END IF;                
ELSE
     DBMS_OUTPUT.PUT_LINE(' YOU ARE DELETING '|| :OLD.firstname);		 
END IF;
END trig_check_age_del;
/
SHOW ERRORS


-- The trigger is fired when updating primary key in any table
--FESTIVAL_NATURES TABLE
-- The trigger is fired when updating primary key in  the festival_natures
CREATE OR REPLACE TRIGGER trig_stop_pk_update
AFTER UPDATE OF festival_nature_id ON festival_natures
BEGIN
	RAISE_APPLICATION_ERROR(-20003,'You cannot update the primary key');
	
END trig_stop_pk_update;
/
SHOW ERRORS

--LOCATIONS TABLE
-- The trigger is fired when updating primary key in the locations table
CREATE OR REPLACE TRIGGER trig_stop_pk_update_loc
AFTER UPDATE OF location_no ON locations
BEGIN
	RAISE_APPLICATION_ERROR(-20003,'You cannot update the primary key');
	
END trig_stop_pk_update_loc;
/
SHOW ERRORS

--STAFF TABLE 
-- The trigger is fired when updating primary key in the staff table
CREATE OR REPLACE TRIGGER trig_stop_pk_update_staff
AFTER UPDATE OF staff_id ON staff
BEGIN
	RAISE_APPLICATION_ERROR(-20003,'You cannot update the primary key');
	
END trig_stop_pk_update_staff;
/
SHOW ERRORS


/*-----------  ----------------------------
----------------DATABASE LEVEL TRIGGER-------------------
-------------------------------------------- ----**/
--trigger named 'trig_logon' that inserts date and time when user logs on the system into the 'activity_logs' table
CREATE OR REPLACE TRIGGER trig_logon
AFTER LOGON
ON DATABASE
BEGIN
       INSERT INTO activity_logs(user_logged, date_time)
       VALUES (USER, SYSDATE);
END;
   /
SHOW ERRORS
--trigger created with  no errors


/*----------------------------------
------------ENABLE | DISABLE TRIGGERS--------------
-------------------------**/

------To disable the triggers
ALTER TRIGGER trig_limit_login DISABLE;
ALTER TRIGGER trig_check_festival_dates DISABLE;
ALTER TRIGGER trig_check_age_del DISABLE;
ALTER TRIGGER trig_stop_pk_update DISABLE;
ALTER TRIGGER trig_stop_pk_update_loc DISABLE;
ALTER TRIGGER trig_stop_pk_update_staff DISABLE;
ALTER TRIGGER trig_logon DISABLE;

-------To enable the triggers

ALTER TRIGGER trig_limit_login ENABLE;
ALTER TRIGGER trig_check_festival_dates ENABLE;
ALTER TRIGGER trig_check_age_del ENABLE;
ALTER TRIGGER trig_stop_pk_update ENABLE;
ALTER TRIGGER trig_stop_pk_update_loc ENABLE;
ALTER TRIGGER trig_stop_pk_update_staff ENABLE;
ALTER TRIGGER trig_logon ENABLE;









