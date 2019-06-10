--@F:\db_group_10\cursor_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

--showing output on screen
SET SERVEROUTPUT ON 

--using implicit cursor to update the firstname in the staff table
CREATE OR REPLACE PROCEDURE proc_imp_cursor(in_fname staff.firstname%TYPE,in_lname staff.lastname%TYPE, in_nname staff.firstname%TYPE) IS 
vc_fname VARCHAR2(15);
vc_lname VARCHAR2(15);
vc_newname VARCHAR2(15);
exp1 EXCEPTION;
BEGIN
	vc_newname := in_nname;
	vc_fname := in_fname;
	vc_lname := in_lname;
	IF in_nname is NULL THEN RAISE exp1;
	ELSE
		UPDATE staff SET firstname=in_nname
				WHERE vc_fname =in_fname AND lastname = in_lname;
		IF SQL%FOUND THEN 
			DBMS_OUTPUT.PUT_LINE(vc_fname || ' UPDATED ');
		ELSE 
			DBMS_OUTPUT.PUT_LINE('USER DOES NOT EXIST');
		END IF;
	END IF;
--using exception handling
EXCEPTION
	WHEN exp1 THEN 
		DBMS_OUTPUT.PUT_LINE('NEW NAME NOT INSERTED');
END proc_imp_cursor;
/
SHOW ERRORS


--using explicit cursor with for loop to retrieve the firstname, lastname, and salaray of staff whose salary is greater than salary provided
CREATE OR REPLACE PROCEDURE proc_exp_cursor(in_salary staff.salary%TYPE)IS
vn_rowcount NUMBER(2):=0;
CURSOR cur_salary IS 
	SELECT firstname,lastname,salary 
	FROM staff
	WHERE salary>in_salary;

BEGIN
		DBMS_OUTPUT.PUT_LINE('S.No'||'        '||'First Name'||'         '||'Last Name'||'            '||'Salary');
		
		FOR rec_cur_salary IN cur_salary LOOP
			DBMS_OUTPUT.PUT_LINE(cur_salary%ROWCOUNT||'   '||rec_cur_salary.firstname||'          '|| rec_cur_salary.lastname||'              '||rec_cur_salary.salary);
			vn_rowcount := cur_salary%ROWCOUNT;
		END LOOP;
		
		DBMS_OUTPUT.PUT_LINE('THERE ARE '|| vn_rowcount ||' STAFF. ');

END proc_exp_cursor;
/
SHOW ERRORS


--cursor using while loop to retrieve the staff id, firstname,lastname, and salary where staff salary is greater than provided salary
--doesn't returns the data if the salary is greater than the salary in the database
CREATE OR REPLACE PROCEDURE proc_ckSal(in_salary staff.salary%TYPE)IS 
	CURSOR cur_salary IS 
		SELECT staff_id,firstname,lastname,salary
		FROM staff
		WHERE salary>in_salary;
	rec_cur_salary cur_salary%ROWTYPE;

BEGIN
DBMS_OUTPUT.PUT_LINE('S.No'||'        '||'First Name'||'         '||'Last Name'||'            '||'Salary');
OPEN cur_salary;
FETCH cur_salary INTO rec_cur_salary;
	IF cur_salary%NOTFOUND THEN
		DBMS_OUTPUT.PUT_LINE('SALARY RANGE TOO HIGH');
		
	ELSE 
	WHILE cur_salary%FOUND LOOP
			DBMS_OUTPUT.PUT_LINE(rec_cur_salary.staff_id ||'  '|| rec_cur_salary.firstname||'  ' || rec_cur_salary.lastname||'  ' || rec_cur_salary.salary);
			FETCH cur_salary INTO rec_cur_salary;
	END LOOP;
		
	END IF;
CLOSE cur_salary;
END proc_ckSal;
/
SHOW ERRORS










