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


SELECT species.name, count(*)
  FROM visits
  LEFT JOIN animals ON animals.id = visits.animal_id
  LEFT JOIN species ON animals.species_id = species.id
  LEFT JOIN vets ON vets.id = visits.vet_id
  WHERE vet.name = 'Maisy Smith'
  GROUP BY species.name

SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name='Melody Pond';

SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.name='Pokemon';

SELECT full_name,name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT count(animal_id) AS amount_of_visits, animals.name FROM visits JOIN animals ON animals.id = visits.animal_id GROUP BY animal_id, animals.name ORDER BY COUNT(animal_id) DESC LIMIT 1;

SELECT * FROM animals JOIN owners on animals.owner_id = owners.id join species on animals.species_id = species.id where full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT full_name, name, escape_attempts FROM animals JOIN owners on animals.owner_id = owners.id  where full_name = 'Dean Winchester' and animals.escape_attempts = 0;

SELECT full_name, count(*) FROM animals JOIN owners on animals.owner_id = owners.id group by full_name order by count(*) desc limit 1;



-- Day 4



SELECT vets.name ,animals.name ,visits.date_of_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id where vets.name='William Tatcher' ORDER BY  date_of_visit DESC LIMIT 1 ;

SELECT vets.name,count(visits.date_of_visit) FROM visits JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' GROUP BY vets.name;

SELECT * FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id;

SELECT vets.name ,animals.name ,visits.date_of_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id where vets.name='Stephanie Mendez'  AND  date_of_visit BETWEEN '2020-04-1' AND '2020-08-30';

SELECT animals.name, COUNT(visits.date_of_visit) from visits INNER JOIN animals ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(visits.date_of_visit) DESC LIMIT 1 ;

SELECT vets.name, animals.name, visits.date_of_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Maisy Smith' ORDER BY  date_of_visit ASC limit 1;

SELECT * FROM visits INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id;

SELECT vets.name, COUNT(*) FROM visits INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN specializations ON specializations.vet_id = visits.vet_id WHERE specializations.species_id IS NULL GROUP BY vets.name;

SELECT vets.name, species.name, COUNT(species.name) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY COUNT DESC LIMIT 1;

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

EXPLAIN SELECT * FROM owners where email = 'owner_18327@mail.com';
