/* Database schema to keep the structure of entire database. */

-- // creating DATABASE
CREATE DATABASE vet_clinic ;

-- // creating TABLES
CREATE TABLE animals (
  id int PRIMARY KEY,
  name varchar,
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg float
);

CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(100) NOT NULL,
	age integer,
  PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(400),
    PRIMARY KEY(id)
);

ALTER TABLE animals AUTO_INCREMENT = 1001;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id integer, ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id integer, ADD FOREIGN KEY (owner_id) REFERENCES owners(id);


