/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(250),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
  PRIMARY KEY(id)
)

/* Add species column */
ALTER TABLE animals
ADD COLUMN species varchar(250);


/* Create owners table */
CREATE TABLE owners (
	id int GENERATED ALWAYS AS IDENTITY,
	full_name varchar(250),
	age int,
	PRIMARY KEY(id)
);

/* Create species table */
CREATE TABLE species (
	id int GENERATED ALWAYS AS IDENTITY,
	name varchar(250),
	PRIMARY KEY(id)
);

/* Modify animals table */
ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id int,
ADD COLUMN owners_id int,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
ADD CONSTRAINT fk_owners FOREIGN KEY(owners_id) REFERENCES owners(id);


/* Vets Table */
CREATE TABLE vets (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  age INT NOT NULL,
  date_of_graduation DATE NOT NULL
);