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