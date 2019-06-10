--@F:\db_group_10\alters_10.sql
--ALTER SCRIPT
/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/

/*---------------------------
---------PRIMARY KEYS------------
------------------------------------*/

--primary key for festival_natures table
ALTER TABLE festival_natures
ADD CONSTRAINT pk_festival_natures
PRIMARY KEY (festival_nature_id);

--primary key for locations table
ALTER TABLE locations
ADD CONSTRAINT pk_locations
PRIMARY KEY (location_no);


--primary key for staff table
ALTER TABLE staff
ADD CONSTRAINT pk_staff
PRIMARY KEY (staff_id);


--primary key for festival_staff table
ALTER TABLE festival_staff
ADD CONSTRAINT pk_festival_staff
PRIMARY KEY (staff_id,location_no,festival_nature_id);


--primary key for festivals table
ALTER TABLE festivals
ADD CONSTRAINT pk_festivals
PRIMARY KEY (festival_nature_id,location_no);


/*---------------------------
---------FOREIGN KEYS------------
------------------------------------*/

--foreign keys of festivals table
ALTER TABLE festivals
ADD CONSTRAINT fk_f_locations
FOREIGN KEY (location_no)
REFERENCES locations(location_no);

ALTER TABLE festivals
ADD CONSTRAINT fk_f_festival_natures
FOREIGN KEY (festival_nature_id)
REFERENCES festival_natures(festival_nature_id);


--foreign key of staff table
ALTER TABLE staff
ADD CONSTRAINT fk_s_staff
FOREIGN KEY (reports_to)
REFERENCES staff(staff_id);


--foreign key of festival_staff table
ALTER TABLE festival_staff
ADD CONSTRAINT fk_fs_staff
FOREIGN KEY (staff_id)
REFERENCES staff(staff_id);


ALTER TABLE festival_staff
ADD CONSTRAINT fk_fs_festivals
FOREIGN KEY (location_no, festival_nature_id)
REFERENCES festivals(location_no, festival_nature_id);


/* ---------------------
---------CHECK CONSTRAINTS---
-------------- -------------*/

--gender of the staff shoul be m, f, o
ALTER TABLE staff
ADD CONSTRAINT ck_staff_gender
CHECK (staff_gender IN ('M','F','O'));

--festival name should be in upper case
ALTER TABLE festivals
ADD CONSTRAINT ck_festivals
CHECK (festival_name=UPPER(festival_name));


--staff name should be in upper case
ALTER TABLE staff
ADD CONSTRAINT ck_firstname
CHECK (firstname=UPPER(firstname));

ALTER TABLE staff
ADD CONSTRAINT ck_lastname
CHECK (lastname=UPPER(lastname));


/* ---------------------
---------UNIQUE CONSTRAINTS---
-------------- -------------*/

--email of the staff should not repeat 
ALTER TABLE staff 
ADD CONSTRAINT uk_staff_email
UNIQUE (staff_email);

