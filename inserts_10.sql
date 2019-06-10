--@F:\db_group_10\inserts_10.sql
/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/


/*
	Insert Queries
	
*/
--insert into addresses  object table
INSERT INTO addresses(street, city,state,country) VALUES ('SOUTH SCIOTO','CIRCLEVILLE','OHIO','USA');
INSERT INTO addresses(city,state,country) VALUES ('HAWAII','HAWAII','USA');
INSERT INTO addresses(city,state,country) VALUES ('HOLLAND','MICHIGAN','USA');
INSERT INTO addresses(city,state,country) VALUES ('PITTSBURGH','PENNSYLVANIA','USA');
INSERT INTO addresses VALUES ('801 E. CESAR E. CHAVEZ BLVD','SAN ANTONIO','TEXAS','USA');
INSERT INTO addresses VALUES ('FITCH STREET','NORWALK','CONNECTICUT','USA');
INSERT INTO addresses VALUES ('MAIN STREET','VERMILION','OHIO','USA');
INSERT INTO addresses VALUES ('SPARTANBURG','SPARTANBURG','SOUTH CAROLINA','USA');
INSERT INTO addresses VALUES ('THE HIGHLANDS','LOUISVILLE','KENTUCKY','USA');
INSERT INTO addresses VALUES ('WESTERN GATEWAY PARK','DES MOINES','IOWA','USA');
INSERT INTO addresses VALUES ('7250 STATEAVE','KANSAS CITY','KANSAS','USA');
INSERT INTO addresses VALUES ('13590 N. 47th AVE.','PHOENIX','ARIZONA','USA');
INSERT INTO addresses VALUES ('1901 CONVENTION CENTER DR','MIAMI BEACH','FLORIDA','USA');
INSERT INTO addresses VALUES ('3800 NAPOLEON LN','IOWA CITY','IOWA','USA');
INSERT INTO addresses VALUES ('100 COLUMBUS BLVD, HARTFORD, CT 06103','HARTFORD','CONNECTICUT','USA');

--insert into festival_nature using seq_festival_naturesuence
INSERT INTO festival_natures (festival_nature_id, nature_name)
VALUES(seq_festival_natures.NEXTVAL, 'CULTURAL');

INSERT INTO festival_natures (festival_nature_id, nature_name)
VALUES(seq_festival_natures.NEXTVAL, 'RELIGIOUS');

INSERT INTO festival_natures (festival_nature_id, nature_name)
VALUES(seq_festival_natures.NEXTVAL, 'FOOD');

INSERT INTO festival_natures (festival_nature_id, nature_name)
VALUES(seq_festival_natures.NEXTVAL, 'MUSIC');

INSERT INTO festival_natures (festival_nature_id, nature_name)
VALUES(seq_festival_natures.NEXTVAL, 'GAMING');


--inserting data into locations table
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='CIRCLEVILLE';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='HAWAII';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='HOLLAND';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='PITTSBURGH';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='SAN ANTONIO';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='NORWALK';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='VERMILION';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='SPARTANBURG';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='LOUISVILLE';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='DES MOINES';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='KANSAS CITY';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='PHOENIX';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='MIAMI BEACH';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='IOWA CITY';
INSERT INTO locations(location_no, address) SELECT seq_locations.NEXTVAL, REF(a) FROM addresses a WHERE city='HARTFORD';


