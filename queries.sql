/*Queries that provide answers to the questions from all projects.*/

UPDATE animals SET species='unspecified';
UPDATE animals SET species='';
UPDATE animals SET species='digimon' WHERE name like '%mon';
UPDATE animals SET species='pokemon' WHERE species ='';

DELETE FROM animals;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
UPDATE animals SET weight_kg =  weight_kg * -1;
UPDATE animals SET weight_kg =  weight_kg * -1 where weight_kg < 0;