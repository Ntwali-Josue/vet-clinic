/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(15),
    age int
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(10),
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name varchar(10),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    species_id int,
    FOREIGN KEY(species_id) REFERENCES species(id),
    owner_id int,
    FOREIGN KEY(owner_id) REFERENCES owners(id)
);

DELETE FROM animals where species;

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name varchar(50),
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    species_id int, 
    FOREIGN KEY(species_id) REFERENCES species(id),
    vet_id int, 
    FOREIGN KEY(vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id int, 
    FOREIGN KEY(animal_id) REFERENCES animals(id),
    vet_id int, 
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    date_of_visit date
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visit_index ON visits(animal_id);
CREATE INDEX visit_vet ON visits(vet_id); 
CREATE INDEX email_index ON owners(email ASC); 