
/*
	GROUP 10
	Name: Dipen Maharjan, Tenzin Dhundup, Sarina Acharya,Tsering Khando
	UoN: 18406500, 18406552, 18406480, 18406499
*/
--creating userspace 
CREATE USER group10 IDENTIFIED BY 18406499;
GRANT CREATE SESSION TO group10;
GRANT CREATE table TO group10;
GRANT CREATE view TO group10;
GRANT CREATE sequence TO group10;
GRANT CREATE synonym TO group10;
GRANT CREATE procedure TO group10;
GRANT CREATE trigger TO group10;
GRANT CREATE cluster TO group10;
GRANT CREATE type TO group10;
GRANT unlimited tablespace TO group10;
GRANT ALL PRIVILEGES TO group10;
ALTER USER group10 quota unlimited ON system;

--DROPPING USERSPACE
DROP USER group10 CASCADE;