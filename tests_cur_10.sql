--@F:\db_group_10\tests_cur_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

--Testing Cursor

/*-----------------------------------
---------for 'proc_imp_cursor'-------
-----------------------------------*/
--shows all the columns of staff table
DESC staff;

--checking the total staff
SELECT firstname FROM staff;
--Result: 6 rows returned

INSERT INTO staff (staff_id,firstname,lastname,staff_email,salary,dob)
VALUES(8,'RAM','SHRESTHA','123@gmail.com','10000', '11-FEB-1989');

--executing procedure
EXEC proc_imp_cursor('DAVID','DOE','SHYAM');
--Result: FIRST NAME DAVID UPDATED TO SHYAM

SELECT firstname FROM staff;
--Result: 7 rows returned

--re executing with firstname not in sites table
EXEC proc_imp_cursor('TENZIN','SHERPA','');
--USER DOES NOT EXIST
EXEC proc_imp_cursor('SHYAM','','');
--USER DOES NOT EXIST
SELECT firstname FROM staff;



/*----------------------------------------
---------for 'proc_exp_cursor'-------
-----------------------------------------*/
--Testing of explicit cursor

--checking all the rows from staff table
SELECT salary FROM staff;
--8 rows selected

--executing cursor with value 10000 in parameter
EXEC proc_exp_cursor(10000);
--Result: THERE ARE 3 STAFF

--executing cursor with value 6000 in parameter
EXEC proc_exp_cursor(6000);
--Result: THERE ARE 8 STAFF

--executing cursor with value 99000 in parameter
EXEC proc_exp_cursor(99000);
--Result: THERE ARE 0 STAFF


/*----------------------------------------
---------for 'proc_ckSal'---------
-----------------------------------------*/
--checking all the rows from staff table
SELECT salary FROM staff;
--8 rows selected

--executing procedure with value 6000
EXEC proc_ckSal(6000);
--Result: SHOWS TABLE with 8 rows

--executing procedure with value 10000
EXEC proc_ckSal(10000);
--Result: SHOWS TABLE with 3 rows 

--executing procedure with value 100000
EXEC proc_ckSal(100000);
--Result: SALARY RANGE TOO HIGH