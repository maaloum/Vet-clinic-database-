/*Queries that provide answers to the questions from all projects.*/

SELECT *
FROM  animals
WHERE name LIKE '%mon'
SELECT name FROM animals where date_of_birth BETWEEN '01/01/2016' AND  '01/01/2019';
SELECT name FROM animals where neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals where name ='Agumon' or name= 'Pikachu' ;
SELECT name, escape_attempts FROM animals where weight_kg > 10.5;
SELECT * FROM animals where neutered = true;
SELECT * FROM animals where name NOT LIKE 'Gabumon';
SELECT * FROM animals where weight_kg BETWEEN 10.4 and 17.3;

/* queries for project 2*/



BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species from animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species from animals;
COMMIT;
SELECT species from animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT svp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT svp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals GROUP BY species
WHERE date_of_birth BETWEEN '01-01-1990' AND '01-01-2000';
