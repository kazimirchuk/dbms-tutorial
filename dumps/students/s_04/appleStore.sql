DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS clients CASCADE;
DROP TABLE IF EXISTS clients_products CASCADE;
DROP TABLE IF EXISTS sellers CASCADE;
DROP TABLE IF EXISTS sellers_clients CASCADE;
DROP TABLE IF EXISTS stores CASCADE;



CREATE TABLE products (
  id                  SERIAL PRIMARY KEY,
  code_id             SMALLINT NOT NULL CONSTRAINT positive_id CHECK ( code_id > 0 ),
  title               VARCHAR(50) NOT NULL,
  small_description   TEXT   
);

CREATE TABLE clients (
  id                SERIAL PRIMARY KEY,
  first_name        VARCHAR(50) NOT NULL,
  last_name         VARCHAR(50),
  tel_number        CHAR(13),
  email             VARCHAR(50) CONSTRAINT proper_email CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')  
);


CREATE TABLE clients_products (
  id               SERIAL PRIMARY KEY,
  client_id        INT NOT NULL REFERENCES clients (id),
  product_id       INT NOT NULL REFERENCES products (id)
);


CREATE TABLE sellers (
  id                SERIAL PRIMARY KEY,
  first_name        VARCHAR(50) NOT NULL,
  last_name         VARCHAR(50) NOT NULL,
  seller_id         INT NOT NULL,
  rang              VARCHAR(50) NOT NULL   
);

CREATE TABLE sellers_clients (
  id               SERIAL PRIMARY KEY,
  client_id        INT NOT NULL REFERENCES clients (id),
  seller_id        INT NOT NULL REFERENCES sellers (id)
);

CREATE TABLE stores (
  id                SERIAL PRIMARY KEY,
  city              VARCHAR(50) NOT NULL,
  country           VARCHAR(50) NOT NULL,
  numb_of_staff     SMALLINT NOT NULL CONSTRAINT number_of_staff CHECK ( numb_of_staff > 0 )
);

