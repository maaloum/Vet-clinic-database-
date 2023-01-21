/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, weight_kg, neutered ) VALUES (1,'Agumon', '02/03/2020',0, 10.23, true);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, weight_kg, neutered ) VALUES (2,'Gabumon', '11/15/2022', 2, 15.04, false);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, weight_kg, neutered ) VALUES (3,'Pikachu', '01/7/2020', 1, 0.5, false);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, weight_kg, neutered ) VALUES (4,'Devimon', '05/12/2017', 5, 11.13, true);

SELECT * from animals;
INSERT INTO animals VALUES (5,'Charmander', '02/08/2020', 0, false, 11), (6,'Plantmon', '11/15/2021', 2, true, 5.4),(7,'Squirtle', '04/02/1993', 3, false, 12.13),
  (9,'Angemon', '06/12/2005', 3, true, 45), (10, 'Boarmon', '06/07/2005', 7, true, 20.4),(11, 'Blossom', '10/13/1998', 3, true, 17),(12, 'Ditto', '05/14/2022', 4, true, 22);
