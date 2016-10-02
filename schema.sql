DROP TABLE IF EXISTS persons CASCADE;
DROP TABLE IF EXISTS super_abilities CASCADE;
DROP TABLE IF EXISTS persons_super_abilities CASCADE;
DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS cities CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS persons_locations CASCADE;
DROP TABLE IF EXISTS languages CASCADE;
DROP TABLE IF EXISTS districts CASCADE;
DROP TABLE IF EXISTS buildings CASCADE;
DROP TABLE IF EXISTS cases CASCADE;
DROP TABLE IF EXISTS arrests CASCADE;
DROP TABLE IF EXISTS prisons CASCADE;
DROP TABLE IF EXISTS imprisonments CASCADE;
DROP TABLE IF EXISTS criminal_group_types CASCADE;
DROP TABLE IF EXISTS criminal_groups CASCADE;
DROP TABLE IF EXISTS persons_criminal_groups CASCADE;
DROP TABLE IF EXISTS persons_allies CASCADE;
DROP TABLE IF EXISTS persons_enemies CASCADE;

CREATE TABLE persons(
    id               SERIAL PRIMARY KEY,
    first_name       VARCHAR(50) NOT NULL,
    last_name        VARCHAR(50) NOT NULL,
    code_name        VARCHAR(20) NOT NULL,
    public_name      VARCHAR(50) NOT NULL,
    born_year        SMALLINT NOT NULL CONSTRAINT positive_age CHECK (born_year > 0)
);

CREATE TABLE super_abilities(
   id               SERIAL PRIMARY KEY,
   public_name      VARCHAR(50) NOT NULL,
   code_name        VARCHAR(20) NOT NULL,
   is_gene_x        BOOLEAN,
   has_alien_nature BOOLEAN,
   menace_level     SMALLINT NOT NULL CONSTRAINT menace_levels CHECK (menace_level >= 0 AND menace_level <= 10),
   description      TEXT
);

CREATE TABLE persons_super_abilities(
    id               SERIAL PRIMARY KEY,
    person_id        INT REFERENCES persons (id),
    super_ability_id INT REFERENCES super_abilities (id)
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
   total_population INT CONSTRAINT positive_population CHECK (total_population > 0),
   total_area_sq_m  INT CONSTRAINT positive_area CHECK (total_area_sq_m > 0),
   foundation_year  SMALLINT
);

CREATE TABLE districts(
  id               SERIAL PRIMARY KEY,
  name             VARCHAR(50) NOT NULL,
  city_id          INT REFERENCES cities (id),
  total_area_sq_m  INT CONSTRAINT positive_area CHECK (total_area_sq_m > 0)
);

CREATE TABLE buildings(
  id               SERIAL PRIMARY KEY,
  address_name     VARCHAR(100),
  district         INT REFERENCES districts (id),
  floors           SMALLINT CONSTRAINT positive_quantity CHECK (floors > 0)
);

CREATE TABLE locations(
   id               SERIAL PRIMARY KEY,
   building_id      INT REFERENCES buildings (id),
   apt_no           INT
);

CREATE TABLE persons_locations(
    id               SERIAL PRIMARY KEY,
    person_id        INT REFERENCES persons (id),
    location_id      INT REFERENCES locations (id)
);

CREATE TABLE cases(
    id               SERIAL PRIMARY KEY,
    person_id        INT REFERENCES persons (id),
    location_id      INT REFERENCES locations (id),
    description      TEXT NOT NULL,
    created_at       TIMESTAMP WITH TIME ZONE
);

CREATE TABLE arrests(
    id               SERIAL PRIMARY KEY,
    person_id        INT REFERENCES persons (id),
    arrested_at      TIMESTAMP WITH TIME ZONE
);

CREATE TABLE prisons(
    id               SERIAL PRIMARY KEY,
    location_id      INT REFERENCES locations (id),
    name             VARCHAR(50) NOT NULL,
    description      TEXT
);

CREATE TABLE imprisonments(
    id               SERIAL PRIMARY KEY,
    person_id        INT REFERENCES persons (id),
    prison_id        INT REFERENCES prisons (id)
);

CREATE TABLE criminal_group_types(
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(20) NOT NULL,
    description      TEXT
);

CREATE TABLE criminal_groups(
    id               SERIAL PRIMARY KEY,
    type_id          INT REFERENCES criminal_group_types (id),
    name             VARCHAR(20) NOT NULL,
    description      TEXT
);

CREATE TABLE persons_criminal_groups(
    id                SERIAL PRIMARY KEY,
    person_id         INT REFERENCES persons (id),
    criminal_group_id INT REFERENCES criminal_groups (id)
);

CREATE TABLE persons_allies(
    id                SERIAL PRIMARY KEY,
    person_id         INT REFERENCES persons (id),
    ally_id           INT REFERENCES persons (id)
);

CREATE TABLE persons_enemies(
    id                SERIAL PRIMARY KEY,
    person_id         INT REFERENCES persons (id),
    enemy_id          INT REFERENCES persons (id)
);