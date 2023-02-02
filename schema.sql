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



-- Day4



CREATE TABLE vets (
    id integer PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    age integer NOT NULL,
    date_of_graduation date NOT NULL
);

CREATE TABLE specializations (
    id integer PRIMARY KEY,
    species_id integer NOT NULL,
    vet_id integer NOT NULL,
    FOREIGN KEY (species_id) REFERENCES species (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);

CREATE TABLE visits (
    id integer PRIMARY KEY,
    animal_id integer NOT NULL,
    vet_id integer NOT NULL,
    date_of_visit date NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id),
    FOREIGN KEY (email_id) REFERENCES vets (id)
);


CREATE TABLE VETS(ID INT GENERATED ALWAYS AS IDENTITY, NAME VARCHAR(60), AGE INT, DATE_OF_GRADUATION DATE, PRIMARY KEY(ID));
CREATE TABLE specializations(VETS_ID INT REFERENCES VETS (ID), SPECIES_ID INT REFERENCES SPECIES (ID));
CREATE TABLE visits(VETS_ID INT REFERENCES VETS(ID), ANIMAL_ID INT REFERENCES ANIMALS(ID), VISIT_DATE DATE );
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
