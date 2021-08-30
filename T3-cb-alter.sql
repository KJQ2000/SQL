--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-cb-alter.sql

--Student ID: 30147573
--Student Name: Kuan Jun Qiang
--Tutorial No: 5

/* Comments for your marker:

animal table had changed to animals due to my previous assignment used animal table already and it will be violated


*/

/*
Task 3:

Make the listed changes to the "live" database
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (a)
ALTER TABLE CENTRE ADD(
    total_offspring NUMBER(10,0)DEFAULT 0
);

COMMENT ON COLUMN centre.total_offspring IS 'Total number of offspring which are born at the centre';
COMMIT;

-- (b)
/*
******* Explain here your selected approach and its advantage/s *********
A new column on Animal named dead_animal added to show the current life status of the animal.
'A' represent alive while 'D' represent dead. 
Advantage: simple and easy to understand
*/
ALTER TABLE animals ADD(
    dead_animal CHAR(1) DEFAULT 'A'
);

Update animals
set dead_animal = 'D'
WHERE animal_id = 000001;

COMMENT ON COLUMN animals.dead_animal IS 'Life status of the animal';
COMMIT;


-- (c)
ALTER TABLE centre ADD(
    centre_type VARCHAR2 (20)DEFAULT 'Other'
);

Update centre
set centre_type = 'Zoo'
    Where centre_name LIKE '%Zoo%';
    
Update centre
set centre_type = 'Wildlife Park'
    WHERE centre_name LIKE '%Park%';

Update centre
set centre_type = 'Sanctuary'
    WHERE centre_name LIKE '%Sanctuary%';

Update centre
set centre_type = 'Nature Reserve'
    WHERE centre_name LIKE '%Reserve%';

COMMENT ON COLUMN
centre.centre_type IS 'Type of centre';

COMMIT;
