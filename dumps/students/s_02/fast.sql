DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS role CASCADE;
DROP TABLE IF EXISTS staff_role CASCADE;
DROP TABLE IF EXISTS menu CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS menu_products CASCADE;
 
CREATE TABLE staff(
    id               SERIAL PRIMARY KEY,
    first_name       VARCHAR(50) NOT NULL,
    last_name        VARCHAR(50) NOT NULL,
    staff_name       VARCHAR(20) NOT NULL,
    born_year        SMALLINT NOT NULL CONSTRAINT positive_age CHECK (born_year > 0)
);

CREATE TABLE role(
   id               SERIAL PRIMARY KEY,
   role_name        VARCHAR(50) NOT NULL,
   description      TEXT
);

CREATE TABLE staff_role(
    id              SERIAL PRIMARY KEY,
    staff_id        INT REFERENCES staff (id),
    role_id         INT REFERENCES role (id)
);

CREATE TABLE menu(
   id               SERIAL PRIMARY KEY,
   name             VARCHAR(50) NOT NULL,
   code             SMALLINT NOT NULL CONSTRAINT positive_code CHECK (code > 0),
   price            SMALLINT NOT NULL CONSTRAINT positive_price CHECK (price > 0),
   portion          VARCHAR(10) NOT NULL
);

CREATE TABLE products(
   id               SERIAL PRIMARY KEY,
   name             VARCHAR(50) NOT NULL,
   code             VARCHAR(3) NOT NULL,
   weight           SMALLINT NOT NULL CONSTRAINT positive_weight CHECK (weight > 0),
   price            SMALLINT NOT NULL CONSTRAINT positive_price CHECK (price > 0),
   country          VARCHAR(50) NOT NULL,
   expires_at       TIMESTAMP WITH TIME ZONE
);

CREATE TABLE menu_products(
   id               SERIAL PRIMARY KEY,
   menu_id          INT REFERENCES menu (id),
   products_id      INT REFERENCES products (id)
);