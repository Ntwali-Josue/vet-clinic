/*Queries that provide answers to the questions from all projects.*/

-- TASK 1
-- BEGIN A TRANSACTION
BEGIN;

UPDATE animals SET species='unspecified';
UPDATE animals SET species='';
UPDATE animals SET species='digimon' WHERE name like '%mon';
UPDATE animals SET species='pokemon' WHERE species ='';
-- COMMIT A TRANSACTION
COMMIT;

-- TASK 2
-- BEGIN A TRANSACTION
BEGIN;

DELETE FROM animals;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
-- CREATE A SAVEPOINT FOR THE TRANSACTION
SAVEPOINT delete_animals;

UPDATE animals SET weight_kg =  weight_kg * -1;
-- ROLLBACK TO THE SAVEPOINT.
ROLLBACK TO SAVEPOINT delete_animals;
UPDATE animals SET weight_kg =  weight_kg * -1 where weight_kg < 0;
-- COMMIT A TRANSACTION
COMMIT;

-- TASK 3

SELECT count(id) FROM animals;
SELECT count(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT avg(weight_kg) FROM animals;
SELECT name FROM animals WHERE max(escape_attempts);
SELECT neutered, max(escape_attempts) as escape_attempts FROM animals GROUP BY neutered;
SELECT species, max(weight_kg) as max_weight, min(weight_kg) as min_weight FROM animals GROUP BY species;
SELECT species, avg(escape_attempts) as escape_attempts FROM animals WHERE date_of_birth BETWEEN '01-01-1990' AND '01-01-2000' GROUP BY species;