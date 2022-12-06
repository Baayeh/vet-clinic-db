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

/* Queries */
--- Begin transaction
BEGIN;

--- Delete all animals born after Jan 1st, 2022
DELETE from animals 
WHERE date_of_birth > '01-01-2022';

--- create a savepoint
SAVEPOINT SP1;

--- update all animals' weights multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1;

--- roolback to savepoint
ROLLBACK TO SP1;

--- update all animals' weights that are negative multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

--- commit the transaction
COMMIT;


/* AGGREGATES */

--- How many animals are there?
SELECT COUNT(*) from animals;

--- How many animals have never tried to escape?
SELECT COUNT(*) from animals
WHERE escape_attempts = 0;

--- What is the average weight of animals?
SELECT AVG(weight_kg) from animals;

--- Who escapes the most, neutered or not neutered animals?
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;

--- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

--- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '01-01-1990' AND '01-01-2000'
GROUP BY species;

--- What animals belong to Melody Pond?
SELECT name, full_name from animals
JOIN owners
ON animals.owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

--- List of all animals that are pokemon
SELECT animals.name AS Animal_Name, species.name AS Species_Name from animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

--- List all owners and their animals
SELECT full_name AS owner_name, name AS animal_name from owners
FULL JOIN animals
ON owners.id = animals.owners_id;

--- How many animals are there per species?
SELECT COUNT(animals) AS Num_of_animals, species.name AS species_name from animals
JOIN species
ON animals.species_id = species.id
GROUP BY species.name;

--- List all Digimon owned by Jennifer Orwell.
SELECT animals.name AS animal_name, full_name AS owner_name from animals
JOIN owners ON animals.owners_id = owners.id
WHERE owners_id = 2 AND species_id = 2;

--- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name AS animal_name, full_name AS owners_name from animals
JOIN owners ON animals.owners_id = owners.id
WHERE owners_id = 5 AND escape_attempts = 0;

--- Who owns the most animals?
SELECT full_name AS owners_name, COUNT(species_id) AS num_of_animals from animals
FULL JOIN owners ON animals.owners_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(name) DESC LIMIT 1;
