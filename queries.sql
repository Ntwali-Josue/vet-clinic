/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN 'Jan/01/2016' AND 'Jan/01/2019';
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg >= 10.5;
SELECT * FROM animals WHERE neutered = True;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10 AND weight_kg <= 17.3;
