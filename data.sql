/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander', 'Feb,08,2020', 0, False, -11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Plantmon', 'Nov,15,2022', 2, True, -5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Squirtle', 'Apr,02,1993', 3, False, -12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Amon', 'Jun,12,2005', 1, True, -45);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Boarmon', 'Jun,07,2005', 7, True, 20.4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Blossom', 'Oct,13,1998', 3, True, 17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Angemon', 'Oct,13,1998', 3, True, 17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon', 'Oct,13,1998', 3, True, 17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Gabumon', 'Oct,13,1998', 3, True, 17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Pikacu', 'Oct,13,1998', 3, True, 17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Devimon', 'Oct,13,1998', 3, True, 17);

-- populate data in owners table
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

-- Update animals table
UPDATE animals SET species_id = (
  SELECT id FROM species WHERE name = 'Digimon'
) WHERE name like '%mon';

UPDATE animals SET species_id = (
  SELECT id FROM species WHERE name = 'Pokemon'
) WHERE species_id IS NULL;

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Sam Smith'
) WHERE name = 'Agumon';

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Jennifer Orwell'
) WHERE name in ('Gabumon', 'Pikacu');

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Bob'
) WHERE name in ('Devimon','Plantmon');

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Melody Pond'
) WHERE name in ('Charmander','Squirtle','Blossom');

UPDATE animals SET owner_id = (
  SELECT id FROM owners WHERE full_name = 'Dean Winchester'
) WHERE name in ('Angemon','Boarmon');

-- populate data in species table
INSERT INTO species(name) VALUES ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');

INSERT INTO vets(name,age,date_of_graduation) VALUES 
  ('William Tatcher',45,'Apr,23,2000'),
  ('Maisy Smith',26,'Jan,17,2019'),
  ('Stephanie Mendez',64,'May,04,1981'),
  ('Jack Harkness',38,'Jun,08,2008');

INSERT INTO specializations(species_id, vet_id) VALUES (
  (SELECT species.id FROM species WHERE species.name = 'Pokemon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher')
);

INSERT INTO specializations(species_id, vet_id) VALUES (
  (SELECT species.id FROM species WHERE species.name = 'Pokemon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
);

INSERT INTO specializations(species_id, vet_id) VALUES (
  (SELECT species.id FROM species WHERE species.name = 'Digimon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
);

INSERT INTO specializations(species_id, vet_id) VALUES (
  (SELECT species.id FROM species WHERE species.name = 'Digimon'),
  (SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness')
);
