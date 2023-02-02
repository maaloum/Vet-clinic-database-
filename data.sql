/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, weight_kg, neutered ) VALUES (1,'Agumon', '02/03/2020',0, 10.23, true);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, weight_kg, neutered ) VALUES (2,'Gabumon', '11/15/2022', 2, 15.04, false);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, weight_kg, neutered ) VALUES (3,'Pikachu', '01/7/2020', 1, 0.5, false);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, weight_kg, neutered ) VALUES (4,'Devimon', '05/12/2017', 5, 11.13, true);

SELECT * from animals;
INSERT INTO animals VALUES (5,'Charmander', '02/08/2020', 0, false, 11), (6,'Plantmon', '11/15/2021', 2, true, 5.4),(7,'Squirtle', '04/02/1993', 3, false, 12.13),
  (9,'Angemon', '06/12/2005', 3, true, 45), (10, 'Boarmon', '06/07/2005', 7, true, 20.4),(11, 'Blossom', '10/13/1998', 3, true, 17),(12, 'Ditto', '05/14/2022', 4, true, 22);



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



-- Day 4


--        Day 4

INSERT INTO vets(id,name, age, date_of_graduation)
	VALUES 	(1,'William Tatcher', 45, '2000-4-23'),
			(2,'Maisy Smith', 26, '2019-2-17'),
			(3,'Stephanie Mendez', 64, '1981-5-4'),
			(4,'Jack Harkness', 38, '2008-1-8');

INSERT INTO specializations (id,vet_id, species_id)
	VALUES 	(1,1,1),
			(2,3,1),
			(3,3,2),
			(4,4,2);

INSERT INTO visits(id,animal_id, vet_id, date_of_visit)
VALUES	(1,1,1,'2020-05-24'),
			(2,1,3,'2020-07-22'),
			(3,2,4,'2021-02-02'),
			(4,3,2,'2020-01-05'),
			(5,3,2,'2020-03-08'),
			(6,3,2,'2020-05-14'),
			(7,4,3, '2021-05-04'),
			(8,5,4, '2021-02-24'),
			(9,6,2, '2019-12-21'),
			(10,6,1, '2020-08-10'),
			(11,6,2, '2021-04-07'),
			(12,7,3, '2019-09-29'),
			(13,8,4, '2020-08-03'),
			(14,8,4, '2020-11-04'),
			(15,9,2, '2019-01-24'),
			(16,9,2,'2019-05-15'),
			(17,9,2, '2020-02-27'),
			(18,9,2,'2020-08-03'),
			(19,10,3,'2020-05-24'),
			(20,10,1, '2021-01-11');


INSERT INTO specializations(vets_id, species_id) VALUES
((SELECT id from vets where name = 'William Tatcher'),(SELECT id from species where name = 'Pokemon')),
((SELECT id from vets where name = 'Stephanie Mendez'),(SELECT id from species where name = 'Digimon')),
((SELECT id from vets where name = 'Stephanie Mendez'),(SELECT id from species where name = 'Pokemon')),
((SELECT id from vets where name = 'Jack Harkness'),(SELECT id from species where name = 'Digimon'));

INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (1, 1, '2020-05-24');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (1, 3, '2020-07-22');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (2, 4, '2021-02-02');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (3, 2, '2020-01-05');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (3, 2, '2020-03-08');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (3, 2, '2020-05-14');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (4, 3, '2021-05-04');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (5, 4, '2021-02-24');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (6, 2, '2019-12-21');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (6, 1, '2020-08-10');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (6, 2, '2021-04-07');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (7, 3, '2019-09-29');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (8, 4, '2020-10-03');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (8, 4, '2020-11-04');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (9, 2, '2019-01-24');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (9, 2, '2019-05-15');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (9, 2, '2020-02-27');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (9, 2, '2020-08-03');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (10, 3, '2020-05-24');
INSERT INTO visits (animal_id, vets_id, visit_date ) VALUES (10, 1, '2021-01-11');



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vets_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
