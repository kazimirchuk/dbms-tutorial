DROP TABLE IF EXISTS persons CASCADE;
DROP TABLE IF EXISTS agents CASCADE;
DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS persons_agents CASCADE;
DROP TABLE IF EXISTS cities CASCADE;
DROP TABLE IF EXISTS tours CASCADE;
DROP TABLE IF EXISTS persons_tours CASCADE;

CREATE TABLE persons(
    id               SERIAL PRIMARY KEY,
    first_name       VARCHAR(50) NOT NULL,
    last_name        VARCHAR(50) NOT NULL,
    code_name        VARCHAR(20) NOT NULL,
    born_year        SMALLINT NOT NULL CONSTRAINT positive_age CHECK (born_year > 1900) AND (born_year < 2000)
);

CREATE TABLE agents(
   id               SERIAL PRIMARY KEY,
   first_name       VARCHAR(50) NOT NULL,
   last_name        VARCHAR(50) NOT NULL,   
   code_name        VARCHAR(20) NOT NULL,
   online           BOOLEAN,
   experience       SMALLINT NOT NULL CONSTRAINT positive_age CHECK (experience >= 0),
   description      TEXT
);

CREATE TABLE persons_agents(
    id              SERIAL PRIMARY KEY,
    person_id       INT REFERENCES persons (id),
    agent_id        INT REFERENCES agents (id)
);

CREATE TABLE countries(
   id               SERIAL PRIMARY KEY,
   name             VARCHAR(50) NOT NULL,
   code             VARCHAR(3) NOT NULL
);

CREATE TABLE cities(
   id               SERIAL PRIMARY KEY,
   country_id       INT REFERENCES countries (id),
   name             VARCHAR(50) NOT NULL,
   type             VARCHAR(20)
);

CREATE TABLE tours(
  id                SERIAL PRIMARY KEY,
  name              VARCHAR(50) NOT NULL,
  city_from_id      INT REFERENCES cities (id),
  city_to_id        INT REFERENCES cities (id),
  price             INT CONSTRAINT positive_area CHECK (price > 0),
  departure_date    TIMESTAMP WITH TIME ZONE,
  ammount_of_night  INT CONSTRAINT positive_area CHECK (ammount_of_night > 0)
);

CREATE TABLE persons_tours(
    id               SERIAL PRIMARY KEY,
    person_id        INT REFERENCES persons (id),
    tour_id          INT REFERENCES tours (id)
);



