--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-cb-schm.sql

--Student ID: 30147573
--Student Name: Kuan Jun Qiang
--Tutorial No: 5

/* Comments for your marker:
animal table had changed to animals due to my previous assignment used animal table already and it will be violated
*/
drop table species cascade constraints purge;
drop table animals cascade constraints purge;
drop table breeding_event cascade constraints purge;
drop table centre cascade constraints purge;
/*
Using the model and details supplied, and the supplied T1-cb-schm.sql
file, create an SQL schema file which can be used to create this database in
Oracle.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

CREATE TABLE species (
    spec_genus          VARCHAR2 (20)NOT NULL,
    spec_name           VARCHAR2 (20)NOT NULL,   
    spec_popular_name   VARCHAR2 (40) NOT NULL,
    spec_family         VARCHAR2 (20) NOT NULL,
    spec_natural_range  VARCHAR2 (100) NOT NULL,
    CONSTRAINT spec_pk  PRIMARY KEY ( spec_genus, spec_name )
);
-- COMMENT SECTION FOR TABLE species --
COMMENT ON COLUMN species.spec_genus IS
    'The species genus';
COMMENT ON COLUMN species.spec_name IS
    'The species name';
COMMENT ON COLUMN species.spec_popular_name IS
    'The species popular name';
COMMENT ON COLUMN species.spec_family IS
    'The species family name';
COMMENT ON COLUMN species.spec_natural_range IS
    'Description of the natural range of the species';

ALTER TABLE species ADD CONSTRAINT spec_popular_name_un UNIQUE (spec_popular_name);


CREATE TABLE animals (
    animal_id    NUMBER (6) NOT NULL,
    animal_sex   CHAR(1) NOT NULL,
    brevent_id   NUMBER (6),
    centre_id    CHAR(6) NOT NULL,
    spec_genus   VARCHAR2 (20) NOT NULL,
    spec_name    VARCHAR2 (20) NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY (animal_id),
    CONSTRAINT ck_animal_sex CHECK (animal_sex IN ('F', 'M')),
    CONSTRAINT spec_id_fk FOREIGN KEY (spec_genus, spec_name)
        REFERENCES species (spec_genus, spec_name)
            ON DELETE CASCADE
);
--COMMENT SECTION FOR THE TABLE animals--
COMMENT ON COLUMN animals.animal_id IS 
    'The identifier for the animal';
COMMENT ON COLUMN animals.animal_sex IS 
    'The animal sex (M or F)';
COMMENT ON COLUMN animals.brevent_id IS
    'If bred in captivity (i.e. at a centre), the id of the breeding event
     which produced the animal. Animals which have been captured
     from the wild will have no brevent_id assigned';
COMMENT ON COLUMN animals.centre_id IS
     'The home center where the animal is normally located.
      Animals are sometimes located at other centres for a breeding
      event';
COMMENT ON COLUMN animals.spec_genus IS
    'The species genus for the animal';
COMMENT ON COLUMN animals.spec_name IS
    'The species name  for the animal';

CREATE TABLE breeding_event (
    brevent_id      NUMBER(6) NOT NULL,
    brevent_date    DATE NOT NULL,
    mother_id       NUMBER(6) NOT NULL,
    father_id       NUMBER (6) NOT NULL,
    CONSTRAINT brevent_pk PRIMARY KEY ( brevent_id ),
    CONSTRAINT mother_id_fk FOREIGN KEY (mother_id)
        REFERENCES animals (animal_id),
    CONSTRAINT father_id_fk FOREIGN KEY (father_id)
        REFERENCES animals (animal_id)
);

--COMMENT SECTION FOR THE TABLE breeding_event--
COMMENT ON COLUMN breeding_event.brevent_id IS
    'The identifier for the breeding event';
COMMENT ON COLUMN breeding_event.brevent_date IS
    'The date on which the breeding event took place';
--COMMENT FOR MOTHER AND FATHER
COMMENT ON COLUMN breeding_event.mother_id IS
    'The animal_id of the animal who was the mother';
COMMENT ON COLUMN breeding_event.father_id IS
    'The animal_id of the animal who was the fatehr';

CREATE TABLE centre (
    centre_id       CHAR(6) CONSTRAINT centre_pk PRIMARY KEY,
    centre_name     VARCHAR2(40) NOT NULL, 
    centre_address  VARCHAR2(100) NOT NULL,
    centre_director VARCHAR2(30) NOT NULL,
    centre_phone_no VARCHAR2(20) NOT NULL
);

--COMMENT SECTION FOR TABLE centre--

COMMENT ON COLUMN centre.centre_id IS
    'The identifier for the center';
COMMENT ON COLUMN centre.centre_name IS
    'The centre name';
COMMENT ON COLUMN centre.centre_address IS
    'The centre address';
COMMENT ON COLUMN centre.centre_director IS
    'The name of the centres director';
COMMENT ON COLUMN centre.centre_phone_no IS
    'The centres phone contact number';

ALTER TABLE centre ADD CONSTRAINT centre_name_un UNIQUE (centre_name);

ALTER TABLE animals
    ADD CONSTRAINT brevent_id_fk FOREIGN KEY (brevent_id)
        REFERENCES breeding_event (brevent_id)
            ON DELETE SET NULL;

ALTER TABLE animals
    ADD CONSTRAINT centre_id_fk FOREIGN KEY (centre_id)
        REFERENCES centre (centre_id)
            ON DELETE CASCADE;