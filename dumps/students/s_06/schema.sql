DROP TABLE IF EXISTS guns CASCADE; 
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS personals CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS sales CASCADE;
DROP TABLE IF EXISTS users_guns CASCADE;
DROP TABLE IF EXISTS kalibers CASCADE;
DROP TABLE IF EXISTS gun_types CASCADE;

CREATE TABLE gun_types(
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(50) NOT NULL,
);

CREATE TABLE users(
  id                  SERIAL PRIMARY KEY,
  first_name          VARCHAR(50) NOT NULL,
  second_name         VARCHAR(50) NOT NULL,
  licence             VARCHAR(50) NOT NULL,
  passport_data       VARCHAR(50) NOT NULL
);

CREATE TABLE kalibers(
  id                  SERIAL PRIMARY KEY,
  name                VARCHAR(50) NOT NULL
);

CREATE TABLE roles(
  id                  SERIAL PRIMARY KEY,
  name                VARCHAR(50) NOT NULL
);

CREATE TABLE guns(
  id                  SERIAL PRIMARY KEY,
  name                VARCHAR(50) NOT NULL,
  gun_type_id         INT REFERENCES gun_types (id) 
);


CREATE TABLE personals(
  id                  SERIAL PRIMARY KEY,
  first_name          VARCHAR(50) NOT NULL,
  second_name         VARCHAR(50) NOT NULL,
  born_year           SMALLINT NOT NULL CONSTRAINT positive_age CHECK (born_year > 0),
  roles_id            INT REFERENCES roles (id)
);


CREATE TABLE sales(
  id                  SERIAL PRIMARY KEY,
  users_id            INT REFERENCES users (id),
  price               VARCHAR(50) NOT NULL
);


CREATE TABLE users_guns(
  id                  SERIAL PRIMARY KEY,
  users_id            INT REFERENCES users (id),
  gun_id              INT REFERENCES guns (id)
);
