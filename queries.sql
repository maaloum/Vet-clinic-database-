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
