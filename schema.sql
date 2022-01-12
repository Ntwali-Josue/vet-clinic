/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(15),
    age int
);
