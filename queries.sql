/*Queries that provide answers to the questions from all projects.*/

UPDATE animals SET species='unspecified';
UPDATE animals SET species='';
UPDATE animals SET species='digimon' WHERE name like '%mon';
UPDATE animals SET species='pokemon' WHERE species ='';