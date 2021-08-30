--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-insert.sql

--Student ID: 30147573
--Student Name: Kuan Jun Qiang
--Tutorial No: 5

/* Comments for your marker:

animal table had changed to animals due to my previous assignment used animal table already and it will be violated


*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the 
supplied T2-cb-insert.sql file script file, and SQL commands which will  
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e. 
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW



Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000001,'F',NULL,'AUS10','Myrmecobius', 'fasciatus');
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000002,'M',NULL,'AUS10','Myrmecobius', 'fasciatus');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (100001,'01-Jan-2021', 000001, 000002);
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000003,'F',100001,'AUS10','Myrmecobius', 'fasciatus');
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000004,'F',100001,'AUS10','Myrmecobius', 'fasciatus');

Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000005,'F',NULL,'AUS30','Sarcophilus', 'harrisii');
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000006,'M',NULL,'AUS30','Sarcophilus', 'harrisii');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (100002,'01-Jan-2021', 000005, 000006);
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000007,'F',100002,'AUS30','Sarcophilus', 'harrisii');

Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000008,'F',NULL,'AUS20','Macrotis', 'lagotis');
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000009,'M',NULL,'AUS20','Macrotis', 'lagotis');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (100003,'01-Jan-2021', 000008, 000009);

Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000010,'M',NULL,'AUS20','Diceros', 'bicornis');
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000011,'F',NULL,'AUS20','Diceros', 'bicornis');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (100004,'01-Jan-2021', 000010, 000011);

Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000012,'F',NULL,'SAF20','Diceros', 'bicornis');

commit;
