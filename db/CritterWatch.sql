DROP TABLE user_details;
DROP TABLE animals;
DROP TABLE habitat;

CREATE TABLE user_details (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT
)
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    species VARCHAR(255),
    animal_type VARCHAR(255),
    quantity_observed INT
)
CREATE TABLE habitat (
    id SERIAL PRIMARY KEY,
    location VARCHAR(255),
    season VARCHAR(255),
    time_of_day VARCHAR(255)
);
