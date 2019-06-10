--@F:\db_group_10\drop_10.sql

/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

/*------------------------------------
------------ All the drop --------------
--------------------------------------------**/

--dropping triggers
DROP TRIGGER trig_check_age_del;
DROP TRIGGER trig_stop_pk_update_loc;
DROP TRIGGER trig_stop_pk_update;
DROP TRIGGER trig_check_festival_dates;
DROP TRIGGER trig_stop_pk_update_staff;
DROP TRIGGER trig_logon;
DROP TRIGGER trig_limit_login;


--only delete rows from all tables
DELETE FROM festival_staff;
DELETE FROM festivals;
DELETE FROM staff;
DELETE FROM locations;
DELETE FROM festival_natures;
DELETE FROM activity_logs;



--dropping other check constraints
ALTER TABLE staff
DROP CONSTRAINT uk_staff_email;

ALTER TABLE staff
DROP CONSTRAINT ck_staff_gender;

ALTER TABLE staff
DROP CONSTRAINT ck_firstname;

ALTER TABLE staff
DROP CONSTRAINT ck_lastname;

--dropping all the foreign keys
ALTER TABLE festival_staff
DROP CONSTRAINT fk_fs_staff;

ALTER TABLE festival_staff
DROP CONSTRAINT fk_fs_festivals;

ALTER TABLE festivals
DROP CONSTRAINT fk_f_festival_natures;

ALTER TABLE festivals
DROP CONSTRAINT fk_f_locations;

ALTER TABLE staff
DROP CONSTRAINT fk_s_staff;

--dropping all the primary keys

ALTER TABLE festival_staff
DROP CONSTRAINT pk_festival_staff;

ALTER TABLE festivals
DROP CONSTRAINT pk_festivals CASCADE;

ALTER TABLE festival_natures
DROP CONSTRAINT pk_festival_natures;

ALTER TABLE locations
DROP CONSTRAINT pk_locations;

ALTER TABLE staff
DROP CONSTRAINT pk_staff CASCADE;


--dropping tables
DROP TABLE festival_staff;
DROP TABLE festivals;
DROP TABLE staff;
DROP TABLE locations;
DROP TABLE festival_natures;
DROP TABLE activity_logs;

--dropping object table addresses
DROP TABLE addresses;

--dropping object types

DROP TYPE activity_varray_type;
DROP TYPE address_type;
DROP TYPE activity_type;
DROP TYPE contact_table_type;
DROP TYPE contact_type;

--dropping all the sequences
DROP SEQUENCE seq_festival_natures;
DROP SEQUENCE seq_locations;
DROP SEQUENCE seq_staff;


--dropping cursors
DROP PROCEDURE proc_imp_cursor;
DROP PROCEDURE proc_exp_cursor;
DROP PROCEDURE proc_ckSal;

--dropping procedures only
DROP PROCEDURE proc_add_addresses;
DROP PROCEDURE proc_delete_addresses_street; 
DROP PROCEDURE proc_delete_addresses_city;
DROP PROCEDURE proc_delete_addresses_state;
DROP PROCEDURE proc_delete_addresses_country; 
DROP PROCEDURE proc_add_location;
DROP PROCEDURE proc_delete_location; 
DROP PROCEDURE proc_add_festival_natures; 
DROP PROCEDURE proc_delete_festival_nature;
DROP PROCEDURE proc_add_festival;
DROP PROCEDURE proc_delete_festival;
DROP PROCEDURE proc_add_staff;
DROP PROCEDURE proc_delete_staff;
DROP PROCEDURE proc_add_festival_staff; 
DROP PROCEDURE proc_delete_festival_staff;



--dropping procedures of functions
DROP PROCEDURE proc_count_staff;
DROP PROCEDURE proc_generate_age_staff;
DROP PROCEDURE proc_duration_of_festival;
DROP PROCEDURE proc_update_username_password;


--dropping functions
DROP FUNCTION func_count_staff;
DROP FUNCTION func_generate_age_staff;
DROP FUNCTION func_duration_of_festival;
DROP FUNCTION func_generate_staff_username;
DROP FUNCTION func_generate_staff_password;


--dropping package
DROP PACKAGE c_package;


--to purge all the objects from the database
PURGE RECYCLEBIN;