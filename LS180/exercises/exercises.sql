-- ### SQL
-- ##- Easy 1
-- ----------------------------------------------------------------------------
-- #- Create a Database

createdb animals

-- #- Create a Table

CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age int,
  species varchar(15)
);

-- #- Insert Data

INSERT INTO birds
VALUES 
(1, 'Charlie', 3, 'Finch'),
(2, 'Allie', 5, 'Owl'),
(3, 'Jennifer', 3, 'Magpie'),
(4, 'Jamie', 4, 'Owl'),
(5, 'Roy', 8, 'Crow');

-- #- Select Data

SELECT * FROM birds;

-- #- WHERE clause

SELECT * FROM birds WHERE age < 5;

-- #- Update Data

UPDATE birds
SET species = 'Raven'
WHERE species = 'Crow';

-- #- Delete Data

DELETE FROM birds
WHERE species = 'Finch' and age = 3;

-- #- Add Constraint

ALTER TABLE birds
ADD CHECK (age >0);

-- #- Drop Table

DROP TABLE birds;

-- #- Drop Database
-- from the console

dropdb animals

-- ##- DML, DDL, and DCL
-- ----------------------------------------------------------------------------
-- #- 1

-- DDL -> creates and controls the schema (relational structure and rules for a database)

CREATE DATABASE birds;

ALTER TABLE example
ALTER COLUMN name SET NOT NULL;

-- DML -> create and manipulates the actual data in the dataset

INSERT INTO birds
VALUES ();

-- #- 2

--DML

-- #- 3

-- DDL

-- #- 4

-- DDL

-- #- 5

-- DML

-- #- 6

-- DML

-- #- 7

-- psql console command

-- #- 8

-- DDL

-- #- 9

-- DDL

-- #- 10

-- DDL

-- ##- DDL
-- ----------------------------------------------------------------------------
-- #- Create an Extrasolar Planetary Database
$ createdb extrasolar;

CREATE TABLE stars (
  id serial PRIMARY KEY, 
  name varchar(25) UNIQUE NOT NULL,
  distance int NOT NULL CHECK (distance > 0),
  spectral_type char(1),
  companions int NOT NULL CHECK (companions >= 0)
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1),
  mass int
);


-- #- Relating Stars and Planets

ALTER TABLE planets
ADD COLUMN star_id int NOT NULL REFERENCES stars(id);


-- #- Increase Star Name Length
ALTER TABLE stars
ALTER COLUMN name
TYPE varchar(50);

-- #- Stellar Distance Precision

ALTER TABLE stars
ALTER column distance
TYPE numeric;


-- #- Check Values in list
ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;


-- #- Enumerated Types

ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check;
-- 
CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');
-- 
ALTER TABLE stars
ALTER COLUMN spectral_type TYPE spectral_type_enum
                           USING spectral_type::spectral_type_enum;

-- #- Planetary Mass Precision



-- #- Add a Semi-Major Axis Column

-- #- Add a Moons Table

-- #- Delete the Database

-- #- DML (Data Manipulation Language)
-- ----------------------------------------------------------------------------
-- #- Set up Database

-- #- Insert Data for Parts and Devices

-- #- INNER JOIN

-- #- SELECT part_number

-- #- Aggregate Functions

-- #- ORDER BY

-- #- IS NULL and IS NOT NULL

-- #- Oldest Device

-- #- UPDATE device_id

-- #- Delete Accelerometer

-- #- Medium: Many to Many
-- ----------------------------------------------------------------------------
-- #- Set up Database

-- #- Get Customers with Services

-- #- Get Customers with no services

-- #- Get services with no customers

-- #- services for each customer

-- #- Services with at least 3 customers

-- #- Total gross income

-- #- Add new customer

-- #- Hypothetically

-- #- Deleting Rows

-- #- Medium: Subqueries and More
-- ----------------------------------------------------------------------------
-- #- Set up the Database using \copy

-- #    - Conditional Subqueries: IN

-- #    - Conditional Subqueries: NOT IN

-- #    - Conditional Subqueries: EXISTS

-- #    - Query from a virtual Table

-- #    - Scalar Subqueries

-- #    - Row Comparison

-- #    - EXPLAIN

-- #    - Comparing SQL Statements
