--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-queries.sql

--Student ID: 30147573
--Student Name: Kuan Jun Qiang
--Tutorial No: 5

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
    e.HT_NBR, e.EMP_NBR, em.EMP_LNAME, em.EMP_FNAME, to_char(e.end_last_annual_review, 'DY DD MON YYYY') as REVIEW_DATE
FROM
    mh.endorsement  e
    JOIN mh.employee    em ON e.emp_nbr = em.emp_nbr
WHERE
    to_char(e.end_last_annual_review, 'DD-MON-YYYY')> '31-MAR-2020'
ORDER BY e.end_last_annual_review DESC;

/*
    Q2
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
    c.charter_nbr, c.client_nbr, cl.client_lname, cl.client_fname, c.charter_special_reqs
FROM
    mh.charter  c
    JOIN mh.client cl ON c.client_nbr = cl.client_nbr
WHERE
    c.charter_special_reqs is not null
ORDER BY c.charter_nbr;
/*
    Q3
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
    c.charter_nbr, cl.client_fname || '' || cl.client_lname AS FULLNAME , c.charter_cost_per_hour
FROM
    mh.charter  c
    JOIN mh.client cl ON c.client_nbr = cl.client_nbr
    JOIN mh.charter_leg chl ON c.charter_nbr = chl.charter_nbr 
WHERE
    chl.location_nbr_destination = (SELECT chl.location_nbr_destination FROM mh.charter_leg chl JOIN mh.location l ON chl.location_nbr_destination = l.location_nbr WHERE l.location_name = 'MOUNT DOOM')
    AND c.charter_cost_per_hour < 1000 
    OR c.charter_special_reqs is null
ORDER BY
    FULLNAME DESC;
/*
    Q4
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
    ht.ht_nbr, ht.ht_name ,count(*) as numbers_of_helicopters_owned
FROM
    mh.helicopter h
    JOIN mh.helicopter_type ht ON h.ht_nbr = ht.ht_nbr
GROUP BY  ht.ht_nbr, ht.ht_name
HAVING
    count(*) > 1
ORDER BY
    count(*) desc;
/*
    Q5
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT 
    l.location_nbr, l.location_name, count(cl.location_nbr_origin) as number_of_time_location_used_as_origin
FROM
    mh.location l
    JOIN mh.charter_leg cl ON l.location_nbr = cl.location_nbr_origin
GROUP BY l.location_nbr, l.location_name
HAVING count(cl.location_nbr_origin)>1
ORDER BY
    count(cl.location_nbr_origin);

/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
    ht.ht_nbr, ht.ht_name ,sum(NVL(h.heli_hrs_flown,0)) as total_hours_flown
FROM
    mh.helicopter h
    RIGHT OUTER JOIN mh.helicopter_type ht ON ht.ht_nbr = h.ht_nbr
GROUP BY  ht.ht_nbr, ht.ht_name
ORDER BY
    total_hours_flown;

/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
    ch.charter_nbr, cl.cl_atd
FROM
    mh.charter_leg cl
    JOIN mh.charter ch ON cl.charter_nbr = ch.charter_nbr
    JOIN mh.employee e ON ch.emp_nbr = e.emp_nbr
WHERE
    e.emp_lname = 'Baggins'
    AND e.emp_fname = 'Frodo'
    AND cl.CL_ATA is not null
    AND cl.cl_leg_nbr = 1
ORDER BY cl.CL_ATA DESC;

/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
    ch.charter_nbr, c.client_nbr, c.client_lname, NVL(c.client_fname,'-'),CONCAT('$',ROUND(((SUM(cl.cl_ata - cl.cl_atd)*24))*ch.charter_cost_per_hour,2)) AS TOTALCHARTERCOST
FROM
    mh.client c
    JOIN mh.charter ch ON c.client_nbr = ch.client_nbr
    JOIN mh.charter_leg cl ON ch.charter_nbr = cl.charter_nbr
WHERE
    cl.cl_ata is not null
GROUP BY ch.charter_nbr, c.client_nbr, c.client_lname, c.client_fname, ch.charter_cost_per_hour
HAVING
(SUM(cl.cl_ata - cl.cl_atd)*24)*ch.charter_cost_per_hour <
        (
        SELECT
            AVG(((SUM(cl.cl_ata-cl.cl_atd)*24)* ch.charter_cost_per_hour))
        FROM
            mh.charter ch
            JOIN mh.charter_leg cl ON ch.charter_nbr = cl.charter_nbr
            group by cl.charter_nbr, charter_cost_per_hour
        )
ORDER BY TOTALCHARTERCOST DESC;

/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT 
    ch.charter_nbr, e.emp_fname || ' ' || e.emp_lname AS PILOTNAME, c.client_fname || ' ' || c.client_lname AS CLIENTNAME
FROM
    mh.charter ch
    JOIN mh.client c ON ch.client_nbr = c.client_nbr
    JOIN mh.employee e ON ch.emp_nbr = e.emp_nbr
    JOIN mh.charter_leg cl ON ch.charter_nbr = cl.charter_nbr
WHERE
    cl.cl_ata is not null
GROUP BY
    ch.charter_nbr, e.emp_fname, e.emp_lname, c.client_fname, c.client_lname, cl.charter_nbr
HAVING
    SUM(cl.cl_etd - cl.cl_atd)>= 0
ORDER BY cl.charter_nbr;

/*
    Q10
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT
    DISTINCT c.client_nbr, c.client_fname || ' ' || c.client_lname AS CLIENTNAME,
    (
    SELECT 
        l.location_name
    FROM 
    mh.charter ch
    JOIN mh.client c ON ch.client_nbr = c.client_nbr
    JOIN mh.charter_leg cl ON ch.charter_nbr = cl.charter_nbr
    JOIN mh.location l ON cl.location_nbr_destination = l.location_nbr
    GROUP BY c.client_nbr, cl.location_nbr_destination, l.location_name
    HAVING COUNT(cl.location_nbr_destination)=(
    SELECT MAX(mycount)
    FROM(
    SELECT l.location_name, COUNT(cl.location_nbr_destination) MYCOUNT
    FROM
    mh.charter ch
    JOIN mh.client c ON ch.client_nbr = c.client_nbr
    JOIN mh.charter_leg cl ON ch.charter_nbr = cl.charter_nbr
    JOIN mh.location l ON cl.location_nbr_destination = l.location_nbr
    GROUP BY c.client_nbr, cl.location_nbr_destination, l.location_name)))AS FAVOURITE_DESTINATION,
    (
    SELECT 
        MAX(MYCOUNT)
    FROM (SELECT cl.location_nbr_destination, COUNT(cl.location_nbr_destination) MYCOUNT
FROM
    mh.charter ch
    JOIN mh.client c ON ch.client_nbr = c.client_nbr
    JOIN mh.charter_leg cl ON ch.charter_nbr = cl.charter_nbr
    JOIN mh.location l ON cl.location_nbr_destination = l.location_nbr
WHERE
    cl.cl_ata is not null
GROUP BY
     c.client_nbr, cl.location_nbr_destination)) AS times_visited
FROM
    mh.charter ch
    JOIN mh.client c ON ch.client_nbr = c.client_nbr
    JOIN mh.charter_leg cl ON ch.charter_nbr = cl.charter_nbr
    JOIN mh.location l ON cl.location_nbr_destination = l.location_nbr
WHERE
    cl.cl_ata is not null
GROUP BY
    c.client_nbr, c.client_fname, c.client_lname, cl.location_nbr_destination
