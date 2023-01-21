
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


SELECT species.name, count(*)
  FROM visits
  LEFT JOIN animals ON animals.id = visits.animal_id
  LEFT JOIN species ON animals.species_id = species.id
  LEFT JOIN vets ON vets.id = visits.vet_id
  WHERE vet.name = 'Maisy Smith'
  GROUP BY species.name



INSERT INTO owners (full_name, age)
	VALUES 	('Sam Smith', 34),
			('Jennifer Orwell', 19),
			('Bob ', 45),
			('Melody Pond', 77),
			('Dean Winchester', 14),
			('Jodie Whittaker', 38);

INSERT INTO species (name)
	VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals set owner_id = 1 WHERE name = 'Agumon';

UPDATE animals set owner_id = 2 WHERE name in ('Gabumon','Pikachu');

UPDATE animals set owner_id = 3 WHERE name in ('Devimon','Plantmon');

UPDATE animals set owner_id = 4 WHERE name in ('Charmander','Squirtle','Blossom');

UPDATE animals set owner_id = 5 WHERE name in ('Angemon','Boarmon');


SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name='Melody Pond';

SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.name='Pokemon';

SELECT full_name,name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT count(animal_id) AS amount_of_visits, animals.name FROM visits JOIN animals ON animals.id = visits.animal_id GROUP BY animal_id, animals.name ORDER BY COUNT(animal_id) DESC LIMIT 1;

SELECT * FROM animals JOIN owners on animals.owner_id = owners.id join species on animals.species_id = species.id where full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT full_name, name, escape_attempts FROM animals JOIN owners on animals.owner_id = owners.id  where full_name = 'Dean Winchester' and animals.escape_attempts = 0;

SELECT full_name, count(*) FROM animals JOIN owners on animals.owner_id = owners.id group by full_name order by count(*) desc limit 1;
