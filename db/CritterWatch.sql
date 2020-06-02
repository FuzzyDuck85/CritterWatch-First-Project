DROP TABLE animals;
DROP TABLE users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) not null,
    age INT
);
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    species VARCHAR(255) not null,
    animal_type VARCHAR(255) not null,
    quantity_observed INT,
    habitat VARCHAR(255) not null,
    season VARCHAR(255) not null,
    time_of_day VARCHAR(255) not null,
    user_id INT REFERENCES users(id)
);
