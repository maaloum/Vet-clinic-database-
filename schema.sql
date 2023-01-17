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

ALTER TABLE animals ADD species varchar(25);
ALTER TABLE animals DROP COLUMN species;

