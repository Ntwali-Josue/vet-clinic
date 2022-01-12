/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(15),
    age int
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(10)
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name varchar(10),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    species_id int REFERENCES species(id),
    owner_id int REFERENCES owners(id)
);
