/*Queries that provide answers to the questions from all projects.*/

SELECT * from ANIMALS WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';

SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered IS TRUE;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* update the animals table by setting the species column to unspecified */
--- Begin Transaction
BEGIN;

--- Update species col to 'unspecified'
UPDATE animals
SET species = 'unspecified';

--- Verify that change was made
SELECT * from animals;

--- Rollback changes
ROLLBACK;

--- Verify changes
SELECT * from animals;


/* Update species col based on a condition */
--- Begin Transaction
BEGIN;

--- update species col for animals with names ending in mon
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

--- update species col for animals with names not ending in mon
UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';

--- commit transaction
COMMIT;

--- verify changes
SELECT * from animals;


/* Delete all records in the animals table */
BEGIN;

--- delete all records
DELETE from animals;

--- verify all records are deleted
SELECT * from animals;

--- Rollback changes
ROLLBACK;

--- verify all records still exist
SELECT * from animals;
