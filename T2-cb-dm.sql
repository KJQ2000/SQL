--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-dm.sql

--Student ID: 30147573
--Student Name: Kuan Jun Qiang
--Tutorial No: 5

/* Comments for your marker:

animal table had changed to animals due to my previous assignment used animal table already and it will be violated


*/

/*
Task 2 (c):

Complete the listed DML actions
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (i)
DROP SEQUENCE ANIMAL_SEQ;
CREATE SEQUENCE ANIMAL_SEQ START WITH 500 INCREMENT BY 1;

DROP SEQUENCE BREEDING_EVENT_SEQ;
CREATE SEQUENCE BREEDING_EVENT_SEQ START WITH 500 INCREMENT BY 1;



-- (ii)
Update ANIMALS
set centre_id =(SELECT centre_id FROM centre WHERE centre_name = 'Kruger National Park')
where centre_id = (SELECT centre_id FROM centre WHERE centre_name = 'SanWild Wildlife Sanctuary');
COMMIT;

Delete From CENTRE
where centre_name = 'SanWild Wildlife Sanctuary';
COMMIT;


-- (iii)
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000013,'F',NULL, (SELECT centre_id FROM centre WHERE centre_name = 'Australia Zoo') ,(SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil'), (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil'));
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000014,'M',NULL, (SELECT centre_id FROM centre WHERE centre_name = 'Werribee Open Range Zoo') ,(SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil'), (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil'));
COMMIT;


-- (iv)
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (100009,'10-Feb-2021', 000013, 000014);
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000015,'F',100009, (SELECT centre_id FROM centre WHERE centre_name = 'Australia Zoo') ,(SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil'), (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil'));
Insert into ANIMALS (ANIMAL_ID,ANIMAL_SEX,BREVENT_ID,CENTRE_ID,SPEC_GENUS,SPEC_NAME) values (000016,'M',100009, (SELECT centre_id FROM centre WHERE centre_name = 'Australia Zoo') ,(SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil'), (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil'));
COMMIT;

