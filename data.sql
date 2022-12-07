/* Populate database with sample data. */

INSERT INTO ANIMALS (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '02-03-2020', 0, true, 10.23);

INSERT INTO ANIMALS (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', '11-15-2018', 2, true, 8);

INSERT INTO ANIMALS (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', '01-07-2021', 1, false, 15.04);

INSERT INTO ANIMALS (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', '05-12-2017', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '02-08-2020', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '11-15-2021', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '04-02-1993', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '06-12-2005', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '06-07-2005', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '10-13-1998', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '05-14-2022', 4, true, 22);


/* INSERT data into owners table */
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);


/* INSERT data into species table */
INSERT INTO species (name) 
VALUES ('Pokemon');

INSERT INTO species (name) 
VALUES ('Digimon');

/* Update species_id col in animals table based on a condition */
--- Begin Transaction
BEGIN;

--- update species col for animals with names ending in mon
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

--- update species col for animals with names not ending in mon
UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon';

--- commit transaction
COMMIT;

/* Update owners_id col in animals table */
BEGIN;

--- Sam Smith owns Agumon.
UPDATE animals
SET owners_id = 1
WHERE name = 'Agumon';

--- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals
SET owners_id = 2
WHERE name IN ('Gabumon', 'Pikachu');

--- Bob owns Devimon and Plantmon.
UPDATE animals
SET owners_id = 3
WHERE name IN ('Devimon', 'Plantmon');

--- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals
SET owners_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

--- Dean Winchester owns Angemon and Boarmon.
UPDATE animals
SET owners_id = 5
WHERE name IN ('Angemon', 'Boarmon');

--- commit transaction
COMMIT;


/* INSERT DATA into vets table */
INSERT INTO vets (name, age, date_of_graduation)
VALUES('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');

/* INSERT DATA into specializations table */
INSERT INTO specializations(species_id, vet_id)
VALUES((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'));

/* INSERT DATA into specializations table */
