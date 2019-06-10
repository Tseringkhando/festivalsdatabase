--@F:\db_group_10\create_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/


/*-------------------
----------OBEJCTS-------------
--------------------*/
--creating the address_type
CREATE OR REPLACE TYPE address_type AS OBJECT (
	street VARCHAR2(50),
	city VARCHAR2(50),
	state VARCHAR2(50),
	country VARCHAR2(40))
/
SHOW ERRORS


--creating object table 'addresses' using address_type
CREATE TABLE addresses OF address_type;
SHOW ERRORS


--creating the activity_type
CREATE OR REPLACE TYPE activity_type AS OBJECT (
	activity_name VARCHAR2(50),
	category VARCHAR2(50))
/
SHOW ERRORS


--creating varray of activity_type
CREATE TYPE activity_varray_type AS VARRAY(10) OF activity_type;
/
SHOW ERRORS


--creating the contact_type
CREATE OR REPLACE TYPE contact_type AS OBJECT (
	medium VARCHAR2(25),
	contact_number VARCHAR2(25))
/
SHOW ERRORS


--creating the nested table named as contact_table_type from contact_type
CREATE TYPE contact_table_type AS TABLE OF contact_type;
/
SHOW ERRORS



/*-------------------------------------------------
---------- REALTIONAL TABLES-------------
-----------------------------------**/

--creating relational table named festival_natures
CREATE TABLE festival_natures (
	festival_nature_id NUMBER(7),
	nature_name VARCHAR2(25) NOT NULL
);


--creating the relational table named festival_natures referencing the address_type
CREATE TABLE locations (
	location_no NUMBER(7),
	address REF address_type SCOPE IS addresses  NOT NULL
);


--creating relational table named festivals of activities_varray_type
CREATE TABLE festivals(
	festival_nature_id NUMBER(7) NOT NULL,
	location_no NUMBER(7) NOT NULL,
	festival_name VARCHAR2(50) NOT NULL,
	activities activity_varray_type,
	festival_start_date DATE,
	festival_end_date DATE
);


--creating relational table named staffs
CREATE TABLE staffs(
	staff_id NUMBER(7),
	reports_to NUMBER(7),
	firstname VARCHAR2(20) NOT NULL,
	lastname VARCHAR2(20) NOT NULL,
	address address_type,
	staff_gender CHAR DEFAULT 'M',
	staff_email VARCHAR2(35) NOT NULL,
	staff_employed_date DATE NOT NULL,
	username VARCHAR2(30),
	password VARCHAR2(30),
	salary NUMBER(10,2) NOT NULL,
	dob DATE NOT NULL,
	contact contact_table_type)
	NESTED TABLE contact STORE AS contact_table;

	
--creating the table named as festival_staffs
CREATE TABLE festival_staff(
	staff_id NUMBER(7),
	location_no NUMBER(7),
	festival_nature_id NUMBER(7)
);


/* SEQUENCES */

--creating sequences for festival_natures
CREATE SEQUENCE seq_festival_natures
INCREMENT BY 1
START WITH 0000001;

--creating sequence for locations
CREATE SEQUENCE seq_locations
INCREMENT BY 1
START WITH 0000001;

--creating seuquence for the staff table
CREATE SEQUENCE seq_staff
INCREMENT BY 1
START WITH 0000001;



--renaming
RENAME staffs TO staff;

--setting defualt vvalue to staff table
ALTER TABLE staff
MODIFY  (staff_employed_date DEFAULT SYSDATE);


--creating table names 'activity_logs' to store the user login date and time 
CREATE TABLE activity_logs
(user_logged VARCHAR2(30),
	date_time DATE );
	