--inserting into festivals table
INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(2,2,'ALOHA FESTIVAL',activity_varray_type(activity_type('FLORAL PARADE','OUTDOOR'),activity_type('PRESENTATION OF ROYAL COURT','OUTDOOR')),'14-SEP-2019','21-SEP-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(3,2,'TULIP TIME FESTIVAL',activity_varray_type(activity_type('PARADES','OUTDOOR'),activity_type('FIREWORKS','OUTDOOR')),'6-MAY-2019','7-MAY-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(4,2,'PITTSBURGH FOLK FESTIVAL',activity_varray_type(activity_type('FOLKDANCE','INDOOR'),activity_type('MUSIC','INDOOR')),'6-SEP-2019','7-SEP-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(5,2,'TEXAS FOLKLIFE FESTIVAL',activity_varray_type(activity_type('FOLKDANCE','INDOOR'),activity_type('BALLET','INDOOR')),'7-SEP-2019','10-SEP-2019');

-----------For Food festivals

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(1,4,'CIRCLEVILLE PUMPKIN SHOW',activity_varray_type(activity_type('WEIGHING PUMPKIN','OUTDOOR'),activity_type('MAKING PUMPKIN PIE','INDOOR')),'18-OCT-2019','20-OCT-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(6,4,'NORWALK OYSTER FESTIVAL',activity_varray_type(activity_type('FEAST','INDOOR')),'8-SEP-2019','20-SEP-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(7,4,'FESTIVAL OF THE FISH',activity_varray_type(activity_type('FISH FRYING','OUTDOOR'),activity_type('LOCAL BAND CONCERT','OUTDOOR')),'5-JUN-2019','8-JUN-2019');


----------FOR MUSIC FESTIVAL
INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(8,5,'MASTERWORKS FESTIVAL',activity_varray_type(activity_type('INTENSE ARTISTIC TRAINING','INDOOR'),activity_type('DEEP SPIRITUAL GROWTH','INDOOR')),'18-OCT-2019','20-OCT-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(9,5,'FORECASTLE FESTIVAL',activity_varray_type(activity_type('MUSIC','OUTDOOR'),activity_type('ART','OUTDOOR')),'8-SEP-2019','8-SEP-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(10,5,'80/35 MUSIC FESTIVAL',activity_varray_type(activity_type('ART','OUTDOOR')),'5-JUN-2019','8-JUN-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(11,5,'ELECTRONIC MUSIC MIDWEST',activity_varray_type(activity_type('LOCAL BAND CONCERT','OUTDOOR')),'7-SEP-2019','10-SEP-2019');


-------GAMING FESTIVAL
INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(12,6,'DEVFARE 2019',activity_varray_type(activity_type('MOBILE GAMING','INDOOR'),activity_type('PC GAMING','INDOOR')),'23-MAR-2019','27-MAR-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(13,6,'FLORIDA SUPERCON',activity_varray_type(activity_type('CONCERT','INDOOR'),activity_type('PC GAMING','INDOOR')),'8-SEP-2019','10-SEP-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(14,6,'RDX AUSTIN 2019',activity_varray_type(activity_type('ART','INDOOR'),activity_type('MOBILE GAMING','INDOOR')),'6-SEP-2019','11-SEP-2019');

INSERT INTO festivals(location_no,festival_nature_id,festival_name,activities,festival_start_date,festival_end_date)
VALUES(15,6,'CONNECTICON 2019',activity_varray_type(activity_type('COMIC STALL','INDOOR'),activity_type('COSPLAY DISPLAY','INDOOR')),'7-SEP-2019','11-SEP-2019');


--
--inserting into staff table
INSERT INTO staff (staff_id, firstname, lastname, address, contact, staff_gender, staff_email, staff_employed_date, salary, dob)
VALUES (seq_staff.NEXTVAL, 'DAVID', 'DOE', address_type('1148  Ashton Lane','LIBERTY HILL', 'TEXAS','USA'), contact_table_type(contact_type('MOBILE','+1 192-554-0133')), 'M', 'DAVIDDOE@HOTMAIL.COM', '12-MAY-2017','13000', '11-JUN-1980');

INSERT INTO staff (staff_id, firstname, lastname, address, contact, staff_gender, staff_email, staff_employed_date,salary, dob)
VALUES (seq_staff.NEXTVAL,  'SCOTT', 'WALLACE', address_type('2132  Randall Drive','HONOLULU','HAWAII','USA'), contact_table_type(contact_type('MOBILE','+1 194-564-0133')), 'M', 'SCOTTWALLACE@GMAI;.COM', '19-MAY-2017',  '10000', '11-FEB-1989');

INSERT INTO staff (staff_id, firstname, lastname, address, contact, staff_gender, staff_email, staff_employed_date, salary, dob)
VALUES (seq_staff.NEXTVAL,  'ELVENA ', 'JONES', address_type('775 ROCKY ROAD','WAYNE','PENNSYLVANIA','USA'), contact_table_type(contact_type('MOBILE','+1 272-775-0190')), 'F', 'ELVENAJONES@HOTMAIL.COM', '17-OCT-2018',  '8000', '11-APR-1984');

INSERT INTO staff (staff_id, firstname, lastname, address, contact, staff_gender, staff_email, staff_employed_date,salary, dob)
VALUES (seq_staff.NEXTVAL,  'KEVIA', 'PAYNE', address_type('4652 SUNSET DRIVE','PINE BLUFF','ARKANSAS','USA'), contact_table_type(contact_type('MOBILE','+1 102-875-0003')), 'F', 'KEVIAPAYNE@GMAIL.COM', '11-FEB-2018',  '9000', '11-MAY-1985');

INSERT INTO staff (staff_id, firstname, lastname, address, contact, staff_gender, staff_email, staff_employed_date,salary, dob)
VALUES (seq_staff.NEXTVAL,  'MENAKA', 'MORRISON', address_type('4090 MORRIS STREET','FOWLERTON','TEXAS','USA'), contact_table_type(contact_type('MOBILE','+1 198-123-3456')), 'F', 'MENAKA@HOTMAIL.COM', '18-JAN-2017',  '11000', '11-SEP-1981');

INSERT INTO staff (staff_id, firstname, lastname, address, contact, staff_gender, staff_email, staff_employed_date,salary, dob)
VALUES (seq_staff.NEXTVAL,  'CONNOR', 'PAYNE', address_type('4478 TRAILS END ROAD','ALBANY','NEW YORK','USA'), contact_table_type(contact_type('MOBILE','+1 129-123-0099')), 'M', 'CONNORPAYNE@GMAIL.COM', '12-JAN-2018', '14000', '11-NOV-1982');


--inserting into festival_staff table
INSERT INTO festival_staff(staff_id,location_no,festival_nature_id) VALUES (1,2,2);
INSERT INTO festival_staff(staff_id,location_no,festival_nature_id) VALUES (2,2,2);
INSERT INTO festival_staff(staff_id,location_no,festival_nature_id) VALUES (3,2,2);
INSERT INTO festival_staff(staff_id,location_no,festival_nature_id) VALUES (6,13,6);
INSERT INTO festival_staff(staff_id,location_no,festival_nature_id) VALUES (4,1,4);
INSERT INTO festival_staff(staff_id,location_no,festival_nature_id) VALUES (5,10,5);


--updating staff table 
UPDATE staff SET reports_to = 1 WHERE staff_id =2;
UPDATE staff SET reports_to = 1 WHERE staff_id =3;
UPDATE staff SET reports_to = 4 WHERE staff_id =5;
UPDATE staff SET reports_to = 4 WHERE staff_id =6;

