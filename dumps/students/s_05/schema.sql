DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS personals CASCADE;
DROP TABLE IF EXISTS providers CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS close_seasons CASCADE;


CREATE TABLE products (
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(50) NOT NULL,
    gender           VARCHAR(10) NOT NULL,
    count            SMALLINT NOT NULL,
    date_arrive      TIMESTAMP WITH TIME ZONE
);

CREATE TABLE customers (
   id               SERIAL PRIMARY KEY,
   public_name      VARCHAR(50) NOT NULL,
   email            VARCHAR(20) NOT NULL,
   discount         BOOLEAN,
   discount_level   SMALLINT NOT NULL CONSTRAINT level_count CHECK (menace_level >= 5 AND menace_level <= 20),
);

CREATE TABLE personals (
    id               SERIAL PRIMARY KEY,
    person_id        SMALLINT NOT NULL,
    name             VARCHAR(50) NOT NULL,
    worked_hours     SMALLINT NOT NULL,
);
CREATE TABLE roles (
  id               SERIAL PRIMARY KEY,
  name             VARCHAR(50) NOT NULL,
  person_id        INT REFERENCES personals (person_id)
);

CREATE TABLE providers (
   id               SERIAL PRIMARY KEY,
   name             VARCHAR(50) NOT NULL,
   code             VARCHAR(10) NOT NULL,
   country          VARCHAR(20) NOT NULL,
);

CREATE TABLE close_seasons(
    id               SERIAL PRIMARY KEY,
    season_name      VARCHAR(10) NOT NULL,
    product_name     VARCHAR(50) NOT NULL REFERENCES products(name)
);
