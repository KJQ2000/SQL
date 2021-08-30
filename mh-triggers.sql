--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-triggers.sql

--Student ID: 30147573
--Student Name: Kuan Jun Qiang
--Tutorial No: 5

/* Comments for your marker:




*/

/* 
    Q1 
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/
CREATE or REPLACE trigger LOCATION_UPDATE
after insert or update of LOCATION_NBR_DESTINATION on mh.charter_leg
for each row

begin
    if location_nbr_origin = location_nbr_destination then
        update mh.charter_leg
            set Location_nbr_destination = :new.location_nbr_destination
            where location_nbr_origin = :old.location_nbr_destination;
    dbms_output.put_line ('Related location number in charter leg have been updated');
    end if;
end;

/* 
    Q2
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/
CREATE or REPLACE trigger CHARTER_UPDATE
after insert or update on mh.charter
for each row

begin
    if mh.charter.charter_cost_per_hour < mh.helicopter_type.HT_cost_per_hour then
        update mh.charter
            set mh.charter.charter_cost_per_hour = :old.mh.charter.charter_cost_per_hour;
    dbms_output.put_line ('Related update of charter cost per hour in charter have been prevented');    
    end if;
    if mh.charter.charter_nbr_passenger < mh.helicopter_type.HT_NBR_seats then
        update mh.charter
            set mh.charter.charter_nbr_passenger = :old.mh.charter.charternbr_passenger;
    dbms_output.put_line ('Related update of charter nbr passenger in charter have been prevented'); 
    end if;
end;

/* 
    Q3
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/





